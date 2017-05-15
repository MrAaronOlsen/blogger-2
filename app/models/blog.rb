class Blog < ApplicationRecord
  has_many :comments
  
  validates :title, :body, presence: true
end
