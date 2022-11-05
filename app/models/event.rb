class Event < ApplicationRecord
  validates :description, presence: true
  validates :title,       presence: true
  validates :event_type,  presence: true
  validates :contact,     presence: true
  validates :start_date,  presence: true, numericality: true
  validates :end_date,    presence: true, numericality: true
  validates :price,       presence: true, numericality: true
  validates :location,    presence: true
  validates :slot,        presence: true
  belongs_to :user
end
