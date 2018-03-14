require 'rails_helper'

RSpec.describe 'Session Views', type: :view do
  describe 'homepage' do
    it "should show a login link if the user is not logged in" do
      visit '/'
      click_button 'Login'
    end

    it "greets and provides a logout link if the user is logged in" do
      visit '/'
      expect(page.body).to include 'Hi, '
      click_button 'Logout'
    end
  end

  describe 'login' do
    it "allows users to enter their name in a form and click login" do
      visit '/login'
      fill_in 'username', with: 'name'
      click_button 'Login'
      expect(page.body).to include 'name'
    end

    it "does not log in user if they do not enter name, return them to login page" do
      visit '/login'
      fill_in 'username', with: ''
      click_button 'Login'
      response.should redirect_to '/login'
    end
  end
end
