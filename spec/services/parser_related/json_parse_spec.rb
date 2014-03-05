require 'spec_helper'
require "#{Rails.root}/app/services/parser_related/json_parse.rb"

describe JsonParse do
  subject { JsonParse.new json }

  let( :json ) do
    "{\"version\":\"50528562590004_7f56212ac_en_2_1\"}"
  end
  let( :parse_result ) do
    { "version" => "50528562590004_7f56212ac_en_2_1" }
  end

  describe "#initialize" do
    context "when a valid json is inputted" do 
      it "returns a hash parsed from the json arguments" do 
        subject.should eq parse_result
      end 
    end

    context "when an invalid json in inputted" do
      let( :json ) { double }

      it "raises an UnprocessableJsonError error" do
        expect{ subject }.to raise_error( UnprocessableJsonError )
      end
    end
  end
end