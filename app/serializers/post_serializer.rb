class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :created_at, :image
end
