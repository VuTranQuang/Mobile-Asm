//
//  ViewController.swift
//  Mobile-Asm
//
//  Created by tran.quang.vu on 23/02/2024.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Outlet
    
    /// Nếu có thể dùng icon các step 1 - 4 thì sẽ bớt được contraint + code
    
    // outlet Step Stack View
    @IBOutlet weak var step1View: UIView!
    @IBOutlet weak var step2View: UIView!
    @IBOutlet weak var step3View: UIView!
    @IBOutlet weak var step4View: UIView!
    @IBOutlet weak var step1NumberLabel: UILabel!
    @IBOutlet weak var step2NumberLabel: UILabel!
    @IBOutlet weak var step3NumberLabel: UILabel!
    @IBOutlet weak var step4NumberLabel: UILabel!
    
    // View1
    @IBOutlet weak var title1Label: UILabel!
    @IBOutlet weak var value1Label: UILabel!
    @IBOutlet weak var dropdownIcon: UIImageView!
    @IBOutlet weak var anchorOfDropdownView: UIView!
    @IBOutlet weak var content1View: UIView!
    
    // View2
    @IBOutlet weak var title2Label: UILabel!
    @IBOutlet weak var value2Label: UILabel!
    @IBOutlet weak var content2View: UIView!
    
    // Khác
    @IBOutlet weak var addView: UIView!
    @IBOutlet weak var previousView: UIView!
    @IBOutlet weak var nextView: UIView!
    
    @IBOutlet weak var increaseIcon: UIImageView!
    @IBOutlet weak var decreaseIcon: UIImageView!
    
    @IBOutlet weak var nextLabel: UILabel!
    
    @IBOutlet weak var mainStep4View: UIView!
    @IBOutlet weak var content4View: UIView!
    // MARK: Properties
    var indexOfStep = 1 {
        didSet {
           handleStep()
        }
    }
    var numberofPeople = 1
    var restaurent = ""
    
    var order: Order?
    var dataStep1 = ["Breakfast", "Lunch", "Dinner"]
    var dataStep2 = ["1", "2", "3"]
    var dataStep3 = ["A", "B", "C"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dropdownIcon.isUserInteractionEnabled = true
        content2View.isHidden = true
        handleStep()
        handleAction()
    }

    func handleStep() {
        switch indexOfStep {
        case 1:
            step1View.backgroundColor = .systemBlue
            step1View.borderWidth = 0
            step1NumberLabel.textColor = .white
            
            step2View.backgroundColor = .white
            step2View.borderWidth = 1
            step2View.borderColor = .systemGray
            step2NumberLabel.textColor = .black
            
            step3View.backgroundColor = .white
            step3View.borderWidth = 1
            step3View.borderColor = .systemGray
            step3NumberLabel.textColor = .black
            
            step4View.backgroundColor = .white
            step4View.borderWidth = 1
            step4View.borderColor = .systemGray
            step4NumberLabel.textColor = .black
            
            title1Label.text = "Please select a medal"
            title2Label.text = "Please enter Number of people"
            
            mainStep4View.isHidden = true
            addView.isHidden = true
            previousView.isHidden = true
            content2View.isHidden = false
            
            value2Label.text = order != nil ? "\(order?.numberOfPeople)" : "1"
            
        case 2:
            step1View.backgroundColor = .white
            step1View.borderWidth = 1
            step1View.borderColor = .systemGray
            step1NumberLabel.textColor = .black
            
            step2View.backgroundColor = .systemBlue
            step2View.borderWidth = 0
            step2NumberLabel.textColor = .white
            
            step3View.backgroundColor = .white
            step3View.borderWidth = 1
            step3View.borderColor = .systemGray
            step3NumberLabel.textColor = .black
            
            step4View.backgroundColor = .white
            step4View.borderWidth = 1
            step4View.borderColor = .systemGray
            step4NumberLabel.textColor = .black
            
            title1Label.text = "Please select a Restaurent"
            
            content2View.isHidden = true
            addView.isHidden = true
            previousView.isHidden = false
            
            value1Label.text = restaurent
            
        case 3:
            step1View.backgroundColor = .white
            step1View.borderWidth = 1
            step1View.borderColor = .systemGray
            step1NumberLabel.textColor = .black
            
            step2View.backgroundColor = .white
            step2View.borderWidth = 1
            step2View.borderColor = .systemGray
            step2NumberLabel.textColor = .black
            
            step3View.backgroundColor = .systemBlue
            step3View.borderWidth = 0
            step3NumberLabel.textColor = .white
            
            step4View.backgroundColor = .white
            step4View.borderWidth = 1
            step4View.borderColor = .systemGray
            step4NumberLabel.textColor = .black
            nextLabel.text = "Next"
            
            title1Label.text = "Please select a Dish"
            title2Label.text = "Please enter no of servings"
            
            mainStep4View.isHidden = true
            content1View.isHidden = false
            content2View.isHidden = false
            addView.isHidden = false
            
            
        case 4:
            
            step1View.backgroundColor = .white
            step1View.borderWidth = 1
            step1View.borderColor = .systemGray
            step1NumberLabel.textColor = .black
            
            step2View.backgroundColor = .white
            step2View.borderWidth = 1
            step2View.borderColor = .systemGray
            step2NumberLabel.textColor = .black
            
            step3View.backgroundColor = .white
            step3View.borderWidth = 1
            step3View.borderColor = .systemGray
            step3NumberLabel.textColor = .black
            
            step4View.backgroundColor = .systemBlue
            step4View.borderWidth = 0
            step4NumberLabel.textColor = .white
            nextLabel.text = "Submit"
            
            
            content1View.isHidden = true
            content2View.isHidden = true
            addView.isHidden = true
            mainStep4View.isHidden = false
            
        default:
            print("Not found")
        }
    }
    
    func handleAction() {
        let nextAction = UITapGestureRecognizer(target: self, action: #selector(nextAction(_:)))
        nextView.addGestureRecognizer(nextAction)
        
        let previousAction = UITapGestureRecognizer(target: self, action: #selector(previousAction(_:)))
        previousView.addGestureRecognizer(previousAction)
        
        let increaseAction = UITapGestureRecognizer(target: self, action: #selector(increaseAction(_:)))
        increaseIcon.isUserInteractionEnabled = true
        increaseIcon.addGestureRecognizer(increaseAction)
        
        let decreaseAction = UITapGestureRecognizer(target: self, action: #selector(decreaseAction(_:)))
        decreaseIcon.isUserInteractionEnabled = true
        decreaseIcon.addGestureRecognizer(decreaseAction)
    }
    
    @objc func nextAction(_ sender: UITapGestureRecognizer) {
        if indexOfStep < 4 {
            indexOfStep += 1
        }
        self.order = Order(medal: value1Label.text ?? "", numberOfPeople: numberofPeople, restaurent: restaurent)
    }
    
    @objc func previousAction(_ sender: UITapGestureRecognizer) {
        if indexOfStep > 1 {
            indexOfStep -= 1
        }
    }
    
    @objc func increaseAction(_ sender: UITapGestureRecognizer) {
        numberofPeople += 1
        self.value2Label.text = "\(numberofPeople)"
    }
    @objc func decreaseAction(_ sender: UITapGestureRecognizer) {
        if numberofPeople > 1 {
            numberofPeople -= 1
            self.value2Label.text = "\(numberofPeople)"
        }
    }
    
    
    @IBAction func dropdownListValue(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        let customView = DropdownView(frame: CGRect(x: content1View.frame.minX, y: content1View.frame.minY - 20, width: content1View.frame.size.width, height: 100))
        customView.tag = 100
        switch indexOfStep {
        case 1:
            // Handle show list
            handleDropdown(sender.isSelected, content2View, customView)
            
            customView.data = dataStep1
            customView.onSelectedRow = { [weak self] data in
                guard let self = self else { return }
                self.value1Label.text = data
                if let viewWithTag = self.view.viewWithTag(100) {
                    viewWithTag.removeFromSuperview()
                    sender.isSelected = !sender.isSelected
                }
                
            }
        case 2:
            // Handle show list
            let customView2 = DropdownView(frame: CGRect(x: content1View.frame.minX, y: content1View.frame.minY - 20, width: content4View.frame.size.width, height: 100))
            handleDropdown(sender.isSelected, content4View, customView2)
            
            customView2.tag = 100
            customView2.data = dataStep2
            customView2.onSelectedRow = { [weak self] data in
                guard let self = self else { return }
                self.value1Label.text = data
                if let viewWithTag = self.view.viewWithTag(100) {
                    viewWithTag.removeFromSuperview()
                    sender.isSelected = !sender.isSelected
                }
                
            }
        case 3:
            customView.data = dataStep3
        default:
            break
        }
    }
    
    func handleDropdown(_ isShow: Bool, _ viewParrent: UIView = UIView(), _ viewSub: UIView = UIView()) {
        if isShow {
            viewParrent.addSubview(viewSub)
        } else {
            if let viewWithTag = self.view.viewWithTag(100) {
                viewWithTag.removeFromSuperview()
            }
        }
    }
    
}

