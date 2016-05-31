//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Shashank Gupta on 04/03/16.
//  Copyright © 2016 Shashank Gupta. All rights reserved.
//

import UIKit

class RatingControl: UIView {

    //MARK: Properties
    var rating=0 {
        didSet{
            setNeedsLayout()
        }
    }
    var ratingButtons=[UIButton]()
    var spacing=2,stars=5
    
    //MARK: Initialization
    override func layoutSubviews() {
        let buttonSize=Int(frame.size.height)
        
        var buttonFrame=CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        for(index,button) in ratingButtons.enumerate(){
            buttonFrame.origin.x=CGFloat(index * (buttonSize+spacing))
            button.frame=buttonFrame
        }
        updateButtonSelectedStates()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let filledStarImage=UIImage(named: "filledStar")
        let emptyStarImage=UIImage(named: "emptyStar")
        
        
        for _ in 0..<stars {
            let button=UIButton()
            
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Highlighted,.Selected])
            
            button.adjustsImageWhenHighlighted=false
            button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
            ratingButtons += [button]
            addSubview(button)
        }
    }
    
    override func intrinsicContentSize() -> CGSize {
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize+spacing) * stars
        
        return CGSize(width: width, height: buttonSize)
    }
    
    func ratingButtonTapped(button:UIButton){
        rating=ratingButtons.indexOf(button)! + 1
        updateButtonSelectedStates()
    }
    
    func updateButtonSelectedStates(){
        for(index,button) in ratingButtons.enumerate(){
            button.selected=index<rating
        }
    }

}
