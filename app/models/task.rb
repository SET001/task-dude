class Task < ActiveRecord::Base
  has_many :tasks
  belongs_to :task
end
