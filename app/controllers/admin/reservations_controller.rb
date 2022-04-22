class Admin::ReservationsController < Admin::AdminController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  # GET /branches
  # GET /branches.json
  def index
    params[:per_page] = 10 unless params[:per_page].present?

    @reservation_count = Reservation.count
    @reservations = Reservation.page(params[:page]).per(params[:per_page]).order('id desc')
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /branches/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to [:admin, @reservation], notice: t(:message_success_create) }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render action: 'new' }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to [:admin, @reservation], notice: 'reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to admin_reservations_url, notice: 'reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.require(:reservation).permit( :start_datetime, :end_datetime, :enable, :order_id)
  end
end
