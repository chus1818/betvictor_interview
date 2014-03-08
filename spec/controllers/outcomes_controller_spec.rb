require 'spec_helper'

describe OutcomesController do
  let( :params ) { { :locale => 'en', :sport_id => "1", :event_id => "2" } }

  describe "GET index" do
    let( :outcomes_array ) { double }
    before { Outcome.should_receive( :all ).with( "1", "2" ).and_return outcomes_array }

    it "assigns @outcomes" do
      get :index, params
      expect( assigns :outcomes ).to eq outcomes_array
    end

    it "renders the index template" do
      get :index, params
      expect( response ).to render_template( 'index' )
    end
  end

  describe "GET show" do
    let( :outcome ) { double }
    let( :params ) { { :locale => 'en', :sport_id => 1, :event_id => 2, :id => id } }
    let( :id ) { '1' }

    before { Outcome.should_receive( :find ).with( id, "1", "2" ).and_return outcome }

    it "assigns @outcome" do
      get :show, params
      expect( assigns :outcome ).to eq outcome
    end

    it "renders the show template for the given sport" do
      get :show, params
      expect( response ).to render_template( 'show' )
    end
  end
end
