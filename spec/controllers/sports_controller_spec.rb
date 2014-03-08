require 'spec_helper'

describe SportsController do
  let( :params ) { { :locale => 'en' } }

  describe "GET index" do
    let( :sports_array ) { double }
    before { Sport.should_receive( :all ).and_return sports_array }

    it "assigns @sports" do
      get :index, params
      expect( assigns :sports ).to eq sports_array
    end

    it "renders the index template" do
      get :index, params
      expect( response ).to render_template( 'index' )
    end
  end

  describe "GET show" do
    let( :sport ) { double }
    let( :params ) { { :locale => 'en', :id => id } }
    let( :id ) { '1' }

    before { Sport.should_receive( :find ).with( id ).and_return sport }

    it "assigns @sport" do
      get :show, params
      expect( assigns :sport ).to eq sport
    end

    it "renders the show template for the given sport" do
      get :show, params
      expect( response ).to render_template( 'show' )
    end
  end
end
