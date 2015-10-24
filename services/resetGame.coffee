budget = require '../models/budget'
defence = require '../models/defenceNumber'
ships = require '../models/shipsNumber'

module.exports = ->

  budget.resetBudget()
  defence.resetDefence()
  ships.resetShips()
