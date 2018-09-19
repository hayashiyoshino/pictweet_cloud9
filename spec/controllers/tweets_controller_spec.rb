require 'rails_helper'

describe TweetsController do
  describe 'GET #new' do
    it "renders the :new template" do
    end 
  end 
  
  describe 'GET #edit' do
    it "assigns the requested tweet to @tweet" do
      tweet = create(:tweet)
      get :edit, id: tweet
      expect(assigns(:tweet)).to eq tweet
      #assignメソッドはコントローラーのテストじ、アクションで定義しているインスタンス変数をテストするためのメソッド。
      #引数に直前でリクエストしたアクション内で定義されているインスタンス変数をシンボル型でとる。
      #通常はexpectメソッドの引数として利用する。
    end 
    it "renders the :edit template" do
      tweet = create(:tweet)
      get :edit, id: tweet
      expect(response).to render_template :edit
      #リクエストした後にexpectメソッドにresponseを渡し、render_templateマッチャを利用する。
      #editアクションの場合、リクエストの際idの値が必要。そのためレコードも作成している。
    end 
  end
  
  describe 'GET #index' do
    it "populates an array of tweets orderd by created_at DESC" do
      tweets = create_list(:tweet, 3)
      get :index
      expect(assigns(:tweets)).to match(tweets.sort{ |a, b| b.created_at <=> a.created_at })
    end
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end 
  end 
  

end