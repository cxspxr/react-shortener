import React, { Component } from 'react'

import axios from 'axios'
import URL from '../utils/url/url'

createHash = (itemCount) =>
  hashDigits = []

  dividend = itemCount + 1
  remainder = 0

  while dividend > 0
    remainder = dividend % 62
    dividend = Math.floor dividend/62
    hashDigits.unshift remainder
  console.log(hashDigits);

  alphabetArray = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789".split('');

  # Convert hashDigits to base62 representation
  hashString = ''
  i = 0
  while hashDigits.length > i
      hashString += alphabetArray[hashDigits[i]]
      i++
  hashString


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
      console.log existing

      # if it's present - return shortened
      if existing
        @setState
          shortened: existing
        return

      # otherwise make hash
      axios.get URL + 'links/count'
      .then (res) =>
        count = +res.data

        hash = createHash count
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
