# frozen_string_literal: true

# Tests Controller
class TestsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def start; end

  def new; end

  def create
    @@user = { 'name' => params[:name], 'type' => '' }
    redirect_to :start
  end

  def submit
    answers = test_params
    @@user['type'] = answers.values.max_by { |value| answers.values.count(value) }
  end

  def result
    @user = @@user
    @@user[:type] = ''
  end

  def destroy
    @@user.clear
    redirect_to :root
  end

  private

  def test_params
    params.require(:answers).permit!
  end
end
