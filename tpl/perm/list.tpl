<!-- breadcrumb -->
				<div class="row breadcrumb">
					<ol class="breadcrumb-entry">
						<li><a href="admin.php">{{ lang['home'] }}</a></li>
						<li class="active"><a href="?mod=perm">{{ lang['permissions'] }}</a></li>
					</ol>
				</div>
				<!-- /breadcrumb -->
<div class="row">
<div class="col-md-12">	
<div class="panel panel-default">
<script type="text/javascript">
var permDefault = {{ DEFAULT_JSON }};

function onUpdatePerm(name) {
 var f = document.getElementById('permSubmit');
 var v = permDefault[name];

 if (f[name].value != v) {
 	f[name].className = 'pChanged';
 } else {
 	f[name].className = '';
 }
 //alert(f[name].value);
}

function onUpdateSubmit() {
 return true;

 var f = document.getElementById('permSubmit');
 for (var i = 0; i < f.elements.length; i++) {
 	if (f.elements[i].value != permDefault[f.elements[i].name]) {
		alert(f.elements[i].name+': '+permDefault[f.elements[i].name]+ ' => '+f.elements[i].value);
	}
 	if (i > 10) { break; }
 }
}
</script>

<!-- Form header -->
<form id="permSubmit" name="permSubmit" method="POST">
<input type="hidden" name="save" value="1"/>
<input type="hidden" name="token" value="{{ token }}"/>
<!-- /Form header -->


<!-- Group menu header -->
<div class="panel-heading">
<ul class="nav nav-pills nav-justified">
{% for group in GRP %}  <li {% if (loop.first) %}class="active"{% endif %}><a href="#tab{{ group.id }}" data-toggle="tab">{{ group.title }}</a></li>
{% endfor %}
 </div>
<div class="tab-content">
 <!-- Group content header -->
{% for group in GRP %}
 <!-- Content for group [{{ group.id }}] {{ group.title }} -->
 <div class="tab-pane fade {% if (loop.first) %}in active{% endif %}" id="tab{{ group.id }}">
<div class="panel-body">
  


{% for block in CONFIG %}

   <h3>{{ block.title }}</h3>
{% if (block.description) %}   <i>{{ block.description }}</i><br/>{% endif %}

{% for area in block.items %}
   <h4>{{ area.title }}</h4>
{% if (area.description) %}   <i>{{ area.description }}</i><br/><br/>{% endif %}

   <table class="table table-hover">
    <thead><tr class="contHead"><td><b>#ID</b></td><td><b>{{ lang['description'] }}</b></td><td width="90"><b>{{ lang['access'] }}</b></td></td></thead>
{% for entry in area.items %}
    <tr class="contentEntry1">
     <td><strong>{{entry.id}}</strong></td><td>{{ entry.title }}</td>
     <td>
	  <select name="{{ entry.name }}|{{group.id}}" onchange="onUpdatePerm('{{ entry.name }}|{{group.id}}');" value="{% if isSet(entry.perm[group.id]) %}{% if (entry.perm[group.id]) %}1{% else %}0{% endif %}{% else %}-1{% endif %}">
	   <option value="-1">--</option>
	   <option value="0"{% if (isSet(entry.perm[group.id]) and (not entry.perm[group.id])) %} selected="selected"{% endif %}>{{ lang['noa'] }}</option>
	   <option value="1"{% if (isSet(entry.perm[group.id]) and (entry.perm[group.id])) %} selected="selected"{% endif %}>{{ lang['yesa'] }}</option>
	  </select>
	 </td>
    </tr>
{% endfor %}
   </table>
{% endfor %}
 
{% endfor %}
 </div>
 </div>
<!-- /Content for group [{{ group.id }}] {{ group.title }} -->
{% endfor %}
</div>
<div style="margin: 10px ;">
<button type="submit" class="btn btn-primary" onclick="return onUpdateSubmit();">{{ lang['save'] }}</button>
</div>
</form>
</div></div></div>