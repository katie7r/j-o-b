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
#  priority     :integer
#  status       :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer          not null
#

class Posting < ActiveRecord::Base
  belongs_to :user
end
