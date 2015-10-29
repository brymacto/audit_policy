class Logger 

  def self.write(message)
    #Pretending to write to the log file
    fail
  end

end


class AuditPolicy

  def initialize(enabled = true)
    @enabled = enabled
  end

  def audit(user, action)
    if !user.authorized? && @enabled 
      message = "Unauthorized #{user.name} for action #{action.name}"
      Logger.write(message)
    end
  end

end

class Action
  attr_reader :name
  def initialize(name)
    @name = name
  end

  

end