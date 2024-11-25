require 'digest'

class User < ApplicationRecord
  attr_accessor :password

  validates :email, uniqueness: true
  validates :email, length: { in: 5..50 }
  validates :email, format: { with: /\A[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}\z/i }
  validates :password, confirmation: true, if: :password_required?
  validates :password, length: { in: 4..20 }, if: :password_required?
  validates :password, presence: true, if: :password_required?

  has_one :profile
  has_many :articles, -> {
                        order 'published_at DESC, title ASC'
                      }, dependent: :nullify # makes it where the newset published articles for that user will be at the top and not the bottom. if the user is deleted the articles that belong to the user willbe destroyied aswell. you can set it yo :nullify if you want the articlesto remain but without a publisher
  has_many :replies, through: :articles, source: :comments

  before_save :encrypt_new_password

  def self.authenticate(email, password)
    user = find_by email: email
    return user if user && user.authenticated?(password)
  end

  def authenticated?(password)
    self.hashed_password == encrypt(password)
  end

  protected

  def encrypt_new_password
    return if password.blank?

    self.hashed_password = encrypt(password)
  end

  def password_required?
    hashed_password.blank? || password.present?
  end

  def encrypt(string)
    Digest::SHA1.hexdigest(string)
  end
end
