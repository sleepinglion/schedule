class Admin::UsersController < Admin::AdminController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /Users
  # GET /Users.json
  def index
    params[:per_page] = 10 unless params[:per_page].present?

    @user_count = User.count
    @users = User.page(params[:page]).per(params[:per_page]).order('id desc')
  end

  # GET /Users/1
  # GET /Users/1.json
  def show
  end

  # GET /Users/new
  def new
    @user = User.new
  end

  # GET /Users/1/edit
  def edit
  end

  # POST /Users
  # POST /Users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to [:admin, @user], notice: 'User was successfully created.'}
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Users/1
  # PATCH/PUT /Users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to [:admin, @user], notice: 'User was successfully updated.'}
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Users/1
  # DELETE /Users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url, notice: 'User was successfully destroyed.'}
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :address_id, :phone, :enable)
  end
end
