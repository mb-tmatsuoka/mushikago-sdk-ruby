# -*- coding: utf-8 -*-
module Mushikago
  module Mitsubachi
    class ResourceStoreRequest < Mushikago::Http::MultipartPostRequest
      def path; '/1/mitsubachi/resource/store' end
      request_parameter :project_name
      request_parameter :file
      request_parameter :file_name
      request_parameter :content_type
      request_parameter :public, :default=>false do |v| (v ? 1 : 0).to_s end

      def initialize project_name, file_or_file_name, options={}
        super(options)
        self.project_name = project_name
        if(file_or_file_name.kind_of?(File))
          self.file = file_or_file_name
        else
          self.file = File.new(file_or_file_name.to_s)
        end
        self.file_name = options[:file_name] || file.path
        self.content_type = options[:content_type] || MIME::Types.of(file.path).first.to_s
        self.public = options[:public]
      end
    end
  end
end



