class CategoriesController < ApplicationController
  before_action :authenticate_user!, exception: [:index, :show]
  before_action :ensure_admin!, only: [:update, :edit, :destroy]


  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(name: params[:name])

    if @category.save
      redirect category_url(category)
    else
      render 'new'
    end
  end

  def show
    @category = Category.find(params[:id])
    @articles = @category.articles

    render 'show'
  end

  def destroy
    Category.find(params[:id])
  end

end
