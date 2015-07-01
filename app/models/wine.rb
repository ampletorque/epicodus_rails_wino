class Wine < ActiveRecord::Base
  has_many :reviews

  validates :name, :presence => true
  validates :year, :presence => true
  validates :grapes, :presence => true
  validates :label, :presence => true
  validates :winery, :presence => true


end
