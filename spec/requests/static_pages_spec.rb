require 'rails_helper'

describe "StaticPages", type: :request do
  before do
    User.create!(name: 'testtest', password: 'asdfghjkl', password_confirmation: 'asdfghjkl')
  end
  describe "GET /login" do
    it "works! (now write some real specs)" do
      visit "/login"
      expect(page).to have_content('login')
      # expect(page).to have_http_status(200)
    end
  end

  describe "GET /" do
    it "works! (now write some real specs)" do
      visit "/login"
      fill_in 'ユーザーID', with: 'testtest'
      fill_in 'パスワード', with: 'asdfghjkl'
      click_on 'Login'

      expect(page).to have_content 'コン'
    end
  end
end
