//
//  Extensions.swift
//  CookieCrunch
//
//  Created by Anthony Lewis on 4/24/16.
//  Copyright © 2016 Anthony Lewis. All rights reserved.
//

import Foundation

// This is a disaster, converted from Swift 1 to really ugly Swift 2
extension Dictionary {
    static func loadJSONFromBundle(filename: String) -> Dictionary<String, AnyObject>? {
        if let path = NSBundle.mainBundle().pathForResource(filename, ofType: "json") {
            
            let data: NSData?

            do {
                data = try NSData(contentsOfFile: path, options: NSDataReadingOptions())
            }
            catch {
                print("Could not load level file: \(filename)")
                return nil
            }
            
            if let data = data {
                let dictionary: AnyObject?
                
                do {
                    dictionary = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions())
                }
                catch {
                    print("Level file '\(filename)' is not valid JSON")
                    return nil
                }
                
                if let dictionary = dictionary as? Dictionary<String, AnyObject> {
                    return dictionary
                }
                else {
                    return nil
                }
            }
            else {
                return nil
            }
        }
        else {
            print("Could not find level file: \(filename)")
            return nil
        }
    }
}