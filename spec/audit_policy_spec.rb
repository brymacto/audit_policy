require_relative('../audit_policy')

describe AuditPolicy do 
  it "does call the logger write method if unauthorized and audit enabled " do
    user = double("user", authorized?: false, name: "user_name", last_sign_in: "2015-07-01")
    action = double("action", name: "action_name")
    # action = Action.new('action_name')

    expect(Logger).to receive(:write).with("Unauthorized user_name for action action_name")

    subject = AuditPolicy.new(true)

    subject.audit(user, action)
  end
end