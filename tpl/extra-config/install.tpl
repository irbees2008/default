<form method="post" action="{php_self}?mod=extra-config">
<!-- breadcrumb -->
				<div class="row breadcrumb">
					<ol class="breadcrumb-entry">
						<li><a href="admin.php">{l_home}</a</li>
						<li class="active"> {mode_text}: {plugin}</li>
					</ol>
				</div>
				<!-- /breadcrumb -->
				
<div class="row">
<div class="col-md-12">	
<div class="panel panel-default">
<table class="table">
<tr><td><div class="telo">{install_text}</div></td></tr>
<tr align="center">
<td width="100%" colspan="2" class="contentEdit" valign="top">
<input type="hidden" name="plugin" value="{plugin}" />
<input type="hidden" name="stype" value="{stype}" />
<input type="hidden" name="action" value="commit" />
</td>
</tr>
</table>
<div class="panel-body">
<button class="btn btn-success" type="submit">{mode_commit}</button>
</div>
</div>
</div>
</div>
</form>