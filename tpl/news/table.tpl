<script type="text/javascript" src="{{ scriptLibrary }}/ajax.js"></script>
<script type="text/javascript" src="{{ scriptLibrary }}/libsuggest.js"></script>
<script language="javascript" type="text/javascript">
<!--

function addEvent(elem, type, handler){
  if (elem.addEventListener){
    elem.addEventListener(type, handler, false)
  } else {
    elem.attachEvent("on"+type, handler)
  }
}

// DateEdit filter
function filter_attach_DateEdit(id) {
	var field = document.getElementById(id);
	if (!field)
		return false;

	if (field.value == '')
		field.value = 'DD.MM.YYYY';

	field.onfocus = function(event) {
		var ev = event ? event : window.event;
		var elem = ev.target ? ev.target : ev.srcElement;

		if (elem.value == 'DD.MM.YYYY')
			elem.value = '';

		return true;
	}


	field.onkeypress = function(event) {
		var ev = event ? event : window.event;
		var keyCode = ev.keyCode ? ev.keyCode : ev.charCode;
		var elem = ev.target ? ev.target : ev.srcElement;
		var elv = elem.value;

		isMozilla = false;
		isIE = false;
		isOpera = false;
		if (navigator.appName == 'Netscape') { isMozilla = true; }
		else if (navigator.appName == 'Microsoft Internet Explorer') { isIE = true; }
		else if (navigator.appName == 'Opera') { isOpera = true; }
		else { /* alert('Unknown navigator: `'+navigator.appName+'`'); */ }

		//document.getElementById('debugWin').innerHTML = 'keyPress('+ev.keyCode+':'+ev.charCode+')['+(ev.shiftKey?'S':'.')+(ev.ctrlKey?'C':'.')+(ev.altKey?'A':'.')+']<br/>' + document.getElementById('debugWin').innerHTML;

		// FF - onKeyPress captures functional keys. Skip anything with charCode = 0
		if (isMozilla && !ev.charCode)
			return true;

		// Opera - dumb browser, don't let us to determine some keys
		if (isOpera) {
			var ek = '';
			//for (i in event) { ek = ek + '['+i+']: '+event[i]+'<br/>\n'; }
			//alert(ek);
			if (ev.keyCode < 32) return true;
			if (!ev.shiftKey && ((ev.keyCode >= 33) && (ev.keyCode <= 47))) return true;
			if (!ev.keyCode) return true;
			if (!ev.which) return true;
		}


		// Don't block CTRL / ALT keys
		if (ev.altKey || ev.ctrlKey || !keyCode)
			return true;

		// Allow to input only digits [0..9] and dot [.]
		if (((keyCode >= 48) && (keyCode <= 57)) || (keyCode == 46))
			return true;

		return false;
	}

	return true;
}

-->
</script>

<!-- DEBUG WINDOW <div id="debugWin" style="overflow: auto; position: absolute; top: 160px; left: 230px; width: 400px; height: 400px; background: white; 4px double black; padding: 2px; margin: 2px;">DEBUG WINDOW</div> -->


<!-- Hidden SUGGEST div -->
<div id="suggestWindow" class="suggestWindow">
<table id="suggestBlock" cellspacing="0" cellpadding="0" width="100%"></table>
<a href="#" align="right" id="suggestClose">{{ lang.editnews['close'] }}</a>
</div>
<!-- breadcrumb -->
				<div class="row breadcrumb">
					<ol class="breadcrumb-entry">
<<<<<<< HEAD
						<li><a href="admin.php">{{ lang['home'] }}</a></li>
=======
						<li><a href="{{ home_url }}/engine/">Главная</a></li>
>>>>>>> refs/remotes/origin/master
						<li class="active"><a href="?mod=news">{{ lang.editnews['news_title'] }}</a></li>
					</ol>
				</div>
				<!-- /breadcrumb -->
<div class="row">

<form action="{{ php_self }}?mod=news" method="post" name="options_bar">
<div class="col-md-4">
						<div class="panel panel-default">
							<div class="panel-body">
								<div style="margin: 10px 0;">
    <input type="text" class="form-control" name="sl" placeholder="{{ lang.editnews['header.search'] }}" value="{{ sl }}">
	</div>
								<div style="margin: 10px 0;">
									<select class="form-control" name="st">
									<option value="0" {% if (selected == '0') %}selected="selected"'{% endif %}>{{ lang.editnews['header.stitle'] }}</option>
									<option value="1" {% if (selected == '1') %}selected="selected"'{% endif %}>{{ lang.editnews['header.stext'] }}</option></select>
  </div>
								<div style="margin: 10px 0;">
									<input name="an" id="an" type="text" class="form-control" placeholder="{{ lang.editnews.author }}" value="{{ an }}" autocomplete="off" >
								</div>
							</div>
						</div>
					</div>
