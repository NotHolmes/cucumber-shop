Feature: Buy products
    As a customer
    I want to buy products

Background:
    Given the store is ready to service customers
    And a product "Bread" with price 20.50 and stock of 5 exists
    And a product "Jam" with price 80.00 and stock of 10 exists
    And a product "Choco" with price 100.00 and stock of 100 exists

Scenario: Buy one product
    When I buy "Bread" with quantity 2
    Then total should be 41.00

Scenario: Buy multiple products
    When I buy "Bread" with quantity 2
    And I buy "Jam" with quantity 1
    Then total should be 121.00

Scenario: Deduct a product in stock
    When I buy "Jam" with quantity 2
    Then "Jam" in stock should be 8

Scenario Outline: Buy product(s)
    When I buy <product> with quantity <quantity>
    Then total should be <total>
    Examples:
        |   product |   quantity    |   total   |
        |   "Bread" |       1       |   20.50   |
        |   "Jam"   |       5       |   400.00  |
        |   "Choco"  |       3       |   300.00  |
