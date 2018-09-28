import React, { Component } from 'react'

import styles from './Input.sss'
import classnames from 'classnames'

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
        className={ classnames(styles.input, {
          "#{styles['input--invalid']}": !@props.valid
        }) }
        spellCheck={false}
      />

      <span
        className={ classnames(styles.highlight, {
          "#{styles['highlight--invalid']}": !@props.valid
        }) }
      >
          { @state.inputValue.replace(/ /g, "\u00a0") }
      </span>
    </div>

export default Input
