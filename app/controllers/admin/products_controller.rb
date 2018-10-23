class Admin::ProductsController < ApplicationController

  before_action :status, only: [:new,:create,:edit,:update, ]
  before_action :categories , only: [:new,:create,:edit,:update]
  before_action :set_product , only: [:show,:edit,:update,:destroy]

  #authenticate user is login
  before_action :authenticate_user!


  # view all product
  def index
    @products = Admin::Product.all
  end

  # view product
  def show

  end

  # new product function
  def new
    @product = Admin::Product.new()
  end


  # create new product
  def create

    @product = Admin::Product.create(product_param)
    if @product.save
      redirect_to admin_products_path, notice: "New Product Added"
    else
      render :new
    end
  end


  def update
    @product.update(product_param)
    redirect_to admin_products_path
  end


  def destroy
    @product.destroy
    redirect_to admin_products_path
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
    @categories = Admin::Category.where(:status => 1).all
  end

  # permited product attribute
  def product_param

    params.require(:admin_product).permit(:item_name, :item_short_description, :item_long_description,
                                    :item_status, :item_price, :category_id, item_images: [])
  end

  def set_product
    @product = Admin::Product.find(params[:id])
  end

end
