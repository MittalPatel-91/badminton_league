# frozen_string_literal: true

class MatchResultsController < ApplicationController
  def index
    @match_results = MatchResult.includes(:winner, :loser)
                                .order(created_at: :desc)
  end

  def new
    @match_result = MatchResult.new
    @players = Player.order(:name)
  end

  def create
    @match_result = MatchResult.new(match_result_params)
    if @match_result.save
      redirect_to match_results_path, notice: I18n.t("match_results.created.successfully")
    else
      @players = Player.order(:name)
      flash.now[:alert] = @match_result.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  private

  def match_result_params
    params.require(:match_result).permit(:winner_id, :loser_id)
  end
end
