class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: %i[create update destroy]
  before_action :set_category, only: %i[show update destroy]
  
  def index
    @categories = Category.all

    render json: @categories
  end

  def show
    render json: @category, include: :events
  end

  def create
    if current_user.admin?
      @category = Category.new(category_params)

      if @category.save
        render json: @category, status: :created, location: @category
      else
        render json: @category.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'You are not authorized to create a category' }, status: :unauthorized
    end
  end

  def update
    if @category.update(category_params)
      render json: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
  end

  private

  def category_params
    params.require(:category).permit(:name, :cover_image)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
