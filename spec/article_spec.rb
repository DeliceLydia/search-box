require './controllers/articles_controller'

describe ArticleController do
  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end

    it "renders partial with Turbo Frame request" do
      allow(controller).to receive(:turbo_frame_request?).and_return(true)
      
      get :index
      expect(response).to render_template(partial: "articles")
    end

    it "assigns @articles with valid query" do
      article = create(:article, text: "Sample article text")

      get :index, params: { query: "Sample article" }
      expect(assigns(:articles)).to eq([article])
    end

    it "assigns empty @articles with short query" do
      get :index, params: { query: "short" }
      expect(assigns(:articles)).to eq([])
    end
  end
 
end