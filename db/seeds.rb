user = User.new
user.first_name = 'Scott'
user.last_name = 'Hanton'
user.email = 'scott_hanton94@hotmail.com'
user.password = 'test1234'
user.password_confirmation = 'test1234'
user.user_level = '9'
user.save!

user = User.new
user.first_name = 'Employer'
user.last_name = ''
user.email = 'employer@hotmail.com'
user.password = 'test1234'
user.password_confirmation = 'test1234'
user.user_level = '1'
user.save!

user = User.new
user.first_name = 'User'
user.last_name = ''
user.email = 'user@hotmail.com'
user.password = 'test1234'
user.password_confirmation = 'test1234'
user.user_level = '0'
user.save!

skills_list = [
  "PHP",
  "Java",
  "Ruby",
  "HTML",
  "SQL",
  "Javascript",
  "C#",
  "C++",
  "Python",
  "IOS"
]

skills_list.each do |name|
  Skill.create!([
    {name: name, created_at: "2016-03-24 08:11:57", updated_at: "2016-03-24 08:11:57"}
  ])
end

levels_list = [
  "Beginner",
  "Intermediate",
  "Advanced",
  "Expert"
]

levels_list.each do |name|
  SkillLevel.create!([
    {level: name, created_at: "2016-03-24 08:11:57", updated_at: "2016-03-24 08:11:57"}
  ])
end