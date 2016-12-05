class Url < ActiveRecord::Base

		URL_REGEX = /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix

    validates :long_url, :presence => true, :format => {:with => URL_REGEX} 
    validates :short_url, :presence => true


    def self.retrieve_short_url(long_url)
    	url = find_by(:long_url => long_url)
    	url.short_url if url 
    end
end
