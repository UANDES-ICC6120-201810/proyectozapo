class SubscribedCustomersController < ApplicationController
  before_action :set_subscribed_customer, only: [:show, :edit, :update, :destroy]

  # GET /subscribed_customers
  # GET /subscribed_customers.json
  def index
    @subscribed_customers = SubscribedCustomer.all
  end

  # GET /subscribed_customers/1
  # GET /subscribed_customers/1.json
  def show
  end

  # GET /subscribed_customers/new
  def new
    @subscribed_customer = SubscribedCustomer.new
  end

  # GET /subscribed_customers/1/edit
  def edit
  end

  # POST /subscribed_customers
  # POST /subscribed_customers.json
  def create
    @subscribed_customer = SubscribedCustomer.new(subscribed_customer_params)

    respond_to do |format|
      if @subscribed_customer.save
        subscribed_customer_id = @subscribed_customer.id
        auth_token = AuthenticateUserClient.new(subscribed_customer_id).call
        @subscribed_customer.token = auth_token
        @subscribed_customer.save
        format.html { redirect_to @subscribed_customer, notice: 'Subscribed customer was successfully created.' }
        format.json { render :show, status: :created, location: @subscribed_customer }
      else
        format.html { render :new }
        format.json { render json: @subscribed_customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subscribed_customers/1
  # PATCH/PUT /subscribed_customers/1.json
  def update
    respond_to do |format|
      if @subscribed_customer.update(subscribed_customer_params)
        format.html { redirect_to @subscribed_customer, notice: 'Subscribed customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @subscribed_customer }
      else
        format.html { render :edit }
        format.json { render json: @subscribed_customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscribed_customers/1
  # DELETE /subscribed_customers/1.json
  def destroy
    @subscribed_customer.destroy
    respond_to do |format|
      format.html { redirect_to subscribed_customers_url, notice: 'Subscribed customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscribed_customer
      @subscribed_customer = SubscribedCustomer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscribed_customer_params
      params.require(:subscribed_customer).permit(:access_group_id, :name, :description)
    end
end
