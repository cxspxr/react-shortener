import React, { Component } from 'react'
import logo from 'assets/logo.svg'

import './index.css'
import styles from './App.sss'

import Shortener from 'Components/Shortener/Shortener'

class App extends Component
  render: ->
    <div className={styles.app}>
      <div>
        <Shortener />
      </div>
    </div>

export default App
