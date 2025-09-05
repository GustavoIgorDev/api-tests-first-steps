module Employee
    include HTTParty
    base_uri 'https://dummy.restapiexample.com/api/v1'
    headers 'Content-Type' => 'application/json'
end