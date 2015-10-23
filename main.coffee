express     = require 'express'
app         = express()
bodyParser  = require 'body-parser'


requestParser = require './parsers/requestParser'


app.use(bodyParser.json())


app.all '/', (req, res) ->

  requestParser(req).then ->
    res.send 'Hello'
  , ->
    res.send 'No hellp'



server = app.listen 3000, ->
  console.log 'slucham'