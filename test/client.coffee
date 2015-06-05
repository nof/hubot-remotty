Client = require '../src/client'

require 'should'

describe 'Client', ->
  it 'get comments', (done) ->
    client = new Client

    client.get(
      '/rooms/participations/3517/comments',
      (data) ->
        data.should.eql 100
        done()
    )

  it 'get my data', (done) ->
    client = new Client

    client.get(
      '/me',
      (data) ->
        data.should.eql 100
        done()
    )
