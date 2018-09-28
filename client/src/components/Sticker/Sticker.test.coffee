import React from 'react'
import Sticker from './Sticker'
# import renderer from 'react-test-renderer'
import { shallow } from 'enzyme'
import toJson from 'enzyme-to-json'

describe '<Sticker />', () =>

  describe 'render()', () =>
    component = {}
    beforeEach () =>
      component = shallow(
        <Sticker />
      )

    test 'renders component', () =>
      expect(component).toMatchSnapshot()

    test 'has an img element', () =>
      expect(
        component.containsMatchingElement(
          <img />
        )
      ).toBe(true)
