import UIKit
 
//Encapsulation
class Account {
    var id: Int = 1
    var customerId: Int
    var accountBalance: Int = 0
    var interestRate: Double = 0.0
    init(customerId: Int) {
        self.customerId = customerId
    }
    
    func withdrawal(amount :Int) -> Int {  
        self.accountBalance -= amount
        return self.accountBalance
    }
    
    func deposit(amount: Int) -> Int {
        self.accountBalance += amount
        return self.accountBalance
    }
    
    func charge() -> Int {
        self.accountBalance -= 100
        return self.accountBalance
    }
    
    func bonus() -> Int {
        self.accountBalance += 10
        return self.accountBalance
    }
}

//Inheritance
class SavingsAccount : Account {
    //Polymorphism
    override var interestRate: Double { //overriding the property "interestRate"
        get{
            0.1
        }
        set{ }
    }
    
    override func deposit(amount: Int) -> Int {
        super.deposit(amount: amount)
        //Abstraction
        self.bonus()
        return self.accountBalance
    }
}

//Inheritance
class CurrentAccount : Account {
    //Polymorphism
    override var interestRate: Double {
        get{
            0.05
        }
        set{ }
    }
    
    override func withdrawal(amount: Int) -> Int {
        //accountBalance - amount
        super.withdrawal(amount: amount)
        //Abstraction
        self.charge()
        return accountBalance
    }
}

class Customer {
    private static var customerIdCount = 0
    private var _name: String
    private var _address: String
    private var _phone: String
    private var _id: Int
    
    //Encapsulation
    var id: Int {
        get {
            return _id
        }
        set { newValue }
    }
    
    //Encapsulation
    var nameValue: String {
        get {
            return _name
        }
        set {
             _name = newValue
        }
    }
    
    //Encapsulation
    var addressValue: String {
        get {
            return _address
        }
        set {
            _address = newValue
        }
    }
    
    //Encapsulation
    var phoneNumber: String {
        get {
            return _phone
        }
        set {
            _phone = newValue
        }
    }
    
    var optionalAccount: [Account]? = []
    
    init(nameValue: String, addressValue: String, phoneValue: String) {
        Customer.customerIdCount += 1
        self._id = Customer.customerIdCount
        self._name = nameValue
        self._address = addressValue
        self._phone = phoneValue
    }
    
    func accountBalance(account: Account) -> Int {
        return account.accountBalance
    }
    
    func withdrawal(account: Account, amount: Int) -> Int {
        account.withdrawal(amount: amount)
        return account.accountBalance
    }
    
    func deposit(account: Account, amount: Int) -> Int {
        account.deposit(amount: amount)
        return account.accountBalance
    }

    
    func openAccount(typeOfAccount: accountType) -> [Account]? {
        switch typeOfAccount {
            case accountType.savings:
                let newSavingsAccount = SavingsAccount(customerId: self.id)
                optionalAccount?.append(newSavingsAccount)
            case accountType.current:
                let newCurrentAccount = CurrentAccount(customerId: self.id)
                 optionalAccount?.append(newCurrentAccount)
             }
         return optionalAccount
}
    
    func closeAccount(account: Account) -> [Account]? {
        optionalAccount?.removeAll( where: { $0 === account } )
        return optionalAccount
    }
}

enum accountType {
    case savings, current
}

let firstCustomer = Customer(nameValue: "chioma", addressValue: "decagon uno", phoneValue: "987654567")
//print(firstCustomer.id, firstCustomer.name, firstCustomer.address, firstCustomer.phoneNumber)
firstCustomer.openAccount(typeOfAccount: .savings)
firstCustomer.openAccount(typeOfAccount: .current)
//firstCustomer.deposit(account: firstCustomer.optionalAccount?[0] ?? <#default value#>, amount: 200)
//firstCustomer.optionalAccount?.count
//firstCustomer.withdrawal(account: firstCustomer.optionalAccount?[0] ?? <#default value#>, amount: 100)
//firstCustomer.closeAccount(account: firstCustomer.optionalAccount?[0] ?? <#default value#>)
//firstCustomer.optionalAccount?.count

//firstCustomer.deposit(account: firstCustomer.optionalAccount?[1] ?? <#default value#>, amount: 200)
//firstCustomer.withdrawal(account: firstCustomer.optionalAccount?[1] ?? <#default value#>, amount: 100)

//print(firstCustomer.accountBalance(account: firstCustomer.optionalAccount?[0] ?? <#default value#>))
//print(firstCustomer.accountBalance(account: firstCustomer.optionalAccount?[1] ?? <#default value#>))
