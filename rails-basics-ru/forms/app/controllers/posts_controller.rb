# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def create
    @post = Post.new(get_post_params)

    if @post.save
      flash[:success] = 'New post was successfully created'

      redirect_to post_path(@post)
    else
      flash[:failure] = 'Task cannot be created'

      render :new, status: :unprocessable_entity
    end
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(get_post_params)
      flash[:success] = 'Post was successfully updated'

      redirect_to post_path(@post)
    else
      flash[:failure] = 'Post cannot be updated'
      render :edit
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])

    if @post.destroy
      flash[:success] = 'Post was successfully deleted'

      redirect_to posts_path
    else
      flash[:failure] = 'Post cannot be deleted'
      redirect_to post_path(@post)
    end
  end

  private

  def get_post_params
    params.required(:post).permit(:title, :body, :summary, :published)
  end
end
