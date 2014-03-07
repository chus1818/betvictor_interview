require 'spec_helper'

describe Betvictor do 
  let( :parsed_source ) do
    {
      'version' => '1',
      'sports'  => sports
    }
  end

  let( :sport_1 ) { double }
  let( :sport_2 ) { double }
  let( :sports  ) { [ sport_1, sport_2 ] }

  describe "#sports" do
    it "returns the sports array from the Betvictor endpoint" do
      subject.should_receive( :source ).and_return parsed_source
      subject.sports.should eq sports
    end
  end
end