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
    query = params[:query].to_s.strip
    if query.length >= 18
      Article.where("text LIKE ?", "%#{params[:query]}%") 
    else 
      Article.none
    end
  end
end
