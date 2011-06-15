require 'spec_helper'

describe "Relationships" do

  before(:each) do
    user = Factory(:user)
    @followed = Factory(:user, :email => Factory.next(:email))
    visit signin_path
    fill_in :email,    :with => user.email
    fill_in :password, :with => user.password
    click_button
  end

  it "should follow user" do
    lambda do
      visit user_path(@followed)
      click_button
    end.should change(Relationship, :count).by(1)
  end
  
  it "should unfollow user" do
    visit user_path(@followed)
    click_button
    lambda do
      visit user_path(@followed)
      click_button
    end.should change(Relationship, :count).by(-1)
  end

end

