class ReservationsController < ApplicationController
  before_action :authenticate_user!, except: [:notify]

  def create
    @reservation = current_user.reservations.create(reservation_params)

    if @reservation
      # send request to PayPal
      values = {
        business: 'kevin2005tran-facilitator@yahoo.com',
        cmd: '_xclick',
        upload: 1,
        notify_url: 'http://65f6acd6.ngrok.io/notify',
        amount: @reservation.total,
        item_name: @reservation.space.title,
        item_number: @reservation.id,
        quantity: '1',
        return: 'http://65f6acd6.ngrok.io/your_trips'
      }

      redirect_to "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
    else
      redirect_to @reservation.space, alert: "error reserving space..."
    end
  end

  def notify
    params.permit!
    status = params[:payment_status]

    reservation = Reservation.find(params[:item_number])

    if status = "Completed"
      reservation.update_attributes status: true
    else
      reservation.destroy
    end

    render nothing: true
  end

  private
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :total, :space_id)
  end

end
