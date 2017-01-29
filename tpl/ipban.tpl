
<!-- breadcrumb -->
				<div class="row breadcrumb">
					<ol class="breadcrumb-entry">
						<li><a href="admin.php">{{ lang['home'] }}</a></li>
						<li class="active"><a href="admin.php?mod=ipban">{{ lang.ipban['hdr.list'] }}</a></li>
					</ol>
				</div>
				<!-- /breadcrumb -->
<div class="row">
<div class="col-md-12">	
<div class="panel panel-default">
<div class="col-md-6">	
<table class="table">

<tr>
<td>{{ lang.ipban['hdr.ip'] }}</td>
<td>{{ lang.ipban['hdr.counter'] }}</td>
<td>{{ lang.ipban['hdr.type'] }}</td>
<td>{{ lang.ipban['hdr.reason'] }}</td>
<td>&nbsp;</td>
</tr>
{% for entry in entries %}
<tr>
<td nowrap ><a href="http://www.nic.ru/whois/?ip={{ entry.whoisip }}" target="_blank">?</a> {{ entry.ip }}</td>
<td >{{ entry.hitcount }}</td>
<td >{{ entry.type }}</td>
<td >{{ entry.descr }}</td>
<td >{% if flags.permModify %}<a href="{{ php_self }}?mod=ipban&amp;action=del&amp;id={{ entry.id }}&amp;token={{ token }}"><i alt="{{ lang.ipban['act.unblock'] }}" title="{{ lang.ipban['act.unblock'] }}" class="fa fa-times" aria-hidden="true"></i> </a>{% endif %}</td>
</tr>
{% endfor %}


</table>
</div>
<div class="col-md-6">	
{% if flags.permModify %}
<form name="form" method="post" action="{{php_self}}?mod=ipban">
<input type="hidden" name="token" value="{{token}}"/>
<table class="table">
<tr>
<td colspan="2" >{{ lang.ipban['hdr.block'] }}</td>
</tr>
<tr><td >{{ lang.ipban['add.ip'] }}:</td><td><input type="text" name="ip" value="{{ iplock }}" size="31" /></td></tr>
<tr><td>{{ lang.ipban['add.block.open'] }}:</td><td><select disabled="disabled" name="lock:open"><option value="0">--</option><option value="1" style="color: blue;">{{ lang.ipban['lock.block'] }}</option><option value="2" style="color: red;">{{ lang.ipban['lock.silent'] }}</option></select></tr>
<tr><td>{{ lang.ipban['add.block.reg'] }}:</td><td><select name="lock:reg"><option value="0">--</option><option value="1" style="color: blue;">{{ lang.ipban['lock.block'] }}</option><option value="2" style="color: red;">{{ lang.ipban['lock.silent'] }}</option></select></tr>
<tr><td>{{ lang.ipban['add.block.login'] }}:</td><td><select name="lock:login"><option value="0">--</option><option value="1" style="color: blue;">{{ lang.ipban['lock.block'] }}</option><option value="2" style="color: red;">{{ lang.ipban['lock.silent'] }}</option></select></tr>
<tr><td>{{ lang.ipban['add.block.comm'] }}:</td><td><select name="lock:comm"><option value="0">--</option><option value="1" style="color: blue;">{{ lang.ipban['lock.block'] }}</option><option value="2" style="color: red;">{{ lang.ipban['lock.silent'] }}</option></select></tr>
<tr><td>{{ lang.ipban['add.block.rsn'] }}</td><td><input type="text" name="lock:rsn" size="30" /></td></tr>
<tr>
<td  colspan="2" >
<button type="submit" class="btn btn-warning">{{ lang.ipban['add.submit'] }}</button>
<input type="hidden" name="action" value="add" />
</td>
</tr>
</table>
</form>
{% endif %}
</div>
<div style="margin: 10px ;">
{{ lang.ipban['info.descr'] }}
</div></div></div></div>