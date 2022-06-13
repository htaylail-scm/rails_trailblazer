module Post::Contract
  class Update < Reform::Form
    include Dry

    property :title
    property :body
    property :created_user_id
    property :updated_user_id

    validation do
      required(:title).maybe(min_size?: 1, max_size?: 100)
      required(:body).maybe(min_size?: 9, max_size?: 255)
    end
  end
end
