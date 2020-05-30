# frozen_string_literal: true

class ScoresController < ApplicationController
  def index
    @scores = Score.all.order(score: :desc)
    render json: @scores
  end

  def create
    @score = Score.new(score_params)
    begin
      @score.save!
      render json: @score
    rescue => exception
      render json: exception, status: :unprocessable_entity
    end
  end

  private

  def score_params
    params.permit(:name, :score)
  end
end
