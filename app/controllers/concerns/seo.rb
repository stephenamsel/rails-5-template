module Seo
  extend ActiveSupport::Concern
  included do 
    after_action do
      if request.get?
        Seo::prepare_meta_tags
      end
    end
    
    def current_user # for Devise-like compatibility
      spree_current_user
    end
  end
  def sitename
    'Shopping Mall'
  end
  def prepare_meta_tags(options={})
    if options.nil? then options = (@seo_opts || Hash.new) end

    site_name   = sitename
    title       = 'Everything you need'
    description = "Lots of shops for just what you need, and maybe some stuff you don't."
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
