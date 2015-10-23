deepcopy = require 'deepcopy'
promise = require 'promised-io'
Deferred = require("promised-io/promise").Deferred



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
  reset: ->
    deferred = new Deferred()

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








