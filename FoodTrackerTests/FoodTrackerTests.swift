//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Shashank Gupta on 03/03/16.
//  Copyright © 2016 Shashank Gupta. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    //MARK: FoodTrackerTests
    func testMealInitialization(){
        //Success Case
        let potentialItem=Meal(name: "Newest Meal", photo: nil, rating: 5)
        XCTAssertNotNil(potentialItem)
        
        //Failure Case
        let noName=Meal(name: "", photo: nil, rating:0)
        XCTAssertNil(noName,"Empty Name is Invalid")
        
        let badRating=Meal(name: "Really bad Rating", photo: nil, rating: -1)
        XCTAssertNil(badRating)
    }
}
