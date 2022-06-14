class LogMiddleware

    def initialize(app)
        @app = app
    end

    def call(env)

        puts "LogMiddleware has beenhit!!"
        puts "This is test for middleware!"

      
        status, headers, response = @app.call(env)
        [status, headers, response]
    end
end
