class Shout < ActiveRecord::Base
  belongs_to :user
  # So the shouts table should have column 'content_type' and 'content_id'
  belongs_to :content, polymorphic: true
  default_scope { order("created_at DESC") }

  # validates_presence_of :content_type
  # validates_presence_of :content_id, unless: Proc.new { |a|
  #   #if it's a new record and addressable is nil and addressable_type is set
  #   #   then try to find the addressable object in the ObjectSpace
  #   #       if the addressable object exists, then we're valid;
  #   #       if not, let validates_presence_of do it's thing
  #   if (new_record? && !content && content_type)
  #     content = nil
  #     ObjectSpace.each_object(content_type.constantize) do |o|
  #       content = o if o.content.include?(a) unless content
  #     end
  #   end
  #   content
  # }
  def self.text_shouts
    where(content_type: 'TextShout')
  end

  searchable do
    text :content do
      content.index
    end
  end
end
