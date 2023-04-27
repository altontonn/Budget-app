require 'rails_helper'
require 'factory_bot_rails'
# require_relative '../factories/users'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end
RSpec.feature 'User authentication', type: :feature do
  let(:user) { create(:user) }
  scenario 'User registration' do
    visit new_user_registration_path
    fill_in 'Email', with: 'altontonnalumasa@gmail.com'
    fill_in 'Name', with: 'Newton'
    fill_in 'Password', with: 123_456
    fill_in 'Password confirmation', with: 123_456
    click_button 'Sign up'

    expect(page).to have_content 'Welcome! You have signed up successfully.'
    # expect(page).to have_current_path(root_path)
  end

  scenario 'User logs in' do
    create(:user, email: 'altontonnalumasa@gmail.com', password: 123_456)
    visit new_user_session_path
    fill_in 'Email', with: 'altontonnalumasa@gmail.com'
    fill_in 'Password', with: 123_456
    click_button 'Log in'

    expect(page).to have_content 'Signed in successfully.'
    # expect(page).to have_current_path(root_path)
  end
end
