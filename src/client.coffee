request = require 'request'

class Client
  constructor: (options) ->

  # https://www.remotty.net/api/v1/rooms/1/participations/3517/comments/200930
  get: (path, callback) ->
    options = {
      url: "https://www.remotty.net/api/v1#{path}.json",
      headers: {
        'Authorization':'Bearer ' + @auth_code
      },
    }
    request options, callback

  post: (path, data, callback) ->


  auth_code: ''

module.exports = Client
