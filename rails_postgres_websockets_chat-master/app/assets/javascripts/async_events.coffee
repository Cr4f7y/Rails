attempts = 1
generateInterval = (attempts) ->
  maxInterval = (Math.pow(2, attempts) - 1) * 1000

  # If the generated interval is more than 30 seconds, truncate it down to 30 seconds.
  maxInterval = 30*1000 if (maxInterval > 30*1000)

  # generate the interval to a random number between 0 and the maxInterval determined from above
  Math.random() * maxInterval

ws = null
createWebsocket = ->
  scheme = "wss://" # TODO: make "wss://" in production
  uri = scheme + window.document.location.host + '/'
  ws = new WebSocket(uri)

  ws.onopen = ->
    attempts = 1 # reset

  ws.onmessage = (message) ->
    data = JSON.parse(message.data)
    $('#chat-text').append '<div class="col-lg-8" id="message_li">
              <div class="panel-body">
                <ul class="chat">
                  <li class="left clearfix">
                            <span class="chat-img pull-left">
                                <img src="http://placehold.it/50/55C1E7/fff&text='+data.author[0]+'" alt="User Avatar" class="img-circle" />
                            </span>
                    <div class="chat-body clearfix">
                      <div class="header">
                        <strong class="primary-font">'+ data.author + '</strong><br>
                        <small class="text-muted">
                          <span class="glyphicon glyphicon-time">' + data.created_at + '</span>
                        </small>
                      </div>
                      <p>' + data.body +
                      '</p>
                      </div>
                  </li>

                </ul>
              </div>
            </div>'
    $('#message_li').last().remove()
  ws.onclose = ->
    setTimeout ->
      attempts++
      createWebsocket()
    , generateInterval(attempts)

# Initialize the websocket
createWebsocket()

$ ->
  $('#input-form').on 'submit', (event) ->

    event.preventDefault()
    author = document.getElementById('cl_name').innerHTML
    body = $('#input-body')[0].value
    created_at = new Date();
    ws.send JSON.stringify(
      author: author
      body: body
      created_at: created_at
      )
    $('#input-body')[0].value = ''

    return
