<?php
  /**************************************************************************\
  * phpGroupWare - administration                                            *
  * http://www.phpgroupware.org                                              *
  * --------------------------------------------                             *
  *  This program is free software; you can redistribute it and/or modify it *
  *  under the terms of the GNU General Public License as published by the   *
  *  Free Software Foundation; either version 2 of the License, or (at your  *
  *  option) any later version.                                              *
  \**************************************************************************/
  	/* $Id$ */
  	
  	$phpgw_info["flags"] = array(
  		"noheader" => True,
  		"nonavbar" => True,
  		"currentapp" => "admin",
  		"parent_page" => "accounts.php"
  	);
  	
  	include("../header.inc.php");
  	include($phpgw_info["server"]["app_inc"]."/accounts_".$phpgw_info["server"]["account_repository"].".inc.php");
  	
  	// creates the html for the user data
  	function createPageBody($_account_id,$_userData='',$_errors='')
  	{
  		global $phpgw,$phpgw_info;
  		
		$t = new Template($phpgw->common->get_tpl_dir("admin"));
  		$t->set_file(array("form" => "account_form.tpl"));
		
		if ($_userData)
		{
			$userData=$_userData;
			reset($userData['n_groups']);
			while(list($key, $value) = each($userData['n_groups']))
			{
				$userGroups[$key]['account_id'] = $value;
			}
			
			$account = CreateObject('phpgwapi.accounts');
			$allGroups = $account->get_list('groups');
		}
		else
		{
			$account = CreateObject('phpgwapi.accounts',$_account_id);
			$userData = $account->read_repository();
			$userGroups = $account->memberships(intval($_account_id));
			$allGroups = $account->get_list('groups');
		}

		$t->set_var("form_action",$phpgw->link("editaccount.php",
			"account_id=$_account_id&old_loginid=".rawurlencode($userData['account_lid'])));

		// groups list
		$groups_select = '<select name="n_groups[]" multiple>';
		$accounts =  $account->get_list();

		for($i=0;$i<count($accounts);$i++) {
			//echo $account->get_type($accounts[$i]["account_id"]);
			if ($account->get_type($accounts[$i]["account_id"]) == "g") {
				$groups_select .= '<option value="' . $accounts[$i]["account_id"] . '"';
				$members = $account->members($accounts[$i]["account_id"]);
				if (!$members) { $members = array(); }
				while (list($name,$value) = each($members)) {
					//echo $value;
					if ($value == $accounts[$i]["account_id"]) {
						$groups_select .= " selected";
					}
				}
				$groups_select .= ">" . $accounts[$i]["account_lid"] . "</option>\n";
			}
		}
		$groups_select .= "</select>";
		$t->set_var("groups_select",$groups_select);
		// end groups list

		if ($_errors) 
		{
			$t->set_var("error_messages","<center>" . $phpgw->common->error_list($_errors) . "</center>");
		} 
		else 
		{
			$t->set_var("error_messages","");
		}
				
		$t->set_var("th_bg",$phpgw_info["theme"]["th_bg"]);
		$t->set_var("tr_color1",$phpgw_info["theme"]["row_on"]);
		$t->set_var("tr_color2",$phpgw_info["theme"]["row_off"]);
		
		$t->set_var("lang_action",lang("Edit user account"));
		$t->set_var("lang_loginid",lang("LoginID"));
		$t->set_var("lang_account_active",lang("Account active"));
		$t->set_var("lang_password",lang("Password"));
		$t->set_var("lang_reenter_password",lang("Re-Enter Password"));
		$t->set_var("lang_lastname",lang("Last Name"));
		$t->set_var("lang_groups",lang("Groups"));
		$t->set_var("lang_firstname",lang("First Name"));
  		$t->set_var("lang_button",lang('Save'));

		$t->set_var("n_loginid_value",$userData["account_lid"]);
		$t->set_var("n_passwd_value",$n_passwd);
		$t->set_var("n_passwd_2_value",$n_passwd_2);
		
		if ($userData["status"]) 
		{
			$t->set_var("account_checked","checked");
		} 
		else 
		{
			$t->set_var("account_checked","");
		}
		$t->set_var("n_firstname_value",$userData["firstname"]);
		$t->set_var("n_lastname_value",$userData["lastname"]);

		$allAccounts;
		$userGroups;
		
		$groups_select = '<select name="n_groups[]" multiple>';
		reset($allGroups);
		while (list($key,$value) = each($allGroups)) 
		{
			$groups_select .= '<option value="' . $value['account_id'] . '"';
			for ($i=0; $i<count($userGroups); $i++) 
			{
				#print "Los1:".$userData["account_id"].$userGroups[$i]['account_id']." : ".$value['account_id']."<br>";
				if ($userGroups[$i]['account_id'] == $value['account_id']) 
				{
					$groups_select .= " selected";
				}
			}
			$groups_select .= ">" . $value['account_lid'] . "</option>\n";
		}
		$groups_select .= "</select>";
		$t->set_var("groups_select",$groups_select);

		
		// create list of available app
		$i = 0;
		
		$availableApps = $phpgw_info["apps"];
		@asort($availableApps);
		@reset($availableApps);
		while ($application = each($availableApps)) 
		{
			if ($application[1]["enabled"]) 
			{
				$perm_display[$i]['appName']        = $application[0];
				$perm_display[$i]['translatedName'] = $application[1]["title"];
				$i++;
			}
		}

		// create apps output
		$apps = CreateObject('phpgwapi.applications',intval($_account_id));
		$db_perms = $apps->read_account_specific();
		
		@reset($db_perms);
		
		for ($i=0;$i<=count($perm_display);$i++) 
		{
			$checked = "";
			if ($new_permissions[$perm_display[$i]['appName']] || $db_perms[$perm_display[$i]['appName']]) 
			{
				$checked = " checked";
			}
			
			if($perm_display[$i]['translatedName'])
			{
				$part1 = sprintf("<td>%s</td><td><input type=\"checkbox\" name=\"new_permissions[%s]\" value=\"True\" %s></td>",
					lang($perm_display[$i]['translatedName']),
					$perm_display[$i]['appName'],
					$checked);
			}


			$i++;
			
			
			$checked = "";
			if ($new_permissions[$perm_display[$i]['appName']] || $db_perms[$perm_display[$i]['appName']]) 
			{
				$checked = " checked";
			}
			
			if($perm_display[$i]['translatedName'])
			{
				$part2 = sprintf("<td>%s</td><td><input type=\"checkbox\" name=\"new_permissions[%s]\" value=\"True\" %s></td>",
					lang($perm_display[$i]['translatedName']),
					$perm_display[$i]['appName'],
					$checked);
			}
			else
			{
				$part2 = '<td colspan="2">&nbsp;</td>';
			}
			
			$appRightsOutput .= sprintf("<tr bgcolor=\"%s\">$part1$part2</tr>\n",$phpgw_info["theme"]["row_on"]);
		}
	
		$t->set_var("permissions_list",$appRightsOutput);

		$t->pparse('out','form');
	}

	// stores the userdata
	function saveUserData($_userData)
	{
		$account = CreateObject('phpgwapi.accounts',$_userData['account_id']);
		$account->update_data($_userData);
		$account->save_repository();
		if ($_userData['passwd'])
		{
			$auth = CreateObject('phpgwapi.auth');
			$auth->change_password($old_passwd, $_userData['passwd'], $_userData['account_id']);
		}

		$apps = CreateObject('phpgwapi.applications',array(intval($_userData['account_id']),'u'));
#		$apps->read_installed_apps();
#		$apps_before = $apps->read_account_specific();
		
		$apps->account_type = 'u';
		$apps->account_id = $_userData['account_id'];
		$apps->account_apps = Array(Array());
		while($app = each($_userData['new_permissions'])) 
		{
			if($app[1]) 
			{
				$apps->add($app[0]);
				if(!$apps_before[$app[0]]) 
				{
					$apps_after[] = $app[0];
				}
			}
		}
		$apps->save_repository();
		


		$account = CreateObject('phpgwapi.accounts');
		$allGroups = $account->get_list('groups');
		
		reset($_userData['n_groups']);
		while (list($key,$value) = each($_userData['n_groups']))
		{
			$newGroups[$value] = $value;
		}

		$acl = CreateObject('phpgwapi.acl',$_userData['account_id']);

		reset($allGroups);
		while (list($key,$groupData) = each($allGroups)) 
		{
			#print "$key,". $groupData['account_id'] ."<br>";

			#print "$key,". $_userData['n_groups'][1] ."<br>";

			if ($newGroups[$groupData['account_id']]) 
			{
				$acl->add_repository('phpgw_group',$groupData['account_id'],$_userData['account_id'],1);
			}
			else
			{
				$acl->delete_repository('phpgw_group',$groupData['account_id'],$_userData['account_id']);
			}
		}
	}
  	
	// checks if the userdata are valid
	// returns FALSE if the data are correct
	// otherwise the error array
	function userDataInvalid($_userData)
	{
		global $phpgw_info;
		
		$totalerrors = 0;
		
		if ($phpgw_info["server"]["account_repository"] == "ldap" && ! $allow_long_loginids) 
		{
			if (strlen($_userData['account_lid']) > 8) 
			{
				$error[$totalerrors] = lang("The loginid can not be more then 8 characters");
				$totalerrors++;
			}
		}
		
		if ($_userData['old_loginid'] != $_userData['account_lid']) 
		{
			if (account_exsists($_userData['n_loginid'])) 
			{
				$error[$totalerrors] = lang("That loginid has already been taken");
				$totalerrors++;
			}
		}
		
		if ($_userData['n_passwd'] || $_userData['n_passwd_2']) 
		{
			if ($_userData['n_passwd'] != $_userData['n_passwd_2']) 
			{
				$error[$totalerrors] = lang("The two passwords are not the same");
				$totalerrors++;
			}
		}
		
		if (!count($_userData['new_permissions']) || !count($_userData['n_groups'])) 
		{
			$error[$totalerrors] = "<br>" . lang("You must add at least 1 permission or group to this account");
			$totalerrors++;
		}
		
		if ($totalerrors == 0)
		{
  			return FALSE;
  		}
  		else
  		{
  			return $error;
  		}
  	}
  	
  	// todo
  	// not needed if i use the same file for new users too
  	if (! $account_id) {
  		Header("Location: " . $phpgw->link("accounts.php"));
  	}


	if ($submit)
	{
		$userData = array(
			'account_lid'    => $account_lid,     	'firstname'   => $n_firstname,
			'lastname'       => $n_lastname,       	'passwd'    => $n_passwd,
			'status' 	 => $n_status, 		'old_loginid' => rawurldecode($old_loginid),
			'account_id'     => $account_id,	'passwd_2'  => $n_passwd_2,
			'n_groups' 	 => $n_groups,		'new_permissions' => $new_permissions
		);
		
		if (!$errors = userDataInvalid($userData)) 
		{ 
			saveUserData($userData);
			Header('Location: ' . $phpgw->link('accounts.php', 'cd='.$cd));
			$phpgw->common->phpgw_exit();
		}
		else
		{
			$phpgw->common->phpgw_header();
			echo parse_navbar();
			
			createPageBody($userData['account_id'],$userData,$errors);
			
  			account_close();
  			$phpgw->common->phpgw_footer();
			
		}
	}
	else
	{
		$phpgw->common->phpgw_header();
		echo parse_navbar();
		
		createPageBody($account_id);

  		account_close();
  		$phpgw->common->phpgw_footer();
  	}
  	
  	return;

