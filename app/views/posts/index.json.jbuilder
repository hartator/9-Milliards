json.array!(@posts) do |post|
  json.extract! post, :id, :link_url, :title
  json.url post_url(post, format: :json)
end
