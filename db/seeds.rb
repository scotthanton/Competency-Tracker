User.create!([
  {email: "user@hotmail.com", encrypted_password: "$2a$10$DkTj1HYqoTaFY1iqQWMWLuLuXS4dLsvfJ1bJb3f10drofVs6IClG2", first_name: "User", last_name: "", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 6, current_sign_in_at: "2016-04-07 04:13:05", last_sign_in_at: "2016-04-05 21:06:27", current_sign_in_ip: "173.206.152.217", last_sign_in_ip: "173.206.75.190", user_level: 0},
  {email: "employer@hotmail.com", encrypted_password: "$2a$10$1t2ZdgHA8jM73/oMwsbBueCQ5m1goYBj/xuoiXYTx3iP6F0ckatOG", first_name: "Employer", last_name: "", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 6, current_sign_in_at: "2016-04-07 05:08:14", last_sign_in_at: "2016-04-07 04:02:58", current_sign_in_ip: "173.206.152.217", last_sign_in_ip: "173.206.152.217", user_level: 1},
  {email: "scott_hanton94@hotmail.com", encrypted_password: "$2a$10$aSmdLNtUDwMvb6CPseD3NOXxvJZG39rv85y3Ze7Mu8pufXwhwXHl2", first_name: "Scott", last_name: "Hanton", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 6, current_sign_in_at: "2016-04-07 06:28:06", last_sign_in_at: "2016-04-07 04:14:14", current_sign_in_ip: "173.206.152.217", last_sign_in_ip: "173.206.152.217", user_level: 9}
])
Conversation.create!([
  {user_id_creator: 3, user_id_recipient: 1, title: "This is the subject line", content: "This is the message contents I am sending.", read: 1},
  {user_id_creator: 3, user_id_recipient: 2, title: "This is a conversation", content: "contents here....", read: 1},
  {user_id_creator: 3, user_id_recipient: 1, title: "Test 2", content: "test 2", read: nil},
  {user_id_creator: 1, user_id_recipient: 3, title: "Hey", content: "Hey this ia test", read: 1},
  {user_id_creator: 2, user_id_recipient: 3, title: "I need your skills", content: "This is my message.", read: nil}
])
Endorsement.create!([
  {user_id: 3, user_id_endorser: 2, user_skill_assignments_id: 4},
  {user_id: 3, user_id_endorser: 2, user_skill_assignments_id: 3}
])
Material.create!([
  {skill_id: 1, description: "This is the description for beginner PHP", material_to_learn: "This is the materials a beginner PHP must know. ", level_id: 1}
])
Reply.create!([
  {user_id: 3, conversation_id: 1, content: "This is my reply. ", read: 1},
  {user_id: 3, conversation_id: 4, content: "This is me again", read: nil},
  {user_id: 2, conversation_id: 2, content: "This is me replying, should show as new message for User and not for me.", read: 1}
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
  {user_id: 2, skill_id: 1, level_id: 3},
  {user_id: 2, skill_id: 1, level_id: 1},
  {user_id: 3, skill_id: 1, level_id: 4},
  {user_id: 3, skill_id: 3, level_id: 1},
  {user_id: 3, skill_id: 1, level_id: 2},
  {user_id: 3, skill_id: 1, level_id: 2},
  {user_id: 3, skill_id: 3, level_id: 3},
  {user_id: 3, skill_id: 2, level_id: 2},
  {user_id: 3, skill_id: 4, level_id: 4},
  {user_id: 3, skill_id: 4, level_id: 4},
  {user_id: 2, skill_id: 3, level_id: 1}
])
