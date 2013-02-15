module Shortener::ShortenerHelper

  # generate a url from a url string
  def short_url(url, owner=nil, options={})
    short_url = Shortener::ShortenedUrl.generate(url, owner)
    url_for_options = {
        :controller => :"shortener/shortened_urls",
        :action => :show,
        :id => short_url.unique_key,
        :only_path => false
    }
    url_for_options[:host] = options[:host] if options[:host]
    short_url ? url_for(url_for_options) : url
  end

end
