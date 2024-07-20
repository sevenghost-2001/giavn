<?php

/* Pendant lớp cơ bản */
include(ROOT_PATH . '/includes/widget.base.php');

/**
 *    Chỉnh sửa Template điều khiển
 *
 *    @author    Garbin
 *    @usage    none
 */
class TemplateApp extends BackendApp
{
    /* Danh sách các trang có thể được chỉnh sửa */
    function index()
    {
        $this->assign('pages', $this->_get_editable_pages());
        $this->display('template.index.html');
    }

    /**
     *    Chỉnh sửa các trang
     *
     *    @author    Garbin
     *    @return    void
     */
    function edit()
    {
        /* Hiện tại, chỉnh sửa các trang */
        $page    = !empty($_GET['page']) ? trim($_GET['page']) : null;
        if (!$page)
        {
            $this->show_warning('no_such_page');

            return;
        }

        /* Lưu ý rằng theo cách này để có được những trang với các dữ liệu người dùng liên quan đến là khách du lịch, bảo đảm tính thống nhất, trình biên tập WYSIWYG sẽ không được bởi vì bạn đã đăng nhập vào và có những khác nhau*/
        $html = $this->_get_page_html($page);
        if (!$html)
        {
            $this->show_warning('no_such_page');

            return;
        }
        /* Hãy làm cho trang có thể chỉnh sửa */
        $html = $this->_make_editable($page, $html);

        echo $html;
    }

    /**
     *    Lưu trang chỉnh sửa
     *
     *    @author    Garbin
     *    @return    void
     */
    function save()
    {
        /* khởi tạo các biến */
        /* Tất cả các trang phụ kiện id=>name */
        $widgets = !empty($_POST['widgets']) ? $_POST['widgets'] : array();

        /* Trang trong vị trí của tất cả các mặt dây chuyền dữ liệu cấu hình */
        $config  = !empty($_POST['config']) ? $_POST['config'] : array();

        /* Hiện tại, chỉnh sửa các trang */
        $page    = !empty($_GET['page']) ? trim($_GET['page']) : null;
        if (!$page)
        {
            $this->json_error('no_such_page');

            return;
        }
        $editable_pages = $this->_get_editable_pages();
        if (empty($editable_pages[$page]))
        {
            $this->json_error('no_such_page');

            return;
        }

        $page_config = get_widget_config(Conf::get('template_name'), $page);

        /* Vị trí của các thông tin cấu hình được viết */
        $page_config['config'] = $config;

        /* Gốc treo mẩu thông tin */
        $old_widgets = $page_config['widgets'];

        /* Rõ ràng treo mẩu thông tin thô */
        $page_config['widgets']  = array();

        /* Viết thông tin để chỉ ra mặt dây chuyền mà ID là mặt dây treo và cấu hình liên quan */
        foreach ($widgets as $widget_id => $widget_name)
        {
            /* Viết phần mới của thông tin liên quan đến */
            $page_config['widgets'][$widget_id]['name']     = $widget_name;
            $page_config['widgets'][$widget_id]['options']  = array();

            /* Nếu bạn thực hiện một cấu hình mới, viết */
            if (isset($page_config['tmp'][$widget_id]))
            {
                $page_config['widgets'][$widget_id]['options'] = $page_config['tmp'][$widget_id]['options'];

                continue;
            }

            /* Các thông tin cấu hình cũ được viết */
            $page_config['widgets'][$widget_id]['options'] = $old_widgets[$widget_id]['options'];
        }

        /* Rõ ràng thông tin cấu hình tạm thời */
        unset($page_config['tmp']);

        /* lưu cấu hình */
        $this->_save_page_config(Conf::get('template_name'), $page, $page_config);
        $this->json_result('', 'save_successed');
    }

    /**
     *    Nhận bảng biên tập
     *
     *    @author    Garbin
     *    @return    void
     */
    function get_editor_panel()
    {
        /* Có được một danh sách các phụ kiện */
        $widgets = list_widget();
        header('Content-Type:text/html;charset=' . CHARSET);
        $this->assign('widgets', ecm_json_encode($widgets));
        $this->assign('site_url', SITE_URL);
        $this->display('template.panel.html');
    }

    /**
     *    Thêm một mặt dây chuyền đến trang
     *
     *    @author    Garbin
     *    @return    void
     */
    function add_widget()
    {
        $name = !empty($_GET['name']) ? trim($_GET['name']) : null;
        /* Hiện tại, chỉnh sửa các trang */
        $page    = !empty($_GET['page']) ? trim($_GET['page']) : null;
        if (!$name || !$page)
        {
            $this->json_error('no_such_widget');

            return;
        }
        $page_config = get_widget_config(Conf::get('template_name'), $page);
        $id = $this->_get_unique_id($page_config);
        $widget =& widget($id, $name, array());
        $contents = $widget->get_contents();
        $this->json_result(array('contents' => $contents, 'widget_id' => $id));
    }

    function _get_unique_id($page_config)
    {
        $id = '_widget_' . rand(100, 999);
        if (array_key_exists($id, $page_config['widgets']))
        {
            return $this->_get_unique_id($page_config);
        }

        return $id;
    }

