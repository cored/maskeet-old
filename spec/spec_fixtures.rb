User.fix(:anonymous) {{
  :id => 1,
  :login => 'anonymous',
  :first_name => 'Anonymous',
  :last_name => 'Coward'
}}

User.fix(:cored) {{
  :id => 2,
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
  :title => /[:sentence:]{4,10}/.gen.gsub(/\.$/, '?'),
  :user_id   => User.pick(:cored).id,
  :body   => /[:paragraph:]/.gen
}}

Question.fix(:question2) {{
  :id => 2,
  :title  => /[:sentence:]{4,10}/.gen.gsub(/\.$/, '?'),
  :body   => /[:paragraph:]/.gen,
  :user_id   => User.pick(:molly).id
}}

Interest.fix(:interest1) {{
  :user_id => User.pick(:cored).id,
  :question_id => Question.pick(:question1)
}}

Interest.fix(:interest2) {{
  :user_id => User.pick(:cored).id,
  :question_id => Question.pick(:question2)
}}

Interest.fix(:interest3) {{
  :user_id => User.pick(:molly).id,
  :question_id => Question.pick(:question1)
}}

Interest.fix(:interest4) {{
  :user_id => User.pick(:molly).id,
  :question_id => Question.pick(:question2)
}}

##Population
User.gen(:anonymous) 
User.gen(:cored) 
User.gen(:molly) 

Question.gen(:question1) 
Question.gen(:question2) 

Interest.gen(:interest1)
Interest.gen(:interest2)
Interest.gen(:interest3)
Interest.gen(:interest4)
