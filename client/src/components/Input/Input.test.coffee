import React from 'react'
import Input from './Input'
# import renderer from 'react-test-renderer'
import { shallow } from 'enzyme'
import toJson from 'enzyme-to-json'

describe '<Input />', () =>

  describe 'render()', () =>
    component = {}
    beforeEach () =>
      component = shallow(
        <Input />
      )

    test 'renders component', () =>
      expect(component).toMatchSnapshot()

    test 'contains input element', () =>
      expect(
        component.containsMatchingElement(
          <input />
        )
      ).toBe(true)

    test 'contains span (highlighting) element', () =>
      expect(
        component.containsMatchingElement(
          <span></span>
        )
      ).toBe(true)

  describe 'onChange()', () =>

    test 'successfully calls the onChange handler', () =>
      mockOnChange = jest.fn()
      component = shallow(
        <Input onChange={mockOnChange} />
      )

      component.find('input').simulate('change')
      expect(mockOnChange.mock.calls.length).toEqual(1)
      expect(component).toMatchSnapshot()
