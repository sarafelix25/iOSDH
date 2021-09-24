//
//  HomeViewController.swift
//  Calculadora
//
//  Created by sara.batista.d.felix on 31/07/21.
//

import UIKit

final class HomeViewController: UIViewController {

    // MARK: - Outlets
    
    // Results
    @IBOutlet weak var resultLabel: UILabel!
    
    // Numbers
    @IBOutlet weak var number0: UIButton!
    @IBOutlet weak var number1: UIButton!
    @IBOutlet weak var number2: UIButton!
    @IBOutlet weak var number3: UIButton!
    @IBOutlet weak var number4: UIButton!
    @IBOutlet weak var number5: UIButton!
    @IBOutlet weak var number6: UIButton!
    @IBOutlet weak var number7: UIButton!
    @IBOutlet weak var number8: UIButton!
    @IBOutlet weak var number9: UIButton!
    @IBOutlet weak var numberDecimal: UIButton!
    
    // Operators
    @IBOutlet weak var operatorAC: UIButton!
    @IBOutlet weak var operatorPlus: UIButton!
    @IBOutlet weak var operatorPercent: UIButton!
    @IBOutlet weak var operatorDivision: UIButton!
    @IBOutlet weak var operatorMultiplication: UIButton!
    @IBOutlet weak var operatorSubtraction: UIButton!
    @IBOutlet weak var operatorAddition: UIButton!
    @IBOutlet weak var operatorResult: UIButton!
    
    // MARK: - Variáveis
    
    // Resultado da calc armazenado
    private var total: Double = 0
    
    // valor temporário
    private var temp: Double = 0
    
    // indica se um operador foi selecionado
    private var operating = false
    private var decimal = false
    
    // operação atual
    private var operation: OperationType = .none
    
    // MARK: - Constantes
    private let kDecimalSeparator = Locale.current.decimalSeparator!
    private let kMaxLength = 9
    private let kTotal = "total"
    
    private enum OperationType {
        case none, addiction, multiplication, subtraction, division, percent
    }
    
