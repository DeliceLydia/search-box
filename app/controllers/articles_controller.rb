class ArticlesController < ApplicationController
  def index
    if params[:query].present?
      @articles = Article.where("name LIKE ?", "%#{params[:query]}%")
    else
      @articles = Article.all
    end
  end
end
