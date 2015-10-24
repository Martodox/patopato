_budget = 0


module.exports =

  resetBudget: ->
    _budget = 0

  getBudget: ->
    return _budget

  tryPurchase: (amount) ->
    return _budget - amount  >= 0

  addPurchase: (amount) ->
    _budget = _budget - amount
    return _budget

  calculateTotalBudget: (serverStatus) ->

    _budget = serverStatus.playerStats.budget

    return _budget
