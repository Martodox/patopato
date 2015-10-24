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


      if lostDefenceNum > 0
        responseService.attack()
        responseService.buyMax('ships')
      else
        responseService.upgradeMine()
        responseService.upgradeShield()
        responseService.upgradeLab(serverStatus.playerStats.round)
        responseService.buyMax('deffence')
        #responseService.upgradeWywiad()


      res.json responseService.get()



server = app.listen port, ->
  console.log 'slucham'
