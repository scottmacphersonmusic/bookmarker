class Bookmark < ActiveRecord::Base
  validates :title, presence: true,
            length: { minimum: 3 }
  validates :link, presence: true
end
