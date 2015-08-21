# == Schema Information
#
# Table name: postings
#
#  id           :integer          not null, primary key
#  quickname    :string
#  job_title    :string           not null
#  job_url      :string           not null
#  company      :string
#  company_url  :string
#  description  :text
#  requirements :text
#  notes        :text
#  remote       :boolean          default(FALSE)
#  full_time    :boolean          default(TRUE)
#  priority     :integer          default(0)
#  status       :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer          not null
#

class Posting < ActiveRecord::Base
  enum priority: ['no', 'very low', 'low', 'medium', 'high', 'very high', 'top']
  enum status:   ['not started', 'on deck', 'in progress', 'applied', 'response received', 'closed']

  belongs_to :user

  validates :job_title, :job_url, :user_id, presence: true

  # Sorting

  def self.by_priority
    order('priority DESC')
  end

  def self.by_status_asc
    order('priority ASC')
  end

  def self.by_status_desc
    order('priority DESC')
  end

  # Filters

  def self.unsubmitted
    where(status: [0, 1, 2])
  end

  def self.submitted
    where(status: [3, 4])
  end

  # ?
  def self.prioritized(priority)
    where(priority: priority)
  end

  # ?
  def self.prioritized_at_least(priority)
    prioritized(priorities_at_least(priority))
  end

  def self.remote
    where(remote: true)
  end

  def self.local
    where(remote: false)
  end

  def self.full_time
    where(full_time: true)
  end

  def self.part_time
    where(full_time: false)
  end

  # Misc

  def self.priorities_at_least(priority)
    minimum_priority  = self.priorities[priority]
    return self.priorities.select{ |k, v| v >= minimum_priority }
  end

end