//////////////////////////////////////////////////////////////////////////////////////////
//
//			the old code
//
/////////////////////////////////////////////////////////////////////////////////////////  	
       
       // The following sets any default preferences needed for new applications..
       // This is smart enough to know if previous preferences were selected, use them.
       
       $pref = CreateObject('phpgwapi.preferences',intval($account_id));
       $t = $pref->get_preferences();
         
       $docommit = False;
       $after_apps = explode(':',$apps_after);
       for($i=1;$i<count($after_apps) - 1;$i++) {
         if($after_apps[$i]=='admin') {
           $check = 'common';
         } else {
           $check = $after_apps[$i];
		 }
         if (!$t["$check"]) {
           $phpgw->common->hook_single('add_def_pref', $after_apps[$i]);
           $docommit = True;
         }
       }
       
       if ($docommit) {
		 $pref->commit();
	   }

       // start including other admin tools
       while($app = each($apps_after))
       {
         $phpgw->common->hook_single('update_user_data', $app[0]);
       }       

  $includedSomething = False;
  // start inlcuding other admin tools
  while($app = each($apps_after))
  {
	// check if we have something included, when not ne need to set
	// {gui_hooks} to ""
  	if ($phpgw->common->hook_single('show_user_data', $app[0])) $includedSomething=True;
  }       
  if (!$includedSomething) $t->set_var('gui_hooks','');

?>
