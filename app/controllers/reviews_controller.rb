class ReviewsController < ApplicationController
    before_filter :set_user

    def create
        @product = Product.find(params[:product_id])
        @review = @product.reviews.create(review_params)
        @review.user = current_user

        if @review.valid?
            redirect_to @product
        else
            redirect_to product_path(@product)
        end
        @review.save
    end

    def destroy
        @product = Product.find(params[:product_id])
        @review = @product.reviews.find(params[:id])
        @review.destroy
        redirect_to product_path(@product)
    end

    private

    def review_params
        params.require(:review).permit(
            :id,
            :rating,
            :description
        )
    end

    def set_user
        @user = current_user
    end
end