require 'spec_helper'

describe User do
  before { @user = User.new name: "Youssef Kababe", email: "youssef@gmail.com" }
  subject { @user }

  it { should respond_to :name }
  it { should respond_to :email }
  it { should be_valid }

  describe "when name is not present" do
  	before { @user.name = '' }
  	it { should_not be_valid }
  end

  describe "when email is not present" do
  	before { @user.email = '' }
  	it { should_not be_valid }
  end

  describe "name should contain more that 4 characters" do
    before { @user.name = 'aaa' }
    it { should_not be_valid }
  end

  describe "name should not be longer than 51 characters" do
    before { @user.name = 'a' * 51 }
    it { should_not be_valid }
  end

  describe "when email format in invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com uset_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+bar.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end

  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email.upcase!
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "email should be downcased before saving" do
    it "should be valid" do
      @user.email = "ABcD@Example.Com"
      @user.save
      expect(@user.email).to eq("abcd@example.com")
    end
  end
end
