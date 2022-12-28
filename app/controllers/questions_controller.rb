# frozen_string_literal: true

# Questions Controller
class QuestionsController < ApplicationController
  def index
    @questions = QUESTIONS.sample(5)
  end
end
