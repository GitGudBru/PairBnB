class User < ApplicationRecord #ApplicationRecord
  include Clearance::User

  enum gender: ['Undefined', 'Male', 'Female']

  #   def user_params
  #       params.require(:User).permit(:Email, :Password, :Fullname, :Gender)
  # end

end
