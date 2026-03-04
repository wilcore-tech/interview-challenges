# frozen_string_literal: true

class PeopleController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show

  end

  def check_access
    render json: { success: 'true or false goes here' }
  end
end
