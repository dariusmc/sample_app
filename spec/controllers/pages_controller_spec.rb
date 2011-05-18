require 'spec_helper'

describe PagesController do
  render_views

  before (:each) do
    @base_title = "Ruby on Rails Tutorial Sample App";
  end

  describe "GET 'home'" do

    it "should be successful" do
      get 'home'
      response.should be_success
    end

    it "should have the right title" do
      get 'home'
      response.should have_selector("title",
                                    :content => @base_title + " | Home")
    end

    describe "Microposts pluralization in sidebar" do

      before(:each) do
        @user = Factory(:user)
        test_sign_in(@user)
        @micropost = Factory(:micropost, :user => @user)
      end

      it "should be singular for 1 micropost" do
        get 'home'
        response.should_not have_selector(".microposts",
                                          :content => "microposts")
      end

      it "should be plural for 2 micropost" do
        @micropost = Factory(:micropost, :user => @user)
        get 'home'
        response.should have_selector(".microposts",
                                      :content => "microposts")
      end
    end

  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end
    it "should have the right title" do
      get 'contact'
      response.should have_selector("title",
                                    :content => @base_title + " | Contact")
    end
  end

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
    it "should have the right title" do
      get 'about'
      response.should have_selector("title",
                                    :content => @base_title + " | About")
    end
  end

  describe "GET 'help'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
    it "should have the right title" do
      get 'help'
      response.should have_selector("title",
                                    :content => @base_title + " | Help")
    end
  end

end
