# frozen_string_literal: true
require 'rails_helper'

RSpec.describe PeopleController, type: :request do
  describe 'GET /people/{:id}' do
    context 'person exists' do
      it 'returns first_name, last_name, phone_number' do

      end
    end

    context 'person does not exist' do
      it 'returns 404' do

      end
    end
  end

  describe 'POST /people/{:id}/check_access' do
    context 'person does not exist' do
      it 'returns 404' do

      end
    end

    context 'person is not active' do
      it 'returns  { access: false }' do

      end
    end

    context 'person is marked active but not listed for access to organization' do
      it 'returns  { access: false }' do

      end
    end

    context 'person is listed for access to organization' do
      it 'returns  { access: true }' do

      end
    end
  end
end

