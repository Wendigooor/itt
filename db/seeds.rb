
require "net/http"

routes = Rails.application.routes.url_helpers

ips_list = []
50.times do
  ips_list << FFaker::Internet.ip_v4_address
end

authors_list = []
100.times do
  authors_list << FFaker::Internet.user_name
end

200000.times do
  params = {
    title: FFaker::Food.fruit,
    body: FFaker::Food.meat,
    login: authors_list.sample,
    ip: ips_list.sample
  }

  uri = URI.parse(routes.v1_posts_url)
  Net::HTTP.post_form(uri, params)
end

100000.times do
  params = {
    mark: rand(1..10)
  }

  uri = URI.parse(routes.v1_post_ratings_url(post_id: rand(1..100000)))
  Net::HTTP.post_form(uri, params)
end

