require 'reform/form/validation/unique_validator'
module User::Contract
  class Update < Reform::Form
    include Sync::SkipUnchanged
    property :name
    property :email
    property :role
    property :phone   
    property :address
    property :profile
    property :dob
    
    property :created_user_id
    property :updated_user_id

    validates :name, presence: true, length: { maximum: 100 }
    validates :email, presence: true, length: { maximum: 100 },
                unique: true, format:  { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/, message: "must be a valid email format" }
    validates :address, length: { maximum: 255 }    
    validates :profile, length: { maximum: 255 }, presence: true
    validates :phone, :numericality => true,
                      :length => { :minimum => 10, :maximum => 15 }, allow_blank: true
    validates :dob, format: { with: /\d{4}-\d{2}-\d{2}/, message: "date format must be ( yyyy/mm/dd )" }, allow_blank: true
  end
end
