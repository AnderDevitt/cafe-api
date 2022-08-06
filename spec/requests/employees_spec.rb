require 'rails_helper'
require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :deletion


# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/employees", type: :request do
  # create 2 sample employees for tests
  before(:each) do
    FactoryBot.create(:employee, first_name: "admin", last_name: "admin", username: "admin123", is_active: false, email:"admin@email.com", is_admin: true, password: "admin123")
    FactoryBot.create(:employee, first_name: "Raj", last_name: "ranj", username: "raj123", is_active: true, email:"raj@email.com", is_admin: false, password: "1234")
  end  


  # test all employees return with http request
  describe "get all employees at /employees" do
    it "returns all employees" do
      get "/employees"
      # check for success
      expect(response).to have_http_status(:success)
      # check the correct amount return
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  # test finding a employee by param
  # describe "get employee at /employees/:id" do
  #   it "returns a employee based on the parameter" do
  #     get "/employees/1"
  #     # check for success
  #     expect(response).to have_http_status(:success)
  #     # check for contents
  #     expect(response.body).to include("admin")
  #     # check the correct amount return
  #     expect(JSON.parse(response.body).size).to eq(1)
  #   end

  #   # test searching a employee with invalid param
  #   it "returns not found based on the wrong parameter" do
  #     get "/employees/40"
  #     # check for success
  #     expect(response).to have_http_status(:not_found)
  #     # check response content
  #     expect(response.body).to include("employee data not found: wrong id")
  #   end
  # end


  # This should return the minimal set of attributes required to create a valid
  # Employee. As you add validations to Employee, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      first_name: "firstname",
      last_name: "lastname",
      username: "username",
      is_active: true,
      password_digest: "$2a$12$f97AQt0ys0d.gTNDo6dqwOUYZnWMd1rudx3DK68ixZfHX.ctGEjJG",
    }
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_headers) {
    {
      first_name: "firstname",
      last_name: "lastname",
      username: "username",
      is_active: true,
      password: "admin123",
    }
  }

  # describe "GET /index" do
  #   it "renders a successful response" do
  #     # Employee.create! valid_attributes
  #     get Employee_url, headers: valid_headers, as: :json
  #     expect(response).to be_successful
  #   end
  # end

  # describe "GET /show" do
  #   it "renders a successful response" do
  #     Employee = Employee.create! valid_attributes
  #     get Employee_url(Employee), as: :json
  #     expect(response).to be_successful
  #   end
  # end

  # describe "POST /create" do
  #   context "with valid parameters" do
  #     it "creates a new Employee" do
  #       expect {
  #         post Employees_url,
  #              params: { Employee: valid_attributes }, headers: valid_headers, as: :json
  #       }.to change(Employee, :count).by(1)
  #     end

  #     it "renders a JSON response with the new Employee" do
  #       post Employees_url,
  #            params: { Employee: valid_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:created)
  #       expect(response.content_type).to match(a_string_including("application/json"))
  #     end
  #   end

  # #   context "with invalid parameters" do
  # #     it "does not create a new Employee" do
  # #       expect {
  # #         post Employees_url,
  # #              params: { Employee: invalid_attributes }, as: :json
  # #       }.to change(Employee, :count).by(0)
  # #     end

  # #     it "renders a JSON response with errors for the new Employee" do
  # #       post Employees_url,
  # #            params: { Employee: invalid_attributes }, headers: valid_headers, as: :json
  # #       expect(response).to have_http_status(:unprocessable_entity)
  # #       expect(response.content_type).to match(a_string_including("application/json"))
  # #     end
  #   end

  # describe "PATCH /update" do
  #   context "with valid parameters" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }

  #     it "updates the requested Employee" do
  #       Employee = Employee.create! valid_attributes
  #       patch Employee_url(Employee),
  #             params: { Employee: new_attributes }, headers: valid_headers, as: :json
  #       Employee.reload
  #       skip("Add assertions for updated state")
  #     end

  #     it "renders a JSON response with the Employee" do
  #       Employee = Employee.create! valid_attributes
  #       patch Employee_url(Employee),
  #             params: { Employee: new_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:ok)
  #       expect(response.content_type).to match(a_string_including("application/json"))
  #     end
  #   end

  #   context "with invalid parameters" do
  #     it "renders a JSON response with errors for the Employee" do
  #       Employee = Employee.create! valid_attributes
  #       patch Employee_url(Employee),
  #             params: { Employee: invalid_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(response.content_type).to match(a_string_including("application/json"))
  #     end
  #   end
  # end

  # describe "DELETE /destroy" do
  #   it "destroys the requested Employee" do
  #     Employee = Employee.create! valid_attributes
  #     expect {
  #       delete Employee_url(Employee), headers: valid_headers, as: :json
  #     }.to change(Employee, :count).by(-1)
  #   end
  # end
end
