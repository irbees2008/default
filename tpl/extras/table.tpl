<div class="row breadcrumb">
    <ol class="breadcrumb-entry">
        <li><a href="admin.php">{{ lang['home'] }}</a></li>
        <li class="active"><a href="admin.php?mod=extras">{{ lang['extras'] }}</a></li>
    </ol>
</div>

<div class="row">
    <div class="col-md-12" id="pluginMenu">
        <div class="panel panel-default">
            <div class="panel-heading">
                <ul class="nav nav-pills">
                    <li data-filter="all" class="active"><a href="#">{{ lang['list.all'] }} <span class="badge">{{ cntAll }}</span></a></li>
                    <li data-filter="pluginEntryActive"><a href="#">{{ lang['list.active'] }} <span class="badge">{{ cntActive }}</span></a></li>
                    <li data-filter="pluginEntryInactive"><a href="#">{{ lang['list.inactive'] }} <span class="badge">{{ cntInactive }}</span></a></li>
                    <li data-filter="pluginEntryUninstalled"><a href="#">{{ lang['list.needinstall'] }} <span class="badge">{{ cntUninstalled }}</span></a></li>
                </ul>
            </div>

            <table class="table table-condensed" id="maincontent">
                <thead>
                    <tr>
                        <td>{{ lang['id'] }}</td>
                        <td>{{ lang['title'] }}</td>
                        <td>{{ lang['type'] }}</td>
                        <td>{{ lang['version'] }}</td>
                        <td>&nbsp;</td>
                        <td>{{ lang['description'] }}</td>
                        <td>{{ lang['author'] }}</td>
                        <td>{{ lang['action'] }}</td>
                    </tr>
                </thead>
                <tbody id="entryList">
                    {% for entry in entries %}
                    <tr align="left" class="all {{ entry.style }}" id="plugin_{{ entry.id }}">
                        <td>{{ entry.id }} {{ entry.new }}</td>
	                    <td>{{ entry.url }}</td>
	                    <td>{{ entry.type }}</td>
	                    <td>{{ entry.version }}</td>
	                    <td nowrap>{{ entry.readme }} {{ entry.history }}</td>
	                    <td>{{ entry.description }}</td>
	                    <td>{{ entry.author_url }}</td>
	                    <td nowrap="nowrap">{{ entry.link }} {{ entry.install }}</td>
                    </tr>
                    {% endfor %}
                </tbody>
            </table>

        </div>
    </div>
</div>

<script type="text/javascript">
$(document).ready(function(){
    var newSelection = "";
    function tabsSwitch(tabs) {
        $("#maincontent").fadeOut(1);
        $(".nav-pills li").removeClass("active");
        tabs.addClass("active");
        newSelection = tabs.attr("data-filter");
        $("."+newSelection).show(1);
        $(".all").not("."+newSelection).hide(1);
        $("#maincontent").fadeIn(1);
    }
        $(".nav-pills").on('click', 'li:not(.active)', function(){
        tabsSwitch($(this));
    });
});
</script>
<script language="javascript" type="text/javascript">
function ngPluginSwitch(plugin, state) {
	ngShowLoading();
	$.post('/engine/rpc.php', {
			json : 1,
			methodName : 'admin.extras.switch',
			rndval: new Date().getTime(),
			params : json_encode(
				{
					'token'  : '{{ token }}',
					'plugin' : plugin,
					'state'  : state,
				}
			) }, function(data) {
		ngHideLoading();
		// Try to decode incoming data
		try {
			resTX = eval('('+data+')');
		} catch (err) { ngNotifyWindow('{{ lang['rpc_jsonError'] }} '+data, '{{ lang['notifyWindowError'] }}'); }
		if (!resTX['status']) {
			ngNotifyWindow('Error ['+resTX['errorCode']+']: '+resTX['errorText'], '{{ lang['notifyWindowInfo'] }}');
		} else {
			ngNotifyWindow(resTX['errorText'], '{{ lang['notifyWindowInfo'] }}');
		}
	}, "text").error(function() { ngHideLoading(); ngNotifyWindow('{{ lang['rpc_httpError'] }}', '{{ lang['notifyWindowError'] }}'); });
}
</script>
