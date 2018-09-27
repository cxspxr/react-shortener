import React, { Component } from 'react'
import Link from './Link'

ALL_LINKS = [
  {
    id: '1'
    hash: 'ABC'
    url: 'https://google.com'
  },
  {
    id: '2',
    hash: 'DEF'
    url: 'https://github.com'
  }
]

class LinkList extends Component
  render: ->
    <div>
      {ALL_LINKS.map( (link) => <Link key={link.id} link={link} />)}
    </div>

export default LinkList
