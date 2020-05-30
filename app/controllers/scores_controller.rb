class ScoresController < ApplicationController
  def index
    @scores = Score.all.order(score: :desc)
    render json: @scores
  end
end
