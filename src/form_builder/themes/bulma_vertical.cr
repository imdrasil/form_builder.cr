module FormBuilder
  class Themes
    class BulmaVertical < Themes

      def wrap_field(field_type : String, html_field : String, html_label : String?, html_help_text : String?, field_errors : Array(String)?, wrapper_html_attributes : StringHash)
        String.build do |s|
          wrapper_html_attributes["class"] = "field #{wrapper_html_attributes["class"]?}".strip

          attr_str = build_html_attr_string(wrapper_html_attributes)
          s << "#{attr_str.empty? ? "<div>" : %(<div #{attr_str}>)}"

          if {"checkbox", "radio"}.includes?(field_type) && html_label
            s << %(<div class="control">#{html_label.sub("\">", "\">#{html_field} ")}</div>)
          else
            s << html_label
            s << %(<div class="control">#{html_field}</div>)
          end

          s << "</div>"
        end
      end

      def input_html_attributes(html_attrs : StringHash, field_type : String)
        html_attrs
      end

      def label_html_attributes(html_attrs : StringHash, field_type : String)
        if {"checkbox", "radio"}.includes?(field_type)
          html_attrs["class"] = "#{field_type} #{html_attrs["class"]?}".strip
        else
          html_attrs["class"] = "label #{html_attrs["class"]?}".strip
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
