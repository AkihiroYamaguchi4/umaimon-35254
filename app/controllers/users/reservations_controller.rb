class Users::ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
   end
  
   def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to root_path
    else
      render :new
    end
   end
  
   private
  
   def reservation_params
    params.require(:reservation).permit(:allergies, :place, :user_phone_number,:guests,:request).merge(user_id: current_user.id,course_id: params[:course_id])
   end
  
end
