//
//  DateFormatter+Extensions.swift
//  Petgram
//
//  Created by Ibad Momin on 4/18/23.
//

import Foundation

extension DateFormatter {
    static var postFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()
}
