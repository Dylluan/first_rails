require 'rails_helper'

describe Picattachment do
  let(:user) { FactoryGirl.create(:user) }
  before do 
  	@micropost = user.microposts.build(content: "Lorem ipsum") 
  	@picattachment = @micropost.picattachments.build(picture: File.open("001.jpg"))
  end
	subject { @picattachment}
	it { should respond_to(:picture) }
	it { should respond_to(:micropost_id) }
	it { should respond_to(:micropost) }

	# describe "when user_id is not present" do
	# 	before { @picattachment.micropost_id = nil }
	# 	it { should_not be_valid }
	# end

end