<!--/Block 1-->

<!--Block 2--><div class="col-md-4">
						<div class="panel panel-default">
							<div class="panel-body">
								<div style="margin: 10px 0;">
									<input id="dr1" name="dr1" value="{{ dr1 }}" type="text" class="form-control" placeholder="{{ lang.editnews['header.date_since'] }}">
								</div>
								<div style="margin: 10px 0;">
									<input id="dr2" name="dr2" value="{{ dr2 }}" type="text" class="form-control" placeholder="{{ lang.editnews['header.date_till'] }}">
								</div>
								<div style="margin: 10px 0;">
									{{ category_select }}
								</div>
							</div>
						</div>
					</div>
      <div class="col-md-4">
						<div class="panel panel-default">
							<div class="panel-body">
								<div style="margin: 10px 0;">
									<div class="input-group">
										<span class="input-group-addon">
											{{ lang.editnews['header.status'] }}
										</span>
										<select class="form-control" name="status">
<option value="">{{ lang.editnews['smode_all'] }}</option>{{ statuslist }}</select>
    </div>
								</div>
								<div style="margin: 10px 0;">
									<div class="input-group">
										<span class="input-group-addon">
											{{ lang.editnews['sort'] }}
										</span>
										<select name="sort" class="form-control">
											{{ sortlist }}
										</select>
									</div>
								</div>
								<div style="margin: 10px 0;">
									<div class="input-group">
										<span class="input-group-addon">
											{{ lang.editnews['header.perpage'] }}
										</span>
										<input type="text" class="form-control" name="rpp" value="{{ rpp }}" >
										<span class="input-group-btn">
											<button type="submit" class="btn btn-success">GO</button>
										</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
</form>
<!-- ????? ????? ?????????? -->

<!-- List of news start here -->
<form action="{{ php_self }}?mod=news" method="post" name="editnews">
<input type="hidden" name="token" value="{{ token }}" />
<input type="hidden" name="mod" value="news" />
<input type="hidden" name="action" value="manage" />
<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">
							<table class="table">
<tr align="left" class="contHead">
<td width="40" nowrap>{{ lang.editnews['postid_short'] }}</td>
<td width="60"  nowrap>{{ lang.editnews['date'] }}</td>
<td width="48">&nbsp;</td>
<td width="45%" >{{ lang.editnews['title'] }}</td>
{% if (pluginIsActive('comments')) %}{% if flags.comments %}<td width="50" style=" text-align:right;"><i class="fa fa-comments-o" aria-hidden="true"></i></td>{% endif %}{% endif %}
<td width="50" style=" text-align:right;"><i class="fa fa-eye" aria-hidden="true"></i></td>
<td width="25%">{{ lang.editnews['category'] }}</td>
<td width="10%">{{ lang.editnews['author'] }}</td>
<td width="16">{{ lang.editnews['status'] }}</td>
<td width="1%"><input class="check" type="checkbox" name="master_box" title="{{ lang.editnews['select_all'] }}" onclick="javascript:check_uncheck_all(editnews)" /></td>
</tr>
{% for entry in entries %}
<tr align="left" >
	<td width="30" class="contentEntry1">{{ entry.newsid }}</td>
	<td width="60" class="contentEntry1">{{ entry.itemdate }}</td>
	<td width="48" class="contentEntry1" cellspacing=0 cellpadding=0 style="padding:0; margin:0;" nowrap>
		{% if entry.flags.mainpage %}<i class="fa fa-home" aria-hidden="true" title="{{ lang['on_main'] }}"></i>  {% endif %}
		{% if (entry.attach_count > 0) %}<i class="fa fa-paperclip" aria-hidden="true" title="{{ lang['attach.count'] }}: {{ entry.attach_count }}"></i>  {% endif %}
		{% if (entry.images_count > 0) %}<i class="fa fa-file-image-o" aria-hidden="true" title="{{ lang['images.count'] }}: {{ entry.images_count }}"></i>{% endif %}
	</td>
	<td width="45%" class="contentEntry1">
		{% if entry.flags.editable %}<a href="{{ php_self }}?mod=news&amp;action=edit&amp;id={{ entry.newsid }}">{% endif %}{{ entry.title }}{% if entry.flags.editable %}</a>{% endif %}
	</td>
  {% if (pluginIsActive('comments')) %}{% if entry.flags.comments %}<td class="contentEntry1" style=" text-align:right;">{% if (entry.comments > 0) %}{{ entry.comments }}{% endif %}</td>{% endif %}{% endif %}
	<td class="contentEntry1" style=" text-align:right;">{% if entry.flags.isActive %}<a href="{{ entry.link }}" target="_blank">{% endif %}{% if (entry.views > 0) %}{{ entry.views }}{% else %}-{% endif %}{% if entry.flags.isActive %}</a>{% endif %}</td>
	<td class="contentEntry1">{{ entry.allcats }}</td>
	<td class="contentEntry1"><a href="{{ php_self }}?mod=users&amp;action=editForm&amp;id={{ entry.userid }}">{{ entry.username }}</a></td>
