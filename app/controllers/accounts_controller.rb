class AccountsController < ApplicationController
  before_action :set_group, only: %i[index create new]
  def index
    # @group = Group.find(params[:group_id])
    # @accounts = Account.where(group_id: @group, user_id: current_user.id)
    # @accounts = Account.includes(:user).where(user_id: current_user.id).order(created_at: :desc)
    @accounts = @group.accounts.order(created_at: :desc)
    @accounts_sum = @accounts.sum(:amount)
  end

  def new
    @account = Account.new
    @groups = Group.all
  end

  def create
    @account = Account.new(account_params)
    @account.user_id = current_user.id
    if @account.save
      GroupTransaction.create!(group_id: @group.id, account_id: @account.id)
      flash[:notice] = 'Transaction created successfully'
      redirect_to group_accounts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def account_params
    params.require(:account).permit(:name, :amount)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
