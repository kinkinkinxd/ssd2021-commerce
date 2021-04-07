class ProductsController < ApplicationController
  
  def index
    @search = params[:search]
    @products = Product.all
    @products = @products.where("title LIKE ? or description LIKE ?" , "%#{@search}%", "%#{@search}%") if @search.present?
    @products = @products.page(params[:page]).per(5)
    respond_to do |format|
      format.html
      format.csv { send_data generate_csv(Product.all), file_name: 'products.csv' }
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    puts "This is how you print out something."
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.create(product_params)

    if @product.invalid?
      flash[:error] = @product.errors.full_messages
    end

    redirect_to action: :index
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to action: :index
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to action: :index
  end

  def csv_upload
    data = params[:csv_file].read.split("\n")
    data.each do |line|
      attr = line.split(",").map(&:strip)
      Product.create title: attr[0], description: attr[1], stock: attr[2]
    end
    redirect_to action: :index
  end

  private

  def generate_csv(products)
    products.map { |a| [a.title, a.description, a.stock , a.created_at.to_date].join(',') }.join("\n")
  end

  def product_params
    params.require(:product).permit(:title, :status, :description, :stock, :category_ids=>[])
  end
end
