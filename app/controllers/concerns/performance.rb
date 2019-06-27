module Performance
  extend ActiveSupport::Concern
  included do 
    def inline_css(template_path = nil)
      template_path ||= File.join(controller_path, action_name)
      #@inlined = true
      html = ''
      @defer_assets = true
      begin
        #tries external first, normally fails
        html = Premailer.new(template_path, :warn_level => Premailer::Warnings::SAFE).to_inline_css
      rescue
        html_string = render_to_string template_path
        #rendered = Haml::Engine.new(string).render(self)
        premailer = Premailer.new(
          html_string, 
          with_html_string: true, 
          warn_level: Premailer::Warnings::SAFE,
          remove_scripts: false,
          preserve_styles: true,
          css_to_attributes: true,
          escape_url_attributes: false)
          
        html = premailer.to_inline_css
        
      end
      render html: html.html_safe #html.to_s.html_safe#.html_safe
    end
  end
end