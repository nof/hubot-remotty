{Robot,Adapter,TextMessage,User} = require 'hubot'
Client = require './client'
Socket = require './socket'

class Remotty extends Adapter

  constructor: ->
    super
    @robot.logger.info "Constructor"
    @client = new Client(auth_code: @auth_code, api_url: @api_url)

  send: (envelope, messages...) ->
    @robot.logger.info "Send"
    for message in messages
      @client.post(
        "/rooms/participations/#{envelope.user.participation_id}/comments",
        {comment: {content: message, show_log: true}},
        (error, response, body) =>
          @robot.logger.info "Send message error: #{error}, response: #{response}, body: #{body}"
      )

  reply: (envelope, strings...) ->
    @robot.logger.info "Reply"

  run: ->
    @robot.logger.info "Run"
    @client.get('/me', (error, response, body) =>
      @me = JSON.parse(body)
      new Socket(
        url: @socket_url,
        roomId: @me.room_id,
        participationId: @me.participation_id,
        callback: @socket_callback
      )
      @emit "connected"
    )

  socket_callback: (event, data) =>
    if event is 'comment'
      @client.get(
        "/rooms/participations/#{data.participation_id}/comments/#{data.comment_id}",
        (error, response, body) =>
          json = JSON.parse(body)
          @robot.logger.info 'data(json)'
          @robot.logger.info data
          content = json.comment.content
          contributor = json.comment.contributor
          if contributor.id isnt @me.participation_id
            user = new User contributor.id, name: contributor.name, participation_id: data.participation_id
            message = new TextMessage user, content, data.comment_id
            @robot.receive message
      )

  auth_code: process.env.REMOTTY_AUTH_CODE
  api_url: process.env.REMOTTY_API_URL ? 'https://www.remotty.net'
  socket_url: process.env.REMOTTY_SOCKET_URL ? 'https://websocket.remotty.net'

exports.use = (robot) ->
  new Remotty robot
