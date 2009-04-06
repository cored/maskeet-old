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
        link_to_login 'interested?'
      end
    end 

    def link_to_login(name, uri = nil)
      if ( uri && session.user )
        return link_to(name, uri)
      else
        return link_to(name, url(:login), :class => 'login_form')
      end
    end 
  end

end
