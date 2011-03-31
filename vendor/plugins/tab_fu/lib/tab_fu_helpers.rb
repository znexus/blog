module TabFu
  module Helpers

    include TabFu::ListHelper  

    def tabs(options = {})
      id = options.delete(:id) || '__default'
      html_id = id.nil? || id == '__default' ? '' : " id=\"#{id}\""
      t = "<ul#{html_id}>"
      t << yield(List.new(self, id, options))
      t << '</ul>'
      t.html_safe
    end

  end
end