class TypesController < ApplicationController
before_action :authenticate
  def new
    @type = @current_user.types.build
  end

  def edit
    return unless allow_view? params[:id]
  end

  def create
    @type = @current_user.types.build type_params

    if @type.save
      notify :success, 'Type successfully created.', true

      redirect_to new_fixed_cost_path
    else
      notify :error, @type.errors.full_messages

      render 'new'
    end
  end

  def update
    return unless allow_view? params[:id]

    if @type.update type_params
      notify :success, 'Type successfully updated', true

      redirect_to new_fixed_cost_path
    else
      notify :error, @type.errors.full_messages

      render 'edit'
    end
  end

  def destroy
    return unless allow_view? params[:id]

    notify :info, 'Type deleted.', true

    @type.destroy

    redirect_to new_fixed_cost_path
  end

  def type_params
    params[:type].permit(:name)
  end

  def allow_view? id
    @type = Type.find id

    if @type.user_id != @current_user.id
      render 'users/access_violation' and return false
    end
    return true
  end
end
