import React, { Component } from 'react'
import PropTypes from 'prop-types'

class Link extends Component
  render: ->
    <div>
      <div>
        {@props.link.url} ({@props.link.shortened})
      </div>
    </div>

export default Link
