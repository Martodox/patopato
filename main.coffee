express = require 'express'
app     = express()



app.get '/', (req, res) ->
  res.send 'Hello'




server = app.listen 3000, ->
  console.log 'slucham'