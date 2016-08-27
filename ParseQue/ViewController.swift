//
//  ViewController.swift
//  ParseQue
//
//  Created by Jeremy Petter on 2016-08-24.
//  Copyright © 2016 JeremyPetter. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        let pizza = PFObject(className: "Food")
//        pizza["name"] = "Pizza"
//        pizza["calories"] = 2000
//
//        let resultsBlock = { (success: Bool, error: NSError?) in
//            if success {
//                print("save successful")
//            }
//        }

//        pizza.saveInBackgroundWithBlock{ (success, error) in
//            if success {
//                print("save successful")
//            }
//        }
//
//        print("I just saved something!")

        let foodQuery = PFQuery(className: "Food")
//        foodQuery.findObjectsInBackgroundWithBlock { (optionalResults, error) in
//            if let results = optionalResults {
//                print("received valid results")
//
//                for result in results {
//
//                    if let resultName = result["name"] as? String {
//                        print(resultName)
//                    } else {
//                        print("object does not have proper key")
//                    }
//                }
//            } else {
//                print("received invalid results")
//            }
//        }

        foodQuery.findObjectsInBackgroundWithBlock { (optionalResults, error) in
            guard let results = optionalResults else {
                print("received invalid results")
                return
            }

            for result in results {

                guard let resultName = result["name"] as? String else {
                    print("object does not have proper key")
                    continue
                }

                print(resultName)
            }
        }

        guard let puppyImage = UIImage(named: "puppy") else {
            print("could not convert puppy into image")
            return
        }

        guard let puppyData = UIImageJPEGRepresentation(puppyImage, 1.0) else {
            print("could not convert image into JPEG")
            return
        }

        guard let puppyFile = PFFile(data: puppyData) else {
            print("could not convert data to file")
            return
        }

        let puppy = PFObject(className: "Puppy")
        puppy["breed"] = "husky"
        puppy["name"] = "Nikita"
        puppy["picture"] = puppyFile

        puppy.saveInBackgroundWithBlock { (succes, error) in
            if error == nil {
                print("saved puppy! WOOF!")
            }
        }




//        print(introduce("Jonas"))
//
//        let introduce2 = { (name: String) -> String in
//            return "My Name is " + name
//        }
//
//        print(introduce2("Slim Shady"))
//
//        superIntroduce("Inigo Montoya", function: introduce)

    }

    func introduce(name: String) -> String {
        return "My Name is " + name
    }

    func superIntroduce(name: String, function: (String) -> String) {
        print(function(name) + ". You killed my father, prepare to die.")
    }

}

