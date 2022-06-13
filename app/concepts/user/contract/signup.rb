module User::Contract
    class Signup < Reform::Form
      include Sync::SkipUnchanged
      property :name
      property :email
      property :password
      property :password_confirmation, virtual: true
  
      validates :name, presence: true, length: { maximum: 100 }
      validates :email, presence: true, length: { maximum: 100 },
                unique: true, format:  { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/, message: "must be a valid email format" }
      validates :password, presence: true, confirmation: true
      validates :password_confirmation, presence: true
    end
  end
  