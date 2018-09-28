import React from 'react'
import Shortener from './Shortener'
import renderer from 'react-test-renderer'

test 'Shortener', () =>
  component = renderer.create(<Shortener />).toJSON()

  expect(component).toMatchSnapshot()
  return
