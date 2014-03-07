require 'spec_helper'

describe Sport do
  subject { Sport }

  describe "#self.all" do 
    let( :sports_array ) { [ sport_1, sport_2 ] }
    let( :sport_1 ) { { "id" => 1, "title" => "a title"   } }
    let( :sport_2 ) { { "id" => 2, "title" => "a title 2" } }

    it "returns all the sports from Betvictor" do
      Betvictor.any_instance.should_receive( :sports ).and_return sports_array
      subject.all
    end
  end

  describe "#self.find" do
    let( :id ) { 1 }

    it "returns an sport from Betvictor matching the given id" do
      Betvictor.any_instance.should_receive( :find ).with :sport, id
      subject.find id
    end
  end
end 