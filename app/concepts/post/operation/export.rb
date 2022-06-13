require 'csv'
module Post::Operation::Export
  class CsvData < Trailblazer::Operation
    step :get_posts
    step :to_csv_format!

    def get_posts(options, **)
      options[:posts] = Post.all
    end

    def to_csv_format!(options, **)
      attributes = %w[title body]
      options[:posts_csv] = CSV.generate(headers: true) do |csv|
          csv << attributes
          options[:posts].each do |post|
          csv << attributes.map { |attr| post.send(attr) }
        end
      end
    end
  end
end
