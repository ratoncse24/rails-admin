class SettingsController < ApplicationController
  before_action :set_settings, only: [:edit,:update,:destroy]
  before_action :authenticate_user!


  def index
  @settings = Setting.all
  end

  def new
    @setting = Setting.new
  end

  def create
    @setting = Setting.new(setting_params)
    if @setting.save
      redirect_to settings_path
    else
      render :new
    end
  end


  def update
    @setting.update(setting_params)
    redirect_to settings_path , notice: "Settings Updated"
  end


  def destory
    @setting.destroy
    redirect_to settings_path, notice: "Settings Deleted"
  end



  private

  def set_settings
    @setting = Setting.find(params[:id])
  end

  def setting_params
    params.require(:setting).permit(:company_name,:company_title,
                                    :company_phone,:company_email,
                                    :company_address,:company_about,
                                    :company_location,:company_facebook,:company_twitter,
                                    :comapny_youtube,:company_other,:logo,:fevicon,)
  end

end
