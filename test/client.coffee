Client = require '../src/client'

assert = require('power-assert')

describe 'Client', ->
  it 'get comments', (done) ->
    client = new Client

    client.get(
      '/rooms/participations/3517/comments/200930',
      (error, response, body) ->
        console.log(body)
        assert error == null
        done()
    )

  it 'get my data', (done) ->
    client = new Client

    client.get(
      '/me',
      (error, response, body) ->
        assert error == null
        done()
    )

  it 'post comment', (done) ->
    client = new Client

    client.post(
      '/rooms/participations/3822/comments',
      {comment: {content: 'POPOPO'}},
      (error, response, body) ->
        assert error == null
        done()
    )
