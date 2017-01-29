<script language="JavaScript">
function ChangeOption(selectedOption) {
document.getElementById('maincontent').style.display = "none";
document.getElementById('additional').style.display = "none";

if(selectedOption == 'maincontent') {document.getElementById('maincontent').style.display = "";}
if(selectedOption == 'additional') {document.getElementById('additional').style.display = "";}
}
</script>
<!-- breadcrumb -->
				<div class="row breadcrumb">
					<ol class="breadcrumb-entry">
						<li><a href="admin.php">{{ lang['home'] }}</a></li>
						<li class="active">Редактирования комментария</li>
					</ol>
				</div>
				<!-- /breadcrumb -->


<form name="form" method="post" action="{php_self}?mod=editcomments">
<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-body">
								<button type="button" class="btn btn-primary" onmousedown="javascript:ChangeOption('maincontent')">{l_maincontent}</button> 
								<button type="button" class="btn btn-info" onmousedown="javascript:ChangeOption('additional')">{l_additional} черновик</button> 
							    <button type=submit accesskey="s" class="btn btn-primary">{l_save}</button> 
								<button type="button" class="btn btn-info" onClick="confirmit('{php_self}?mod=editcomments&subaction=deletecomment&newsid={newsid}&comid={comid}&poster={author}', '{l_sure_del}')">{l_delete}</button> 
								<button type="button" class="btn btn-warning" onClick="document.location='{php_self}?mod=ipban&iplock={ip}'">{l_block_ip}</button> 	
								<input type=hidden name=mod value="editcomments">
<input type=hidden name=newsid value="{newsid}">
<input type=hidden name=comid value="{comid}">
<input type=hidden name=poster value="{author}">
<input type=hidden name=subaction value="doeditcomment">
							</div>
						</div>
					</div>
				</div>

<div class="row">
<div class="col-md-12">	
<div class="panel panel-default">
<table class="table" id="maincontent">
<tr>
<td width="100%" colspan="2" class="contentHead">{l_answer}</td>
</tr>
<tr>
<td width="50%" valign="top" class="contentEntry1"><textarea id="content"  class="form-control" name="content" rows="10" cols="70">{answer}</textarea></td>
<td width="50%" valign="top" class="contentEntry1">{quicktags}<br />{smilies}</td>
</tr>
<tr>
<td width="100%" colspan="2" class="contentHead">{l_comment}</td>
</tr>
<tr>
<td width="50%" class="contentEntry1" valign="top"><textarea class="form-control" name="comment" rows="10" cols="70">{text}</textarea></td>
<td width="50%" class="contentEntry1" valign="top"><input type="checkbox" id="send" name="send_notice" value="send_notice" class="check" /> &nbsp;<label for="send">{l_send_notice}</label></td>
</tr>
</table>

<table class="table" id="additional" style="display: none;" border="0" cellspacing="0" cellpadding="0" class="content" align="center">
<tr>
<td width="50%" class="contentHead"><img src="{skins_url}/images/nav.gif" hspace="8">{l_date}</td>
<td width="47%" class="contentHead"><img src="{skins_url}/images/nav.gif" hspace="8">{l_ip}</td>
</tr>
<tr>
<td width="50%" class="contentEntry1">{comdate}</td>
<td width="47%" class="contentEntry1"><a href="http://www.nic.ru/whois/?ip={ip}" target="_blank">{ip}</a></td>
</tr>
<tr>
<td width="50%" class="contentHead"><img src="{skins_url}/images/nav.gif" hspace="8">{l_name}</td>
<td width="47%" class="contentHead"><img src="{skins_url}/images/nav.gif" hspace="8">{l_email}</td>
</tr>
<tr>
<td width="50%" class="contentEntry1">{author}</td>
<td width="47%" class="contentEntry1"><input type="text" name="mail" value="{mail}" /></td>
</tr>
</table>

</div>
</div>
</div>
</form>