class Rack::Attack
  # 10 requests per 10 seconds for a single ip
  throttle('req/ip', limit: 10, period: 10) do |req|
    req.ip
  end

  # response with 429
  self.throttled_response = ->(env) {
    retry_after = (env['rack.attack.match_data'] || {})[:period]
    [
      429,
      {'Content-Type' => 'application/json', 'Retry-After' => retry_after.to_s},
      [{error: "Throttle limit reached. Retry later."}.to_json]
    ]
  }

  # whitelist localhost
  whitelist('allow-localhost') do |req|
  '127.0.0.1' == req.ip || '::1' == req.ip
  end
end
