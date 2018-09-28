import URL from '../utils/url/url'

API = {}

for route in ['get', 'count', 'store']
  API[route] = "#{URL}/links/#{route}"

export default API
