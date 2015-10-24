_ships = 0

module.exports =

  resetShips: ->
    _ships = 0

  getPreviousRoundNum: ->
    return _ships

  updateNum: (newNum) ->
    _ships = newNum

  numLost: (newNum) ->
    _ships - newNum

  add: (num) ->
    _ships + num

