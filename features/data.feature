Feature: An authorized user can download data about attempts

	Background:
		Given the user group "Group 1" exists
		And the user group "Group 2" exists
		And the user group "Group 3" exists

		Given the following users exist:
		    | Student A    | 1 |
		    | Student B    | 2 |
		    | Instructor X | 3 |
		    | Instructor Y | 4 |

		Given "Student A" is in the user group "Group 1"
		And "Student A" is in the user group "Group 2"
		And "Student B" is in the user group "Group 1"

		Given "Instructor X" is the owner of "Group 1"

		Given Omniauth is in test mode

	Scenario: A user with "viewer" privileges can request data for a user group
		Given I am logged in as "Instructor X"
		And I am on the download data page
		Then I should see "Group 1"

	Scenario: A user without "viewer" privileges cannot request data for a user group
		Given I am logged in as "Student A"
		And I am on the download data page
		Then I should not see 'Group 1'

	Scenario: A user with "viewer" privileges can request data for a question group
		Given I am logged in as "Instructor X"
		And I am on the download data page

	Scenario: A user without "viewer" privileges cannot request data for a question group
		Given I am logged in as "Student A"
		And I am on the download data page

	Scenario: A user with "viewer" privileges can download data for a user group
		Given I am logged in as "Instructor X"
		And I am on the download data page
		When I select "Group 1" from "user_group[id]"
		And I press "download_data_submit"
		Then I should get a download with the filename "attempts.csv"

	Scenario: A user with "viewer" privileges can download data for a question group
		Given I am logged in as "Instructor X"
		And I am on the download data page

	Scenario: A user with "viewer" privileges can download data for a user group and a question group
		Given I am logged in as "Instructor X"
		And I am on the download data page

	Scenario: A user cannot download data without parameters
		Given I am logged in as "Instructor X"
		And I am on the download data page
		When I press "download_data_submit"
		Then I should be on the download data page
		And I should see "flash_error"	