@setono_reserve_stock_cart
Feature: Prevent buying more products than available in a stock
  In order to buy only available items
  As a Visitor
  I want to be prevented from adding items over the available amount

  Background:
    Given the store operates on a single channel in "United States"
    And the store has a product "T-shirt Mononoke" priced at "$12.54"
    And "T-shirt Mononoke" product is tracked by the inventory
    And there are 5 units of product "T-shirt Mononoke" available in the inventory

  @ui
  Scenario: Preventing from adding more items to the cart than it's available in stock
    Given 5 customers have added 1 "T-shirt Mononoke" products to the cart
    When I check this product's details
    Then I should see that it is out of stock
    And I should be unable to add it to the cart

  @ui
  Scenario: Preventing from adding more items to the cart than it's available in stock by adding same item twice
    Given 2 customers have added 2 "T-shirt Mononoke" products to the cart
    When I check this product's details
    And I add 1 products "T-shirt Mononoke" to the cart
    When I check this product's details
    Then I should see that it is out of stock
    And I should be unable to add it to the cart
    And I should still be on product "T-shirt Mononoke" page

  @ui
  Scenario: Allowing to add items to the cart if they are in stock
    Given 2 customers have added 1 "T-shirt Mononoke" products to the cart
    When I add 3 products "T-shirt Mononoke" to the cart
    Then I should not be notified that this product does not have sufficient stock
    And I should be on my cart summary page
