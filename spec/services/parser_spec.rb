require 'spec_helper'

describe Parser do 
  describe "#parse_from_url" do
    subject { Parser.new format }
    let( :parse_result ) { double }
    let( :uri          ) { double }
    let( :format       ) { double } 

    context "when a valid url is inputted" do
      let( :url    ) { 'http://www.betvictor.com/live/en/live/list.json' }
      let( :format ) { :json  }
      let( :parse_instance ) { double }

      let( :get_response ) do
        "{\"version\":\"50528562590004_7f56212ac_en_2_1\"}"
      end
      let( :parse_result ) do
        { "version" => "50528562590004_7f56212ac_en_2_1" }
      end

      before do 
        stub_const "JsonParse", double
        JsonParse.should_receive( :new ).with( get_response ).and_return( parse_result )
      end

      it "returns a parsed result in function of the parser format" do
        Net::HTTP.should_receive( :get ).with( kind_of URI ).and_return get_response
        subject.parse_from_url( url ).should eq parse_result
      end
    end

    context "when an invalid url is inputted" do
      let( :url ) { 'aaa' }

      it "should raise an error" do
        expect{ subject.parse_from_url( url ) }.to raise_error( URI::BadURIError )
      end
    end
    
  end
end