require 'spec_helper'

describe BetvictorRecord do
  subject { Sport = Class.new BetvictorRecord }
  let( :class_instance ) { subject.find 1 }

  let( :sports_array ) { [ sport_1, sport_2 ] }
  let( :sport_1 ) { { "id" => 1, "title" => "a title"   } }
  let( :sport_2 ) { { "id" => 2, "title" => "a title 2" } }

  describe "#self.all" do
    before do 
      Betvictor.any_instance.should_receive( :sports ).and_return sports_array
    end

    let( :all_records ) { subject.all }

    it "returns an array of instances for all the records in the source" do
      all_records.class.should eq Array
      all_records.size.should eq 2
      all_records.first.record.should eq sport_1
    end
  end

  describe "#self.find" do
    before do 
      Betvictor.any_instance.should_receive( :find ).with( :sport, 1 ).and_return sport_1
    end

    it "returns a new BetvictorRecord instance with a record extracted from source matching the given id" do
      class_instance.class.should eq Sport
      class_instance.record.should eq sport_1
    end
  end

  describe "#self.attr_readable" do
    before do 
      Betvictor.any_instance.should_receive( :find ).with( :sport, 1 ).and_return sport_1
      subject.attr_readable :id, :title
    end

    it "defines reader methods for the given names" do
      class_instance.id.should eq 1
      class_instance.title.should eq "a title"
    end
  end

  describe "#self.first" do
    let( :all_records ) { [ "first", "second", "last" ] }

    it "returns the first element of all" do
      subject.should_receive( :all ).and_return all_records
      subject.first.should eq "first"
    end
  end

  describe "#self.last" do
    let( :all_records ) { [ "first", "second", "last" ] }

    it "returns the first element of all" do
      subject.should_receive( :all ).and_return all_records
      subject.last.should eq "last"
    end
  end
end