User.create!([
  {email: "manager@hotmail.com", encrypted_password: "$2a$10$94hpwyeed7lbRFHuXcPnOuCkmhcVytx9dh3UGLdTZPekSIFoMNVxq", first_name: "Manager", last_name: "", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, user_level: 1},
  {email: "programmer@hotmail.com", encrypted_password: "$2a$10$qggkvgoMjZNwv8Vb0J6Niu0SECD4lf1/EJMb6dxtpLjXxCSvyA0Aq", first_name: "Programmer", last_name: "", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2016-04-07 09:30:09", last_sign_in_at: "2016-04-07 09:30:09", current_sign_in_ip: "173.206.152.217", last_sign_in_ip: "173.206.152.217", user_level: 0},
  {email: "admin@domain.com", encrypted_password: "$2a$10$Br9vvOnhBoONgytsQ/hVsO31pCuYSTg0bas.ft7knpUEtbSB8BAx6", first_name: "Scott", last_name: "Hanton", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2016-04-07 09:36:43", last_sign_in_at: "2016-04-07 09:28:12", current_sign_in_ip: "173.206.152.217", last_sign_in_ip: "173.206.152.217", user_level: 9}
])
Prerequisite.create!([
  {skill_id: 1, level_id: 2, prerequisite_skill_id: 1, prerequisite_level_id: 1}
])
Skill.create!([
  {name: "PHP"},
  {name: "Java"},
  {name: "Ruby"},
  {name: "HTML"},
  {name: "SQL"},
  {name: "Javascript"},
  {name: "C#"},
  {name: "C++"},
  {name: "Python"},
  {name: "IOS"}
])
SkillLevel.create!([
  {level: "Beginner"},
  {level: "Intermediate"},
  {level: "Advanced"},
  {level: "Expert"}
])
UserSkillAssignment.create!([
  {user_id: 3, skill_id: 1, level_id: 1}
])
