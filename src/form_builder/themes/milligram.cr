module FormBuilder
  class Themes
    class Milligram < Themes

      def wrap_field(field_type : String, html_field : String, html_label : String?, html_help_text : String?, field_errors : Array(String)?, wrapper_html_attributes : StringHash)
        String.build do |s|
          attr_str = build_html_attr_string(wrapper_html_attributes)
          s << "#{attr_str.empty? ? "<div>" : %(<div #{attr_str}>)}"

          if {"checkbox", "radio"}.includes?(field_type)
            s << html_field
            s << html_label
          else
            s << html_label
            s << html_field
          end

          s << "</div>"
        end
      end

      def input_html_attributes(html_attrs : StringHash, field_type : String)
        html_attrs
      end

      def label_html_attributes(html_attrs : StringHash, field_type : String)
        if {"checkbox", "radio"}.includes?(field_type)
          html_attrs["class"] = "label-inline #{html_attrs["class"]?}".strip
        end

        html_attrs
      end

      def form_html_attributes(html_attrs : StringHash)
        html_attrs
      end

      def build_html_help_text(help_text : String, html_attrs : StringHash)
        html_attrs["class"] = "help-text #{html_attrs["class"]?}".strip

        String.build do |s|
          s << html_attrs.empty? ? %(<div #{build_html_attr_string(html_attrs)}>) : "<div>"
          s << "#{help_text}</div>"
        end
      end

    end
  end
end
