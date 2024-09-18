class Api::V1::CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :authorise_user!, only: [:update, :destroy]
  # GET /comments
  def index
    @comments = Comment.all
    render json: @comments
  end

  # GET /comments/:id
  def show
    @comment
    render json: @comment
  end

  # COMMENT /comments
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/:id
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/:id
  def destroy
    @comment.destroy
  end
  
  def search_title
    @comments = Comment.where("title LIKE ?", "%#{params[:title]}%")
    render json: @comments
  end
  
  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:title, :content)
  end#

  def authorise_user!
    unless @comment.user_id == current_user.id
      render json: { error: 'You are not authorized to perform this action' }, status: :unauthorized
    end
  end

end
