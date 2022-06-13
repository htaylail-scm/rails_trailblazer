class User < ApplicationRecord

    # virtual attributes for authentication
    has_secure_password
  
    # to check old password with new password
    attr_accessor :old_password
    attr_accessor :remember_me

    # image
    has_one_attached :profile

    # soft delete
    acts_as_paranoid


end
