class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # direct link to event_attendance model
  has_many :event_attendances, foreign_key: :event_attendee_id

  # link for attendees to event model through event_attendance model. dont need "source:" because event_attendance has column named "attended_event_id" 
  has_many :attended_events, through: :event_attendances
  
  # direct link to event model for creators
  has_many :created_events, foreign_key: "creator_id", class_name: "Event"
end
