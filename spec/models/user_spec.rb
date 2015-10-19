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

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by(name: @user.name) }

    describe "with valid password" do
      it { expect(@user).to eq found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { expect(@user).not_to eq user_for_invalid_password }
      specify { expect(user_for_invalid_password).to be false }
    end
  end
end
