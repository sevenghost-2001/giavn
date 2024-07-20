<?php

class DatacallModule extends IndexbaseModule
{
    var $_datacall_mod;         //Mô hình dữ liệu được gọi là
    var $_x_mod;                //Cần phải gọi là loại dữ liệu, dữ liệu sản phẩm hiện tại chỉ, dữ liệu lưu trữ, vv có thể được sau
    var $_expires;              //Bộ nhớ cache hết hạn thời gian
    var $name_length;           //Duy trì dữ liệu dài, lớn hơn chiều dài của các đánh chặn
    var $charset;               //mã hóa ký tự
    var $_doc_content;          //Đầu ra

    function __construct()
    {
        $this->DatacallModule();
    }

    function DatacallModule()
    {
        parent::__construct();
        $this->_datacall_mod = &af("datacall");
    }

    function index()
    {
        $id = isset($_GET['id']) ? intval($_GET['id']) : 0;
        if (!$this->is_cached($id))                         //Kiểm tra xem bộ nhớ cache là hết hạn
        {
            $data = $this->_datacall_mod->getOne($id);
            if (empty($data))
            {
                return;
            }
            $this->name_length = $data['name_length'];
            $this->_expires    = time() + $data['cache_time'];
            $this->charset = in_array($data['content_charset'], array('utf-8', 'gbk', 'big5')) ? $data['content_charset'] : CHARSET;
            if ($data['type'] == 'goods') //Hãy gọi cho loại dữ liệu như một loại hàng hoá
            {
                $this->_x_mod = &m('goods');
                $conditions = '';
                if (!empty($data['spe_data']['keywords']))    //SQL từ khóa
                {
                    if (strpos($data['spe_data']['keywords'], ' ') > 0)
                    {
                        $tmp_str = explode(' ', $data['spe_data']['keywords']);
                        $tmp_con = '';
                        foreach ($tmp_str as $val)
                        {
                            $tmp_con .= "OR g.goods_name LIKE '%{$val}%' OR g.brand LIKE '%{$val}%'";
                        }
                        $tmp_con = substr_replace($tmp_con, '', 0, 2);
                        $conditions .= 'AND ('. $tmp_con . ')';
                    }
                    else
                    {
                        $conditions .= "AND (g.goods_name LIKE '%{$data['spe_data']['keywords']}%' OR g.brand LIKE '%{$data['spe_data']['keywords']}%')";
                    }
                    unset($tmp_con);
                }
                if (!empty($data['spe_data']['cate_id']))   //Việc phân loại hàng hóa nơi
                {
                    $gcategory = &m('gcategory');
                    $ids = $gcategory->get_descendant($data['spe_data']['cate_id']);
                    $conditions .= " AND g.cate_id " . db_create_in($ids);
                    unset($ids);
                }

                if (!empty($data['spe_data']['brand_name']))    //Trường hợp thương hiệu
                {
                    $conditions .= " AND g.brand LIKE '%{$data['spe_data']['brand_name']}%'";
                }

                if (!empty($data['spe_data']['max_price']))      //Trường hợp giá tối đa
                {
                    $conditions .= " AND gs.price < {$data['spe_data']['max_price']}";
                }

                if (!empty($data['spe_data']['min_price']))     //Trường hợp giá tối thiểu
                {
                    $conditions .= " AND gs.price > {$data['spe_data']['min_price']}";
                }

/*                if (!empty($data['spe_data']['recommend']))     //cho dù giới thiệu
                {
                    $conditions .= " AND  g.recommended = 1";
                }*/

                $order = '';
                if (!empty($data['spe_data']['sort_order']))   //Sắp xếp nơi
                {
                    $order = in_array($data['spe_data']['sort_order'], array('add_time','last_update')) ? "g.".$data['spe_data']['sort_order']." ".$data['spe_data']['asc_desc'] : "gst.".$data['spe_data']['sort_order']." ".$data['spe_data']['asc_desc'];
                }

                $con = array(
                    'conditions' => "1=1 ". $conditions,
                    'order' => $order,
                );
                if (!empty($data['amount']))
                {
                    $con['limit'] = "0, ".$data['amount'];
                }
                $result = $this->_x_mod->get_list($con);
                if (empty($result))
                {
                    return ;
                }
                $this->js_write($data['header']);
                $body = $data['body'];
                foreach ($result as $val)
                {
                    $code = str_replace('{goods_name}', empty($this->name_length) ? $val['goods_name'] : sub_str($val['goods_name'], $this->name_length), $body);
                    $code = str_replace('{goods_full_name}', $val['goods_name'], $code);
                    $code = str_replace('{goods_price}', $val['price'], $code);
                    $code = str_replace('{goods_url}', site_url() . '/index.php?app=goods&amp;id='. $val['goods_id'], $code);
                    $code = str_replace('{goods_image_url}', site_url() . '/' . $val['default_image'], $code);
                    $content .= $code;
                    unset($code);
                }
                $this->js_write($content);
                $this->js_write($data['footer']);
                $this->save_cache($id);
            }
        }
        $this->doc_output();
    }

    function is_cached($id)
    {
        $file_path = ROOT_PATH . '/temp/js/datacallcache'. $id .'.js';

        if (is_file($file_path))
        {
            $content = file_get_contents($file_path);
            $idx = strpos($content , "%^@#!*");
            $str = substr($content, 0 , $idx);

            $arr = explode('|', $str);

            $this->charset = $arr[0];
            $this->_expires  = $arr[1];

            if (time() > $this->_expires)
            {
                return false;
            }
            else
            {
                $this->_doc_contents = substr($content, $idx + 6);
                return true;
            }
        }
        else
        {
            return false;
        }
    }

    function js_write($str)
    {
        $str = str_replace("\r", "", $str);
        $str = str_replace("\n", "", $str);
        $str = str_replace("'", "\\'", $str);
        $this->_doc_contents .= 'document.write(\''. $str .'\');';
    }

    function save_cache($id)
    {
        $file_path = ROOT_PATH . '/temp/js/datacallcache'. $id .'.js';
        ecm_mkdir(dirname($file_path));
        file_put_contents($file_path, "{$this->charset}|{$this->_expires}%^@#!*" . $this->_doc_contents);
    }

    function doc_output()
    {
        header("Content-type:text/html;charset=" . $this->charset , true);
        $tmp_str = ecm_iconv(CHARSET, $this->charset, $this->_doc_contents);
        $output = $this->charset == 'utf-8' ? stripslashes($tmp_str) : $tmp_str;
        echo $output;
    }


}

?>
