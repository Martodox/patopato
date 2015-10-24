_shouldAttack = false

module.exports =

  resetAttack: ->
    _shouldAttack = false

  setAttack: ->
    _shouldAttack = true

  shouldAttack: ->
    _shouldAttack
