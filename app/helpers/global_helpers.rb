module Merb
  module GlobalHelpers
    # helpers defined here available to all views.  
    def link_to_interested_user(question)
      if session.user
        interested = Interest.get(session.user.id, question.id)
        if !interested.nil?
          return 'interested!' 
        else
          return link_to('interested?',  url(:user_interested, :id => question.id),
                         :class => 'remote_interested', 
                         :rel => question.id)
        end
      else
        link_to 'interested?', url(:login)
      end
    end 
  end
end
