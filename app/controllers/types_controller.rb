class TypesController < ApplicationController
  def new
    @type = Type.new
  end

  def create
    @type = Type.new(params[:type].permit(:name))

    if @type.save
      redirect_to fixed_costs_path
    else
      render 'new'
    end
  end
end
