require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'when signed in' do
    context 'GET #show' do
      it 'renders the user page' do
        user = create(:user)
        sign_in user
        get :show

        expect(response).to render_template('show')
        expect(response).to have_http_status(200)
      end
    end

    context 'GET #index' do
      it 'renders the user page' do
        user = create(:user)
        sign_in user
        get :index

        expect(response).to render_template('index')
        expect(response).to have_http_status(200)
      end
    end
  end
end
