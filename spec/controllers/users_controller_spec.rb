require 'rails_helper'

describe UsersController, type: :controller do
  # let(:user) { User.create!(email: "tengiao@gmail.com", password: "yadayada") }
  # let(:user2) { User.create!(email: "raozien@yahoo.com", password: "dayadaya") }
  let(:user) { FactoryBot.create(:user) }
  let(:user2) { FactoryBot.create(:user) }


  describe 'GET #show' do
    context 'when a user is logged in' do
      before do
        sign_in user
      end

      it 'loads correct user details' do
        get :show, params: { id: user.id }
        expect(response).to be_ok
        expect(assigns(:user)).to eq user
      end
    end

    context 'when a user is not logged in' do
      it 'redirects to login' do
        get :show, params: { id: user.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when user1 try to access pages of user2' do
      before do
        sign_in user
      end

      it 'redirects to root' do
        get :show, params: { id: user2.id }
        expect(response).not_to be_ok
        # expect(response).to redirect_to(root_path)
        expect(response).to redirect_to(user_session_path)
      end
    end
  end
end
