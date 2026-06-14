class Post < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  has_many :post_editors, dependent: :destroy
  has_many :editors, through: :post_editors, source: :editor

  validates :title, presence: true
  validates :content, presence: true
end
