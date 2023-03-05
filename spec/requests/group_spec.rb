require 'rails_helper'

RSpec.describe 'groups', type: :request do
  before :each do
    @user = User.create(name: 'Peter', email: 'peter@gmail.com', password: '12345')

    Group.create([
                   { user_id: @user, name: 'Sports' },
                   { user_id: @user, name: 'Movies' }
                 ])

    get root_path
  end

  it 'for a renders index template' do
    expect(response).to have_http_status(:found)
  end

  it 'for a success' do
    expect(response).to have_http_status(:found)
  end
end
