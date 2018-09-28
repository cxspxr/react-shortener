import React from 'react'
import Button from './Button'
# import renderer from 'react-test-renderer'
import { shallow, mount } from 'enzyme'

describe '<Button />', () =>
  describe 'render()', () =>
    test 'renders a button', () =>
      component = shallow(
        <Button>abc</Button>
      )

      expect(component.contains(<button className="button">abc</button>)).toBeTruthy()
      expect(component).toMatchSnapshot()

    test 'renders a disabled button', () =>
      component = shallow(
        <Button disabled={true}></Button>
      )

      button = component.find('button').first()
      expect(
        button.props().disabled
      ).toBe(true)

      expect(component).toMatchSnapshot()

  describe 'onClick()', () =>
    test 'successfully calls the onClick handler', () =>
      mockOnClick = jest.fn()
      component = shallow(
        <Button onClick={mockOnClick} />
      )

      component.find('button').simulate('click')
      expect(mockOnClick.mock.calls.length).toEqual(1)
      expect(component).toMatchSnapshot()

    test 'it doesnt call the handler when disabled', () =>
      mockOnClick = jest.fn()
      component = mount(
        <Button disabled={true} onClick={mockOnClick} />
      )

      component.find('button').simulate('click')
      expect(mockOnClick.mock.calls.length).toEqual(0)
      expect(component).toMatchSnapshot()
