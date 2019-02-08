module FormBuilder
  class Themes
    class Bootstrap4Vertical < Themes

      def self.theme_name
        "bootstrap_4_vertical"
      end

      def wrap_field(field_type : String, html_label : String?, html_field : String, field_errors : Array(String)?, wrapper_html_attributes : StringHash)
        "Foo to the Bar"
      end

      def input_html_attributes(html_attrs : StringHash, field_type : String, name : String? = nil, label_text : String? = nil)
        html_attrs["class"] = "form-control"
        html_attrs
      end

      def label_html_attributes(html_attrs : StringHash, field_type : String, name : String? = nil, label_text : String? = nil)
        html_attrs["class"] = "control"
        html_attrs
      end

      def form_html_attributes(html_attrs : StringHash)
        html_attrs["class"] = "#{html_attrs["class"]?} form-vertical".strip
        html_attrs
      end

    end
  end
end