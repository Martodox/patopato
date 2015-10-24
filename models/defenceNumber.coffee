_defence = 0

module.exports =

  resetDefence: ->
    _defence = 0

  getPreviousRoundNum: ->
    return _defence

  updateNum: (newNum) ->
    _defence = newNum

  numLost: (newNum) ->
    _defence - newNum

  add: (num) ->
    _defence + num
