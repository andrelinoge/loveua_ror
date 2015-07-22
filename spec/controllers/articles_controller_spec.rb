require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  describe "GET #index" do
    it "returns http success and renders template" do
      get :index
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "returns http success and renders template" do
      article = FactoryGirl.create(:article)

      get :show, {id: article.id}
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
    end
  end

end
