_budget = 0


module.exports =

  getBudget: ->
    return _budget

  tryPurchase: (amount)->
    _budget - amount  > 0

  addPurchase: (amount)->
    _budget -= amount

  calculateTotalBudget: (serverStatus) ->
    _budget = serverStatus.playerStats.budget + serverStatus.playerStats.budgetBonus

    return _budget
