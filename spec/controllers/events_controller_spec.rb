require 'spec_helper'

describe EventsController do
  let( :params ) { { :locale => 'en', :sport_id => "1" } }

  describe "GET index" do
    let( :events_array ) { double }
    before { Event.should_receive( :all ).with( "1" ).and_return events_array }

    it "assigns @events" do
      get :index, params
      expect( assigns :events ).to eq events_array
    end

    it "renders the index template" do
      get :index, params
      expect( response ).to render_template( 'index' )
    end
  end

  describe "GET show" do
    let( :event ) { double }
    let( :params ) { { :locale => 'en', :sport_id => 1, :id => id } }
    let( :id ) { '1' }

    before { Event.should_receive( :find ).with( id, "1" ).and_return event }

    it "assigns @event" do
      get :show, params
      expect( assigns :event ).to eq event
    end

    it "renders the show template for the given sport" do
      get :show, params
      expect( response ).to render_template( 'show' )
    end
  end
end
