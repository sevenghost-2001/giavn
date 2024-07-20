<?php

/**
 *    Liên kết với tài liệu điều khiển quản lý
 *
 *    @author    Garbin
 *    @usage    none
 */
class WidgetApp extends BackendApp
{
    function index()
    {
        /* Đọc các phần liên kết được cài đặt */
        $widgets = list_widget();
        $this->assign('widgets', $widgets);
        $this->display('widget.index.html');
    }

    /**
     *    Pendant biên tập kịch bản
     *
     *    @author    Garbin
     *    @return    void
     */
    function edit()
    {
        $name = empty($_GET['name']) ? 0 : trim($_GET['name']);
        if (!$name)
        {
            $this->show_warning('no_such_widget');

            return;
        }
        $script_file = $this->_get_file($name, $_GET['file']);
        if (!IS_POST)
        {
            $this->assign('code', file_get_contents($script_file));
            $this->display('widget.form.html');
        }
        else
        {
            if (!file_put_contents($script_file, stripslashes($_POST['code'])))
            {
                $this->show_warning('edit_file_failed');

                return;
            }

            $this->show_message('edit_file_successed');
        }
    }

    /**
     *    Làm sạch các tập tin rác
     *
     *    @author    Garbin
     *    @return    void
     */
    function clean_file()
    {
        $continue = isset($_GET['continue']);
        $isolcated_file = $this->_get_isolated_file();
        if (empty($isolcated_file))
        {
            $this->json_error('no_isocated_file');

            return;
        }
        $file_count = count($isolcated_file);
        if (!$continue)
        {
            $this->json_result('', sprintf(Lang::get('isolcated_file_count'), $file_count));

            return;
        }
        else
        {
            foreach ($isolcated_file as $f)
            {
                _at('unlink', ROOT_PATH . '/' . $f);
            }

            $this->json_result('', sprintf('clean_file_successed', $file_count));
        }
    }

    /**
     *    Đối với các tập tin mồ côi
     *
     *    @author    Garbin
     *    @return    array
     */
    function _get_isolated_file()
    {
        /* Có được một danh sách các tập tin hiện có */
        $exist_files    = $this->_get_exist_file();
        if (empty($exist_files))
        {
            return array();
        }
        /* Lấy giá trị của tất cả các tùy chọn */
        $option_values  = $this->_get_option_value();
        /* Không có tùy chọn, sau đó tất cả các tập tin được cô lập, bạn có thể xóa*/
        if (empty($option_values))
        {
            return $exist_files;
        }
        /* Hãy sử dụng cá nhân để xác định xem */
        foreach ($exist_files as $k => $f)
        {
            /* Nếu $ f tồn tại trong các tùy chọn, sau đó tập tin đang được sử dụng, không thể bị xóa */
            /* $ Options_values ​​có thể được mảng hai chiều, có thể có ba chiều bốn chiều vấn đề, do đó, cần phải chú ý, tất cả các tùy chọn để tải lên tập tin được lưu trữ trên các nhóm hàng loạt đầu tiên */
            if($this->_check_use($f, $option_values))
            {
                unset($exist_files[$k]);
            }
        }
        return $exist_files;
    }

    /**
     *   Kiểm tra xem việc sử dụng các tập tin treo
     *
     * @param  $f
     * @param array $option_values
     * @return true | Đang sử dụng, không thể bị xóa
     *         false | Không sử dụng, bạn có thể xóa
     */
    function _check_use($f, $option_values)
    {
        if (in_array($f, $option_values, true))
        {
            return true;
        }
        foreach ($option_values as $key => $val)
        {
            if (is_array($val))
            {
                if (in_array($f, $val))
                {
                    return true;
                }
            }
        }
       return false;
    }

    function _get_exist_file()
    {
        $files = array();
        $file_dir = ROOT_PATH . '/data/files/mall/template';
        if (!is_dir($file_dir))
        {

            return $files;
        }
        $dir  = dir($file_dir);
        while (false !== ($item = $dir->read()))
        {
            if (in_array($item, array('.', '..', 'index.htm')) || $item{0} == '.')
            {
                continue;
            }
            $files[] = 'data/files/mall/template/' . $item;
        }

        return $files;
    }

    function _get_option_value()
    {
        $config_dir = ROOT_PATH . '/data/page_config';
        $dir  = dir($config_dir);
        $config_values = array();
        while (false !== ($item = $dir->read()))
        {
            if (in_array($item, array('.', '..', 'index.htm')) || $item{0} == '.')
            {
                continue;
            }
            $tmp = include($config_dir . '/' . $item);
            $config_values = array_merge($config_values, $this->_get_all_value($tmp));
        }

        return $config_values;
    }
    function _get_all_value($widgets)
    {
        $values = array();
        if (isset($widgets['widgets']))
        {
            foreach ($widgets['widgets'] as $widget)
            {
                if (is_array($widget['options']))
                {
                    $values = array_merge($values, array_values($widget['options']));
                }
            }
        }
        if (isset($widgets['tmp']))
        {
            foreach ($widgets['tmp'] as $widget)
            {
                if (is_array($widget['options']))
                {
                    $values = array_merge($values, array_values($widget['options']));
                }
            }
        }

        return $values;
    }

    function _get_file($name, $type = 'script')
    {
        $file = ROOT_PATH . '/external/widgets/' . $name;
        switch ($type)
        {
            case 'script':
                return $file . '/main.widget.php';
            break;
            case 'template':
                return $file . '/widget.html';
            break;
        }
    }
}

?>
