class AccountsController < ApplicationController
  def index
    @accounts = Account.includes(:user).where(user_id: current_user.id)
  end
end