    // formatador de valores auxiliares
    private let auxFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 100
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 100
        return formatter
    }()
    
    private let auxTotalFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = ""
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 100
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 100
        return formatter
    }()
    
    // formatador de valores
    private let printFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = locale.groupingSeparator
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 9
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 8
        return formatter
    }()
    
    // formato cientifico
    private let printScientificFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .scientific
        formatter.maximumFractionDigits = 3
        formatter.exponentSymbol = "e"
        return formatter
    }()
    
    // MARK: - Init
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberDecimal.setTitle(kDecimalSeparator, for: .normal)
        
        total = UserDefaults.standard.double(forKey: kTotal)
        
        result()
    }
        
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // UI
        number0.round()
        number1.round()
        number2.round()
        number3.round()
        number4.round()
        number5.round()
        number6.round()
        number7.round()
        number8.round()
        number9.round()
        numberDecimal.round()
        
        operatorAC.round()
        operatorPlus.round()
        operatorPercent.round()
        operatorDivision.round()
        operatorMultiplication.round()
        operatorSubtraction.round()
        operatorAddition.round()
        operatorResult.round()

    }

    // MARK: - Button Actions
    @IBAction func operatorACAction(_ sender: UIButton) {
        
        clear()
        
        sender.shine()
    }
    
    @IBAction func operatorPlusAction(_ sender: UIButton) {
        
        temp = temp * (-1)
        
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        
        sender.shine()
    }
    
    @IBAction func operatorPercentAction(_ sender: UIButton) {
        
        if operation != .percent {
            result()
        }
        
        operating = true
        operation = .percent
        result()
        
        sender.shine()
    }
    
    @IBAction func operatorDivisionAction(_ sender: UIButton) {
        
        if operation != .none {
            result()
        }
        
        operating = true
        operation = .division
        
        sender.shine()
    }
    
    @IBAction func operatorMultiplicationAction(_ sender: UIButton) {
        
        if operation != .none {
            result()
        }
        
        operating = true
        operation = .multiplication
        
        sender.shine()
    }
    
    @IBAction func operatorSubtractionAction(_ sender: UIButton) {
        
        if operation != .none {
            result()
        }
        
        operating = true
        operation = .subtraction
        
        sender.shine()
    }
    
    @IBAction func operatorAdditionAction(_ sender: UIButton) {
        
        if operation != .none {
            result()
        }
        
        operating = true
        operation = .addiction
        
        sender.shine()
    }
    
    @IBAction func operatorResultAction(_ sender: UIButton) {
        
        result()
        
        sender.shine()
    }
    
    @IBAction func operatorDecimalAction(_ sender: UIButton) {
        
        let currentTemp = auxTotalFormatter.string(from: NSNumber(value: temp))!
        if !operating && currentTemp.count >= kMaxLength {
            return
        }
        
        resultLabel.text = resultLabel.text! + kDecimalSeparator
        decimal = true
        
        selectVisualOperation()
        
        sender.shine()
    }
    
    @IBAction func numberAction(_ sender: UIButton) {
        
        operatorAC.setTitle("C", for: .normal)
        
        var currentTemp = auxTotalFormatter.string(from: NSNumber(value: temp))!
        if !operating && currentTemp.count >= kMaxLength {
            return
        }
        
        currentTemp = auxFormatter.string(from: NSNumber(value: temp))!
        
        if operating {
            total = total == 0 ? temp : total
            resultLabel.text = ""
            currentTemp = ""
            operating = false
        }
        
        if decimal {
            currentTemp = "\(currentTemp)\(kDecimalSeparator)"
            decimal = false
        }
        
        let number = sender.tag
        temp = Double(currentTemp + String(number))!
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
       
        selectVisualOperation()
        
        sender.shine()
    }
    
    // limpar
    private func clear() {
        operation = .none
        operatorAC.setTitle("AC", for: .normal)
        
        if temp != 0 {
            temp = 0
            resultLabel.text = "0"
        } else {
            total = 0
            result()
        }
    }
    
    private func result() {
        switch operation {
        case .none:
            break
        case .addiction:
            total = total + temp
            break
        case .multiplication:
            total = total * temp
            break
        case .subtraction:
            total = total - temp
            break
        case .division:
            total = total / temp
            break
        case .percent:
            temp = temp / 100
            total = temp
            break
        }
    
    if let currentTotal = auxTotalFormatter.string(from: NSNumber(value: total)),
           currentTotal.count > kMaxLength {
    resultLabel.text = printScientificFormatter.string(from: NSNumber(value: total))
    } else {
    resultLabel.text = printFormatter.string(from: NSNumber(value: total))
    }
    
    selectVisualOperation()
    
    UserDefaults.standard.set(total, forKey: kTotal)
    
    print("TOTAL: \(total)")
        
    }
    
    private func selectVisualOperation() {

        if !operating {
//            // No estamos operando
            operatorAddition.selectOperation(false)
            operatorSubtraction.selectOperation(false)
            operatorMultiplication.selectOperation(false)
            operatorDivision.selectOperation(false)
        } else {
            switch operation {
            case .none, .percent:
                operatorAddition.selectOperation(false)
                operatorSubtraction.selectOperation(false)
                operatorMultiplication.selectOperation(false)
                operatorDivision.selectOperation(false)
                break
            case .addiction:
                operatorAddition.selectOperation(true)
                operatorSubtraction.selectOperation(false)
                operatorMultiplication.selectOperation(false)
                operatorDivision.selectOperation(false)
                break
            case .subtraction:
                operatorAddition.selectOperation(false)
                operatorSubtraction.selectOperation(true)
                operatorMultiplication.selectOperation(false)
                operatorDivision.selectOperation(false)
                break
            case .multiplication:
                operatorAddition.selectOperation(false)
                operatorSubtraction.selectOperation(false)
                operatorMultiplication.selectOperation(true)
                operatorDivision.selectOperation(false)
                break
            case .division:
                operatorAddition.selectOperation(false)
                operatorSubtraction.selectOperation(false)
                operatorMultiplication.selectOperation(false)
                operatorDivision.selectOperation(true)
                break
                }
        }
    }
}
