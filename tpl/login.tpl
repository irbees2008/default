<!DOCTYPE html>
<html lang="ru">
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset={l_encoding}" />
		<title>{home_title} - {l_adminpanel}</title>
		<link href="{skins_url}/css/bootstrap.css" rel="stylesheet">
		<link href="{skins_url}/css/styles.css" rel="stylesheet" />
		<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
</head>
	<body>
		<div class="container-login" id="login_wrap">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Авторизационная форма</h3>
				</div>
				    <form name="login" method="post" action="{php_self}">
				<div class="panel-body">
					<div style="margin: 10px 0;">
						<input type="text" name="username" class="form-control" placeholder="{l_name}">
					</div>
					<div style="margin: 10px 0;">
						<input type="password" name="password" class="form-control" placeholder="{l_password}">
					</div>
					<div class="left" style="margin: 10px 0;">
						<button type="submit" class="btn btn-success">{l_login}</button>
					</div>
					<input type="hidden" name="redirect" value="{redirect}" />
<input type="hidden" name="action" value="login" />
    </form>
					<div class="right" style="margin: 10px 0;">
						<label class="checkbox-inline">
							<input type="checkbox"> Запомнить меня
						</label>
					</div>
					
				</div>
				<div class="panel-footer">
					<div style="margin: 10px;">2008-{year} © <a href="http://ngcms.ru" target="_blank">Next Generation CMS</a>
					</div></div>
			</div>
		</div>
		
	</body>
</html>

