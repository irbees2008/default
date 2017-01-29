<?php
// Protect against hack attempts
if (!defined('NGCMS')) die ('HAL');

if ( !in_array($config['default_lang'], array('russian', 'english'))) {
	$config['default_lang'] = 'english';
}

// Load skin language
function LoadLang_Askin() {
	global $config;
	
	$filename = root . 'skins/default/lang/' . $config['default_lang'] . '/admin/index.ini';
	
	if (!$content = parse_ini_file($filename, true)) {
		$filename = root . 'skins/default/lang/english/admin/index.ini';
		$content = parse_ini_file($filename, true);
	}
	
	return $content;
}

$skins_url = skins_url;

$lang = array_merge (LoadLang('index', 'admin'), LoadLang_Askin());

<<<<<<< HEAD
////////////// ������ � $_COOKIE �������
=======
////////////// Запись в $_COOKIE сделать
>>>>>>> refs/remotes/origin/master
LoadPluginLibrary('uprofile', 'lib');
$skin_UAvatar = ( isset($userROW['avatar']) and !empty($userROW['avatar']) )? userGetAvatar($userROW)[1] : $skins_url . '/assets/img/default-avatar.jpg';
$skin_UStatus = $UGROUP[$userROW['status']]['langName'][$config['default_lang']];
///////////////////

$year = date("Y");

if (is_array($userROW)) {
	$unnAppCount = '0';
	$newpm = '';
	$unapp1 = '';
	$unapp2 = '';
	
	$newpm = $mysql->result("SELECT count(pmid) FROM ".prefix."_users_pm WHERE to_id = ".db_squote($userROW['id'])." AND viewed = '0'");
<<<<<<< HEAD
	$newpmText = ($newpm != "0") ? $newpm : '��� �����';
=======
	$newpmText = ($newpm != "0") ? $newpm : 'нет новых';
>>>>>>> refs/remotes/origin/master
	
	// Calculate number of un-approved news
	if ($userROW['status'] == 1 || $userROW['status'] == 2) {
		$unapp1 = $mysql->result("SELECT count(id) FROM ".prefix."_news WHERE approve = '1'");
		$unapp2 = $mysql->result("SELECT count(id) FROM ".prefix."_news WHERE approve = '0'");
		$unapp3 = $mysql->result("SELECT count(id) FROM ".prefix."_news WHERE approve = '-1'");
		$unapp4 = $mysql->result("SELECT count(id) FROM ".prefix."_static WHERE approve = '0'");
		if ($unapp1)
<<<<<<< HEAD
		$unapproved1 = ' <li> <a href="'.$PHP_SELF.'?mod=news&amp;status=1"> ��������� <span class="label label-primary">'.$unapp3.'</span>  </a></li>  ';
		if ($unapp2)
		$unapproved2 = '<span class="label label-primary">'.$unapp1.'</span>';
	    if ($unapp3)
		$unapproved3 = '<li> <a href="'.$PHP_SELF.'?mod=news&amp;status=2"> �� ��������� <span class="label label-primary">'.$unapp2.'</span> </a></li>';
=======
		$unapproved1 = ' <li> <a href="'.$PHP_SELF.'?mod=news&amp;status=1"> Черновики <span class="label label-primary">'.$unapp3.'</span>  </a></li>  ';
		if ($unapp2)
		$unapproved2 = '<span class="label label-primary">'.$unapp1.'</span>';
	    if ($unapp3)
		$unapproved3 = '<li> <a href="'.$PHP_SELF.'?mod=news&amp;status=2"> На модерации <span class="label label-primary">'.$unapp2.'</span> </a></li>';
>>>>>>> refs/remotes/origin/master
		if ($unapp4)
		$unapproved4 = '<span class="label label-primary">'.$unapp4.'</span>';
	}
	
	$unnAppCount = (int)$newpm + (int)$unapp1 + (int)$unapp2 + (int)$unapp3;
}

$mod = $_REQUEST['mod'];
$action = isset($_REQUEST['action'])?$_REQUEST['action']:'';

$h_active_pm = ($mod=='pm')?' active':'';
$h_active_content = ( $mod=='news' || $mod=='categories' || $mod=='static' || $mod=='images' || $mod=='files' )?' class="active"':'';

