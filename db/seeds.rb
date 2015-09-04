def coin_flip
  [true, false].sample
end

def description
  d = ''
  rand(10).times{ d += "- #{Faker::Lorem.sentence}" }
  return d
end

user = User.where(email: 'katie@test.org').first_or_initialize
user.password = user.password_confirmation = 'testing123'
user.save!

postings = []
15.times do
  posting = {}

  posting[:user_id]      = user.id
  posting[:quickname]    = Faker::App.name
  posting[:job_title]    = "#{Faker::Company.buzzword} #{Faker::Hacker.verb}er".titleize
  posting[:job_url]      = Faker::Internet.url
  posting[:company]      = "#{Faker::Hacker.noun.titleize}-#{Faker::Hacker.ingverb.titleize} #{Faker::Team.creature.titleize}"
  posting[:company_url]  = Faker::Internet.url
  posting[:description]  = coin_flip ? description : ''
  posting[:requirements] = coin_flip ? Faker::Lorem.sentence  : ''
  posting[:notes]        = coin_flip ? Faker::Lorem.paragraph : ''
  posting[:remote]       = coin_flip
  posting[:full_time]    = coin_flip
  posting[:priority]     = Posting.priorities.keys.sample
  posting[:status]       = Posting.statuses.keys.sample

  postings << posting
end

Posting.create(postings)
