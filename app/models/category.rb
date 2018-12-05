class Category < ApplicationRecord
  validates :name, presence: true, Length: {minimum:3,maximum:25}
  validates_uniqueness_of :name
  
  
end
