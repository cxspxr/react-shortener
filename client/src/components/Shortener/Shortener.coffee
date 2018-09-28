import React, { Component } from 'react'

import links from '../../api/LinksAPI'
import base62 from '../../utils/encode/base62'
import Input from '../Input/Input'
import Button from '../Button/Button'

import styles from './Shortener.sss'
import InputStyles from './inline/Input'

class Shortener extends Component
  constructor: (props) ->
    super(props)
    @state =
      url: ''
      shortened: ''
      isValid: false

  validate: (value) ->
    { isValid } = @state

    isValid = value.match /^(?:http(s)?:\/\/)[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$/

    @setState { isValid }

  onInputChange: (e) =>
    { value } = e.target
    @setState url: value
    @validate value

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
          # do @createShortLink
          console.log e.response.data

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
    <div className={styles.shortener}>
      <Input
        value={@state.url}
        placeholder="Link URL"
        onChange={@onInputChange}
        type="text"
        style={InputStyles}
        valid={@state.isValid}
      />
      <Button
        onClick={() => @createShortLink()}
        disabled={!@state.isValid}
      >
        Create
      </Button>
      <div>
        {@state.shortened}
      </div>
    </div>

export default Shortener
