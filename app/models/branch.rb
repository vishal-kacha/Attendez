class Branch < ApplicationRecord
  has_many :students
  has_many :subjects
  has_many :teachers
end
