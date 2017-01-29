<!-- breadcrumb -->
				<div class="row breadcrumb">
					<ol class="breadcrumb-entry">
						<li><a href="admin.php">{l_home}</a</li>
						<li class="active"><a href="admin.php?mod=extras">{l_extras}</a></li>
					</ol>
				</div>
				<!-- /breadcrumb -->
<form action="admin.php?mod=extras" method="post">				
<div class="row">
<div class="col-md-12">	
<div class="panel panel-default">
<table class="table">
        <tr><td>&nbsp;</td></tr>
        <tr>
          <td width="100%" colspan="2" class="contentHead"><img src="{skins_url}/images/nav.gif" hspace="8" alt="" />{mode_text}: {plugin}</td>
        </tr>
        {entries}
        <tr align="center">
          <td width="100%" colspan="2" class="contentEdit" valign="top">
            <input type=hidden name=mod value=extras>
          </td>
        </tr>
      </table>
<div class="panel-body">
<button class="btn btn-success" type="submit">{msg}</button>
</div>
</div>
</div>
</div>
</form>