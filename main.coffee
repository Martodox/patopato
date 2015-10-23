express     = require 'express'
app         = express()
bodyParser  = require 'body-parser'

port = process.env.PORT || 3000



requestParser = require './parsers/requestParser'


response = require './parsers/response'


app.use(bodyParser.json())


app.all '/', (req, res) ->

  requestParser(req).then ->

    response.reset().then ->

      res.json response.get()



server = app.listen port, ->
  console.log 'slucham'

