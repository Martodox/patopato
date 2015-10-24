deepcopy = require 'deepcopy'
promise = require 'promised-io'
Deferred = require("promised-io/promise").Deferred
budgetService = require '../models/budget'
defenceService = require '../models/defenceNumber'
shipService = require '../models/shipsNumber'

reseter = require '../services/resetGame'


_defaultResponse =
  amountOfMyShips:            0
  amountOfMyDefensiveSystems: 0
  upgradeMine:                false
  upgradeLaboratory:          "NotUpgrade"
  upgradeCounterintelligence: false
  attack:                     false
  upgradeShield:              false

_newResponse = {}

_newServerStatus = {}



module.exports =


  reset: (req) ->
    deferred = new Deferred()

    _newResponse = deepcopy _defaultResponse

    _newServerStatus = req

    if _newServerStatus.playerStats.round is 20
      reseter()



    deferred.resolve()

    return deferred.promise

  getLostShipNum: ->
    shipService.numLost(_newServerStatus.playerStats.myResources.myDefensiveSystemsStats.amount)

  getLostDefenceNum: ->
    defenceService.numLost(_newServerStatus.playerStats.myResources.myDefensiveSystemsStats.amount)

  setCurrentDefAndShips: ->
    defenceService.updateNum(_newServerStatus.playerStats.myResources.myDefensiveSystemsStats.amount)
    shipService.updateNum(_newServerStatus.playerStats.myResources.myShipsStats.amount)

  upgradeLab: (round)->
    if budgetService.tryPurchase(_newServerStatus.playerStats.myResources.laboratory.upgradeCost)
      round % 2 == 0 ? _newResponse['upgradeLaboratory'] = 'UpgradeDefense' : _newResponse['upgradeLaboratory'] = 'UpgradeAttack'
      budgetService.addPurchase(_newServerStatus.playerStats.myResources.laboratory.upgradeCost)

  upgradeMine: ->
    if budgetService.tryPurchase(_newServerStatus.playerStats.myResources.mine.upgradeCost)
      _newResponse['upgradeMine'] = true
      budgetService.addPurchase(_newServerStatus.playerStats.myResources.mine.upgradeCost)

  upgradeShield: ->
    if budgetService.tryPurchase(_newServerStatus.playerStats.myResources.shield.upgradeCost)
      _newResponse['upgradeShield'] = true
      budgetService.addPurchase(_newServerStatus.playerStats.myResources.shield.upgradeCost)

  attack: ->
    if budgetService.tryPurchase(400)
      _newResponse['attack'] = true
      budgetService.addPurchase(400)

  upgradeWywiad: ->
    if budgetService.tryPurchase(_newServerStatus.playerStats.myResources.counterintelligence.upgradeCost)
      _newResponse['upgradeCounterintelligence'] = true
      budgetService.addPurchase(_newServerStatus.playerStats.myResources.counterintelligence.upgradeCost)

  addShips: (ammount) ->
    if budgetService.tryPurchase(50 * ammount)
      shipService.add(ammount)
      _newResponse['amountOfMyShips'] = ammount
      budgetService.addPurchase(50 * ammount)

  addDefence: (ammount) ->
    if budgetService.tryPurchase(50 * ammount)
      defenceService.add(ammount)
      _newResponse['amountOfMyDefensiveSystems'] = ammount
      budgetService.addPurchase(50 * ammount)

  buyMax: (what) ->
    _funds = Math.floor(budgetService.getBudget() / 50)

    if _funds > 0

      if what is 'ships'
        _newResponse['amountOfMyShips'] = _funds
      else
        _newResponse['amountOfMyDefensiveSystems'] = _funds

      budgetService.addPurchase(50 * _funds)

  get: ->
    return _newResponse

