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
        console.log('----2')
        console.log(error)
        # console.log(response)
        console.log(body)
        # data.should.eql 100
        done()
    )
