class Playlist < ActiveRecord::Base
  belongs_to :user, touch: true
  has_and_belongs_to_many :songs
end
