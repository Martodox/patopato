express     = require 'express'
app         = express()
bodyParser  = require 'body-parser'
priorities  = require './models/priorities'

port = process.env.PORT || 3000




requestParser = require './parsers/requestParser'

budget = require './models/budget'

responseService = require './parsers/response'


app.use(bodyParser.json())


app.all '/', (req, res) ->

  requestParser(req).then (serverStatus) ->

    responseService.reset(serverStatus).then ->

      budget.calculateTotalBudget(serverStatus)
      lostShipNum = responseService.getLostShipNum()
      lostDefenceNum = responseService.getLostDefenceNum()
      responseService.setCurrentDefAndShips()

      if(serverStatus.playerStats.round is 20)
        responseService.upgradeMine()
        responseService.upgradeShield()
        responseService.addDefence(46)
      else
        responseService.upgradeShield()

        responseService.upgradeMine()

        responseService.upgradeWywiad()

        responseService.upgradeLab()

        responseService.addDefence(30)

        responseService.buyMax('ships')

      res.json responseService.get()



server = app.listen port, ->
  console.log 'slucham'
  priorities.updatePriority 'mine', 10
