express     = require 'express'
app         = express()
bodyParser  = require 'body-parser'

port = process.env.PORT || 3000



requestParser = require './parsers/requestParser'


response = require './parsers/response'


app.use(bodyParser.json())


app.all '/', (req, res) ->

  requestParser(req).then ->
    GLOBAL.exreq = req

    #GLOBAL.budget = req.playerStats.budget + req.playerStats.budgetBonus

    response.reset().then ->
#      response.upgradeShield()
#
#      response.upgradeMine()
#
#      response.upgradeWywiad()
#
      response.addDefence 100





      res.json response.get()



server = app.listen port, ->
  console.log 'slucham'

