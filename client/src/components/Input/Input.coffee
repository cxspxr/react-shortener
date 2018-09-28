import React, { Component } from 'react'

import styles from './Input.sss'

class Input extends React.Component
  constructor: (props) ->
    super(props)

    @state =
      inputValue: ''

    @onInputChange = @onInputChange.bind @

  onInputChange: (e) ->
    @props.onChange e

    { value } = e.target

    @setState
      inputValue: value

  render: ->
    <div
      className={styles.wrapper} 
      style={@props.style}
    >
      <input
        id={@props.id}
        value={@props.url}
        placeholder={@props.placeholder}
        onChange={@onInputChange}
        type={@props.type}
        value={@state.inputValue}
        className={styles.input}
        spellCheck={false}
      />

      <span className={styles.highlight}>
          { @state.inputValue.replace(/ /g, "\u00a0") }
      </span>
    </div>

export default Input
