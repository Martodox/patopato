express = require 'express'
app     = express()


requestParser = require './parsers/requestParser'



app.get '/', (req, res) ->

  requestParser(req).then ->
    res.send 'Hello'
  , ->
    res.send 'No hellp'





server = app.listen 3000, ->
  console.log 'slucham'