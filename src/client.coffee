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


  auth_code: '3bb9fd40539be218992da74974152643006bbce9b19ec464781d080720cce546'

module.exports = Client
