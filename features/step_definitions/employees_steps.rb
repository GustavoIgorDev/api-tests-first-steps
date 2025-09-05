Given('the user consults the employee informations') do
    @getlist = Employee_Requests.new
end

When('the user makes a search request') do
    @list_employees = @getlist.find_employee
end

Then('a list of employees should be returned') do
    expect(@list_employees.code).to eql 200
    expect(@list_employees.message).to eql 'OK'
end

Given('the user registers a new employee') do
    @create = Employee_Requests.new
end

When('the user submits the employee details') do
    @create_employee = @create.create_employee(DATABASE[:name][:name1], DATABASE[:salary][:salary1], DATABASE[:age][:age1])
    puts(@create_employee)
end

Then('the employee should be created successfully') do
    expect(@create_employee.code).to eql 200
    expect(@create_employee.message).to eql 'OK'
    expect(@create_employee['data']['employee_name']).to eql DATABASE[:name][:name1]
    expect(@create_employee["status"]).to eql 'success'
    expect(@create_employee['data']['employee_salary']).to eql DATABASE[:salary][:salary1]
    expect(@create_employee['data']['employee_age']).to eql DATABASE[:age][:age1]
end


Given('the user updates an existing employees information')do
    @request = Employee_Requests.new
end
 
When('the user modifies the employee details') do
    @update_employee = @request.update_employee(@request.find_employee['data'][0]['id'], DATABASE[:name][:name2], DATABASE[:salary][:salary2], DATABASE[:age][:age2])
    puts(@update_employee)
end

Then('the employee information should be updated successfully') do
    expect(@update_employee.code).to eql 200
    expect(@update_employee.message).to eql 'OK'
    expect(@update_employee['data']['employee_name']).to eql DATABASE[:name][:name2]
    expect(@update_employee["status"]).to eql 'success'
    expect(@update_employee['data']['employee_salary']).to eql DATABASE[:salary][:salary2]
    expect(@update_employee['data']['employee_age']).to eql DATABASE[:age][:age2]
end

Given('the user wants to delete an existing employee') do
    @request = Employee_Requests.new
end

When('the user sends the id') do
    @delete_employee = @request.delete_employee(@request.find_employee['data'][0]['id'])
end

Then('the employee should be deleted successfully') do       
    expect(@delete_employee.code).to eql 200
    expect(@delete_employee.message).to eql 'OK'
    expect(@delete_employee["status"]).to eql 'success'
    expect(@delete_employee['data']).to eql '2'
end

