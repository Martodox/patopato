express     = require 'express'
app         = express()
bodyParser  = require 'body-parser'

port = process.env.PORT || 3000




requestParser = require './parsers/requestParser'

budget = require './models/budget'

response = require './parsers/response'


app.use(bodyParser.json())


app.all '/', (req, res) ->

  requestParser(req).then (serverStatus) ->

    response.reset(serverStatus).then ->

      budget.calculateTotalBudget(serverStatus)





      response.upgradeShield()

      response.upgradeMine()

      response.upgradeWywiad()

      response.addDefence 100





      res.json response.get()



server = app.listen port, ->
  console.log 'slucham'

