import React, { Component } from 'react'

import axios from 'axios'
import URL from '../utils/url/url'

import base62 from '../utils/encode/base62'


class Shortener extends Component
  constructor: (props) ->
    super(props)
    @state =
      url: ''
      shortened: ''

  createShortLink: () ->

    # fetch existing link
    axios.post URL + 'links/get',
      url: @state.url
    .then (res) =>
      existing = res.data

      # if it's present - return shortened
      if existing
        @setState
          shortened: existing.shortened
        return

      # otherwise make hash
      axios.get URL + 'links/count'
      .then (res) =>
        count = +res.data

        hash = base62 count
        # and store link
        axios.post URL + 'links/store',
          url: @state.url
          shortened: hash

        # set shortened to hash
        @setState
          shortened: hash


  render: ->
    <div>
      <input
        id="url"
        value={@state.url}
        placeholder="Link URL"
        onChange={(e) => @setState({ url: e.target.value })}
        type="text"
      />
      <button onClick={() => @createShortLink()}>Create</button>
      {@state.shortened}
    </div>

export default Shortener
