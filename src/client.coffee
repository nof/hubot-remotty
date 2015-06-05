oauth = require('oauth')
class Client
  constructor: (options) ->
    @consumer = new oauth.OAuth2(
      @key,
      @secret,
      'https://www.remotty.net/',
      null,
      'oauth2/token',
      null
    )

  # https://www.remotty.net/api/v1/rooms/1/participations/3517/comments/200930
  get: (path, callback) ->
    console.log(callback)
    console.log(path)
    console.log(@consumer)
    console.log(@consumer.get)
    @consumer.get(
      "https://www.remotty.net/api/v1#{path}",
      @token,
      callback
    )

  key: ''
  secret: ''
  auth_code: ''

module.exports = Client
