promise = require 'promised-io'
Deferred = require("promised-io/promise").Deferred

_request = {}

fs = require 'fs'
logName = 'request_logs.log'

module.exports = (req) ->

  _request = req.body

  fs.writeFile './logs/' + new Date().getTime(), JSON.stringify req.body
  logStream = fs.createWriteStream('./' + logName, flags: 'a')

  logStream.write(new Date().toString() + ' ' + (JSON.stringify req.body) + '\n')
  logStream.end()

  deferred = new Deferred()

  deferred.resolve(_request)


  return deferred.promise
