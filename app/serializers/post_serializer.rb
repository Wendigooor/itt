class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :ip, :average_ratio
end
