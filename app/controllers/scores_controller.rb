class ScoresController < ApplicationController
  def index
    @scores = Score.all.order(score: :desc)
    render json: @scores
  end

  def create
    @score = Score.new(score_params)
    if @score.save
      render json: @score
    end
  end

  private

  def score_params
    params.permit(:name, :score)
  end
end
