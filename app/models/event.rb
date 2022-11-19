class Event < ApplicationRecord
  has_one_attached :photo
  # validates :description, presence: true
  # validates :title,       presence: true
  # validates :category,  presence: true
  # validates :contact,     presence: true
  # validates :start_date,  presence: true
  # validates :end_date,    presence: true
  # validates :price,       presence: true, numericality: true
  # validates :location,    presence: true
  # validates :slot,        presence: true
  belongs_to :user

  include PgSearch::Model

  pg_search_scope :search_by_title_and_description,
                  against: [ :title, :description, :location ],
                  using: {
                    tsearch: { prefix: true } # <-- now `superman batm` will return something!
                  }

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
