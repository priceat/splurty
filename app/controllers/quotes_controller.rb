class QuotesController < ApplicationController
  #before_action :set_category, only: [:index]

  def index
    @category = Category.order("RANDOM()").first
    @quote = @category.quotes
  end


  def create
    @category = Category.find(params[:category_id])
    @new_quote = Quotes.create(quote_params)

    if @new_quote.invalid?
      @category = Category.order("RANDOM()").first
      render :index, :status => :unprocessable_entity
    else
      @quote = @new_quote
      redirect_to @category.quotes
    end

  end

  def about
  end

  private


  def set_category
    @category = Category.find(params[:category_id])
  end

  def quote_params
    params.require(:quote).permit(:saying, :author, :category_id)
  end
  
end
