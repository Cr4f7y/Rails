module ChatHelper
  def chat(name,answer,time)
    if name && answer
        data='<li class="left clearfix">
            <span class="chat-img pull-left">
        <img src="http://placehold.it/50/55C1E7/fff&text='+name[0]+'"alt="User Avatar" class="img-circle" />
        </span>
        <div class="chat-body clearfix">
          <div class="header">
            <strong class="primary-font">' + name +'</strong><br>
        <small class="text-muted">


        <div><p>'+ answer + '</p><div id="time"><span class="glyphicon glyphicon-time"></span>' +
            time.to_s +
            '</small></div></div>


        </div>

        </div>
      </li>'
      data.html_safe
      end
  end
end
