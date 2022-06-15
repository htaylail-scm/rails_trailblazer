class User < ApplicationRecord
    
    # to delete relate user posts
    has_many :posts, :foreign_key => :created_user_id, :primary_key => :id, :dependent => :destroy
    belongs_to :created_user, class_name: 'User', foreign_key: 'created_user_id'
    belongs_to :updated_user, class_name: 'User', foreign_key: 'updated_user_id'

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