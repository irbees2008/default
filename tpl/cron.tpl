<!-- breadcrumb -->
				<div class="row breadcrumb">
					<ol class="breadcrumb-entry">
						<li><a href="admin.php">{{ lang['home'] }}</a></li>
						<li class="active"><a href="?mod=cron" title="{{ lang.cron['title'] }}">{{ lang.cron['title'] }}</a></li>
					</ol>
				</div>
				<!-- /breadcrumb -->
				
<div class="row">
<div class="col-md-12">	
<div class="panel panel-default">
<form action="?mod=cron" method="post" name="commitForm" id="commitForm">
<input type="hidden" name="mod" value="cron">
<input type="hidden" name="action" value="commit">
<input type="hidden" name="token" value="{{ token }}">

<table class="table">
<tr><td style="background-color: #EEEEEE; padding-bottom: 5px;" colspan="2">{{ lang.cron['title#desc'] }}</td></tr>
<tr><td valign="top" width="60%"><br/><br/>{{ lang.cron['legend'] }}</td>
<td valign="top">
<table class="table">
<tr align="left">
	<td class="contentHead"><b>Plugin</b></td>
	<td class="contentHead"><b>Handler</b></td>
	<td class="contentHead"><b>Min</b></td>
	<td class="contentHead"><b>Hour</b></td>
	<td class="contentHead"><b>Day</b></td>
	<td class="contentHead"><b>Month</b></td>
	<td class="contentHead"><b>D.O.W.</b></td>
</tr>

{% for entry in entries %}
<tr align="left">
	<td><input class="form-control" name="data[{{ entry.id }}][plugin]" style="width: 85px;" value="{{ entry.plugin }}"/></b></td>
	<td><input class="form-control" name="data[{{ entry.id }}][handler]" style="width: 90px;" value="{{ entry.handler }}"/></td>
	<td><input class="form-control" name="data[{{ entry.id }}][min]" style="width: 70px" value="{{ entry.min }}"/></td>
	<td><input class="form-control" name="data[{{ entry.id }}][hour]" style="width: 70px" value="{{ entry.hour }}"/></td>
	<td><input class="form-control" name="data[{{ entry.id }}][day]" style="width: 70px" value="{{ entry.day }}"/></td>
	<td><input class="form-control" name="data[{{ entry.id }}][month]" style="width: 70px" value="{{ entry.month }}"/></b></td>
	<td><input class="form-control" name="data[{{ entry.id }}][dow]" style="width: 70px" value="{{ entry.dow }}"/></b></td>
</tr>
{% endfor %}
</table>
</td></tr></table>


<div class="panel-body">
<button type="button" class="btn btn-success" type="submit" onclick='document.location="?mod=extra-config&plugin=xfields&action=add&section={{ sectionID }}";'>{{ lang.cron['commit_change'] }}</button>
</div>


</form>
</div>
</div>
</div>