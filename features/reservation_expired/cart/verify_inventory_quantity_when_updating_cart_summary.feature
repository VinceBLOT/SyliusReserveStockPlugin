@setono_reserve_stock_cart
Feature: Verifying inventory quantity on cart summary using product reservation expirations
  In order to not be able to add more items than available
  As a Customer
  I want to be notified that requested item quantity cannot be handled or can be handled after expiration

  Background:
    Given the store operates on a single channel in "United States"
    And the store has a product "Iron Maiden T-Shirt" priced at "€12.54"
    And this product is tracked by the inventory
    And there are 8 units of product "Iron Maiden T-Shirt" available in the inventory

  @ui
  Scenario: Being able to save a cart with product which reservation expired
    Given I have added 3 products "Iron Maiden T-Shirt" in the cart
    And 1 customers have added 5 "Iron Maiden T-Shirt" products to the cart
    When I change "Iron Maiden T-Shirt" quantity to 4
    And I update my cart
    Then I should be notified that this product cannot be updated
    When I wait 20 seconds
    And I change "Iron Maiden T-Shirt" quantity to 4
    And I update my cart
    Then I should not be notified that this product cannot be updated
