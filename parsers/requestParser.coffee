promise = require 'promised-io'
Deferred = require("promised-io/promise").Deferred

_request = {}

fs = require 'fs'

module.exports = (req) ->


  _request = req.body

  fs.writeFile './logs/' + new Date().getTime(), JSON.stringify req.body

  deferred = new Deferred()

  GLOBAL.exreq = _request

  deferred.resolve(_request)


  return deferred.promise









