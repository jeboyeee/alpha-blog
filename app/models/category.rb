class Category < ActiveRecord::Base
  #section7 lecture 144---
  has_many :article_categories
  has_many :articles, through: :article_categories
  #section7 lecture 144---
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :name
  
end