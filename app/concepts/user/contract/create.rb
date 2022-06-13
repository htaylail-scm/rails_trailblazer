require 'reform/form/validation/unique_validator'
module User::Contract
  class Create < Reform::Form
    include Sync::SkipUnchanged
    property :name
    property :email
    property :password
    property :password_confirmation, virtual: true
    property :role
    property :phone
    property :dob
    property :address
    property :profile
   
    property :created_user_id
    property :updated_user_id

    validates :name, presence: true, length: { maximum: 100 }
    validates :email, presence: true, length: { maximum: 100 },
                unique: true, format:  { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/, message: "must be a valid email format" }
    validates :address, length: { maximum: 255 }    

    validates :phone, :presence => {:message => 'Only number accept'},
                     :numericality => true,
                     :length => { :minimum => 10, :maximum => 15 }, allow_blank: true
    validates :password, presence: true, confirmation: true
    validates :password_confirmation, presence: true
    
    validates :dob, format: { with: /\d{4}-\d{2}-\d{2}/, message: "date format should be  ( yyyy/mm/dd )" }, allow_blank: true

  
   

    # PASSWORD_FORMAT = /\A
    # (?=.{8,})          # Must contain 8 or more characters
    # (?=.*\d)           # Must contain a digit
    # (?=.*[a-z])        # Must contain a lower case character
    # (?=.*[A-Z])        # Must contain an upper case character
    # (?=.*[[:^alnum:]]) # Must contain a symbol
    # /x
    # validates :password, confirmation: true, presence: true, format: { with: PASSWORD_FORMAT }, on: :create
   
  end
end
