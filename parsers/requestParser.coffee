promise = require 'promised-io'
Deferred = require("promised-io/promise").Deferred
logName = 'request_logs.log'

_request = {}

fs = require 'fs'

module.exports = (req) ->
  _request = req.body

  logStream = fs.createWriteStream(__dirname + '/' + logName, flags: 'w')

  logStream.write(new Date().toString() + ' ' + (JSON.stringify req.body) + '\n')

  deferred = new Deferred()

  deferred.resolve(_request)


  return deferred.promise
