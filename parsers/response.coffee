deepcopy = require 'deepcopy'
promise = require 'promised-io'
Deferred = require("promised-io/promise").Deferred
budget = require './models/budget'


_defaultResponse =
  amountOfMyShips:            0
  amountOfMyDefensiveSystems: 0
  upgradeMine:                false
  upgradeLaboratory:          "NotUpgrade"
  upgradeCounterintelligence: false
  attack:                     false
  upgradeShield:              false

_newResponse = {}



module.exports =

  getTotalCost: ->
    _total = 0

    _total = _total + _newResponse.amountOfMyShips * 50

    _total = _total + _newResponse.amountOfMyDefensiveSystems * 50

    if _newResponse.upgradeMine
      _total = _total + exreq.myResources.mine.upgradeCost

    if _newResponse.upgradeLaboratory
      _total = _total + exreq.myResources.laboratory.upgradeCost

    if _newResponse.upgradeCounterintelligence
      _total = _total + exreq.myResources.counterintelligence.upgradeCost

    if _newResponse.upgradeShield
      _total = _total + exreq.myResources.shield.upgradeCost



  reset: (req) ->
    deferred = new Deferred()

    budget = 5000 + (req.playerStats.myResources.mine.lvl - 1) * 500

    _newResponse = deepcopy _defaultResponse
    deferred.resolve()

    return deferred.promise

  upgradeLab: ->
    _newResponse['upgradeLaboratory'] = true

  upgradeMine: ->
    _newResponse['upgradeMine'] = true

  upgradeShield: ->
    _newResponse['upgradeShield'] = true

  attack: ->
    _newResponse['attack'] = true

  upgradeWywiad: ->
    _newResponse['upgradeCounterintelligence'] = true

  addShips: (ammount) ->
    _newResponse['amountOfMyShips'] = ammount

  addDefence: (ammount) ->
    _newResponse['amountOfMyDefensiveSystems'] = ammount

  get: ->
    return _newResponse

