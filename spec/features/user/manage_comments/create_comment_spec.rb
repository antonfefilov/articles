require 'rails_helper'

feature 'Create comment' do
  let(:user) { create :user, :confirmed }

  let!(:article) { create :article }

  let(:login_page) { Devise::Sessions::New.new }
  let(:edit_user_page) { Devise::Registrations::Edit.new }

  before(:each) do
    login_page.load
    login_page.sign_in(user.email, '123456')

    visit article_path(article)
  end

  scenario 'User creates comment(success)' do
    within 'form#new_comment' do
      fill_in 'Text', with: 'A thousands mile way starts from first step'

      click_button 'Create Comment'
    end

    expect(page).to have_content 'Comment was successfully created.'
    expect(current_path).to eq article_path(article)
  end

  scenario 'User creates comment(fail)' do
    within 'form#new_comment' do
      fill_in 'Text', with: ''

      click_button 'Create Comment'
    end

    expect(page).to have_content "Text can't be blank"
    expect(current_path).to eq article_path(article)
  end
end
