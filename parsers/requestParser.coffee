promise = require 'promised-io'
Deferred = require("promised-io/promise").Deferred
logger = require('../services/logger')

_request = {}

fs = require 'fs'
logName = 'request_logs.log'

module.exports = (req) ->

  _request = req.body
  logger(JSON.stringify req.body)

  deferred = new Deferred()

  GLOBAL.exreq = _request

  deferred.resolve(_request)


  return deferred.promise
