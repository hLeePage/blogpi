class PostsController < ApplicationController
  def index
    render json: Post.all
  end

  def show
    post = Post.find(params[:id])
    render json: post
  end

  def create
    post = Post.new(post_params)
    if post.save
      render json: post, status: :created
    else
      render json: post.errors, status: :bad_request
    end
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      render json: post
    else
      render json: post.errors, status: :bad_request
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.destroy
      render json: "", status: :no_content
    else
      render json: "", status: :bad_request
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
