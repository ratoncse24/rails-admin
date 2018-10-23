class Admin::CategoriesController < ApplicationController


  #before action call method
  before_action :set_category, only: [:show,:edit, :update,:destroy]
  before_action :category_status, only: [:edit,:new,:create,:update]
  #authenticate user is login
  before_action :authenticate_user!

  # list of all categories
  def index
    @categories = Admin::Category.all
  end

  # new categories
  def new
    @category = Admin::Category.new
  end

  #show the category
  def show

  end

  # create new categories save to database
  def create
    @category = Admin::Category.new(category_params)
    respond_to do |format|
      if @category.save
      format.html { redirect_to admin_categories_path , notice: "New Category Added" }
      format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new}
        format.json {render json: @category.errors, status: :unprocessable_entity }
    end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to admin_categories_path, notice: "Category Deleted"}
      format.json { head :no_content }
    end
  end

  def edit

  end

  def update
    @category.update(category_params)
    respond_to do |format|
      format.html { redirect_to admin_categories_path, notice: "Category Updated"}
      format.json { head :no_content }
    end
  end


  def delete_image_attachment

    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge
    redirect_to(request.env['HTTP_REFERER'])

  end




  # permit category params for store database
  private

  def category_status
    @status = [{"name"=>"Active", "value"=>1},{"name"=>:"DeActive", "value"=>0},  ]
  end

  def set_category
    @category = Admin::Category.find(params[:id])
  end
  def category_params
    params.require(:admin_category).permit(:name,:status,:description,:image)
  end

end
