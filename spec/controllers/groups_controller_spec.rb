require 'rails_helper'

# RSpec.describe GroupsController, type: :controller do
#   describe 'when signed in' do
#     self.use_transactional_tests = false
#     context 'GET #new' do
#       it 'renders groups#new page' do
#         user = FactoryBot.create(:user)
#         sign_in user
#         get :new

#         expect(response).to render_template('new')
#         expect(response).to have_http_status(200)
#       end
#     end

#     context 'GET #index' do
#       it 'renders groups#index page' do
#         user = FactoryBot.create(:user)
#         sign_in user
#         get :index, params: { author_id: user.id }

#         expect(response).to render_template('index')
#         expect(response).to have_http_status(200)
#       end
#     end

#     context 'POST #create' do
#       context 'with invalid params' do
#         it 'redirects to groups#index page' do
#           user = FactoryBot.create(:user)
#           sign_in user
#           post :create, params: { author_id: user.id, name: "Test Group Name" }

#           expect(response).to redirect_to(user_groups_path(user))
#           expect(response).to have_http_status(302)
#         end
#       end
#     end
#   end
# end