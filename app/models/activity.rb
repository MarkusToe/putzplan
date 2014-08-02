class Activity < ActiveRecord::Base
  has_many :cleaning_dates
  has_many :users, through: :cleaning_dates
end
