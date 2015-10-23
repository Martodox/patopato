Array::move = (old_index, new_index) ->
  while old_index < 0
    old_index += @length
  while new_index < 0
    new_index += @length
  if new_index >= @length
    k = new_index - (@length)
    while k-- + 1
      @push undefined
  @splice new_index, 0, @splice(old_index, 1)[0]
  this

_priority = ['mine', 'shield', 'intelligence', 'deffence', 'attack', 'laboratory']

module.exports =

  getPriorities: ->
    _priority

  updatePriority: (element, new_priority)->
    old_index = _priority.indexOf(element)
    if(new_priority >= _priority.length)
      _priority.move(old_index, -1)
    else
      _priority.move(old_index, new_priority)
    _priority
