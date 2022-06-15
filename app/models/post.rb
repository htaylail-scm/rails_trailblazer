class Post < ApplicationRecord

  belongs_to :user, :foreign_key => :created_user_id, :primary_key => :id, :dependent => :destroy, optional: true
  belongs_to :created_user, class_name: 'User', foreign_key: 'created_user_id'
  belongs_to :updated_user, class_name: 'User', foreign_key: 'updated_user_id'

  require 'csv'
  # soft delete
  acts_as_paranoid
end