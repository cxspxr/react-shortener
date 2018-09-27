import React, { Component } from 'react'
import Link from './Link'

import axios from 'axios'
import URL from '../utils/url'

class LinkList extends Component
  constructor: (props) ->
    super props
    @state =
      links: []

  componentDidMount: ->
    axios.get URL + 'links'
      .then (res) =>
        links = res.data

        @setState { links }

  render: ->
    <div>
      {@state.links.map( (link) => <Link key={link.id} link={link} />)}
    </div>

export default LinkList
