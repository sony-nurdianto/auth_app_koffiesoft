Feature: Login Screen


Scenario:  There are Welcome Text
    Given the app is running
    Then I see {'Welcome To Our App'} text
     
Scenario: There are Login Text
    Given the app is running
    Then I see {'Login To Your Acount'} text

Scenario: There are Email Text Field
    Given the app is running 
    Then I see {'Email'} text

Scenario: There are passwod Text Field
    Given the app is running 
    Then I see {'Password'} text

Scenario: There are button Text Field
    Given the app is running 
    Then I see {'Login'} text

Scenario: There are asking acount Text
    Given the app is running
    Then I see {'Don't have an account ?'} text

Scenario: There are register Text
    Given the app is running
    Then I see {'Register'} text
