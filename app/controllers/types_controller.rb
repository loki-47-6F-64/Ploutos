class TypesController < ApplicationController
  def new
    @type = Type.new
  end

  def edit
    @type = Type.find(params[:id])
  end

  def create
    @type = Type.new(params[:type].permit(:name))

    if @type.save
      redirect_to new_fixed_cost_path
    else
      render 'new'
    end
  end

  def update
    @type = Type.find(params[:id])
    if @type.update(params[:type].permit(:name))
      redirect_to new_fixed_cost_path
    else
      render 'edit'
    end
  end

  def destroy
    @type = Type.find(params[:id])
    @type.destroy

    redirect_to new_fixed_cost_path
  end
end
