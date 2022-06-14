module User::Cell
  class Index < Trailblazer::Cell
    
    def logged_in?
      options[:logged_in]
    end

    def admin?
      options[:is_admin]
    end
    
    def search_name
      search_name = options[:search_name]
    end

    def search_email
      search_email = options[:search_email]
    end

    def search_from_date
      search_name = options[:search_name]
    end

    def search_to_date
      search_name = options[:search_name]
    end
  end
end