class Post < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { in: 4..100 }
  validates :title, uniqueness: true
  validates :content, presence: true, length: { minimum: 5, maximum: 4000 }
end