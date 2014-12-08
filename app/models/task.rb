class Task < ActiveRecord::Base

  validates :description, presence: true, length: {maximum: 255}

  scope :completed, -> { where(:completed => true) }
  scope :incompleted, -> { where(:completed => false) }

end
