Feature: Getting Activities

  Scenario: User wants to get activities assigned
    Given a user is logged in
      And the user is on the profile page
    When the user asks for activities
    Then they should get activities assigned