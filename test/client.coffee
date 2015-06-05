Client = require '../src/client'

require 'should'

describe 'Client', ->
  it 'get token', (done) ->
    client = new Client

    client.get(
      '/rooms/participations/3517/comments',
      (data) ->
        data.should.eql 100
        done()
    )