$h_active_users = (($mod=='users')||($mod=='ipban')||($mod=='ugroup')||($mod=='perm'))?' class="active"':'';
$h_active_extras = (($mod=='extra-config')||($mod=='extras'))?' class="active"':'';
$h_active_templates = ($mod=='templates')?' class="active"':'';
$h_active_options = (($mod=='')||($mod=='options')||($mod=='configuration')||($mod=='statistics')||($mod=='dbo')||($mod=='rewrite')||($mod=='cron'))?' class="active"':'';
$skin_header = <<<HTML

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="$lang[langcode]" lang="$lang[langcode]" dir="ltr">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=$lang[encoding]" />
<title>$config[home_title] - $lang[adminpanel]</title>
<link href="$skins_url/css/bootstrap.css" rel="stylesheet">
<link href="$skins_url/css/font-awesome.min.css" rel="stylesheet">
<link href="$skins_url/css/styles.css" rel="stylesheet">
		<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
   <link href="http://fonts.googleapis.com/css?family=Exo+2&subset=latin,cyrillic" rel="stylesheet" type="text/css">		
<link rel="stylesheet" href="$config[home_url]/lib/jqueryui/core/themes/cupertino/jquery-ui.min.css" type="text/css"/>
<link rel="stylesheet" href="$config[home_url]/lib/jqueryui/core/themes/cupertino/jquery-ui.theme.min.css" type="text/css"/>
<link rel="stylesheet" href="$config[home_url]/lib/jqueryui/plugins/jquery-ui-timepicker-addon/dist/jquery-ui-timepicker-addon.min.css" type="text/css"/>
<!--<link rel="stylesheet" href="$config[home_url]/lib/jqueryui/plugins/jquery-ui-multiselect-widget-1.17/jquery.multiselect.css" type="text/css"/>-->
<script type="text/javascript" src="$config[home_url]/lib/jq/jquery.min.js"></script>
<script type="text/javascript" src="$config[home_url]/lib/jqueryui/core/jquery-ui.min.js"></script>
<script type="text/javascript" src="$config[home_url]/lib/jqueryui/plugins/jquery-ui-timepicker-addon/dist/jquery-ui-timepicker-addon.min.js"></script>
<script type="text/javascript" src="$config[home_url]/lib/functions.js"></script>
<script type="text/javascript" src="$config[home_url]/lib/admin.js"></script>
</head>
<body>

<!-- Page Loader -->
	<section id="loader-wrapper"><div id="loader">$lang[loading]</div></section>
	<!-- Page Loader END -->

<!-- navbar -->
		<header class="topnav">
			<div class="topnav-left">
				<a class="topnav-bars" href="#"><i class="fa fa-2x fa-bars" aria-hidden="true" ></i></a>
				<a class="topnav-logo" href="$config[home_url]" title="$lang[mainpage_t]" target="_blank"><i class="fa fa-lg fa-rocket" aria-hidden="true"></i> <span class="hidden-xs">Next Generation CMS</span></a>
			</div>
			<div class="topnav-right">
				<ul class="topnav-menu">
					<li><a class="pm" href="$PHP_SELF?mod=pm" title="$lang[pm_t]"><i class="fa fa-lg fa-envelope-o" aria-hidden="true" ></i><span class="badge badge-warning">$newpm</span></a></li>
					<li>
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="$skin_UAvatar" class="avatar" alt="avatar"></a>
						<ul class="dropdown-menu user" role="menu">
							<li><a href="profile.html"><i class="fa fa-user" aria-hidden="true"></i> Мой профиль</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="$PHP_SELF?action=logout" title="$lang[logout_t]"><i class="fa fa-power-off" aria-hidden="true"></i> $lang[logout]</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</header>
		<!-- /navbar -->
		
	<div class="container-fluid">
			<!-- Sidebar -->
			<div class="content-sidebar collapse">
				<ul class="nav nav-menu">
					<li class="active"><a href="$config[home_url]"><i class="fa fa-external-link" aria-hidden="true" style="color: #3fe1fe;"></i> $lang[mainpage]</a></li>
					
					<li><a href="#"><i class="fa fa-cogs" aria-hidden="true" style="color: #3fe1fe;"></i> $lang[system] <span class="caret"></span></a>
						<ul class="nav nav-level">
							<li><a href="$PHP_SELF?mod=configuration" title="$lang[configuration]">$lang[configuration]</a></span></li>
							<li><a href="$PHP_SELF?mod=dbo" title="$lang[dbo] ">$lang[dbo]</a></li>
							<li><a href="$PHP_SELF?mod=rewrite" title="$lang[rewrite]">Управление форматом ссылок</a></li>
							<li><a href="$PHP_SELF?mod=cron" title="$lang[cron]">Планировщик задач</a></li>
						</ul>
					</li>
					<li><a href="#"><i class="fa fa-newspaper-o" aria-hidden="true" style="color: #3fe1fe;"></i> $lang[news]<span class="caret"></span></a>
						<ul class="nav nav-level">
							<li><a href="$PHP_SELF?mod=news&amp;action=add" title="$lang[addnews_t]">$lang[addnews]</a></li>
							<li><a href="$PHP_SELF?mod=news" title="$lang[editnews_t]">$lang[editnews] $unapproved2 </a></li>
							$unapproved1
							$unapproved3
							</ul>
					</li>
