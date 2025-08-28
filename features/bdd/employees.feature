Feature: Manage employees
    To verify informations
    The system user
    Wants to manage employee informations

    @scenario_01
    Scenario: Search for employees information
        Given the user consults the employee informations
        When the user makes a search request
        Then a list of employees should be returned

    @scenario_02
    Scenario: Register a new employee
        Given the user registers a new employee
        When the user submits the employee details
        Then the employee should be created successfully
    