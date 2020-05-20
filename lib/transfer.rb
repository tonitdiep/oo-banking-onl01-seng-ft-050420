class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  def initialize(sender, receiver, amount, status = "pending")
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    sender.valid? && receiver.valid? ? true : false
  end
  
  def execute_transaction 
    if valid? && sender.balance > amount && status == "pending" 
      self.sender.balance -= amount
      self.receiver.balance += amount
      self.status = "complete" 
    else  
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  def reverse_transfer
      if valid? && receiver.balance > amount && status == "complete" 
      self.sender.balance += amount
      self.receiver.balance -= amount
      self.status = "reversed" 
    else  
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
end