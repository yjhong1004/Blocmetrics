class RegisteredApplication < ApplicationRecord
  belongs_to :user, optional: true
  has_many :events
end
