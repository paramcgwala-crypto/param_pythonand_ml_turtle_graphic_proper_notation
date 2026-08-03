"""3. Loan Approval
Input:
Salary
Credit Score
Existing Loan
Rules:

Salary >= 50000

    Credit Score >= 750
        Existing Loan = No  -> Approved
        Existing Loan = Yes -> Manual Verification

    Credit Score 650-749 -> Review

    Below 650 -> Rejected

Salary < 50000 -> Rejected"""

salary = int(input("Enter Salary: "))
credit = int(input("Enter Credit Score: "))
loan = input("Existing Loan (Yes/No): ")

if salary >= 50000:

    if credit >= 750:

        if loan.lower() == "no":
            print("Loan Approved")
        else:
            print("Manual Verification")

    elif credit >= 650:
        print("Review")

    else:
        print("Rejected")

else:
    print("Rejected")