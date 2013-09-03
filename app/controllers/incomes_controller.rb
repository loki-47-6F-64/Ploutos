class IncomesController < ApplicationController
before_action :authenticate
  def new
    @income = @current_user.incomes.build
  end

  def edit
    return unless allow_view? params[:id]
  end

  def index
    @incomes = @current_user.incomes
  end

  def show
    return unless allow_view? params[:id]
  end

  def create
    @income = @current_user.incomes.build income_params

    if @income.save
      notify :success, 'Income saved successfully.', true

      redirect_to incomes_path
    else
      notify :error, @income.errors.full_messages
      render 'new'
    end
  end

  def update
    return unless allow_view? params[:id]

    if @income.update income_params
      notify :success, 'Income updated successfully.', true

      redirect_to incomes_path
    else
      notify :error, @income.errors.full_messages

      render 'edit'
    end
  end

  def destroy
    return unless allow_view? params[:id]

    @income.destroy

    notify :info, 'Income deleted.', true
    redirect_to incomes_path
  end

  def income_params
    params[:income].permit(:amount, :description)
  end

  def allow_view? id
    @income = Income.find id

    if @income.user_id != @current_user.id
      render 'users/access_violation' and return false
    end
    return true
  end
end
