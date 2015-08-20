class Job < ActiveRecord::Base
  has_many :application_forms, dependent: :delete_all

  validates_presence_of :name, :description
end
