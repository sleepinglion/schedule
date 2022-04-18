class Admin::OperatorsController < Admin::AdminController
    before_action :set_operator, only: [:show, :edit, :update, :destroy]

    # GET /Users
    # GET /Users.json
    def index
        params[:per_page] = 10 unless params[:per_page].present?

        condition = { enable: true }

        @operator_count = Operator.where(condition).count
        @operators = Operator.where(condition).page(params[:page]).per(params[:per_page]).order('id desc')
    end

    def show; end

    # GET /operators/new
    # GET /operators/new.json
    def new
        @operator = Operator.new

        respond_to do |format|
            format.html # new.html.erb
            format.json { render json: @operator }
        end
    end

    # GET /operators/1/edit
    def edit; end

    # POST /operators
    # POST /operators.json
    def create
        @operator = Operator.new(operator_params)

        respond_to do |format|
            if @operator.save
                format.html { redirect_to admin_operator_path(@operator), notice: @controller_name + t(:message_success_insert) }
                format.json { render json: @operator, status: :created, location: @operator }
            else
                format.html { render :new }
                format.json { render json: @operator.errors, status: :unprocessable_entity }
            end
        end
    end

    # PUT /operators/1
    # PUT /operators/1.json
    def update
        respond_to do |format|
            if @operator.update(operator_params)
                format.html { redirect_to admin_operator_path(@operator), notice: @controller_name + t(:message_success_update) }
                format.json { head :no_content }
            else
                format.html { render :edit }
                format.json { render json: @operator.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /operators/1
    # DELETE /operators/1.json
    def destroy
        @operator.destroy

        respond_to do |format|
            format.html { redirect_to admin_operators_path }
            format.json { head :no_content }
        end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_operator
        @operator = Operator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def operator_params
        params.require(:operator).permit(:login_id, :parent_id, :nickname, :email, :password, :password_confirmation, :enable)
    end
end
