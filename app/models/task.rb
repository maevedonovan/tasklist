class Task < ActiveRecord::Base
  belongs_to :task_list

  validates :title, :task_list, :due_date, :priority, presence:true
  validates :priority, numericality:true, inclusion:{in: 1..10}

  scope :completed, -> {where(is_completed: true).order("created_at asc")}
  scope :pending, -> {where(is_completed: false).order("created_at desc")}
end
