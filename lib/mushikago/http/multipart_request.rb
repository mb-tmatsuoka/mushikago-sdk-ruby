# -*- coding: utf-8 -*-
module Mushikago
  module Http
    class MultipartRequest < Request
      CR = "\015"
      LF = "\012"
      EOL = CR+LF

      def to_http_request
        http_request = new_http_request
        headers.each do |key, value|
          http_request[key] = value
        end
        boundary = 'boundary'
        http_request.set_content_type 'multipart/form-data', {'boundary' => boundary}
        http_request.body = multipart_body(boundary)
        http_request.content_length = http_request.body.size
        return http_request
      end

      def multipart_body boundary='boundary'
        content = ''

        files, parameters = params.partition{|k, v| v.kind_of?(File)}
        parameters.each do |k, v|
          content << [
            %Q|--#{boundary}|,
            %Q|Content-Disposition: form-data; name="#{k}"|,
            %Q||,
            %Q|#{v}|
          ].join(EOL)
          content << EOL
        end

        files.each do |k, v|
          v.rewind
          content_type = ''
          begin
            content_type = MIME::Types.of(v.path).to_s
          rescue NameError => e
          ensure
            content_type = "application/octet-stream" if content_type.to_s.empty?
          end
          content << [
            %Q|--#{boundary}|,
            %Q|Content-Disposition: form-data; name="#{k}"; filename="#{File::basename(v.path)}"|,
            %Q|Content-Type: "#{content_type}"|,
            %Q||,
            %Q|#{v.read}|
          ].join(EOL)
          content << EOL

          return content
        end
      end
    end
  end
end

