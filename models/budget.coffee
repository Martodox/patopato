_budget = 0


module.exports =

  getBudget: ->
    return _budget


  calculateTotalBudget: (serverStatus) ->
    _budget = serverStatus.playerStats.budget + serverStatus.playerStats.budgetBonus

    return _budget