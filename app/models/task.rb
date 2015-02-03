class Task < ActiveRecord::Base
  validates :name, presence: true, length: {minimum: 1}

  # in your form for creating a new task, there is no place to set priority
  # so you can either add priority to your form, or take out the validation that checks for priority
  # otherwise the task can't save (that's the point of validations in general - they make it impossible to save incomplete objects)

  # validates :priority, presence: true
  # validates :priority, inclusion: 0..5
  belongs_to :list
  has_many :notes, dependent: :destroy
end
