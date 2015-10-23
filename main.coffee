express     = require 'express'
app         = express()
bodyParser  = require 'body-parser'

port = process.env.PORT || 3000




requestParser = require './parsers/requestParser'

budget = require './models/budget'

responseService = require './parsers/response'


app.use(bodyParser.json())


app.all '/', (req, res) ->

  requestParser(req).then (serverStatus) ->

    responseService.reset(serverStatus).then ->

      budget.calculateTotalBudget(serverStatus)





      responseService.upgradeShield()

      responseService.upgradeMine()

      responseService.upgradeWywiad()

      responseService.upgradeLab()

      responseService.addDefence(30)

      responseService.buyMax('ships')





      res.json responseService.get()



server = app.listen port, ->
  console.log 'slucham'

