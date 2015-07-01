class Wine < ActiveRecord::Base
  has_many :reviews

  validates :name, :presence => true
  validates :year, :presence => true
  validates :grapes, :presence => true
  validates :label, :presence => true
  validates :winery, :presence => true

  def average_rating
    if (self.reviews.size > 0)
      sum = 0
      self.reviews.each do |review|
        sum += review.rating
      end
      result = (sum/self.reviews.size)
    else
      result = 0
    end
    return result
  end





  scope :sorted_by, lambda { |sort_option|
    # extract the sort direction from the param value.
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^year_/
      order("this.year #{ direction }")
    when /^name_/
      order("this.name #{ direction }")
    when /^rating/
      order("this.average_rating #{ direction }")
    else
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }
  #  ->(sort_type) { order('updated_at')}

    # order('updated_at ')

end
