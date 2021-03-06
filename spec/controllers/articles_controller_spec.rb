require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Article. As you add validations to Article, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ArticlesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all articles as @articles" do
      article = Article.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:articles)).to eq([article])
    end
  end

  describe "GET #show" do
    it "assigns the requested article as @article" do
      article = Article.create! valid_attributes
      get :show, params: {id: article.to_param}, session: valid_session
      expect(assigns(:article)).to eq(article)
    end
  end

  describe "GET #new" do
    before { sign_in }
    it "assigns a new article as @article" do
      get :new, params: {}, session: valid_session
      expect(assigns(:article)).to be_a_new(Article)
    end
  end

  describe "GET #edit" do
    before { sign_in }
    it "assigns the requested article as @article" do
      article = Article.create! valid_attributes
      get :edit, params: {id: article.to_param}, session: valid_session
      expect(assigns(:article)).to eq(article)
    end
  end

  describe "POST #create" do
    before { sign_in }
    context "with valid params" do
      it "creates a new Article" do
        expect {
          post :create, params: {article: valid_attributes}, session: valid_session
        }.to change(Article, :count).by(1)
      end

      it "assigns a newly created article as @article" do
        post :create, params: {article: valid_attributes}, session: valid_session
        expect(assigns(:article)).to be_a(Article)
        expect(assigns(:article)).to be_persisted
      end

      it "redirects to the created article" do
        post :create, params: {article: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Article.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved article as @article" do
        post :create, params: {article: invalid_attributes}, session: valid_session
        expect(assigns(:article)).to be_a_new(Article)
      end

      it "re-renders the 'new' template" do
        post :create, params: {article: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    before { sign_in }
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested article" do
        article = Article.create! valid_attributes
        put :update, params: {id: article.to_param, article: new_attributes}, session: valid_session
        article.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested article as @article" do
        article = Article.create! valid_attributes
        put :update, params: {id: article.to_param, article: valid_attributes}, session: valid_session
        expect(assigns(:article)).to eq(article)
      end

      it "redirects to the article" do
        article = Article.create! valid_attributes
        put :update, params: {id: article.to_param, article: valid_attributes}, session: valid_session
        expect(response).to redirect_to(article)
      end
    end

    context "with invalid params" do
      it "assigns the article as @article" do
        article = Article.create! valid_attributes
        put :update, params: {id: article.to_param, article: invalid_attributes}, session: valid_session
        expect(assigns(:article)).to eq(article)
      end

      it "re-renders the 'edit' template" do
        article = Article.create! valid_attributes
        put :update, params: {id: article.to_param, article: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    before { sign_in }
    it "destroys the requested article" do
      article = Article.create! valid_attributes
      expect {
        delete :destroy, params: {id: article.to_param}, session: valid_session
      }.to change(Article, :count).by(-1)
    end

    it "redirects to the articles list" do
      article = Article.create! valid_attributes
      delete :destroy, params: {id: article.to_param}, session: valid_session
      expect(response).to redirect_to(articles_url)
    end
  end

end
