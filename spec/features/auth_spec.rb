require 'rails_helper'
require "spec_helper"

feature "the signup process" do
  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "Sign Up!"
  end

  scenario "shows username on the homepage after signup" do
    sign_up_as('sparky')
    expect(page).to have_content "Welcome sparky"
  end
end

feature "logging in" do
  given(:sparky) { FactoryBot.create(:user_s) }

  scenario "shows username on the homepage after login" do
    login_as(sparky)
    expect(page).to have_content "Welcome sparky"
  end
end

feature "logging out" do
  given!(:sparky) { FactoryBot.create(:user_s) }

  scenario "begins with logged out state" do
    visit root_url
    expect(page).to have_content "Log In"
  end

  scenario "doesn't show username on the homepage after logout" do
    login_as(sparky)
    click_button "Log Out"
    expect(page).not_to have_content "sparky"
  end
end
