#File config/initializers/swagger.rb
Swagger::Docs::Config.register_apis({
    "1.0" => {
      # the extension used for the API
      :api_extension_type => :json,
      # the output location where your .json files are written to
      :api_file_path => "public/",
      # the URL base path to your API
      :base_path => "http://localhost:3000",
      # if you want to delete all .json files at each generation
      :clean_directory => true,
      # add custom attributes to api-docs
      :attributes => {
        :info => {
          "title" => "Spolecznosciowy system informowania o cenach na stacjach paliw",
          "description" => "Rails API documention with Swagger UI.",
          "termsOfServiceUrl" => "",
          "contact" => ""
         }
       }
    }
  })