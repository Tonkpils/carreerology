class ApplicationForm < ActiveRecord::Base
  belongs_to :job

  validates_presence_of :name, :email, :address, :phone_number, :job_id
  validates_uniqueness_of :email, :phone_number, scope: :job_id
end
