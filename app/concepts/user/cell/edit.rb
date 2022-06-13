module User::Cell
  class Edit < New
    
    def admin?
      options[:is_admin]
    end
  end
end

