require 'rails_helper'

RSpec.describe ActivitiesController, type: :controller do
  describe 'when not signed in' do
    context 'GET #new' do
      it 'redirects to user sign in page' do
        user = FactoryBot.create(:user)
        get :new, params: { user_id: user.id }

        expect(response).to redirect_to(new_user_session_path)
        expect(response).to have_http_status(302)
      end
    end

    context 'GET #index' do
      it 'redirects to user sign in page' do
        user = FactoryBot.create(:user)
        get :index, params: { user_id: user.id }

        expect(response).to redirect_to(new_user_session_path)
        expect(response).to have_http_status(302)
      end
    end
  end

  describe 'when signed in' do
    context 'GET #new' do
      it 'renders activities#new page' do
        user = FactoryBot.create(:user)
        sign_in user
        get :new, params: { user_id: user.id }

        expect(response).to render_template('new')
        expect(response).to have_http_status(200)
      end
    end

    context 'GET #index' do
      it 'renders activities#index page' do
        user = FactoryBot.create(:user)
        sign_in user
        get :index, params: { user_id: user.id }

        expect(response).to render_template('index')
        expect(response).to have_http_status(200)
      end
    end

    context 'POST #create' do
      context 'with valid params' do
        it 'renders activities#new page with errors' do
          user = FactoryBot.create(:user)
          sign_in user
          group = FactoryBot.create(:group)
          post :create, params: { user_id: user.id, activity: { name: 'Some Test Activity Name', amount: 100, group_id: group.id } }
          expect(response).to redirect_to(user_activities_path(user))
          expect(response).to have_http_status(302)
        end
      end
    end
  end
end
