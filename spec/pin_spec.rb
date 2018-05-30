require 'rails_helper'

RSpec.describe Pin, type: :model do
    let(:title)		{ 'Test Pin' }
	let(:image)	{ 'default_avatar.png' }

	context "validation: " do
        it { is_expected.to belong_to(:user) }
        it { is_expected.to validate_presence_of(:title) }
        it { is_expected.to validate_presence_of(:image) }
        
	end

	context "create: " do
		it "takes in a title & image " do
			expect{ Pin.create(title: title, image: image) }.not_to raise_error
		end
	
		it "won't create a pin if title is not given" do
			@pin = Pin.create(title: nil, image: image)
			expect(@pin).to_not be_valid
        end
        
        it "won't create a pin if image is not given" do
			@pin = Pin.create(title: title, image: nil)
			expect(@pin).to_not be_valid
		end

	end
end