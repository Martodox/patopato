fs = require 'fs'

module.exports = (req) ->
  _toSave = req + ','
  logStream = fs.createWriteStream('./fightLog.log', flags: 'a')
  logStream.write _toSave
  logStream.end()

