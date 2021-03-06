//
//  MealViewController.swift
//  FoodTracker
//
//  Created by Shashank Gupta on 03/03/16.
//  Copyright © 2016 Shashank Gupta. All rights reserved.
//

import UIKit

class MealViewController: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    // MARK:Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var ratingControl: RatingControl!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var meal:Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
        nameTextField.delegate=self
        
        if let meal=meal{
            navigationItem.title=meal.name
            nameTextField.text=meal.name
            ratingControl.rating=meal.rating
            photoImageView.image=meal.photo
        }
        
        checkValidMealName()
    }
    
    //MARK:UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        saveButton.enabled=false
    }
    
    func checkValidMealName(){
        let text=nameTextField.text ?? ""
        saveButton.enabled = !text.isEmpty
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        checkValidMealName()
        navigationItem.title=textField.text
    }
    
    //MARK:UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let selectedImage=info[UIImagePickerControllerOriginalImage] as! UIImage
        photoImageView.image=selectedImage
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    //MARK:Navigation
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode{
            dismissViewControllerAnimated(true, completion: nil)
        }else{
            navigationController!.popViewControllerAnimated(true)
        }
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton===sender{
            let name=nameTextField.text ?? ""
            let photo=photoImageView.image
            let rating=ratingControl.rating
            
            meal=Meal(name: name, photo: photo, rating: rating)
        }
    }
    
    //MARK:Actions

    @IBAction func selectImagePhotoGallery(sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        
        let imagePickerController=UIImagePickerController()
        imagePickerController.sourceType = .PhotoLibrary
        imagePickerController.delegate=self
        
        presentViewController(imagePickerController, animated: true, completion: nil)
        
        
    }
    
}

