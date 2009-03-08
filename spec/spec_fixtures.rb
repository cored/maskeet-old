User.fix(:anonymous) {{
  :id  => 1,
  :login => 'anonymous',
  :first_name => 'Anonymous',
  :last_name => 'Coward'
}}

User.fix(:cored) {{
  :id  => 2,
  :login =>  'cored',
  :first_name =>  'Rafael',
  :last_name =>  'George'
}}

User.fix(:molly) {{
  :id => 3,
  :login => 'molly',
  :first_name => 'Molly',
  :last_name  => 'Grey',
}}

Question.fix(:question1) {{
  :id => 1,
  :title => 'What shall i do tonight with my girlfriend?',
  :user   => User.pick(:cored),
  :body   => /[:paragraph:]/.gen
}}

Question.fix(:question2) {{
  :id => 2,
  :title  => 'What can i offer to my step mother?',
  :body   => /[:paragraph:]/.gen,
  :user   => User.pick(:molly)
}}

Question.fix(:question3) {{
  :id => 3,
  :title => 'How can i generate trafic to my blog?',
  :body  => /[:paragraph:]/.gen,
  :user  => User.pick(:anonymous)
}}

Answer.fix(:answer1) {{
  :id => 1,
  :question => Question.pick(:question1),
  :user => User.pick(:molly),
  :body => /[:paragraph:]/.gen
}}

Answer.fix(:answer2) {{
  :id => 2,
  :question => Question.pick(:question1),
  :user => User.pick(:cored),
  :body => /[:paragraph:]/.gen
}}

Answer.fix(:answer3) {{
  :id => 3,
  :question => Question.pick(:question2),
  :user => User.pick(:cored),
  :body => /[:paragraph:]/.gen
}}

Answer.fix(:answer4) {{
  :id => 4,
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
