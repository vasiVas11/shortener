require "spec_helper"

describe Shorter do

  it "can be instantiated" do
    Shorter.new.should be_an_instance_of(Shorter)
  end

  it "can be saved successfully" do

    Shorter.create(:url => "http://www.youtube.com/watch?v=oWYp1xRPH5g", :identifier =>"1asdasdasd3334")
    expect(Shorter.where(:identifier => "1asdasdasd3334", :url =>  "http://www.youtube.com/watch?v=oWYp1xRPH5g")).to exist

  end

end