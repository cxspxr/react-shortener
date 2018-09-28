import React from 'react'
import Button from './Button'
# import renderer from 'react-test-renderer'
import { shallow } from 'enzyme'
import toJson from 'enzyme-to-json'

describe '<Button />', () =>

  describe 'render()', () =>
    test 'renders a button', () =>
      component = shallow(
        <Button>abc</Button>
      )

      expect(component.contains(<button className="button">abc</button>)).toBeTruthy()


  describe 'onClick()', () =>
    test 'successfully calls the onClick handler', () =>
      mockOnClick = jest.fn()
      component = shallow(
        <Button onClick={mockOnClick} />
      )

      component.find('button').simulate('click')
      expect(mockOnClick.mock.calls.length).toEqual(1)
