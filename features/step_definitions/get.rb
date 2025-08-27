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