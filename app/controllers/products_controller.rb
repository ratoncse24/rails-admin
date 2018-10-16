class ProductsController < ApplicationController

  before_action :status, only: [:new,:create,:edit,:update, ]
  before_action :categories , only: [:new,:create,:edit,:update]
  before_action :set_product , only: [:show,:edit,:update,:destroy]

  #authenticate user is login
  before_action :authenticate_user!


  # view all product
  def index
    @products = Product.all
  end

  # view product
  def show

  end

  # new product function
  def new
    @product = Product.new()
  end


  # create new product
  def create

    @product = Product.create(product_param)
    if @product.save
      redirect_to products_path, notice: "New Product Added"
    else
      render :new
    end
  end


  def update
    @product.update(product_param)
    redirect_to products_path
  end


  def destroy
    @product.destroy
    redirect_to products_path
  end

  def delete_image_attachment
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge
    redirect_to(request.env['HTTP_REFERER'])
  end





  private
  #product status 1 or 0 for select option
  def status
    @status = [{"name" => "Active", "value" => 1}, {"name" => "Deactive", "value" => 0}]
  end

  #product category list
  def categories
    @categories = Category.where(:status => 1).all
  end

  # permited product attribute
  def product_param

    params.require(:product).permit(:item_name, :item_short_description, :item_long_description,
                                    :item_status, :item_price, :category_id, item_images: [])
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
