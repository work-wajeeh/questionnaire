# frozen_string_literal: true

# Tests Controller
class TestsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new; end

  def create
    $redis.set('questions', QUESTIONS.to_json)
    redirect_to :questions
  end

  def submit
    answers = test_params
    result = PERSONALITIES[answers.values.count('introvert') - answers.values.count('extrovert') <=> 0]
    $redis.set('result', result)
    redirect_to :result
  end

  def result
    @result = $redis.get('result')
  end

  def destroy
    $redis.del('result')
    $redis.del('questions')
    redirect_to :root
  end

  private

  def test_params
    params.require(:answers).permit!
  end
end