<<<<<<< HEAD
					<li><a href="$PHP_SELF?mod=static" title="$lang[l_static]"><i class="fa fa-sticky-note-o" aria-hidden="true" style="color: #3fe1fe;"></i> $lang[l_static] $unapproved4</a></li>
					<li><a href="$PHP_SELF?mod=categories" title="$lang[categories]"><i class="fa fa-sitemap" aria-hidden="true" style="color: #3fe1fe;"></i> $lang[categories]</a></li>
=======
					<li><a href="$PHP_SELF?mod=static" title="$lang[l_static]">$lang[l_static] $unapproved4</a></li>
					<li><a href="$PHP_SELF?mod=categories" title="$lang[categories]">$lang[categories]</a></li>
>>>>>>> refs/remotes/origin/master
					
					<li><a href="#"><i class="fa fa-cog" aria-hidden="true" style="color: #3fe1fe;"></i> $lang[other]<span class="caret"></span></a>
						<ul class="nav nav-level">
							<li><a href="$PHP_SELF?mod=extras" title="$lang[extras_t]">$lang[extras]</a></span></li>
							<li><a href="$PHP_SELF?mod=images" title="$lang[images_t]">$lang[images]</a></span></li>
							<li><a href="$PHP_SELF?mod=files" title="$lang[files_t]">$lang[files]</a></span></li>
							<li><a href="$PHP_SELF?mod=templates" title="$lang[templates]">$lang[templates]</a></li>
						</ul>
					</li>
					<li><a href="#"><i class="fa fa-users" aria-hidden="true" style="color: #3fe1fe;"></i> $lang[userman]<span class="caret"></span></a>
						<ul class="nav nav-level">
							<li><a href="$PHP_SELF?mod=users" title="$lang[users]">$lang[users]</a></li>
							<li><a href="$PHP_SELF?mod=ipban" title="$lang[ipban]">$lang[ipban]</a></li>
							<li><a href="$PHP_SELF?mod=ugroup" title="$lang[ugroup]">$lang[ugroup]</a></li>
							<li><a href="$PHP_SELF?mod=perm" title="$lang[uperm]">$lang[uperm]</a></li> 
						</ul>
					</li>
					
				</ul>
			</div>
			<!-- /sidebar -->
			<!-- main content -->
			<div class="content-main">


HTML;


$skin_footer = <<<HTML
</div>


<!--<script type="text/javascript" src="$config[home_url]/lib/jqueryui/plugins/jquery-ui-timepicker-addon/dist/i18n/jquery-ui-timepicker-addon-i18n.min.js"></script>-->
<!--<script type="text/javascript" src="$config[home_url]/lib/jqueryui/plugins/jquery-ui-multiselect-widget/src/jquery.multiselect.min.js"></script>-->
<script language="javascript" type="text/javascript">
$datetimepicker_lang
</script>
		
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="$skins_url/js/bootstrap.js"></script>
		<script src="$skins_url/js/jquery.nicescroll.min.js"></script>
		<script src="$skins_url/js/scripts.js"></script>
	</body>
</html>
HTML;
?>
