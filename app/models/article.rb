class Article < ApplicationRecord
  validates :title, :body, presence: true #makes it where you cant submit something blank
end
