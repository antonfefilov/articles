require 'rails_helper'

feature 'Edit article' do
  let(:user) { create :user, :confirmed }

  let!(:article) { create :article }

  let(:login_page) { Devise::Sessions::New.new }
  let(:edit_user_page) { Devise::Registrations::Edit.new }

  before(:each) do
    login_page.load
    login_page.sign_in(user.email, '123456')

    visit root_path

    click_link 'Edit'
  end

  scenario 'User edits article(success)' do
    within 'form' do
      fill_in 'Title', with: 'First article'
      fill_in 'Text', with: 'A thousands mile way starts from first step'

      click_button 'Update Article'
    end

    expect(page).to have_content 'Article was successfully updated.'
    expect(current_path).to eq(root_path)
  end

  scenario 'User edits article(fail)' do
    within 'form' do
      fill_in 'Title', with: ''
      fill_in 'Text', with: ''

      click_button 'Update Article'
    end

    expect(page).to have_content "Titlecan't be blank"
    expect(page).to have_content "Textcan't be blank"
    expect(current_path).to eq(article_path(article))
  end
end
