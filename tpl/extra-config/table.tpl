<form method="post" action="{php_self}?mod=extra-config" name="form">
<input type="hidden" name="token" value="{token}"/>
<!-- breadcrumb -->
<div class="row breadcrumb">
	<ol class="breadcrumb-entry">
		<li><a href="admin.php">{l_home}</a</li>
		<li><a href="admin.php?mod=extras" title="{l_extras}">{l_extras}</a> </li>
		<li class="active">  <a href="?mod=extra-config&plugin={plugin}">{plugin}</a></li>
	</ol>
</div>
<!-- /breadcrumb -->
<div class="row">
    <div class="col-md-12">	
        <div class="panel panel-default">
            <table class="table">
                {entries}
            </table>  
<input type="hidden" name="plugin" value="{plugin}" />
<input type="hidden" name="action" value="commit" />
            <div class="panel-body">
                <button class="btn btn-success" type="submit">{l_commit_change}</button>
            </div>
        </div>
    </div>
</div>
</form>
