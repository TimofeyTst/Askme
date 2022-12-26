class Question < ApplicationRecord
  belongs_to :user
  has_one :anwser, dependent: :destroy
end
