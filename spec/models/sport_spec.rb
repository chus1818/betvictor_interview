require 'spec_helper'

describe Sport do
  subject { Sport }

  describe "#self.all" do 
    it "returns all the sports from Betvictor" do
      Betvictor.any_instance.should_receive( :sports )
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