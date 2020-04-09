//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Robert Harrison on 04/08/2020.
//  Copyright © 2020 Robert Harrison. All rights reserved.
//

import UIKit
import AudioToolbox

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()

    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var ageSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func ageSliderChanged(_ sender: UISlider) {
        let age = String(format: "%.0f", sender.value)
        ageLabel.text = "\(age) yrs"
    }
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let height = String(format: "%.1f", sender.value)
        heightLabel.text = "\(height) ft"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weight) lb"
       
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = (heightSlider.value * 12)
        let weight = weightSlider.value

        calculatorBrain.calculateBMI(height: height, weight: weight)
        performSegue(withIdentifier: "goToResult", sender: self)
        
        AudioServicesPlaySystemSound(1520)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}























