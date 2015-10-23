express     = require 'express'
app         = express()
bodyParser  = require 'body-parser'

port = process.env.PORT || 3000



requestParser = require './parsers/requestParser'


app.use(bodyParser.json())


app.all '/', (req, res) ->

  requestParser(req).then ->
    res.send 'Hello'
  , ->
    res.send 'No hellp'



server = app.listen port, ->
  console.log 'slucham'

