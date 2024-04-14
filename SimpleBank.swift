/*
Project: Simple Bank System
Objective: Create a simple bank system that allows for creating new bank accounts, 
depositing money, withdrawing money, and checking balances.

+ Features to Implement:
Account Creation: Allow the user to create a new account with an initial deposit amount. 
Each account should have a unique account number.

- Deposit Money: Enable depositing money into an account using the account number.
- Withdraw Money: Implement withdrawal functionality that checks if the account has s
ufficient funds before allowing the withdrawal.
- Check Balance: Allow the user to check the account balance using the account number.

- Simple UI in the Console: Implement a simple text interface in the console for interaction with the user. You can use print() for output and read input using readLine().

+ Implementation Guidelines:
Data Model: Use a struct or a class to model a Bank Account. 
It should at least contain properties for the account number, 
account holder's name, and balance.
Account Number: Generate a random or sequential unique account number for each account.
Functions: Implement functions for each of the features mentioned above. For example, createAccount(name: String, initialDeposit: Double) -> Account, deposit(amount: Double, to accountNumber: Int), etc.
Validation: Make sure to validate user input where applicable, such as checking for sufficient balance before withdrawal and ensuring valid amounts are entered for deposits and withdrawals.

Example Workflow:
The program starts and presents the user with options: Create Account, Deposit, Withdraw, Check Balance, and Exit.
The user selects to create an account, enters their name, and an initial deposit amount. The program then displays the newly created account number.
The user can then make deposits or withdrawals by selecting the corresponding options and providing necessary details.
The user can check the balance of an account by entering the account number.
Bonus Challenges:
Implement simple interest calculations for the balances and add an option to view accrued interest for an account.
Allow for transferring funds between accounts.
Use optionals for functions that search for accounts by account number, and handle cases where an account may not exist.
This project will challenge you to use basic Swift programming concepts in a cohesive application. As you progress, you can continually refactor and enhance the system with more features, such as adding transaction history or implementing overdraft protection. Happy coding!
*/

import Foundation
print("")

class BankAccount{
    var accountnumber: Int
    var cardHolderName: String
    var accountBalance: Double

    init(cardHolderName:String, accountBalance:Double, accountnumber:Int){
        self.accountnumber = accountnumber
        self.cardHolderName = cardHolderName
        self.accountBalance = accountBalance
    }

    func deposit(value:Double) ->String{
        
        self.accountBalance += value

        return "Deposited $\(value)"
    }

    func withdrawal(value:Double)->String{
        if (self.accountBalance - value < 0){
            return "Can't Withdraw"
        }else{
            self.accountBalance -= value
            return "New Balance\(self.accountBalance)"
        }

    }
}

var Bank: [Int:BankAccount] = [:]

var run: Bool = true

while run{
    print("Welcome to Bank")
    print("Press A for Account Creation")
    print("Press D for Deposit Money")
    print("Press W for Money withdrawl")
    print("Press B for Check Balance")

    var option = readLine(strippingNewline: true)!

    switch option{
        case "A":
            print("---------------")
            print("Type CarholderName:")

            let userName:String = readLine()!

            print("Initial Deposit Value")

            let value:Double = Double(readLine()!)!

            let accountNumber:Int = Int.random(in: 0000...9999)
            
            let newAccount:BankAccount = BankAccount(cardHolderName: userName , accountBalance: value, accountnumber:accountNumber)

            Bank[accountNumber] = newAccount

            print("Account Created")
            print("User: \(newAccount.cardHolderName)")
            print("Balance: \(newAccount.accountBalance)")
            print("AccountNumber: \(newAccount.accountnumber)")

        case "D":
            print("--------------")
            print("Deposit")

            print("Type Account Number:")

            let accNumber:Int = Int(readLine()!)!

            print(" Deposit Value")

            let value:Double = Double(readLine()!)!

            Bank[accNumber]?.deposit(value: value)

            print("New Balance: $\(Bank[accNumber]!.accountBalance)")

        case "W":
            print("--------------")
            print("Withdrwal")

            print("Type Account Number:")

            let accNumber:Int = Int(readLine()!)!

            print("Withdraw Value")

            let value:Double = Double(readLine()!)!

            var message:String? = Bank[accNumber]?.withdrawal(value: value)

            print(message!)

        case "B":

            print("--------------")
            print("Balance")

            print("Type Account Number:")

            let accNumber:Int = Int(readLine()!)!

            let balance:Double = Bank[accNumber]!.accountBalance

            print("Your current balance is $\(balance)")

        case "Q":
            print("Quit")
            run = false
        default:
            print("No option")
            print(option)
    }
}