class User < ApplicationRecord
  has_one :profile
  has_many :articles, -> {order 'published_at DESC, title ASC'}, dependent: :nullify          #makes it where the newset publiched articles for that user will be at the top and not the bottom. if the user is deleted the articles that belong to the user willbe destroyied aswell. you can set it yo :nullify if you want the articlesto remain but without a publisher
  has_many :replies, through: :articles, source: :comments
end

