import React from 'react'
import Shortener from './Shortener'
# import renderer from 'react-test-renderer'
import { shallow, mount } from 'enzyme'
import toJson from 'enzyme-to-json'
import Sticker from '../Sticker/Sticker'

describe '<Shortener />', () =>
  describe 'render()', () =>
    wrapper = {}
    beforeEach () =>
      wrapper = mount(<Shortener />)

    test 'renders the component', () =>
      expect(wrapper).toMatchSnapshot()
