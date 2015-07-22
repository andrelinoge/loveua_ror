class ArticlesController < ApplicationController
  def index
  	@articles = Article.page(params[:page]).decorate
  end

  def show
  	@article = Article.find(params[:id])
  end
end
