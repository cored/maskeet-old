User.fix(:anonymous) {{
  :login => 'anonymous',
  :first_name => 'Anonymous',
  :last_name => 'Coward'
}}

User.fix {{
  :login =>  first_name = Randgen.first_name,
  :last_name  =>  last_name = Randgen.last_name,
  :login =>  "#{first_name.downcase}#{last_name[0].chr}"
}}

Question.fix {{
  :title => /[:sentence:]{4,10}/.gen.gsub(/\.$/, '?'),
  :user_id   => User.pick.id,
  :body   => /[:paragraph:]/.gen
}}

Question.fix(:anonymous) {{
  :title  => /[:sentence:]{4,10}/.gen.gsub(/\.$/, '?'),
  :body   => /[:paragraph:]/.gen,
  :user_id   => User.pick(:anonymous).id
}}

Interest.fix { DataMapper::Sweatshop.unique {{
  :user     => User.pick,
  :question => Question.pick
}}}

##Population

User.gen(:anonymous) #create the anonymous user
5.of { User.gen }     #randomly create 5 users

10.of { Question.gen }              #create 10 questions with random users (not the anonymous user)
10.of { Question.gen(:anonymous) }  #create 10 questions with the anonymous user

20.of { Interest.gen }                                  #create 20 interests 
5.of  { Interest.gen(:user => User.pick(:anonymous)) }  #create 5 interests with questions for the anonymous user
