Socket = require '../src/socket'
should = require 'should'

describe.skip 'Socket / SKIP TEST for real connection', ->
  describe '#join', ->
    it 'join', (done) ->

      socket = new Socket(
        url: 'https://websocket.remotty.net'
        roomId: 1
        participationId: 3517
        callback: (event, data) ->
          done() if (event is 'join')
        )

  describe '#comment', ->
    @.timeout(10000)
    it 'comment', (done) ->
      socket = new Socket(
        url: 'https://websocket.remotty.net'
        roomId: 1
        participationId: 3517
        callback: (event, data) ->
          if (event is 'comment')
            console.log(data)
            done()
        )
