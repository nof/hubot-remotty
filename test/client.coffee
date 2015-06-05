Client = require '../src/client'

should = require 'should'

describe 'Client', ->
  it 'get comments', (done) ->
    client = new Client

    client.get(
      '/rooms/participations/3517/comments/200930',
      (error, response, body) ->
        console.log('----1')
        console.log(error)
        # console.log(response)
        console.log(body)
        # data.should.eql 100
        done()
    )

  it 'get my data', (done) ->
    client = new Client

    client.get(
      '/me',
      (error, response, body) ->
        console.log(error)
        # console.log(response)
        console.log(body)
        # data.should.eql 100
        done()
    )

  it 'post comment', (done) ->
    client = new Client

    client.post(
      '/rooms/participations/3822/comments',
      {comment: {content: 'POPOPO'}}
      (error, response, body) ->
        console.log('')
        console.log(error)
        # console.log(response)
        console.log(body)
        done()
    )
