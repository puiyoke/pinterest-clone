require 'rails_helper'

RSpec.describe User, type: :feature do
    context 'create user' do
        scenario "should be succesful" do
            visit signup_path
            within ('#signup_form') do
                fill_in 'user[email]', with: 'john@email.com'
                fill_in 'user[password]', with: 'asdf'
            end
            click_button "Submit"
            expect(page).to have_content('User Successfully Created')
        end
    end
end