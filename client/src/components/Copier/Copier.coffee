import React, { Component } from 'react'

class Copier extends Component
  constructor: (props) ->
    super(props)

  handleOnClick: (e) =>
    el = document.createElement 'textarea'
    el.value = @props.what
    el.setAttribute 'readonly', ''
    el.style.position = 'absolute'
    el.style.left = '-9999px'
    document.body.appendChild el
    el.select()
    document.execCommand 'copy'
    document.body.removeChild el

    do @props.onCopy

  render: ->
    <div onClick={@handleOnClick}>
      {@props.children}
    </div>

export default Copier
