class Article < ApplicationRecord
  validates :title, :body, presence: true #makes it where you cant submit something blank

  belongs_to :user

  def long_title
    "#{title} - #{published_at}"
  end
end
