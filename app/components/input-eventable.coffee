InputEventable = Ember.TextField.extend
    
  # keyUp does not work properly with enter key
  # keyPress ignores backspace and is fired before input value gets updated and 
  keyDown: (event)->
    @sendAction 'onKey', event

  focusOut: (event) ->
    @sendAction 'onBlur', event

  invalid: (value) ->
    @.$().toggleClass('invalid', value)


`export default InputEventable`