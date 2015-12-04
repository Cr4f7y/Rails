module ChatHelper
  def chat(heading,body,id,counter)
    if heading && body
      data=' <tr>
              <td></td>
              <td>'+ counter.to_s+'</td>
              <td id='+ id.to_s+' >'+heading+'</td>
              <td class="col-md-8">'+body+'</td>
              <td><p><button class="btn btn-primary btn-xs open-EditNoteDialog" data-title="Edit" data-toggle="modal" data-id='+id.to_s+' data-target="#edit" data-placement="top" rel="tooltip"><span class="glyphicon glyphicon-pencil"></span></button></p></td>
              <td><p><button class="btn btn-danger btn-xs open-DeleteNoteDialog" data-title="Delete" data-toggle="modal" data-id='+id.to_s+' data-target="#delete" data-placement="top" rel="tooltip"><span class="glyphicon glyphicon-trash"></span></button></p></td>
            </tr>'
      data.html_safe
    end
  end
end