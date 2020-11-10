require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  describe 'when signed in' do
    self.use_transactional_tests = false
    context 'GET #new' do
      it 'renders groups#new page' do
        user = FactoryBot.create(:user)
        sign_in user
        get :new, params: { user_id: user.id }

        expect(response).to render_template('new')
        expect(response).to have_http_status(200)
      end
    end

    context 'GET #index' do
      it 'renders groups#index page' do
        user = FactoryBot.create(:user)
        sign_in user
        get :index, params: { user_id: user.id }

        expect(response).to render_template('index')
        expect(response).to have_http_status(200)
      end
    end

    # context 'POST #create' do
    #   context 'with invalid params' do
    #     it 'renders to groups#new page with errors' do
    #       user = FactoryBot.create(:user)
    #       sign_in user
    #       file = fixture_file_upload(Rails.root.join('public', 'no_group.png'))
    #       post :create, params: { user_id: user.id, name: "Some Test Name", icon: file }

    #       expect(response).to render_template('new')
    #       expect(response).to have_http_status(200)
    #     end
    #   end
    # end

    # context 'GET #index' do
    #   it 'renders groups#index page' do
    #     user = FactoryBot.create(:user)
    #     sign_in user
    #     group = FactoryBot.create(:group)
    #     get :show, params: { user_id: user.id, group_id: group.id }

    #     expect(response).to render_template('show')
    #     expect(response).to have_http_status(200)
    #   end
    # end
  end
end