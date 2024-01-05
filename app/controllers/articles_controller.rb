class ArticlesController < ApplicationController
  def index
    @articles = search_articles
    if turbo_frame_request? 
      render partial: "articles", locals: { articles: @articles } 
    else 
      render :index 
    end
  end

  private 
  
  def search_articles 
    if params[:query].present? 
      Article.where("text LIKE ?", "%#{params[:query]}%") 
    else 
      Article.all 
    end
  end
end
