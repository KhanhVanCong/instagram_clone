class CommentsController < ApplicationController
  before_action :set_post, only: :create
  def create
    @comment = @post.comments.create(user: current_user, body: params[:comment_body])

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "post#{@post.id}comments",
          partial: "posts/post_comments",
          locals: { post: @post }
        )
      end
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    if @comment
      @comment.destroy
      @post = @comment.post
      respond_to do |format|
        format.turbo_stream
      end
    end


  end

  private

    def set_post
      @post = Post.find_by(params[:post_id])
    end
end