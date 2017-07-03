class Article < ActiveRecord::Base
  belongs_to :user
  #section7 lecture 144---
  has_many :article_categories #because the many side
  has_many :categories, through: :article_categories
  #section7 lecture 144---
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  validates :user_id, presence: true
end