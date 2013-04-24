module Fullstay
  class API < Grape::API
    prefix 'api'
    format :json

    helpers do
      def current_user
        @current_user ||= User.authorize!(env)
      end

      def authenticate!
        error!('401 Unauthorized', 401) unless current_user
      end
    end

    # Handle any User related calls
    resource :users do
      desc 'Return the information for the user with :id'
      params do
        requires :id, :type => Integer, :desc => 'User id'
      end
      get :id do
        #return User.find(params[:id])
        return 'User ' + params[:id]
      end

      desc 'Create a new user'
      params do
        requires :name, :type => String, :desc => 'User name'
        requires :email, :type => String, :desc => 'User email'
      end
      put do
        #return User.find(params[:id])
        return 'New User ' + params[:name]
      end
    end

    # Handle any Hotel related calls
    resource :hotels do
      desc 'Return the list of hotels'
      get do
        #Hotels.all
        return 'This is a list of hotels'
      end

      desc 'Return the information for the hotel with :id'
      params do
        requires :id, :type => Integer, :desc => 'Hotel id'
      end
      get :id do
        #return Hotel.find(params[:id])
        return 'Hotel ' + params[:id]
      end

      desc 'Bidding on a room at the hotel'
      params do
        requires :id, :type => Integer, :desc => 'Hotel id'
      end
      put 'bid' do
        return 'Bidding on a room at hotel ' + params[:id]
      end

      desc 'Getting available rooms at hotel'
      params do
        requires :id, :type => Integer, :desc => 'Hotel id'
        requires :checkin, :type => Date, :desc => 'Checkin date'
        requires :checkout, :type => Date, :desc => 'Checkout date'
      end
      get 'available_rooms' do
        return 'Available rooms in hotel ' + params[:id]
      end
    end

    # Handle any Booking related calls
    resource :bookings do
      desc 'Return the information for the booking with :id'
      params do
        requires :id, :type => Integer, :desc => 'Booking id'
      end
      get :id do
        #return Booking.find(params[:id])
        return 'Booking ' + params[:id]
      end

      desc 'Creates a new Booking'
      params do
        requires :hotel, :type => Integer, :desc => 'Hotel id'
        requires :room, :type => Integer, :desc => 'Room id'
        requires :checkin, :type => Date, :desc => 'Checkin date'
        requires :checkout, :type => Date, :desc => 'Checkout date'
      end
      put do
        return 'New Booking with hotel ' + params[:hotel]
      end

      desc 'Cancelingthe booking'
      params do
        requires :id, :type => Integer, :desc => 'Booking id'
      end
      put 'cancel' do
        return 'Canceling booking ' + params[:id]
      end
    end

    # Handle any Payment related calls
    resource :payments do
      desc 'Return the information for the payment with :id'
      params do
        requires :id, :type => Integer, :desc => 'Payment id'
      end
      get :id do
        #return Payment.find(params[:id])
        return 'Payment ' + params[:id]
      end

      desc 'Create a new payment'
      params do
        requires :booking, :type => Integer, :desc => 'Booking id'
        requires :payment_type, :type => String, :desc => 'Payment type'
        requires :payment_info, :type => String, :desc => 'Credit Card #, other info'
      end
      put do
        return 'New Payment for booking ' + params[:booking]
      end
    end

    # Handle any Review related calls
    resource :reviews do
      desc 'Return a list of reviews'
      get do
        return 'Here are all the reviews'
      end

      desc 'Return the information for the review with :id'
      params do
        requires :id, :type => Integer, :desc => 'Review id'
      end
      get :id do
        #return Review.find(params[:id])
        return 'Review ' + params[:id]
      end

      desc 'Creates a new review'
      params do
        requires :hotel, :type => Integer, :desc => 'Hotel id'
        requires :rating, :type => Integer, :desc => 'Hotel rating'
        requires :comments, :type => String, :desc => 'User comments'
      end
      put do
        return 'New Review for hotel' + params[:hotel]
      end
    end
  end
end
