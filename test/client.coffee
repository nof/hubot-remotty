Client = require '../src/client'

assert = require('power-assert')

describe.skip 'Client / SKIP TEST for real connection', ->
  client = new Client(
    auth_code: process.env.TEST_REMOTTY_AUTH_CODE,
    api_url: 'https://www.remotty.net'
  )

  it 'get comments', (done) ->
    client.get(
      '/rooms/participations/3517/comments/200930',
      (error, response, body) ->
        assert error == null
        done()
    )

  it 'get my data', (done) ->
    client.get(
      '/me',
      (error, response, body) ->
        assert error == null
        done()
    )

  it 'post comment', (done) ->
    client.post(
      '/rooms/participations/3822/comments',
      {comment: {content: 'POPOPO'}},
      (error, response, body) ->
        assert error == null
        done()
    )
