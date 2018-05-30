require 'rails_helper'

RSpec.describe User, type: :model do
    let(:email)		{ 'test@email.com' }
	let(:password)	{ SecureRandom.base64[0..8] }

	context "validation: " do
		it { is_expected.to validate_presence_of(:email) }
		it { is_expected.to validate_presence_of(:password) }
	end

	context "initialize: " do
		it "takes in a valid email & password" do
			expect{ User.create(email: email, password: password) }.not_to raise_error
		end
	
		it "won't create an user if password is not given" do
			@user = User.create(email: email, password: nil)
			expect(@user).to_not be_valid
		end

		it "won't create an user if email is not given" do
			@user = User.create(email: nil, password: password)
			expect(@user).to_not be_valid
		end
	end
end