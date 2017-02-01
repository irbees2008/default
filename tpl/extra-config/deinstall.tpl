<div class="row breadcrumb">
	<ol class="breadcrumb-entry">
		<li><a href="admin.php">{l_home}</a></li>
		<li class="active"> {l_deinstall_text}: {plugin}</li>
	</ol>
</div>
<!-- /breadcrumb -->
<div class="row">
    <div class="col-md-12">	
        <div class="panel panel-default">
            <form method="post" action="{php_self}?mod=extra-config">
            <table class="table">
                <tr>
				    <td>{install_text}</td>
				</tr>
                <tr align="center">
                    <td  colspan="2" >
            <input type="hidden" name="plugin" value="{plugin}" />
            <input type="hidden" name="stype" value="install" />
            <input type="hidden" name="action" value="commit" /> 
                    </td>
                </tr>
            </table>
            <div class="panel-body">
                <button class="btn btn-success" type="submit">{l_commit_deinstall}</button>
            </div>
            </form>
        </div>
    </div>
</div>
