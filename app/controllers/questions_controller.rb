# frozen_string_literal: true

# Questions Controller
class QuestionsController < ApplicationController
  def index
    user = JSON.parse($redis.get('user'))
    @questions = JSON.parse($redis.get('questions')).sample(user['questions'].to_i)
  end
end
