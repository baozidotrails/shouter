require 'digest/md5'

module ShoutsHelper
  def gravatar user, size = 64, img_class = 'media-object'
    digest = Digest::MD5.hexdigest(user.email)
    image_tag("http://gravatar.com/avatar/#{digest}?s=#{size}", class: "#{img_class}")
  end

  def shouterize text
    link_hashtags(strip_tags(text)).html_safe
  end

  def link_hashtags text
    text.gsub(/#(\w+)/) { |match| link_to(match, hashtag_path($1)) }
  end
end