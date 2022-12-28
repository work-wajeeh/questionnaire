# frozen_string_literal: true

# Questions Controller
class QuestionsController < ApplicationController
  def index
    @questions = JSON.parse($redis.get('questions')).sample(5)
  end
end
