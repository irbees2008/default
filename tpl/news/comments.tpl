<tr align="center">
    <td >[userlink]<a href="{com_url}">{com_author}</a>[/userlink]</td>
    <td >{com_time}</td>
    <td  align="left">{com_part}</td>
    <td ><a href="{php_self}?mod=editcomments&newsid={com_post}&comid={com_id}">{l_edit_comm}</a></td>
    <td ><a href="{php_self}?mod=ipban&iplock={com_ip}" target="_blank" title="{l_block_ip}">{com_ip}</a></td>
    <td ><input form="commentsForm" type="checkbox" name="delcomid[]" id="{com_id}-{com_author}-{com_ip}-{com_post}" value="{com_id}-{com_author}-{com_ip}-{com_post}" class="check" /><label for="{com_id}-{com_author}-{com_ip}-{com_post}"></label></td>
</tr>
