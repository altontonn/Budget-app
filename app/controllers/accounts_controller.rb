class AccountsController < ApplicationController
  def index
    @accounts = Account.includes(:user).where(user_id: current_user.id)
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    @account.user = current_user
    if @account.save
      redirect_to group_account_path(@account), notice: 'Transaction created successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def account_params
    params.require(:account).permit(:name, :amount)
  end
end
