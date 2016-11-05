module ApplicationHelper
  def pagination_links(collection, options = {})
   options[:renderer] ||= BootstrapPaginationHelper::LinkRenderer
   options[:class] ||= 'pagination pagination-centered pagination-sm'
   options[:inner_window] ||= 2
   options[:outer_window] ||= 1
   will_paginate(collection, options)
  end

  def avatar_url(model)
    gravatar_id = Digest::MD5::hexdigest(model.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}?s=48&d=mm"
  end

  def avatar_tag(model, options = {})
    image_tag avatar_url(model), options
  end

  def add_http(url)
    url = "http://#{url}" unless url[/\Ahttp:\/\//] || url[/\Ahttps:\/\//]
    url
  end
end
