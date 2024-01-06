require 'rails_helper'

RSpec.describe "Articles", type: :request do

  describe "GET #index" do
    it "assigns @articles with valid query" do
      article = Article.create(text: "hello world, how are you?")
      expect(article).to be_valid
    end
  end
end
