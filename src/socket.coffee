io = require('socket.io-client')

class Socket
  constructor: (options) ->
    socket = io.connect(options.url)
    socket.emit 'join',
      participation_id: options.participationId
      room_id: options.roomId
      select_id: options.participationId

    socket.on 'join',(data) ->
      options.callback('join', data)

    socket.on 'connect', ->
      options.callback('connect')

    socket.on 'message', (data) ->
      options.callback('comment', data) if data.comment_id

module.exports = Socket
