import React, { Component } from 'react'
import logo from 'assets/logo.svg'

import 'styles/index.css'
import styles from 'styles/App.sss'

export default class App extends Component
  render: ->
    <div className={styles.App}>
      <header className={styles['App-header']}>
        <img src={logo} className={styles['App-logo']} alt="logo" />
        <h1 className={styles['App-title']}>Welcome to React</h1>
      </header>
      <p className={styles['App-intro']}>
        To get started, edit <code>src/App.js</code> and save to reload.
      </p>
    </div>
