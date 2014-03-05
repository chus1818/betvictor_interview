require 'spec_helper'

describe String do 
  describe "#to_uri" do 
    context "when includes an http" do 
      subject { "http://google.com"}

      it "should return and URI object" do
        subject.to_uri.class.should eq URI::HTTP
      end

      it "should return an object which recovers the string when asked for to_s" do
        subject.to_uri.to_s.should eq subject
      end
    end

    context "when includes an https" do
      subject { "https://google.com"}

      it "should return and URI object" do
        subject.to_uri.class.should eq URI::HTTPS
      end

      it "should return an object which recovers the string when asked for to_s" do
        subject.to_uri.to_s.should eq subject
      end
    end

    context "when do not include an http or https protocol" do
      subject { "aaaaa" }

      it "should raise a bad URI error" do
        expect{ subject.to_uri }.to raise_error( URI::BadURIError )
      end
    end

  end
end