require 'rails_helper'

RSpec.describe Shift, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  subject {
    described_class.new(
      date: "2022-07-27",
      start: "2000-01-01T06:30:00.000Z",
      finish: "2000-01-01T12:30:00.000Z",
      employee_id: Employee.create!(first_name: "firstname",
        last_name: "lastname",
        username: "username",
        is_active: true,
        is_admin: false,
        password: "1234",
        email: "email@email.com").id
    )
  }
  # test that the object takes valid attributes
  it "is valid with date start and finish time attributes" do
    expect(subject).to be_valid
  end  

  # test that the object is not valid with an empty date
  it "is not valid with an empty date" do
    subject.date = ""
    expect(subject).not_to be_valid
  end

  # test that the object is not valid with an empty start time
  it "is not valid with an empty start" do
    subject.start = ""
    expect(subject).not_to be_valid
  end

  # test that the object is not valid with an empty finish time
  it "is not valid with an empty finish" do
    subject.finish = ""
    expect(subject).not_to be_valid
  end

end
