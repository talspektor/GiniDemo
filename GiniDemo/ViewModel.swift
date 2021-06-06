//
//  ViewModel.swift
//  GiniDemo
//
//  Created by Tal talspektor on 04/06/2021.
//

import Combine

class ViewModel {

    var numbers = [Number]()

    func getNumbers(completion: @escaping () -> Void) {
        APICaller.getNumbers { [weak self] result in
            switch result {
            case .success(let numbers):
                self?.numbers = numbers.numbers
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
}
