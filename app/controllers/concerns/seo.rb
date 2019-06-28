module Seo
  extend ActiveSupport::Concern
  included do 
    after_action do
      if request.get?
        Seo::prepare_meta_tags
      end
    end
    
    #Note: Devise not installed in case another Gem containing a specific version is required.
    #Avoiding version-conflict
    def current_user # for compatibility between Devise-compatible components and Spree (for e-commerce)
      if defined?(spree_current_user) then return spree_current_user end
      return
    end
  end
  def sitename
    'Template Site'
  end
  def prepare_meta_tags(options={})
    if options.nil? then options = (@seo_opts || Hash.new) end

    site_name   = sitename
    title       = 'Template Title'
    description = "Template Description and stuff."
    current_url = request.url
    logo_url = ''

    #logo_url = 'https://www.hyrestaff.com/assets/img/logo.png'

    defaults = {
      site:        site_name,
      title:       title,
      description: description,
      keywords:    ['Shopping', 'Start-ups', 'Full-Service'],
      twitter: {
        site_name: site_name,
        site: 'Shopping Mall',
        card: 'summary',
        description: description,
        image: logo_url
      },
      og: {
        url: current_url,
        site_name: site_name,
        title: title,
        image: logo_url,
        "image:width" => '72',
        "image:height" => '72',
        description: description,
        type: 'website',        
        video: ""
      }
    }
    options.reverse_merge!(defaults)
    set_meta_tags options

  end

end
