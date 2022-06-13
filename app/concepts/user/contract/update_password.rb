module User::Contract
    class UpdatePassword < Reform::Form
        include Sync::SkipUnchanged
        property :old_password
        property :password
        property :password_confirmation,virtual: true
        
        validates :old_password, presence: true
        validates :password, presence: true, confirmation: true
        validates :password_confirmation, presence: true
    end
end
