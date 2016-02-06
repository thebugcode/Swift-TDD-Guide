//
//  ViewController.swift
//  ErrorHandlingExample
//
//  Created by Dan Ursu on 06/02/16.
//  Copyright © 2016 Dan Ursu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchData() throws -> AnyObject  {
        let data = NSData(contentsOfFile: "File.txt")
        guard let unwrappedData = data else { throw Readfailure() }
        let json = try NSJSONSerialization.JSONObjectWithData(unwrappedData, options: .AllowFragments)
        return json
    }
    
    func throwingFunction() throws -> AnyObject {
        throw Readfailure()
    }
    
    func nonThrowingFunction() throws -> AnyObject {
        return ""
    }


}

class Readfailure: ErrorType {
}
  