class Review < ActiveRecord::Base
  belongs_to :wine

  validates :description, :presence => true
  validates :rating, :presence => true
  validates :user, :presence => true



end
