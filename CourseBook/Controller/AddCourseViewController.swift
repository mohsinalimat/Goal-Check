//
//  AddCourseViewController.swift
//  CourseBook
//
//  Created by Alex Wong on 8/27/17.
//  Copyright © 2017 Alex Wong. All rights reserved.
//

import UIKit
import CoreData

class AddCourseViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: - Properties
    
    var imagePicker: UIImagePickerController!
    var category = [Category]()
    var existingCourse: Course?

    // MARK: - IBOutlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var courseNameTextField: UITextField!
    @IBOutlet weak var courseEmailTextField: UITextField!
    @IBOutlet weak var coursePriceTextField: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        //getTestDataForPickerView()
        getCategoryData()
        
        if existingCourse != nil{
            
            loadCourseInfo()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - IBActions
    
    @IBAction func pickImage(_ sender: Any) {
        
        // present image picker controller
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func saveData(_ sender: Any) {
        
        var course: Course!
        let picture = Image(context: context)
        picture.image = imageView.image
        
        if existingCourse == nil {
            
            
            course = Course(context: context)
            
        } else {
            
            
            course = existingCourse
        }
        
        
        course.courseToImage = picture
        
        if let courseName = courseNameTextField.text{
            
            course.coursename = courseName
            
        }
        
        if let sureEmail = courseEmailTextField.text{
            course.email = sureEmail
        }
        
        if let surePrice = coursePriceTextField.text {
            
            course.price = (surePrice as NSString).doubleValue
            
        }
        
        course.courseToCategory = category[pickerView.selectedRow(inComponent: 0)]
        
        appDelegate.saveContext()
        
        // go back to main view controller
        
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func deleteData(_ sender: Any) {
        
        if existingCourse != nil{
            
            context.delete(existingCourse!)
            appDelegate.saveContext()
        }
        
        navigationController?.popViewController(animated: true)
        
        
        
    }
    
    // MARK: - Image Picker methods
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            
            imageView.image = image
            
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Picker View methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return category.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let category = self.category[row]
        return category.name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //
    }
    
    // MARK: - Fetch category data from core data
    
  
    func getCategoryData(){
        
        let fetchRequest: NSFetchRequest<Category> = Category.fetchRequest()
        
        do {
            self.category = try context.fetch(fetchRequest)
            self.pickerView.reloadAllComponents()
        } catch {
            //handle the error
        }
        
        
    }
    
    // Load course info from Main screen
    
    func loadCourseInfo(){
        
        if let course = existingCourse {
            
            courseNameTextField.text = course.coursename
            coursePriceTextField.text = "\(course.price)"
            courseEmailTextField.text = course.email
            
            imageView.image = course.courseToImage?.image as? UIImage
            
        }
        
        
    }
    
    func getTestDataForPickerView(){
        
        let category = Category(context: context)
        category.name = "WebDev"
        
        let category1 = Category(context: context)
        category1.name = "iOS 11"
        
        let category2 = Category(context: context)
        category2.name = "Android"
        
        let category3 = Category(context: context)
        category3.name = "Python"
        
        let category4 = Category(context: context)
        category4.name = "Machine Learning"
        
        appDelegate.saveContext()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
