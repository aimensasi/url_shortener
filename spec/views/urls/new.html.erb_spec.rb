require 'rails_helper'

RSpec.describe "urls/new.html.erb", type: :feature do
  
	let(:long_url) {'https://www.google.com/'}
	let(:invalid_url) {'google'}

	before(:each) do 
		visit new_url_path
	end

	describe "visit #new" do
	  it "is able to visit the new page" do
	    visit new_url_path
	  end
	end 

  describe "Fill And Submit The Form" do 
  	it "should fill in url" do 
  		fill_in('Long Url', :with => long_url)
  	end

  	it "Submit The form" do 
  		click_button "Shorten"
  	end
  end

  describe "displaying info on success or failure" do 
  	context "On Success" do 
  		it "Should redirect to index" do 
  			fill_in('Long Url', :with => long_url)
  			click_button "Shorten"
  			current_path.should == urls_path
  		end
  	end
  	context "On Failure" do 
  		it "Should display error message" do 
  			fill_in('Long Url', :with => invalid_url)
  			click_button "Shorten"
  			page.should have_css('div.error') 
  		end
  	end
  end

end
