class Admin::OrdersController < Admin::AdminController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /order
  # GET /order.json
  def index
    params[:per_page] = 10 unless params[:per_page].present?

    condition_sql = '1=1'
    sql_params = []

    if params[:user_id].present?
      condition_sql += " AND user_id=?"
      sql_params << params[:user_id]
    end

    if params[:branch_id].present?
      condition_sql += " AND branch_id=?"
      sql_params << params[:branch_id]
    end

    if params[:receipt_id].present?
      condition_sql += " AND receipt_id=?"
      sql_params << params[:receipt_id]
    end

    if params[:start_date].present?
      condition_sql += " AND transaction_date>=?"
      sql_params << params[:start_date].to_date
    end

    if params[:end_date].present?
      condition_sql += " AND transaction_date<=?"
      sql_params << params[:end_date].to_date
    end

    @order_count = Order.where(condition_sql, *sql_params).count
    @orders = Order.where(condition_sql, *sql_params).page(params[:page]).per(params[:per_page]).order('id desc')
  end

  # GET /order/1
  # GET /order/1.json
  def show; end

  # GET /order/new
  # GET /order/new.json
  def new
    @order = Order.new
    @order.build_branch

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /order/1/edit
  def edit; end

  # POST /order
  # POST /order.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to admin_order_path(@order), notice: 'Order was successfully created.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /order/1
  # PUT /order/1.json
  def update
    respond_to do |format|
      if @order.update_attributes(order_params)
        format.html { redirect_to admin_order_path(@order), notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order/1
  # DELETE /order/1.json
  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to admin_orders_path }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit(:user_id, :branch_id, :number, :title, :contract_date, :enable, :created_at, :updated_at)
  end
end
