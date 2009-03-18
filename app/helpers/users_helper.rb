module Merb
  module UsersHelper
    def link_to_interested_user(question)
      if session.user
        interested = Interest.get(session.user.id, question.id)
        if !interested.nil?
          return 'interested!' 
        else
          return link_to 'interested?', url(:user_interested), :rel => '#interested_id', :class => 'remote'
        end
      else
        link_to 'interested?', url(:login)
      end
    end 
  end
end # Merb
