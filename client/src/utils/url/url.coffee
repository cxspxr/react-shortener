env = process.env.APP_URL

url = if env
    env
  else
    'http://localhost:8080/api'

export default url
