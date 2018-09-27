import React, { Component } from 'react'
import PropTypes from 'prop-types'

class Link extends Component
  render: ->
    <div>
      <div>
        {@props.link.url}
        {@props.link.hash}
      </div>
    </div>

export default Link
