class SuddenChecksController < ApplicationController
before_action :authenticate
  def new
    @sudden_check = @current_user.sudden_checks.build
    @sudden_check.is_income = params[:is_income]
  end

  def edit
    return unless allow_view? params[:id]
  end

  def index
    @sudden_checks = @current_user.sudden_checks
  end

  def show
    return unless allow_view? params[:id]
  end

  def create
    @sudden_check = @current_user.sudden_checks.build sudden_check_params

    if @sudden_check.save
      notify :success, 'Unexpected check added successfully.', true

      redirect_to sudden_checks_path
    else
      notify :error, @sudden_check.errors.full_messages

      render 'new'
    end
  end

  def update
    return unless allow_view? params[:id]

    if @sudden_check.update sudden_check_params
      notify :success, 'Unexpected check updated successfully.', true

      redirect_to sudden_checks_path
    else
      notify :error, @sudden_check.errors.full_messages

      render 'edit'
    end
  end

  def destroy
    return unless allow_view? params[:id]

    notify :info, 'Sudden check deleted.', true

    @sudden_check.destroy
    redirect_to sudden_checks_path
  end

  def sudden_check_params
    params[:sudden_check].permit(:when, :amount, :is_income, :description)
  end

  def allow_view? id
    @sudden_check = SuddenCheck.find id

    if @sudden_check.user_id != @current_user.id
      render 'users/access_violation' and return false
    end
    return true
  end
end
