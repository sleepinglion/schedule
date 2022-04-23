class Admin::OperatorsController < Admin::AdminController
    before_action :set_operator, only: [:show, :edit, :update, :destroy]

    # GET /Users
    # GET /Users.json
    def index
        params[:per_page] = 10 unless params[:per_page].present?

        @operator_count = Operator.count
        @operators = Operator.page(params[:page]).per(params[:per_page]).order('id desc')
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

    # PATCH/PUT /operators/1
    # PATCH/PUT /operators/1.json
    def update
        respond_to do |format|
            if @operator.update(operator_params)
                format.html { redirect_to [:admin, @operator], notice: 'Operator was successfully updated.' }
                format.json { render :show, status: :ok, location: @operator }
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
            format.html { redirect_to admin_operators_url, notice: 'Operator was successfully destroyed.' }
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
        params.require(:operator).permit(:id, :email, :password, :password_confirmation, :enable)
    end
end
