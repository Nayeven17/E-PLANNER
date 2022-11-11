class Event < ApplicationRecord
  has_one_attached :photo
  validates :description, presence: true
  validates :title,       presence: true
  validates :category,  presence: true
  validates :contact,     presence: true
  validates :start_date,  presence: true
  validates :end_date,    presence: true
  validates :price,       presence: true, numericality: true
  validates :location,    presence: true
  validates :slot,        presence: true
  belongs_to :user
end
