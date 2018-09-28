import React from 'react'
import Sticker from './Sticker'
# import renderer from 'react-test-renderer'
import { shallow } from 'enzyme'
import toJson from 'enzyme-to-json'

describe '<Sticker />', () =>

  describe 'render()', () =>
    test 'renders component', () =>
      component = shallow(
        <Sticker />
      )

      expect(component).toMatchSnapshot()
