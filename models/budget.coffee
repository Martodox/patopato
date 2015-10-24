_budget = 0


module.exports =

  resetBudget: ->
    _budget = 0

  getBudget: ->
    return _budget

  tryPurchase: (amount) ->
    return _budget - amount  >= 0

  addPurchase: (amount) ->
    return _budget -= amount

  calculateTotalBudget: (serverStatus) ->



    _budget = serverStatus.playerStats.budget + serverStatus.playerStats.budgetBonus

    return _budget
