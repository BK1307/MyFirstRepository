//
//  ViewController.swift
//  Test1
//
//  Created by Bhanu Kashyap on 26/03/24.
//

import UIKit
import Combine
class ViewController: UIViewController {
    var x = 5
    var y = 5
    var number: Int {
        get {
            return x * y
        }
        set (newValue){
            x = newValue / 2
            y = newValue / 2
        }
    }
    var total: Double = 0 {
        didSet {
            numEntries+=1
        }
    }
    var numEntries: Double = 0
    var average: Double {
        get {
            return total / numEntries
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("initial number = ",number)
        number = 100
        print("final number = ",number)
        print("value of x = ",x)
        total += 10
        total += 20
        print("average = ", average)
        print("total = ", total)
        print("numEntries number = ",numEntries)
        var settings = SettingsViewModel()
        settings.autoMarkMessagesAsRead = true
        settings.numberOfSearchResultsPerPage = 20
        print(settings)
        /*
         prints only the output
         */
        print( Userr(firstName: "Bhanu", lastName: "Kashyap") )
        
        /*
         - prints a debug description of the given items to the console
         - includes more details about the object, making it easier to track down bugs and issues
         */
        //        debugPrint(Userr(firstName: "Bhanu", lastName: "Kashyap"))
        /* The println() function works similarly to print(), but it adds a newline character at the end of the message. */
        var s = twoSum([2,3,4], 7)
        print (s)
        return
        print("\("bhanu".uppercased())")
        
        
    }
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var arr = [Int]()
        nums.enumerated().map { index, num in
            let nextIndex = index + 1
            if nextIndex < nums.count, num + nums[nextIndex] == target {
                arr = [num, nums[nextIndex]]
            }
        }
        return arr
    }
    
    
}

@propertyWrapper struct Capitalized {
    var wrappedValue: String //{
    //        didSet {
    //            wrappedValue = wrappedValue.capitalized
    //        }
    //    }
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.capitalized
    }
}

struct Userr {
    @Capitalized var firstName: String
    @Capitalized var lastName: String
    @Capitalized var company = "XYZ"
}


@propertyWrapper struct UserDefaultsBacked<Value> {
    let key: String
    var storage: UserDefaults = .standard
    
    var wrappedValue: Value? {
        get { storage.value(forKey: key) as? Value }
        set { storage.setValue(newValue, forKey: key) }
    }
}

struct SettingsViewModel {
    @UserDefaultsBacked<Bool>(key: "mark-as-read")
    var autoMarkMessagesAsRead
    
    @UserDefaultsBacked<Int>(key: "search-page-size")
    var numberOfSearchResultsPerPage
}
