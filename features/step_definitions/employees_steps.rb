Given('the user consults the employee informations') do
    @get_url = 'https://dummy.restapiexample.com/api/v1/employees'
end

When('the user makes a search request') do
    @list_employees = HTTParty.get(@get_url)
end

Then('a list of employees should be returned') do
    expect(@list_employees.code).to eql 200
    expect(@list_employees.message).to eql 'OK'
end

Given('the user registers a new employee') do
    @post_url = 'https://dummy.restapiexample.com/api/v1/create'
end

When('the user submits the employee details') do
    @create_employee = HTTParty.post(@post_url, headers: { 'Content-Type' => 'application/json' }, body: {
        "id": 30,
        "employee_name": "Gus",
        "employee_salary": 50000,
        "employee_age": 30,
        "profile_image": ""
    }.to_json)

    puts @create_employee
end

Then('the employee should be created successfully') do
    expect(@create_employee.code).to eql 200
    expect(@create_employee.message).to eql 'OK'
    expect(@create_employee['data']['employee_name']).to eql 'Gus'
    expect(@create_employee["status"]).to eql 'success'
    expect(@create_employee['data']['employee_salary']).to eql (50000)
    expect(@create_employee['data']['employee_age']).to eql (30)
end


Given('the user updates an existing employees information')do
    @get_employee = HTTParty.get('https://dummy.restapiexample.com/api/v1/employees', :headers => {'Content-Type': 'application/json'})
    @put_url = 'https://dummy.restapiexample.com/api/v1/update/' + @get_employee['data'][0]['id'].to_s
end
 
When('the user modifies the employee details') do
    @update_employee = HTTParty.put(@put_url, :headers => { 'Content-Type': 'application/json' }, body: {
        "employee_name": "Gas",
        "employee_salary": 12030,
        "employee_age": 21,
        "profile_image": ""
    }.to_json) 

    puts(@update_employee)
end

Then('the employee information should be updated successfully') do
    expect(@update_employee.code).to eql 200
    expect(@update_employee.message).to eql 'OK'
    expect(@update_employee['data']['employee_name']).to eql 'Gas'
    expect(@update_employee["status"]).to eql 'success'
    expect(@update_employee['data']['employee_salary']).to eql (12030)
    expect(@update_employee['data']['employee_age']).to eql (21)
end

Given('the user wants to delete an existing employee') do
    @get_employee = HTTParty.get('https://dummy.restapiexample.com/api/v1/employees', :headers => {'Content-Type': 'application/json'})
    @delete_url = 'https://dummy.restapiexample.com/api/v1/delete/' + @get_employee['data'][0]['id'].to_s
end

When('the user sends the id') do
    @delete_employee = HTTParty.delete(@delete_url, :headers => { 'Content-Type': 'application/json' })
    puts(@delete_employee)
end

Then('the employee should be deleted successfully') do       
    expect(@delete_employee.code).to eql 200
    expect(@delete_employee.message).to eql 'OK'
    expect(@delete_employee["status"]).to eql 'success'
    expect(@delete_employee['data']).to eql '2'
end

