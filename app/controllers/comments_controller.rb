class CommentsController < ApplicationController
  respond_to :html

  expose(:article)
  expose(:comment, attributes: :comment_params)
  expose(:comments, ancestor: :article)

  def create
    comment.user = current_user if current_user.present?
    flash[:notice] = 'Comment was successfully created.' if comment.save
    respond_with(comment, location: article_path(comment.article))
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
