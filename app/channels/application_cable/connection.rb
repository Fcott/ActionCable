module ApplicationCable
  class Connection < ActionCable::Connection::Base
    include SessionsHelper
    identified_by :message_user

    def connect
      self.message_user = find_varified_user
    end

    private
    def find_varified_user
      if logged_in?
        current_user
      else
        reject_unauthorized_connection
      end
    end
  end
end
