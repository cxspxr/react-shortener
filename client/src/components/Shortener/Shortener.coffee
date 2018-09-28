import React, { Component } from 'react'

import links from '../../api/LinksAPI'
import base62 from '../../utils/encode/base62'
import Input from '../Input/Input'
import Button from '../Button/Button'
import Copier from '../Copier/Copier'

import styles from './Shortener.sss'
import InputStyles from './inline/Input'

fallbackMessage = "Let's paste a proper link..."

class Shortener extends Component
  constructor: (props) ->
    super(props)
    @state =
      url: ''
      shortened: ''
      isValid: false
      message: fallbackMessage

  validate: (value) ->
    { isValid } = @state
    isValid = value.match /^(?:http(s)?:\/\/)[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$/
    @setState { isValid }

  onInputChange: (e) =>
    { value } = e.target
    @setState url: value
    @validate value

  resetMessage: -> @setState message: fallbackMessage
  reset: ->
    @setState
      shortened: ''
      url: ''
      isValid: false

  onCopy: =>
    do @reset
    new Promise (resolve, reject) =>
        @setState({ message: "Your link is copied!" })
        setTimeout =>
          resolve()
        , 3000
      .then () =>
        do @resetMessage

  storeLink: (hash) ->
    links.store
        url: @state.url
        shortened: hash
      .then (res) =>
        # set shortened
        @setState
          shortened: res.data.shortened

      .catch (e) =>
        if e.response.status is 422
          console.log e.response.data
          do @reset

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
    link = if @state.shortened
      <Copier
        what={@state.shortened}
        onCopy={@onCopy}
      >
        Click on me! Shortened: {@state.shortened}
      </Copier>
    else
      @state.message

    <div className={styles.shortener}>
      <div className={styles.shortened}>
        {link}
      </div>
      <Input
        value={@state.url}
        onChange={@onInputChange}
        type="text"
        style={InputStyles}
        valid={@state.isValid}
        autoFocus={true}
      />
      <Button
        onClick={() => @createShortLink()}
        disabled={!@state.isValid}
      >
        Shorten
      </Button>
    </div>

export default Shortener
