require 'rails_helper'

RSpec.describe Board, type: :model do
    let(:title)		{ 'Test Board' }
	let(:description)	{ 'Board number 1' }

	context "validation: " do
        it { is_expected.to belong_to(:user) }
        it { is_expected.to validate_presence_of(:title) }
        
	end

	context "initialize: " do
		it "takes in a valid title " do
			expect{ Board.create(title: title) }.not_to raise_error
		end
	
		it "won't create a board if title is not given" do
			@board = Board.create(title: nil)
			expect(@board).to_not be_valid
		end

	end
end