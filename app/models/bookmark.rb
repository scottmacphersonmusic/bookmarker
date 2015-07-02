class Bookmark < ActiveRecord::Base
  validates :link, presence: true
end
