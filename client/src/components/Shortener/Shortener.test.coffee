import React from 'react'
import Shortener from './Shortener'
# import renderer from 'react-test-renderer'
import { shallow } from 'enzyme'
import toJson from 'enzyme-to-json'

describe '<Shortener />', () =>
  describe 'render()', () =>
    test 'renders the component', () =>
      wrapper = shallow(<Shortener />)
      expect(wrapper).toMatchSnapshot()
