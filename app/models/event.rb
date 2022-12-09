class Event < ApplicationRecord
  # direct link to event_attendance model
  has_many :event_attendances, foreign_key: :attended_event_id
  
  # Gets to users model through event_attendance model because event_attendance's event_attendee_id column is linked to user model
  has_many :attendees, through: :event_attendances, source: :event_attendee
  
  belongs_to :creator, class_name: "User"

  # Create class methods to separate Events by upcoming and past
  # def self.upcoming
  #   @upcoming = Event.where(date: (Time.now)..).order(:date)
  # end
  # def self.past
  #   @past = Event.where(date: ..(Time.now)).order(date: :desc)
  # end

  # Refactored class methods into scopes
  scope :upcoming, -> { where(date: (Time.now)..).order(:date) }
  scope :past, -> { where(date: ..(Time.now)).order(date: :desc) }
end
