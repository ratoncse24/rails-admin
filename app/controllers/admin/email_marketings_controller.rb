class Admin::EmailMarketingsController < ApplicationController
  before_action :set_email_marketing, only: [:show, :edit, :update, :destroy]
  before_action :set_customer, only: [:new, :edit, :create, :update]

  # GET /email_marketings
  # GET /email_marketings.json
  def index
    @email_marketings = Admin::EmailMarketing.all
  end

  # GET /email_marketings/1
  # GET /email_marketings/1.json
  def show
  end

  # GET /email_marketings/new
  def new
    @email_marketing = Admin::EmailMarketing.new
  end

  # GET /email_marketings/1/edit
  def edit
  end

  # POST /email_marketings
  # POST /email_marketings.json
  def create

   # render plain: params[:admin_email_marketing][:send_type]

     @email_marketing = Admin::EmailMarketing.new(email_marketing_params)

     @send_type = params[:admin_email_marketing][:send_type]
     if @send_type == "All"
       @email_marketing.reciver_email = "All"
     elsif @send_type == "Custom Email"
       @email_marketing.reciver_email = params[:admin_email_marketing][:custom_email]
     end

    respond_to do |format|
      if @email_marketing.save
        # Tell the UserMailer to send a welcome email after save

        if @email_marketing.reciver_email == "All"

          #find all the customer and send email
          Customer.find_each do |customer|
            @email_marketing.reciver_email = customer.email
            EmailMarketingMailer.with(email: @email_marketing ).send_email.deliver_now
          end
        else

          EmailMarketingMailer.with(email: @email_marketing ).send_email.deliver_now

          end

        format.html { redirect_to admin_email_marketings_path, notice: 'Email marketing was successfully created.' }
        format.json { render :show, status: :created, location: @email_marketing }
      else
        format.html { render :new }
        format.json { render json: @email_marketing.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /email_marketings/1
  # PATCH/PUT /email_marketings/1.json
  def update
    respond_to do |format|
      if @email_marketing.update(email_marketing_params)
        # Tell the UserMailer to send a welcome email after save
        @email = Admin::EmailMarketing.last

        EmailMarketingMailer.with(email: @email).send_email.deliver_now

        format.html { redirect_to admin_email_marketings_path, notice: 'Email marketing was successfully updated.' }
        format.json { render :show, status: :ok, location: @email_marketing }
      else
        format.html { render :edit }
        format.json { render json: @email_marketing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /email_marketings/1
  # DELETE /email_marketings/1.json
  def destroy
    @email_marketing.destroy
    respond_to do |format|
      format.html { redirect_to admin_email_marketings_url, notice: 'Email marketing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # customer list for sending email
    def set_customer
      @customers = Admin::Customer.all
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_email_marketing
      @email_marketing = Admin::EmailMarketing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_marketing_params
      params.require(:admin_email_marketing).permit(:sender_name, :sender_email, :email_subject, :email_body, :reciver_email)
    end
end
