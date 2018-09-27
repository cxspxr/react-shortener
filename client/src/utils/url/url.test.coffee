import URL from './url'

describe 'Application URL', ->
  it 'should return localhost', ->
    expect(URL).toBe('http://localhost:8080/api/')
