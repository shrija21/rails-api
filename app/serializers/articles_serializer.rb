class ArticlesSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :slug
end
