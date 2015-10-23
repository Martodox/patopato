_ships = 0

module.exports =

  getPreviousRoundNum: ->
    return _ships

  updateNum: (newNum) ->
    _ships = newNum

  numLost: (newNum) ->
    _ships - newNum

  add: (num) ->
    _ships + num

