class User < ApplicationRecord #ApplicationRecord
  include Clearance::User
  has_many :authentications, :dependent => :destroy

  enum gender: ['Undefined', 'Male', 'Female']

  #   def user_params
  #       params.require(:User).permit(:Email, :Password, :Fullname, :Gender)
  # end
  def self.create_with_auth_and_hash(authentication, auth_hash)
    create! do |u|
      # user = User.create!(full_name: auth_hash["name"], email: auth_hash["extra"]["raw_info"]["email"])
      u.fullname = auth_hash["info"]["name"]
      u.email = auth_hash["extra"]["raw_info"]["email"]
      u.authentications << (authentication)
      u.password = SecureRandom.hex(7)
                                                        # add more scopes for gender and age
    end
  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end

end
