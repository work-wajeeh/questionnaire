# frozen_string_literal: true

# Tests Controller
class TestsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def start; end

  def new; end

  def create
    user = { 'name' => params[:name], 'type' => '' }
    $redis.set('questions', QUESTIONS.to_json)
    $redis.set('user', user.to_json)
    redirect_to :start
  end

  def submit
    answers = test_params
    user = JSON.parse($redis.get('user'))
    user[:type] = answers.values.max_by { |value| answers.values.count(value) }
    $redis.set('user', user.to_json)
  end

  def result
    user = JSON.parse($redis.get('user'))
    @user = user
    user[:type] = ''
    $redis.set('user', user.to_json)
  end

  def destroy
    $redis.del('user')
    $redis.del('questions')
    redirect_to :root
  end

  private

  def test_params
    params.require(:answers).permit!
  end
end
