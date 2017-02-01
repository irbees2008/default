<form method="post" action="{{ php_self }}?mod=categories" enctype="multipart/form-data">
<input type="hidden" name="token" value="{{ token }}"/>
<!-- breadcrumb -->
				<div class="row breadcrumb">
					<ol class="breadcrumb-entry">
						<li><a href="admin.php">{{ lang['home'] }}</a</li>
						<li><a href="?mod=categories">{{ lang['categories_title'] }}</a> </li>
						<li class="active">  {{ lang['editing'] }} "{{ name }}"</li>
					</ol>
				</div>
<!-- /breadcrumb -->
<div class="row">
    <div class="col-md-12">	
        <div class="panel panel-default">
            <table class="table">
                <tr>
                    <td width="70%"  ><label for="cat_show">{{ lang['show_main'] }}</label></td>
                    <td width="30%"  ><input type="checkbox" id="cat_show" name="cat_show" value="1" class="check" {% if flags.showInMenu %}checked="checked" {% endif %}/></td>
                </tr>
                <tr>
                    <td width="70%"  >{{ lang['show.link'] }}</td>
                    <td width="30%"  ><select name="show_link">{{ show_link }}</select></td>
                </tr>
                <tr>
                    <td width="70%"  >{{ lang['title'] }}</td>
                    <td width="30%"  ><input value="{{ name }}" type=text size="40" name="name" /></td>
                </tr>
                <tr>
                    <td width="70%"  >{{ lang['alt_name'] }}</td>
                    <td width="30%"  ><input value="{{ alt }}" type=text size="40" name="alt" /></td>
                </tr>
{% if flags.haveMeta %}
                <tr>
                    <td width="70%"  >{{ lang['cat_desc'] }}</td>
                    <td width="30%"  ><input type="text" size="40" name="description" value="{{ description }}" /></td>
                </tr>
                <tr>
                    <td width="70%"  >{{ lang['cat_keys'] }}</td>
                    <td width="30%"  ><input type="text" size="40" name="keywords" value="{{ keywords }}" /></td>
                </tr>
{% endif %}
                <tr>
                    <td width="70%"  >{{ lang['cat_number'] }}</td>
                    <td width="30%"  ><input type="text" size="4" name="number" value="{{ number }}" /></td>
                </tr>
                <tr>
                    <td width="70%"  >{{ lang['cat_tpl'] }}</td>
                    <td width="30%"  ><select name="tpl">{{ tpl_list }}</select></td>
                </tr>
                <tr>
                    <td width="70%"  >{{ lang['template_mode'] }}</td>
                    <td width="30%"  ><select name="template_mode">{{ template_mode }}</select></td>
                </tr>
                <tr>
                    <td width="70%"  >{{ lang['parent'] }}</td>
                    <td width="30%"  >{{ parent }}</td>
                </tr>
                <tr>
                    <td width="70%"  >{{ lang['icon'] }}<br/><small>{{ lang['icon#desc'] }}</small></td>
                    <td width="30%"  ><input type="text" size="40" name="icon" value="{{ icon }}" maxlength="255" /></td>
                </tr>
                <tr>
                    <td width="70%"  >{{ lang['attached_icon'] }}<br/><small>{{ lang['attached_icon#desc'] }}</small></td>
                    <td width="30%"  >
{% if flags.haveAttach %}
                        <div id="previewImage">
						    <img src="{{ attach_url }}"/><br/>
                            <input type="checkbox" name="image_del" value="1"> <label for="image_del">{{ lang['delete_icon'] }}</label>
						</div>
                        <br/>{% endif %}
                        <input type="file" size="40" name="image" />
                    </td>
                </tr>
                <tr>
                    <td width="70%"  >{{ lang['alt_url'] }}</td>
                    <td width="30%"  ><input value="{{ alt_url }}" type=text size="40" name="alt_url" /></td>
                </tr>
                <tr>
                    <td width="70%"  >{{ lang['orderby'] }}</td>
                    <td width="30%"  >{{ orderlist }}</td>
                </tr>
                <tr>
                    <td width="70%"   valign="top">{{ lang['category.info'] }}<br/><small>{{ lang['category.info#desc'] }}</small></td>
                    <td width="30%"  ><textarea id="info" name="info" cols="70" rows="5">{{ info }}</textarea></td>
                </tr>
{{ extend }}
                <tr>
                    <td width="100%" colspan="2">&nbsp;</td>
                </tr>
            </table>
{% if flags.canModify %}
            <div class="panel-body">
                <button class="btn btn-success" type="submit">{{ lang['save'] }}</button>
                <button class="btn btn-success" type="button" onclick="document.location='admin.php?mod=categories';" >{{ lang['cancel'] }}</button>
                <input type="hidden" name="action" value="doedit" />
                <input type="hidden" name="catid" value="{{ catid }}" />{% endif %}
            </div>
        </div>
    </div>
</div>
</form>
