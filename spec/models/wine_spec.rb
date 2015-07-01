require 'rails_helper'

describe Wine do
  it { should validate_presence_of :name }
  it { should validate_presence_of :year }
  it { should validate_presence_of :grapes }
  it { should validate_presence_of :label }
  it { should validate_presence_of :winery }

  it { should have_many :reviews }
end
