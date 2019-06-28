module GlobalInfo
=begin
 This is a nicer interface for the Thread Hash to which we can add useful logic.
 
 The primary goal of this module is to pass Request parameters or page-information to models 
 without needing to do so explicitly in the Controller. Its original use was to pass
 params[:user_id] to models inside Gems using the following Controller Decorator:
 
 GemModule.class_eval do
   before_action :pass_parameters
 end
 with that function defined the same was as in ApplicationController in this template.
 
 In Models, use
 GemModule.class_eval do
   has_one account_joiner, as: :obj, class_name: 'Account::Joiner'
   before_save :join_to_account
   
   def join_to_account
     self.create_account_joiner(user_id: GlobalInfo.current[:user_id])
   end
   
   default_scope {joins(account_joiner).merge(Account::Joiner.where(user_id: GlobalInfo.current[:user_id])}
 end
 
 This encapsulates data so by mounting engines inside a path like /users/:user_id/
 you can quickly convert any tool, including those inside Gems' engines, into
 Software as a Service, needing only to replace images and other assets with those
 linked to the User's account through ActiveStorage.
=end

  def self.pass_parameters(parameters)
    self.current_parameters = parameters
  end

  def current_parameters
    Thread.current[:parameters]
  end

  def self.current_parameters=(parameters)
    Thread.current[:parameters] = parameters
  end
end