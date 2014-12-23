require 'rails_helper'

feature 'Create article' do
  let(:user) { create :user, :confirmed }

  let(:login_page) { Devise::Sessions::New.new }
  let(:edit_user_page) { Devise::Registrations::Edit.new }

  before(:each) do
    login_page.load
    login_page.sign_in(user.email, '123456')
  end

  scenario 'User creates article' do
    visit root_path

    click_link 'New Article'

    within 'form#new_article' do
      fill_in 'Title', with: 'First article'
      fill_in 'Text', with: 'A thousands mile way starts from first step'

      click_button 'Create Article'
    end

    expect(page).to have_content 'Article was successfully created.'
    expect(current_path).to eq(root_path)
  end
end
