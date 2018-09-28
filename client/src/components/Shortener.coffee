import React, { Component } from 'react'

import axios from 'axios'
import api from '../api/LinksAPI'

import base62 from '../utils/encode/base62'


class Shortener extends Component
  constructor: (props) ->
    super(props)
    @state =
      url: ''
      shortened: ''

  fetchExistingLink: () ->
    axios.post api.get,
        url: @state.url

  fetchCountOfLinks: () ->
    axios.get api.count

  storeLink: (hash) ->
    axios.post api.store,
      url: @state.url
      shortened: hash
    .then (res) =>
      # set shortened
      @setState
        shortened: res.data.shortened

    .catch (e) =>
      # recreate if fails (could be so with parallel requests)
      if e.response.status is 422
        do @createShortLink

  createShortLink: () ->
    # fetch existing link
    @fetchExistingLink().then (res) =>
      existing = res.data

      # if it's present - return shortened
      if existing
        @setState
          shortened: existing.shortened
        return

      # otherwise make hash
      @fetchCountOfLinks().then (res) =>
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
