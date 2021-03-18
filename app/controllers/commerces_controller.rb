class CommercesController < ApplicationController
  
  def index
    @search = params[:search]
    @commerces = Commerce.all
    @commerces = @commerces.where("title LIKE ? or description LIKE ?" , "%#{@search}%", "%#{@search}%") if @search.present?
    @commerces = @commerces.page(params[:page]).per(5)
  end

  def show
    @commerce = Commerce.find(params[:id])
  end

  def new
    puts "This is how you print out something."
    @commerce = Commerce.new
  end

  def edit
    @commerce = Commerce.find(params[:id])
  end

  def create
    @commerce = Commerce.create(commerce_params)

    if @commerce.invalid?
      flash[:error] = @commerce.errors.full_messages
    end

    redirect_to action: :index
  end

  def update
    @commerce = Commerce.find(params[:id])
    @commerce.update(commerce_params)
    redirect_to action: :index
  end

  def destroy
    @commerce = Commerce.find(params[:id])
    @commerce.destroy
    redirect_to action: :index
  end

  private

  def commerce_params
    params.require(:commerce).permit(:title, :description, :stock)
  end
end
