class Admin::AddressCategoriesController < Admin::AdminController
  before_action :set_address_category, only: [:show, :edit, :update, :destroy]

  # GET /address_categories
  # GET /address_categories.json
  def index
    params[:per_page] = 10 unless params[:per_page].present?

    @address_category_count = AddressCategory.count
    @address_categories = AddressCategory.page(params[:page]).per(params[:per_page]).order('id desc')
  end

  # GET /address_categories/1
  # GET /address_categories/1.json
  def show
  end

  # GET /address_categories/new
  def new
    @address_category = AddressCategory.new
  end

  # GET /address_categories/1/edit
  def edit
  end

  # POST /address_categories
  # POST /address_categories.json
  def create
    @address_category = AddressCategory.new(address_category_params)

    respond_to do |format|
      if @address_category.save
        format.html { redirect_to [:admin, @address_category], notice: t(:message_success_create) }
        format.json { render :show, status: :created, location: @address_category }
      else
        format.html { render action: 'new' }
        format.json { render json: @address_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /address_categories/1
  # PATCH/PUT /address_categories/1.json
  def update
    respond_to do |format|
      if @address_category.update(address_category_params)
        format.html { redirect_to [:admin, @address_category], notice: 'receipt was successfully updated.' }
        format.json { render :show, status: :ok, location: @address_category }
      else
        format.html { render :edit }
        format.json { render json: @address_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /address_categories/1
  # DELETE /address_categories/1.json
  def destroy
    @address_category.destroy
    respond_to do |format|
      format.html { redirect_to admin_address_categories_url, notice: 'receipt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_address_category
    @address_category = AddressCategory.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def address_category_params
    params.require(:address_category).permit(:title)
  end
end
