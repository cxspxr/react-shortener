import React, { Component } from 'react'
import logo from 'assets/logo.svg'

import './index.css'
import styles from './App.sss'

import Sticker from './components/Sticker/Sticker'
import Shortener from './components/Shortener/Shortener'


class App extends Component
  render: ->
    <div className={styles.app}>
      <div>
        <Shortener />
      </div>
      <Sticker
        href="https://github.com/cxsper/react-shortener/tree/react"
      >
      </Sticker>
    </div>

export default App
