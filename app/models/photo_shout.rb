class PhotoShout < ActiveRecord::Base
  has_attached_file :image, styles: { shout: '200x200>' }
  # Paperclip issue
  # http://stackoverflow.com/questions/21897725/papercliperrorsmissingrequiredvalidatorerror-with-rails-4
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
