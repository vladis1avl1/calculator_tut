//
//  ContentView.swift
//  calculator
//
//  Created by vladislav on 22.07.2024.
//


import SwiftUI

struct ContentView: View {
    @State private var displayValue: String = "0"
    @State private var currentOperation: String?
    @State private var firstOperand: Double?

    var body: some View {
        VStack {
            Text(displayValue)
                .font(.largeTitle)
                .padding()

            HStack {
                Button("7") { handleDigit("7") }
                Button("8") { handleDigit("8") }
                Button("9") { handleDigit("9") }
                Button("C") { clear() }
            }
            .padding()

            HStack {
                Button("4") { handleDigit("4") }
                Button("5") { handleDigit("5") }
                Button("6") { handleDigit("6") }
                Button("+") { handleOperation("+") }
            }
            .padding()

            HStack {
                Button("1") { handleDigit("1") }
                Button("2") { handleDigit("2") }
                Button("3") { handleDigit("3") }
                Button("-") { handleOperation("-") }
            }
            .padding()

            HStack {
                Button("0") { handleDigit("0") }
                Button(".") { handleDigit(".") }
                Button("=") { handleEquals() }
                Button("*") { handleOperation("*") }
            }
            .padding()

            HStack {
                Button("/") { handleOperation("/") }
            }
            .padding()
        }
    }

    // Функция обработки цифр
    private func handleDigit(_ digit: String) {
        if displayValue == "0" {
            displayValue = digit
        } else {
            displayValue += digit
        }
    }

    // Функция обработки операций
    private func handleOperation(_ operation: String) {
        currentOperation = operation
        firstOperand = Double(displayValue)
        displayValue = "0"
    }

    // Функция обработки знака "="
    private func handleEquals() {
        if let operation = currentOperation, let first = firstOperand, let second = Double(displayValue) {
            switch operation {
            case "+":
                displayValue = String(first + second)
            case "-":
                displayValue = String(first - second)
            case "*":
                displayValue = String(first * second)
            case "/":
                if second == 0 {
                    displayValue = "Error"
                } else {
                    displayValue = String(first / second)
                }
            default:
                break
            }
        }
        currentOperation = nil
        firstOperand = nil
    }

    // Функция очистки
    private func clear() {
        displayValue = "0"
        currentOperation = nil
        firstOperand = nil
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
