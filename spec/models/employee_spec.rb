require 'rails_helper'

RSpec.describe Employee, type: :model do
  subject {
    described_class.new(
      first_name: "firstname",
      last_name: "lastname",
      username: "username",
      is_active: true,
      is_admin: false,
      password: "1234",
      email: "email@email.com"
    )
  }

  # test that the object takes valid attributes
  it "is valid with correct attributes" do
    expect(subject).to be_valid
  end  

  # test that the object is not valid with an empty firstname
  it "is not valid with an empty firstname" do
    subject.first_name = ""
    expect(subject).not_to be_valid
  end

  # test that the object is not valid with an empty lastname
  it "is not valid with an empty lastname" do
    subject.last_name = ""
    expect(subject).not_to be_valid
  end

  # test that the object is not valid with an empty username
  it "is not valid with an empty username" do
    subject.username = ""
    expect(subject).not_to be_valid
  end

  # test that the object is not valid without is_active
  it "is not valid with an empty firstname" do
    subject.is_active = nil
    expect(subject).not_to be_valid
  end

end
