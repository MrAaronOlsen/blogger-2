class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update]

  def index
    @blogs = Blog.all
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      flash.notice = "You Created Blog '#{@blog.title}''"
      redirect_to blog_path(@blog)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      flash.notice = "You Update Blog '#{@blog.title}''"
      redirect_to blog_path(@blog)
    else
      flash.notice = 'Error'
      render :edit
    end
  end

end

private

  def blog_params
    params.require(:blog).permit(:title, :body)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end