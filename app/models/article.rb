class Article < ApplicationRecord
  validates :title, :body, presence: true # makes it where you cant submit something blank

  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :comments

  scope :published, -> { where.not(published_at: nil) }
  scope :draft, -> { where(published_at: nil) }
  scope :recent, -> { where('articles.published_at > ?', 1.week.ago.to_date) }
  scope :where_title, ->(term) { where('articles.title LIKE ?', '%#{term}%') }

  def long_title
    "#{title} - #{published_at}"
  end

  def published?
    published_at.present?
  end
end
