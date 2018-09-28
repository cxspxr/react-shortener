import React, { Component } from 'react'

import styles from './Input.sss'
import classnames from 'classnames'

class Input extends React.Component
  constructor: (props) ->
    super(props)

  render: ->
    <div
      className={styles.wrapper}
      style={@props.style}
    >
      <input
        id={@props.id}
        value={@props.url}
        placeholder={@props.placeholder}
        onChange={@props.onChange}
        type={@props.type}
        value={@props.value}
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
          { @props.value.replace(/ /g, "\u00a0") }
      </span>
    </div>

export default Input
