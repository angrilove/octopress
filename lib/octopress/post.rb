module Octopress
  class Post < Page

    def set_default_options
      @options['type'] = 'post'
      @options['layout'] =  @config['octopress']['new_post_layout']
      @options['title'] ||= 'New Post'
      @options['date'] = convert_date @options['date'] || Time.now
      @options['extension'] ||= @config['octopress']['new_post_extension']
    end

    def path
      source = @config['source']
      name = "#{date_slug}-#{title_slug}.#{extension}"
      File.join(source, '_posts', name)
    end

    # Post template defaults
    #
    def default_template
      <<-TEMPLATE
---
layout: {{ layout }}
title: {{ title }}
date: {{ date }}
categories: {{ categories }}
---
TEMPLATE
    end
  end
end
