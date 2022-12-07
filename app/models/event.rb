class Event < ApplicationRecord
  # direct link to event_attendance model
  has_many :event_attendances, foreign_key: :attended_event_id
  
  # Gets to users model through event_attendance model because event_attendance's event_attendee_id column is linked to user model
  has_many :attendees, through: :event_attendances, source: :event_attendee
  
  belongs_to :creator, class_name: "User"
end
