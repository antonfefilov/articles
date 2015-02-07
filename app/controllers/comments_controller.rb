class CommentsController < ApplicationController
  respond_to :html

  expose(:article)
  expose(:comment, attributes: :comment_params)
  expose(:comments, ancestor: :article)

  def create
    authorize comment

    if comment.save
      flash[:notice] = 'Comment was successfully created.'
    else
      flash[:alert] = comment.errors.full_messages.first
    end

    redirect_to comment.article
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
