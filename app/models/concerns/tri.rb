module Tri
 
  def tri(user_id)
       joins(:user).order("prenom").where('users.id' => user_id)
  end
  


end