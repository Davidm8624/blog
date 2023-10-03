class Article < ApplicationRecord
  validates :title, :body, presence: true #makes it where you cant submit something blank

  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :comments

  def long_title
    "#{title} - #{published_at}"
  end
end
