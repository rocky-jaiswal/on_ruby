require 'spec_helper'

describe SitemapsHelper do
  let(:sitemap_urls) { ["http://hamburg.test.host/events/tesssstooo", "http://hamburg.test.host/locations/blau-mobilfunk-gmbh", "http://hamburg.test.host/"] }

  it "returns the right urls" do
    location = create(:location, name: 'blau mobilfunk gmbh')
    create(:event, name: 'tesssstooo', label: 'hamburg', location: location)
    helper.urls.should eql(sitemap_urls)
  end
end
