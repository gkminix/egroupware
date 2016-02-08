<!-- BEGIN head --><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xml:lang="{lang_code}" xmlns="http://www.w3.org/1999/xhtml"{dir_code}>
	<head>
		<title>{website_title}</title>
		<meta http-equiv="content-type" content="text/html; charset={charset}" />
		<meta name="keywords" content="EGroupware" />
		<meta name="description" content="EGroupware" />
		<meta name="keywords" content="EGroupware" />
		<meta name="copyright" content="Stylite AG 2013, see http://www.stylite.de/EPL" />
		<meta name="language" content="{lang_code}" />
		<meta name="author" content="Stylite AG www.stylite.de" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
		<link rel="apple-touch-icon" href="{webserver_url}/phpgwapi/templates/default/images/logo64x64.png" />
		{pngfix}
		{meta_robots}
		<link rel="icon" href="{img_icon}" type="image/x-ico" />
		<link rel="shortcut icon" href="{img_shortcut}" />
		{css_file}
		<style type="text/css">
			{app_css}
		</style>
		{java_script}
	</head>
	<body {body_tags}>
		<div id="divAppboxHeader" class="onlyPrint">{app_header}</div>
<!-- END head -->
<!-- BEGIN framework -->
		{hook_after_navbar}
		<div id="egw_fw_basecontainer">
			<div id="egw_fw_top_toolbar">
				<div id="egw_fw_topmenu_items">{topmenu_items}</div>
				<div id="egw_fw_userinfo">
					<span class="avatar">
						<img></img>
					</span>
					<span class="user"></span>
				</div>
				<div id="egw_fw_menu" title="{title_menu}">
					<audio id="egw_fw_menuAudioTag" autobuffer="autobuffer">
						<source src="data:audio/mp3;base64,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AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP/71gBgAAAAAEsAAAAAAAAJYAAAAAAAASwAAAAAAAAlgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/+9YAYAAAAABLAAAAAAAACWAAAAAAAAEsAAAAAAAAJYAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA//vWAGAAAAAASwAAAAAAAAlgAAAAAAABLAAAAAAAACWAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP/71gBgAAAAAEsAAAAAAAAJYAAAAAAAASwAAAAAAAAlgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/+9YAYAAAAABLAAAAAAAACWAAAAAAAAEsAAAAAAAAJYAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA//vWAGAAAAAASwAAAAAAAAlgAAAAAAABLAAAAAAAACWAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP/71gBgAAAAAEsAAAAAAAAJYAAAAAAAASwAAAAAAAAlgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/+9YAYAAAAABLAAAAAAAACWAAAAAAAAEsAAAAAAAAJYAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA//vWAGAAAAAASwAAAAAAAAlgAAAAAAABLAAAAAAAACWAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP/71gBgAAAAAEsAAAAAAAAJYAAAAAAAASwAAAAAAAAlgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAA=";/>
					</audio>
				</div>
				</div>
			<div id="egw_fw_sidebar">
				<div id="egw_fw_sidemenu"></div>
			</div>
			<div id="egw_fw_main">

				<div id="egw_fw_tabs">

				</div>
			</div>
		</div>
		<div id="egw_fw_firstload"></div>
		<div id="egw_fw_footer">{powered_by}</div>
<!-- END framework -->
