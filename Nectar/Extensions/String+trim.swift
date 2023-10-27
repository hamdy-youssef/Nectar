//
//  String+trim.swift
//  Nectar
//
//  Created by Hamdy Youssef on 27/10/2023.
//

import Foundation
import UIKit

extension String {
    var trimm: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
