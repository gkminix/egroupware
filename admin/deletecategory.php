<?php
  /**************************************************************************\
  * phpGroupWare - Admin                                                     *
  * (http://www.phpgroupware.org)                                            *
  * Written by Bettina Gille [ceb@phpgroupware.org]                          *    
  * -----------------------------------------------                          *
  *  This program is free software; you can redistribute it and/or modify it *
  *  under the terms of the GNU General Public License as published by the   *
  *  Free Software Foundation; either version 2 of the License, or (at your  *
  *  option) any later version.                                              *
  \**************************************************************************/
  /* $Id$ */

    if ($confirm) {
    $phpgw_info["flags"] = array('noheader' => True, 
                                  'nonavbar' => True);
    }

    $phpgw_info["flags"]["currentapp"] = 'admin';
    include('../header.inc.php');

    $c = CreateObject('phpgwapi.categories');
    $c->categories($phpgw_info['user']['account_id'],'phpgw');

    if (! $cat_id) {
    Header('Location: ' . $phpgw->link('/admin/categories.php'));
    }

    if ($confirm) {
    $c->delete($cat_id);    
    Header('Location: ' . $phpgw->link('/admin/categories.php',"start=$start&query=$query&sort=$sort&order=$order&filter=$filter"));
    }
    else {
    $hidden_vars = "<input type=\"hidden\" name=\"sort\" value=\"$sort\">\n"
                        . "<input type=\"hidden\" name=\"order\" value=\"$order\">\n"
                        . "<input type=\"hidden\" name=\"query\" value=\"$query\">\n"
                        . "<input type=\"hidden\" name=\"start\" value=\"$start\">\n"
                        . "<input type=\"hidden\" name=\"filter\" value=\"$filter\">\n"
                        . "<input type=\"hidden\" name=\"cat_id\" value=\"$cat_id\">\n";

    $t = CreateObject('phpgwapi.Template',$phpgw->common->get_tpl_dir('admin'));
    $t->set_file(array('category_delete' => 'delete_common.tpl'));
    $t->set_var('messages',lang('Are you sure you want to delete this category ?'));

    $nolinkf = $phpgw->link('/admin/categories.php',"cat_id=$cat_id&start=$start&query=$query&sort=$sort&order=$order&filter=$filter");
    $nolink = "<a href=\"$nolinkf\">" . lang('No') ."</a>";
    $t->set_var('no',$nolink);

    $yeslinkf = $phpgw->link('/admin/deletecategory.php',"cat_id=$cat_id&confirm=True");
    $yeslinkf = "<FORM method=\"POST\" name=yesbutton action=\"".$phpgw->link('/admin/deletecategory.php') . "\">"
                 . $hidden_vars
                 . "<input type=hidden name=cat_id value=$cat_id>"
		 . "<input type=hidden name=confirm value=True>"
                 . "<input type=submit name=yesbutton value=Yes>"
                 . "</FORM><SCRIPT>document.yesbutton.yesbutton.focus()</SCRIPT>";

    $yeslink = "<a href=\"$yeslinkf\">" . lang('Yes') ."</a>";
    $yeslink = $yeslinkf;

    $t->set_var('yes',$yeslink);

    $t->pparse('out','category_delete');
    }

    $phpgw->common->phpgw_footer();
?>
