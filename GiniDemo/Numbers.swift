//
//  Numbers.swift
//  GiniDemo
//
//  Created by Tal talspektor on 04/06/2021.
//

import Foundation

struct Numbers: Decodable {
    let numbers: [Number]
}

struct Number: Decodable {
    let number: Int
}
