import React, { Component } from 'react'

import styles from './Sticker.sss'

export default (props) ->
    <a
      href={props.href}
      className={styles.sticker}
      style={props.style}
      target="_blank"
    >
      <img className={styles.img} src={props.src} />
    </a>
