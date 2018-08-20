module Oak
  class Post < ApplicationRecord
    belongs_to :author, class_name: Oak.author_class.to_s
    before_validation :set_author

    extend FriendlyId
    friendly_id :title, use: :slugged
    
    scope :live, -> { where( live: true ) }
    
    private
      def set_author
        self.author = Oak.author_class.find_by(id: author_id.to_i)
      end
    
  end
end