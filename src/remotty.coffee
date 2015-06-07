{Robot,Adapter,TextMessage,User} = require 'hubot'
Client = require './client'
Socket = require './socket'

class Remotty extends Adapter

  constructor: ->
    super
    @robot.logger.info "Constructor"
    @client = new Client

  send: (envelope, messages...) ->
    @robot.logger.info "Send"
    for message in messages
      @client.post(
        "/rooms/participations/#{envelope.user.id}/comments",
        {comment: {content: message}},
        (error, response, body) ->
          @robot.logger.info "Send message error: #{error}, response: #{response}, body: #{body}"
      )

  reply: (envelope, strings...) ->
    @robot.logger.info "Reply"

  run: ->
    @robot.logger.info "Run"
    @emit "connected"

    roomId = 1

    new Socket(
      url: 'https://websocket.remotty.net',
      roomId: 1,
      participationId: 3822
      callback: (event, data) =>
        if event is 'comment'
          @client.get(
            "/rooms/participations/#{data.participation_id}/comments/#{data.comment_id}",
            (error, response, body) =>
              data = JSON.parse(body)
              content = data.comment.content
              contributor = data.comment.contributor
              user = new User contributor.id, name: contributor.name
              # TODO: ここで書き込んだ先の participation_id を受け渡ししたい
              message = new TextMessage user, content, data.comment_id
              @robot.receive message
          )
    )

exports.use = (robot) ->
  new Remotty robot
