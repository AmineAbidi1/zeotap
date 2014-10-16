#encoding:utf-8
class MappersController < ApplicationController

  before_action :all_mappers, only: [:index, :create, :update, :destroy]
  before_action :set_mappers, only: [:edit, :update, :destroy]
  respond_to :html, :js

  def new
    @mapper = Mapper.new
  end

  def create
    @mapper = Mapper.new(mapper_params)
    @mapper.result = Mappers::Computer.seek(mapper_params[:string1], mapper_params[:string2])
    @mapper.save
    @mapper
  end

  def update
    ActiveRecord::Base.transaction do 
      @mapper.string1 = mapper_params[:string1]
      @mapper.string2 = mapper_params[:string2]
      @mapper.result = Mappers::Computer.seek(mapper_params[:string1], mapper_params[:string2])
      @mapper.save!
    end
    @mapper
  end

  def destroy
    @mapper.destroy
  end

  private

  def all_mappers
    @mappers = Mapper.all
  end

  def set_mappers
    @mapper = Mapper.find(params[:id])
  end

  def mapper_params
    params.require(:mapper).permit(:string1, :string2)
  end
end