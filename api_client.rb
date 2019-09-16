require 'faraday'
require 'oj'

# client = Faraday.new(url: 'http://localhost:3000') do |config|
#   config.adapter Faraday.default_adapter
# end
#
# response = client.post do |req|
#   req.url '/api/v1/users'
#   req.headers['Content-Type'] = 'application/json'
#   req.body = '{ "user": {"name": "test user"} }'
# end

token = '15547ac3648b53944c963e94cd164087'

client = Faraday.new(url: 'http://localhost:3000') do |config|
  config.adapter  Faraday.default_adapter
  config.token_auth(token)
end
 
# response = client.post do |req|
#   req.url '/api/v1/posts'
#   req.headers['Content-Type'] = 'application/json'
#   req.body = '{ "post": {"title": "Title", "body": "Text"} }'
# end

post_id = 7

response = client.delete do |req|
  req.url "/api/v1/posts/#{post_id}"
  req.headers['Content-Type'] = 'application/json'
end

puts Oj.load(response.body)
puts response.status