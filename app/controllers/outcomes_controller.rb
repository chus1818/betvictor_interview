class OutcomesController < ApplicationController
  def index
    @outcomes = Outcome.all params[ :sport_id ], params[ :event_id ]
  end

  def show
    @outcome = Outcome.find params[ :id ], params[ :sport_id ], params[ :event_id ]
  end
end
