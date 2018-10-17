class EmailMarketingsController < ApplicationController
  before_action :set_email_marketing, only: [:show, :edit, :update, :destroy]

  # GET /email_marketings
  # GET /email_marketings.json
  def index
    @email_marketings = EmailMarketing.all
  end

  # GET /email_marketings/1
  # GET /email_marketings/1.json
  def show
  end

  # GET /email_marketings/new
  def new
    @email_marketing = EmailMarketing.new
  end

  # GET /email_marketings/1/edit
  def edit
  end

  # POST /email_marketings
  # POST /email_marketings.json
  def create
    @email_marketing = EmailMarketing.new(email_marketing_params)

    respond_to do |format|
      if @email_marketing.save
        format.html { redirect_to @email_marketing, notice: 'Email marketing was successfully created.' }
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
        format.html { redirect_to @email_marketing, notice: 'Email marketing was successfully updated.' }
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
      format.html { redirect_to email_marketings_url, notice: 'Email marketing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email_marketing
      @email_marketing = EmailMarketing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_marketing_params
      params.require(:email_marketing).permit(:sender_name, :sender_email, :reciver_email, :email_subject, :email_body)
    end
end
