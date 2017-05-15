class Comment < ApplicationRecord
  validates :author_name, :body, presence: true
  
  belongs_to :blog
end
