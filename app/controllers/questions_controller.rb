# frozen_string_literal: true

# Questions Controller
class QuestionsController < ApplicationController
  def index
    questions = $redis.get('questions')
    if questions
      @questions = JSON.parse(questions).sample(6)
    else
      redirect_to :root
    end
  end
end
