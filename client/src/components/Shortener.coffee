import React, { Component } from 'react'

import links from '../api/LinksAPI'

import base62 from '../utils/encode/base62'


class Shortener extends Component
  constructor: (props) ->
    super(props)
    @state =
      url: ''
      shortened: ''

  storeLink: (hash) ->
    links.store
        url: @state.url
        shortened: hash
      .then (res) =>
        # set shortened
        @setState
          shortened: res.data.shortened

      .catch (e) =>
        # recreate if fails (could be so with parallel requests)
        if e.response.status is 422
          console.log e.response.data
          do @createShortLink

  createShortLink: () ->
    # fetch existing link
    links.get(@state.url).then (res) =>
      existing = res.data

      # if it's present - return shortened
      if existing
        @setState
          shortened: existing.shortened
        return

      # otherwise make hash
      links.count().then (res) =>
        hash = base62 +res.data
        @storeLink hash


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
