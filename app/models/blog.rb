class Blog < ApplicationRecord
  has_many :comments

  validates :title, :body, presence: true

  before_destroy :destroy_comments

  def destroy_comments
    Comment.where("blog_id = ?", id).destroy_all
  end

end
