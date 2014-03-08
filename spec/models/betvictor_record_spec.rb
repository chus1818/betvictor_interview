require 'spec_helper'

Foo = Class.new BetvictorRecord

describe BetvictorRecord do
  subject { Foo }
  let( :class_instance ) { subject.find 1 }

  let( :foos_array ) { [ foo_1, foo_2 ] }
  let( :foo_1 ) { { "id" => 1, "title" => "a title"   } }
  let( :foo_2 ) { { "id" => 2, "title" => "a title 2" } }

  describe "#self.all" do
    before do 
      Betvictor.any_instance.should_receive( :foos ).and_return foos_array
    end

    let( :all_records ) { subject.all }

    it "returns an array of instances for all the records in the source" do
      all_records.class.should eq Array
      all_records.size.should eq 2
      all_records.first.record.should eq foo_1
    end
  end

  describe "#self.find" do
    before do 
      Betvictor.any_instance.should_receive( :find ).with( :foo, 1, [] ).and_return foo_1
    end

    it "returns a new BetvictorRecord instance with a record extracted from source matching the given id" do
      class_instance.class.should eq Foo
      class_instance.record.should eq foo_1
    end
  end

  describe "#self.attr_readable" do
    before do 
      Betvictor.any_instance.should_receive( :find ).with( :foo, 1, [] ).and_return foo_1
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