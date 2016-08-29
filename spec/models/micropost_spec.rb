require 'rails_helper'

describe Micropost do

	let(:user) { FactoryGirl.create(:user) }
	before { @micropost = user.microposts.build(content: "Lorem ipsum") }

	subject { @micropost }

	it { should respond_to(:content) }
	it { should respond_to(:user_id) }
	it { should respond_to(:user) }
	it { expect(@micropost.user).to eq user}
	it { should be_valid }

	describe "when user_id is not present" do
		before { @micropost.user_id = nil }
		it { should_not be_valid }
	end

	describe "with blank content" do
		before { @micropost.content = " " }
		it { should_not be_valid }
	end
	let!(:picattachement) do
		FactoryGirl.create(:picattachment,micropost: @micropost)
	end
	describe "with blank content and not blank attachment" do

		before { @micropost.content = " " }
		 it "should be_valid" #{ should be_valid }

	end



	describe "with content that is too long" do
		before { @micropost.content = "a" * 141 }
		it { should_not be_valid }
	end


    

    it "should destroy associated picattachments" do
      picattachments = @micropost.picattachments.to_a
      @micropost.destroy
      
      expect(picattachments).not_to be_empty
      
      picattachments.each do |picattachment|
        expect(Picattachment.where(id:picattachment.id)).to be_empty
      end
    end


end