class Post < ApplicationRecord
    require 'csv'
    # soft delete
    acts_as_paranoid

end
