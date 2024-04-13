class Subject < ApplicationRecord
  belongs_to :branch
  has_one :teacher
  has_many :attendances
  has_many :students, through: :attendances
end
