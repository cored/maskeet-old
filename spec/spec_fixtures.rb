include DataMapper::Sweatshop::Unique

User.fix {{
  :login      => /\w+/.gen,
  :first_name => Randgen.first_name,
  :last_name  => Randgen.last_name
}}

Question.fix {{
  :user  => User.pick,
  :title => /[:sentence:]/.gen,
  :body  => /[:sentence:]/.gen
}}

Answer.fix {{
  :question => Question.pick,
  :user => User.pick,
  :body  => /[:sentence:]/.gen
}}

Interest.fix {{
  :user     => User.pick,
  :question => Question.pick
}}

Relevancy.fix {{
  :user => User.pick,
  :answer => Answer.pick,
  :score => rand(10)
}}
