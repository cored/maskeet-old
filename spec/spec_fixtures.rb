User.fix(:anonymous) {{
  :login => 'anonymous',
  :first_name => 'Anonymous',
  :last_name => 'Coward',
  :password => password = 'anonymous',
  :password_confirmation => password
}}

User.fix(:cored) {{
  :login =>  'cored',
  :first_name =>  'Rafael',
  :last_name =>  'George',
  :password => password = 'cored',
  :password_confirmation => password
}}

User.fix(:molly) {{
  :login => 'molly',
  :first_name => 'Molly',
  :last_name  => 'Grey',
  :password => password = 'molly',
  :password_confirmation => password
}}

Question.fix(:question1) {{
  :title => 'What shall i do tonight with my girlfriend?',
  :user   => User.pick(:cored),
  :body   => /[:paragraph:]/.gen
}}

Question.fix(:question2) {{
  :title  => 'What can i offer to my step mother?',
  :body   => /[:paragraph:]/.gen,
  :user   => User.pick(:molly)
}}

Question.fix(:question3) {{
  :title => 'How can i generate trafic to my blog?',
  :body  => /[:paragraph:]/.gen,
  :user  => User.pick(:anonymous)
}}

Answer.fix(:answer1) {{
  :question => Question.pick(:question1),
  :user => User.pick(:molly),
  :body => /[:paragraph:]/.gen
}}

Answer.fix(:answer2) {{
  :question => Question.pick(:question1),
  :user => User.pick(:cored),
  :body => /[:paragraph:]/.gen
}}

Answer.fix(:answer3) {{
  :question => Question.pick(:question2),
  :user => User.pick(:cored),
  :body => /[:paragraph:]/.gen
}}

Answer.fix(:answer4) {{
  :question => Question.pick(:question3),
  :user => User.pick(:cored),
  :body => /[:paragraph:]/.gen
}}

Interest.fix(:interest1) {{
  :user => User.pick(:cored),
  :question => Question.pick(:question1)
}}

Interest.fix(:interest2) {{
  :user => User.pick(:cored),
  :question => Question.pick(:question2)
}}

Interest.fix(:interest3) {{
  :user => User.pick(:molly),
  :question => Question.pick(:question1)
}}

Interest.fix(:interest4) {{
  :user => User.pick(:molly),
  :question => Question.pick(:question2)
}}

##Population
User.gen(:anonymous) 
User.gen(:cored) 
User.gen(:molly) 

Question.gen(:question1) 
Question.gen(:question2) 
Question.gen(:question3)

Answer.gen(:answer1)
Answer.gen(:answer2)
Answer.gen(:answer3)
Answer.gen(:answer4)

Interest.gen(:interest1)
Interest.gen(:interest2)
Interest.gen(:interest3)
Interest.gen(:interest4)
