class ReservationsController < ApplicationController
  before_action :authenticate_user!, except: [:notify]

  def preload
    space = Space.find(params[:space_id])
    today = Date.today
    reservations = space.reservations.where(["start_date >= ? or end_date >= ?", today, today])

    render json: reservations
  end

  def preview
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:start_date])

    output = {
      conflict: is_conflict(start_date, end_date)
    }

    render json: output
  end

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
        return: 'http://65f6acd6.ngrok.io/your_rentals'
      }

      redirect_to "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
    else
      redirect_to @reservation.space, alert: "error reserving space..."
    end
  end

  protect_from_forgery except: [:notify]
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

  protect_from_forgery except: [:your_rentals]
  def your_rentals
    @rentals = current_user.reservations
  end

  def your_reservations
    @spaces = current_user.spaces
  end

  private
  def is_conflict(start_date, end_date)
    space = Space.find(params[:space_id])
    check = space.reservations.where("? < start_date and end_date < ?", start_date, end_date)
    check.size > 0? true : false
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :price, :total, :space_id)
  end

end
