class CategoriesController < ApplicationController
  
  def index
    @category = Category.order("RANDOM()").first
    @quote = Quote.new
  end

  def show
    @category = Category.find(params[:id])
    @quotes = @category.quotes.all
  end

  def update
    @category = Category.find(params[:id])
    @new_quote = @category.quotes.build
    
    if @new_quote.save
      render :index
    else
      @category = Category.order("RANDOM()").first
      render :index, :status => :unprocessable_entity
    end
  end

  private

  def category_params
    params.require(:category).permit(:title, quotes_attributes: [:saying, :author])
  end

end
