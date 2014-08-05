require 'digest/md5'

module ShoutsHelper
  def gravatar user, size = 64, img_class = 'media-object'
    digest = Digest::MD5.hexdigest(user.email)
    image_tag("http://gravatar.com/avatar/#{digest}?s=#{size}", class: "#{img_class}")
  end
end