request = require 'request'

class Client
  constructor: (options) ->
    @options = options

  get: (path, callback) ->
    options = {
      url: "#{@options.api_url}/api/v1#{path}.json",
      headers: {
        'Authorization':'Bearer ' + @options.auth_code
      }
    }
    request options, callback

  post: (path, data, callback) ->
    options = {
      url: "#{@options.api_url}/api/v1#{path}.json",
      method: 'POST',
      headers: {
        'Authorization':'Bearer ' + @options.auth_code
      },
      json: data
    }
    request options, callback

module.exports = Client
