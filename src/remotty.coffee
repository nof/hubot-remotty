{Robot,Adapter,TextMessage,User} = require 'hubot'
Client = require './client'
Socket = require './socket'

class Remotty extends Adapter

  constructor: ->
    super
    @robot.logger.info "Constructor"

  send: (envelope, strings...) ->
    @robot.logger.info "Send"

  reply: (envelope, strings...) ->
    @robot.logger.info "Reply"

  run: ->
    @robot.logger.info "Run Run Run"
    @emit "connected"

    new Socket(
      url: 'https://websocket.remotty.net'
      roomId: 1
      participationId: 3822
      callback: (event, data) =>
        if (event is 'comment')
          console.log(data.comment_id)
          console.log(data.participation_id)
          @client = new Client
          @client.get(
            "/rooms/participations/#{data.participation_id}/comments/#{data.comment_id}",
            (error, response, body) =>
              data = JSON.parse(body)
              console.log('-- data')
              console.log(data)
              console.log('-- comment')
              console.log(data.comment)
              content = data.comment.content
              user = new User 3822, name: 'horikita'
              message = new TextMessage user, content, data.comment_id
              @robot.receive message
              @robot.receive message
          )
      )

exports.use = (robot) ->
  new Remotty robot
