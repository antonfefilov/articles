class ArticlesController < ApplicationController
  respond_to :html

  expose(:article, attributes: :article_params)
  expose(:articles) { Article.page(params[:page]) }

  def create
    authorize article

    article.user = current_user
    flash[:notice] = 'Article was successfully created.' if article.save
    respond_with(article, location: root_path)
  end

  def update
    authorize article

    flash[:notice] = 'Article was successfully updated.' if article.save
    respond_with(article, location: root_path)
  end

  def destroy
    authorize article

    article.destroy
    respond_with(article)
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
