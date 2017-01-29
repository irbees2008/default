<tr class="contentEntry1" id="re.row.{id}">
 <td width="40px;"><a href="#" onclick="reMoveUp({id}); return false;"><i class="fa fa-arrow-up" aria-hidden="true"></i></a><a href="#" onclick="reMoveDown({id}); return false;"><i class="fa fa-arrow-down" aria-hidden="true"></i></a></td>
 <td class="contentEntry1" id="re.{id}.id">{id}</td>
 <td class="contentEntry1" id="re.{id}.pluginName" width="70px">{pluginName}</td>
 <td class="contentEntry1" id="re.{id}.handlerName" width="80px">{handlerName}</td>
 <td class="contentEntry1" id="re.{id}.description">{description}</td>
 <td class="contentEntry1" id="re.{id}.regex">{regex}</td>
 <td class="contentEntry1" id="re.{id}.flags">{flags}</td>
 <td class="contentEntry1" align="right" width="80px;">
 <button id="btn.{id}" type="button" class="btn btn-success" value="Edit" onclick="reEditRow({id});"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>
 <button id="btn.del.{id}" type="button" class="btn btn-success" value="Del" onclick="reDeleteRow({id});"><i class="fa fa-times" aria-hidden="true"></i></button>

 </td>
</tr>
