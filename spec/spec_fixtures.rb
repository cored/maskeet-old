User.fix(:anonymous) {{
  :login      => 'anonymous',
  :first_name => 'Anonymous',
  :last_name  => 'Coward'
}}

User.fix(:cored) {{
  :login      => 'cored',
  :first_name => 'Rafael',
  :last_name  => 'George'
}}

User.fix(:dobot) {{
  :login      => 'dobot',
  :first_name => 'Bob',
  :last_name  => 'Do'
}}

User.gen(:anonymous).create
User.gen(:cored).create
User.gen(:dobot).create

Question.fix(:question1) {{
  :user_id  => User.pick(:cored).id,
  :title => 'What shall I do tonight with my girlfriend?',
  :body  => 'We shall meet in front of the Dunkin Donuts before dinner.'
}}

Question.fix(:question2) {{
  :user_id  => User.pick(:anonymous).id,
  :title => 'What can I offer to my step mother?',
  :body  => 'My stepmother has everything a stepmother is usually offered (watch, vacuum cleaner, earrings, del.icio.us account). Her birthday comes next week, I am broke, and I know that if I do not offer her something sweet, my girlfriend will not look at me in the eyes for another month.'
}}

Question.fix(:question3) {{
  :user_id  => User.pick(:dobot).id,
  :title => 'How can I generate traffic to my blog?',
  :body  => 'I have a very swell blog that talks about my class and mates and pets and favorite movies.'
}}

Question.gen(:question1).create
#Question.gen(:question2).create
#Question.gen(:question3).create

Interest.fix(:interest1) {{
  :user_id     => User.pick(:cored).id,
  :question => Question.pick(:question1)
}}

Interest.fix(:interest2) {{
  :user_id     => User.pick(:dobot).id,
  :question => Question.pick(:question1)
}}

Interest.fix(:interest3) {{
  :user_id     => User.pick(:dobot).id,
  :question => Question.pick(:question2)
}}

Interest.fix(:interest4) {{
  :user_id     => User.pick(:cored).id,
  :question => Question.pick(:question2)
}}


#Interest.gen(:interest1).create
#Interest.gen(:interest2).create
#Interest.gen(:interest3).create
#Interest.gen(:interest4).create
