require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
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

    context 'POST #create' do
      context 'with invalid params' do
        it 'renders groups#new page with errors' do
          user = FactoryBot.create(:user)
          sign_in user
          post :create, params: { user_id: user.id, group: { name: 'Some Test Name' } }

          expect(response).to render_template('new')
          expect(response).to have_http_status(200)
        end
      end

      context 'with valid params' do
        it 'redirects to groups#index page' do
          user = FactoryBot.create(:user)
          sign_in user
          file = fixture_file_upload('files/no_group.png', 'image/png')
          post :create, params: { user_id: user.id, group: { name: 'Some Test Name', icon: file } }

          expect(response).to redirect_to user_groups_path(user)
          expect(response).to have_http_status(302)
        end
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

    context 'GET #show' do
      it 'renders groups#show page' do
        user = FactoryBot.create(:user)
        sign_in user
        group = FactoryBot.create(:group)
        get :show, params: { user_id: user.id, id: group.id }

        expect(response).to render_template('show')
        expect(response).to have_http_status(200)
      end
    end
  end
end
