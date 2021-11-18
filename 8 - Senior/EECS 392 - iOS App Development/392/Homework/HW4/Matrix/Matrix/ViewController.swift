//
//  ViewController.swift
//  Matrix
//
//  Created by Jacob Alspaw on 2/12/19.
//  Copyright © 2019 Jacob Alspaw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputLabel: UILabel!
    @IBOutlet weak var matrixInput: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var outputTextbox: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outputTextbox.text = ""
    }

    @IBAction func calculateClicked(_ sender: Any) {
        let input: String? = matrixInput.text;
        if (!isValidInput(input: input)) {
            inputLabel.textColor = UIColor.red
            return
        }
        
        inputLabel.textColor = UIColor.black
        let inputMat: [[Double]] = parseInput(input: input!)
        let outputMat: [[Double]] = squareMultiply(matrix: inputMat)
        let outputStr: String = convertMatrixToString(matrix: outputMat)
        displayMatrix(matStr: outputStr)
    }
    
    func isValidInput(input: String?) -> Bool {
        if (input == nil || input!.isEmpty) {
            return false
        }
        else {
            let rows: [String] = input!.components(separatedBy: ";")
            for r in 0..<rows.count {
                //if number of columns does not match number of rows, return false
                let column: [String] = rows[r].components(separatedBy: " ")
                if (column.count != rows.count) {
                    return false
                }
                //check to make sure every value is a number
                for c in 0..<column.count {
                    if (Double(column[c]) == nil) {
                        return false
                    }
                }
            }
            return true
        }
    }
    
    func parseInput(input: String) -> [[Double]] {
        var inputMat: [[Double]] = []
        let rows: [String] = input.components(separatedBy: ";")
        for r in 0..<rows.count {
            inputMat.append([])
            let column: [String] = rows[r].components(separatedBy: " ")
            for c in 0..<column.count {
                inputMat[r].append(Double(column[c])!)
            }
        }
        return inputMat
    }
    
    func squareMultiply(matrix: [[Double]]) -> [[Double]] {
        let len: Int = matrix.count
        var result: [[Double]] = [[Double]](repeating: [Double](repeatElement(0, count: len)), count: len)
        
        for i in 0..<len {
            for j in 0..<len {
                for k in 0..<len {
                    result[i][j] = Double(String(format: "%.3f", result[i][j] + (matrix[i][k] * matrix[k][j])))!
                }
            }
        }
        
        return result
    }
    
    func convertMatrixToString(matrix: [[Double]]) -> String {
        var rows: [String] = []
        for r in 0..<matrix.count {
            let column: [Double] = matrix[r]
            rows.append(column.map { String($0) }.joined(separator: " "))
        }
        return rows.map { String($0) }.joined(separator: ";")
    }
    
    func displayMatrix(matStr: String) {
        outputTextbox.text = matStr;
    }
}

