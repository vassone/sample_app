# == Schema Information
# Schema version: 20100520213130
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base

  EmailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  attr_accessor :password # virtual attribute, in memory only, not in db
  attr_accessible :name, :email, :password, :password_confirmation

  validates_presence_of :name, :email
  validates_length_of :name, :maximum => 50
  validates_format_of :email, :with => EmailRegex
  validates_uniqueness_of :email, :case_sensitive => false
  
  # Automatically create the virtual attribute "password_confirmation".
  validates_confirmation_of :password

  # Password validations.
  validates_presence_of :password
  validates_length_of :password, :within => 6..40  
end
