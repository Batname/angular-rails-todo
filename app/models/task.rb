class Task < ActiveRecord::Base

  acts_as_list  column: :priority, add_new_at: :top
  validates :description, presence: true, length: {maximum: 255}

  scope :completed, -> { where(:completed => true) }
  scope :incompleted, -> { where(:completed => false) }

  def target_priority=(value)
    insert_at(value.to_i)
  end

end
