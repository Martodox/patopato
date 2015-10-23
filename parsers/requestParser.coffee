promise = require 'promised-io'
Deferred = require("promised-io/promise").Deferred
logName = 'request_logs.log'

_request = {}

fs = require 'fs'

module.exports = (req) ->


  _request = req.body

  fs.appendFile './log/' + logName, new Date().toString() + ' ' + (JSON.stringify req.body) + '\n'


  deferred = new Deferred()

  deferred.resolve()


  return deferred.promise









