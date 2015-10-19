require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  before { @user = User.new(name: "testtest", password: 'asdfghjkl', password_confirmation: 'asdfghjkl') }
  subject { @user }

  it { expect(@user).to respond_to(:name) }
  it { expect(@user).to respond_to(:password) }
  it { expect(@user).to respond_to(:password_confirmation) }

  describe "when name is not present" do
    before { @user.name = " " }
    it { expect(@user).to be_invalid }
  end

  describe "when email is not present" do
    before { @user.password = " " }
    it { expect(@user).to be_invalid }
  end

  before { @user = User.new(name: "testtest", password: 'asdfghjkl', password_confirmation: 'asdfghjkl') }
  subject { @user }
  describe "when email address is already taken" do
    before do
      user_with_same_name = @user.dup
      user_with_same_name.save
    end

    it { expect(@user).to be_invalid }
  end
end
