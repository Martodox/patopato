express = require 'express'
app     = express()
port = process.env.PORT || 3000

requestParser = require './parsers/requestParser'



app.get '/', (req, res) ->

  requestParser(req).then ->
    res.send 'Hello'
  , ->
    res.send 'No hellp'





server = app.listen port, ->
  console.log 'slucham'