    /**
     *    Đối với treo một mảnh duy nhất của bảng cấu hình
     *
     *    @author    Garbin
     *    @return    void
     */
    function get_widget_config_form()
    {
        $name = !empty($_GET['name']) ? trim($_GET['name']) : null;
        $id   = !empty($_GET['id']) ? trim($_GET['id']) : null;
        /* Hiện tại, chỉnh sửa các trang */
        $page    = !empty($_GET['page']) ? trim($_GET['page']) : null;
        if (!$name || !$id || !$page)
        {
            $this->json_error('no_such_widget');

            return;
        }
        $page_config = get_widget_config(Conf::get('template_name'), $page);
        $options = empty($page_config['tmp'][$id]['options']) ? $page_config['widgets'][$id]['options'] : $page_config['tmp'][$id]['options'];
        $widget =& widget($id, $name, $options);
        header('Content-Type:text/html;charset=' . CHARSET);
        $widget->display_config();
    }

    /**
     *    Cấu hình phần treo
     *
     *    @author    Garbin
     *    @param    none
     *    @return    void
     */
    function config_widget()
    {
        if (!IS_POST)
        {
            return;
        }
        $name = !empty($_GET['name']) ? trim($_GET['name']) : null;
        $id   = !empty($_GET['id']) ? trim($_GET['id']) : null;
        /* Hiện tại, chỉnh sửa các trang */
        $page    = !empty($_GET['page']) ? trim($_GET['page']) : null;
        if (!$name || !$id || !$page)
        {
            $this->_config_respond('_d.setTitle("' . Lang::get('no_such_widget') . '");_d.setContents("message", {text:"' . Lang::get('no_such_widget') . '"});');

            return;
        }
        $page_config = get_widget_config(Conf::get('template_name'), $page);
        $widget =& widget($id, $name, $page_config['widgets'][$id]['options']);
        $options = $widget->parse_config($_POST);
        if ($options === false)
        {
            $this->json_error($widget->get_error());

            return;
        }
        $page_config['tmp'][$id]['options'] = $options;

        /* Lưu thông tin cấu hình */
        $this->_save_page_config(Conf::get('template_name'), $page, $page_config);

        /* Thời gian thực cập nhật của dữ liệu trả về */
        $widget->set_options($options);
        $contents = $widget->get_contents();
        $this->_config_respond('DialogManager.close("config_dialog");parent.disableLink(parent.$(document.body));parent.$("#' . $id . '").replaceWith(document.getElementById("' . $id . '").parentNode.innerHTML);parent.init_widget("#' . $id . '");', $contents);
    }

    /**
     *    Đáp ứng yêu cầu cấu hình
     *
     *    @author    Garbin
     *    @param    none
     *    @return    void
     */
    function _config_respond($js, $widget = '')
    {
        header('Content-Type:text/html;charset=' . CHARSET);
        echo  '<div>' . $widget . '</div>' . '<script type="text/javascript">var DialogManager = parent.DialogManager;var _d = DialogManager.get("config_widget");' . $js . '</script>';
    }

    /**
     *    Lưu file bố trí trang
     *
     *    @author    Garbin
     *    @param     string $template_name
     *    @param     string $page
     *    @param     array  $page_config
     *    @return    void
     */
    function _save_page_config($template_name, $page, $page_config)
    {
        $page_config_file = ROOT_PATH . '/data/page_config/' . $template_name . '.' . $page . '.config.php';
        $php_data = "<?php\n\nreturn " . var_export($page_config, true) . ";\n\n?>";

        return file_put_contents($page_config_file, $php_data, LOCK_EX);
    }

    /**
     *    Nhận trang HTML bạn muốn chỉnh sửa
     *
     *    @author    Garbin
     *    @param     string $page
     *    @return    string
     */
    function _get_page_html($page)
    {
        $pages = $this->_get_editable_pages();
        if (empty($pages[$page]))
        {
            return false;
        }

        return file_get_contents($pages[$page]);
    }

    /**
     *    Để chỉnh sửa trang
     *
     *    @author    Garbin
     *    @param     string $html
     *    @return    string
     */
    function _make_editable($page, $html)
    {
        $editmode = '<script type="text/javascript" src="admin/index.php?act=jslang"></script><script type="text/javascript">__PAGE__ = "' . $page . '";</script><script type="text/javascript" src="' . SITE_URL . '/includes/libraries/javascript/jquery.ui/jquery.ui.js"></script><script type="text/javascript" charset="utf-8" src="' . SITE_URL . '/includes/libraries/javascript/jquery.ui/i18n/' . i18n_code() . '.js"></script><script id="dialog_js" type="text/javascript" src="' . SITE_URL . '/includes/libraries/javascript/dialog/dialog.js"></script><script id="template_editor_js" type="text/javascript" src="' . SITE_URL . '/admin/includes/javascript/template_panel.js"></script><link id="template_editor_css" href="' . SITE_URL . '/admin/templates/style/template_panel.css" rel="stylesheet" type="text/css" /><link rel="stylesheet" href="' . SITE_URL . '/includes/libraries/javascript/jquery.ui/themes/ui-lightness/jquery.ui.css" type="text/css" media="screen" /><link rel="stylesheet" href="' . SITE_URL . '/includes/libraries/javascript/hack.css" type="text/css" media="screen" />';

        return str_replace('<!--<editmode></editmode>-->', $editmode, $html);
    }

    /**
     *    Có được một danh sách các trang có thể được chỉnh sửa
     *
     *    @author    Garbin
     *    @param    none
     *    @return    void
     */
    function _get_editable_pages()
    {
        return array(
            'index' => SITE_URL . '/index.php',
            'gcategory' => SITE_URL . '/index.php?app=category',
        );
    }
}

?>
