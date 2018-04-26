class Admin::CategoriesController < ApplicationController

    def index
      @category = Category.order(id: :desc).all
    end

    def new
      @category = Category.new
    end

    def create
      @category = Category.new(categories_params)

      if @categories.save
        redirect_to [:admin, :categories], notice: 'Category created!'
      else
        render :new
      end
    end

    private

    def category_params
      params.require(:category).permit(
        :name
      )
    end

  end
