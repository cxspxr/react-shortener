import React from 'react'
import Input from './Input'
# import renderer from 'react-test-renderer'
import { shallow } from 'enzyme'
import toJson from 'enzyme-to-json'

describe '<Input />', () =>

  describe 'render()', () =>
    test 'renders component', () =>
      component = shallow(
        <Input />
      )

      expect(component).toMatchSnapshot()

  describe 'onChange()', () =>

    test 'successfully calls the onChange handler', () =>
      mockOnChange = jest.fn()
      component = shallow(
        <Input onChange={mockOnChange} />
      )

      component.find('input').simulate('change')
      expect(mockOnChange.mock.calls.length).toEqual(1)
      expect(component).toMatchSnapshot()
