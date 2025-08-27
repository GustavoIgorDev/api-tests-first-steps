Feature: Search employees
    To verify informations
    The system user
    Wants to consult the employee informations

    Scenario: Search for employees information
        Given the user consults the employee informations
        When the user makes a search request
        Then a list of employees should be returned