<<<<<<< HEAD
	<td class="contentEntry1">{% if (entry.state == 1) %}<i class="fa fa-check" aria-hidden="true" title="{{ lang['state.published'] }}"></i> {% elseif (entry.state == 0) %}<i class="fa fa-times" aria-hidden="true" title="{{ lang['state.unpiblished'] }}"></i>{% else %}<i class="fa fa-circle-o" aria-hidden="true" title="{{ lang['state.draft'] }}"></i>{% endif %} </td>
=======
	<td class="contentEntry1">{% if (entry.state == 1) %}<i class="fa fa-check" aria-hidden="true" title="{{ lang['state.published'] }}"></i> {% elseif (entry.state == 0) %}<i class="fa fa-times" aria-hidden="true" title="{{ lang['state.unpiblished'] }}"></i>{% else %}<i class="fa fa-circle-o" aria-hidden="true" title="{{ lang['state.draft'] }}"></i>>{% endif %} </td>
>>>>>>> refs/remotes/origin/master
	<td class="contentEntry1"><input name="selected_news[]" value="{{ entry.newsid }}" class="check" type="checkbox" /></td>
</tr>
{% else %}
<tr><td colspan="6"><p>- {{ lang.editnews['not_found'] }} -</p></td></tr>
{% endfor %}
</table>
</div>
					</div>
				</div>
<div class="row">
					<div class="col-md-7"></div>
{% if flags.allow_modify %}


					<div class="col-md-5">
						<div style="margin: 20px 0;">
							<div class="input-group">
								<span class="input-group-addon">
									{{ lang.editnews['action'] }}
								</span>
								<select class="form-control" name="subaction">
								<option value="">-- {{ lang.editnews['action'] }} --</option>
<option value="mass_approve">{{ lang.editnews['approve'] }}</option>
<option value="mass_forbidden">{{ lang.editnews['forbidden'] }}</option>
<option value="" style="background-color: #E0E0E0;" disabled="disabled">===================</option>
<option value="mass_mainpage">{{ lang.editnews['massmainpage'] }}</option>
<option value="mass_unmainpage">{{ lang.editnews['massunmainpage'] }}</option>
<option value="" style="background-color: #E0E0E0;" disabled="disabled">===================</option>
<option value="mass_currdate">{{ lang.editnews['modify.mass.currdate'] }}</option>
<option value="" style="background-color: #E0E0E0;" disabled="disabled">===================</option>
{% if flags.comments %}<option value="mass_com_approve">{{ lang.editnews['com_approve'] }}</option>
<option value="mass_com_forbidden">{{ lang.editnews['com_forbidden'] }}</option>
<option value="" style="background-color: #E0E0E0;" disabled="disabled">===================</option>{% endif %}
<option value="mass_delete">{{ lang.editnews['delete'] }}</option>

</select>
								<span class="input-group-btn">
									<button type="submit" class="btn btn-success">{{ lang.editnews['submit'] }}</button>
								</span>
							</div>
						</div>
					</div>
				
				{% endif %}
				
</div>
<div class="row">
<div class="col-md-12">{{ pagesss }}</div>
</div>
</form>

<script language="javascript" type="text/javascript">
$("#dr1").datepicker( { currentText: "{{ dr1 }}", dateFormat: "dd.mm.yy" });
$("#dr2").datepicker( { currentText: "{{ dr2 }}", dateFormat: "dd.mm.yy" });


function systemInit() {
var aSuggest = new ngSuggest('an',
								{
									'localPrefix'	: '{{ localPrefix }}',
									'reqMethodName'	: 'core.users.search',
									'lId'		: 'suggestLoader',
									'hlr'		: 'true',
									'iMinLen'	: 1,
									'stCols'	: 2,
									'stColsClass': [ 'cleft', 'cright' ],
									'stColsHLR'	: [ true, false ],
								}
							);

}

// Init system [ IE / Other browsers should be inited in different ways ]
if (document.body.attachEvent) {
	// IE
	document.body.onload = systemInit;
} else {
	// Others
	systemInit();
}

filter_attach_DateEdit('dr1');
filter_attach_DateEdit('dr2');
</script>
