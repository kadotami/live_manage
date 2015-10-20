require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  before { @user = User.new(name: "testtest", password: 'asdfghjkl', password_confirmation: 'asdfghjkl') }
  subject { @user }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:password) }
  it { is_expected.to respond_to(:password_confirmation) }

  describe "when name is not present" do
    before { @user.name = " " }
    it { is_expected.to be_invalid }
  end

  describe "when email is not present" do
    before { @user.password = " " }
    it { is_expected.to be_invalid }
  end

  before { @user = User.new(name: "testtest", password: 'asdfghjkl', password_confirmation: 'asdfghjkl') }
  subject { @user }
  describe "when email address is already taken" do
    before do
      user_with_same_name = @user.dup
      user_with_same_name.save
    end

    it { is_expected.to be_invalid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by(name: @user.name) }

    describe "with valid password" do
      it { is_expected.to eq found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { is_expected.not_to eq user_for_invalid_password }
      specify { expect(user_for_invalid_password).to be false }
    end
  end
end
