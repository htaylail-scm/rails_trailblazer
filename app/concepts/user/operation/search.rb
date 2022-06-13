module User::Operation
    class Search < Trailblazer::Operation
      step :get_users
        
      def get_users(options, params:, **)
        name = params[:name]
        email = params[:email]
        from_date = params[:search_from_date]   
        to_date = params[:to_date]
        if from_date.present? and to_date.present?
            options['users'] = User.where("name like ? and email like ? and created_at >= ? and created_at <= ?", "%" + name + "%", "%" + email + "%", from_date, Date.parse(to_date)+1)
          elsif from_date.present?
            options['users'] = User.where("name like ? and email like ? and created_at >= ?", "%" + name + "%", "%" + email + "%", from_date)
          elsif to_date.present?
            options['users'] = User.where("name like ? and email like ? and created_at <= ?", "%" + name + "%", "%" + email + "%", Date.parse(to_date)+1)
          elsif name.present?
            options['users'] = User.where("name like ? and email like ?", "%" + name + "%", "%" + email + "%")
          else
          options['users'] = User.all
        end    
      end
    end
end













# module User::Operation
#     class Search < Trailblazer::Operation
#       step :get_users
  
#       def get_users(options, params:, **)
#         options['users'] = User.where("id LIKE :id or name LIKE :name or email LIKE :email", {:id => "%#{params[:search_keyword]}%", :name => "%#{params[:search_keyword]}%", :email => "%#{params[:search_keyword]}%"})
                          
#         # abort options['last_search_keyword'].inspect
#         # abort params[:search_keyword].inspect
#         options['search_name'] = params[:search_keyword]
#         options['search_email'] = params[:search_keyword]
#         # options['search_from_date'] = params[:search_keyword]
#         # options['search_to_date'] = params[:search_keyword]
        
#       end
#     end
# end