import React from 'react'
import Copier from './Copier'
# import renderer from 'react-test-renderer'
import { shallow } from 'enzyme'
import toJson from 'enzyme-to-json'

describe '<Copier />', () =>

  describe 'render()', () =>
    test 'renders with a text', () =>
      component = shallow(
        <Copier/>
          "abc"
        <Copier/>
      )

      expect(component).toMatchSnapshot()

    test 'renders with an elements', () =>
      component = shallow(
        <Copier/>
          <div>
            <span></span>
          </div>
        <Copier/>
      )

      expect(component).toMatchSnapshot()
