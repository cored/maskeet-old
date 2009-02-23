include DataMapper::Sweatshop::Unique

User.fix(:anonymous) {{
  :login      => "anonymous",
  :first_name => "Anonymous",
  :last_name  => "Coward"
}}

User.fix(:cored) {{
  :login      => "cored",
  :first_name => "Rafael",
  :last_name  => "George"

}}

User.fix(:dobot) {{
  :login      => "dobot",
  :first_name => "Bob",
  :last_name  => "Do"
}}

Question.fix(:question1) {{
  :user  => :cored
  :title => /[:sentence:]/.gen,
  :body  => /[:sentence:]/.gen
}}

Question.fix(:question2) {{
  :user  => :anonymous
  :title => /[:sentence:]/.gen,
  :body  => /[:sentence:]/.gen
}}

Question.fix(:question3) {{
  :user  => :dobot
  :title => /[:sentence:]/.gen,
  :body  => /[:sentence:]/.gen
}}

Interest.fix(:interest1) {{
  :user     => :cored,
  :question => :question1
}}


Interest.fix(:interest2) {{
  :user     => :dobot,
  :question => :question1
}}

Interest.fix(:interest3) {{
  :user     => :dobot,
  :question => :question2
}}


Interest.fix(:interest4) {{
  :user     => :cored,
  :question => :question2
}}
