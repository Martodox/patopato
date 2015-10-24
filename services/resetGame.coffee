budget = require '../models/budget'
defence = require '../models/defenceNumber'
ships = require '../models/shipsNumber'
shouldAttack = require '../models/attackManager'

module.exports = ->

  budget.resetBudget()
  defence.resetDefence()
  ships.resetShips()
  shouldAttack.resetAttack()
