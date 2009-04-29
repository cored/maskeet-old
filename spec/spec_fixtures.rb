User.all.destroy!
Question.all.destroy!
Answer.all.destroy!
Interest.all.destroy!
Relevancy.all.destroy!

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
  :email => 'george.rafael@gmail.com',
  :password => password = 'cored',
  :password_confirmation => password
}}

User.fix(:molly) {{
  :login => 'molly',
  :first_name => 'Molly',
  :last_name  => 'Grey',
  :email => 'mollyme@gmail.com',
  :password => password = 'molly',
  :password_confirmation => password
}}

Question.fix(:question1) {{
  :title => 'What shall i do tonight with my girlfriend?',
  :user   => User.pick(:cored),
  :body   => "We shall meet in front of the __Dunkin'Donuts__ before dinner, and i haven't the slightest idea of what i can do with her. She's not interested in _programming_, _space opera movies_ nor _insects_. She's kinda cute, so I __really__ need to find something that will keep her to my side for another evening."
}}

Question.fix(:question2) {{
  :title  => 'What can i offer to my step mother?',
  :body   => "My stepmother has everything a stepmother is usally offered (watch, vacuum cleaner, earrings, [delicious](http://delicious.com) account). Her birthday comes next week, I am broke, and i know that if i don't offer her something *sweet*, my girlfriend won't look at me in the eyes for another month.",
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

Relevancy.fix(:relevancy1) {{
  :answer => Answer.pick(:answer1),
  :user   => User.pick(:cored),
  :score  => 1
}}

Relevancy.fix(:relevancy2) {{
  :answer => Answer.pick(:answer1),
  :user => User.pick(:molly),
  :score => -1
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

Relevancy.gen(:relevancy1)
Relevancy.gen(:relevancy2)

Interest.gen(:interest1)
Interest.gen(:interest2)
Interest.gen(:interest3)
Interest.gen(:interest4)
