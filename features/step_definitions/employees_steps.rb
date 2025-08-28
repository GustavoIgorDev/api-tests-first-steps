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