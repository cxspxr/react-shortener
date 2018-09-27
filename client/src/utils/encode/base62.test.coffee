import base62 from './base62'

describe 'base62 hashing', ->

  describe 'when number isnt positive', ->
    it 'hashes correclty', ->
      expect(base62(0)).toBe '0'
      expect(base62(1)).toBe '1'
      expect(base62(10)).toBe 'a'
      expect(base62(23)).toBe 'n'
      expect(base62(62)).toBe '10'

  describe 'when number is negative', ->
    it 'returns empty string', ->
      expect(base62(-1)).toBe ''
      expect(base62(-389)).toBe ''
