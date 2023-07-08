class Topic < ApplicationRecord
  
  # Validation
  validates :title, presence: true
  
  #
   # nameの文字数は、1文字から10文字まで
  validates :name,
    length: { minimum: 1, maximum: 10 }
  
end
