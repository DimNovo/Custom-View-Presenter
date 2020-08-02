//
//  Model.swift
//  Custom View Presenter
//
//  Created by Dmitry Novosyolov on 02/08/2020.
//  Copyright © 2020 Dmitry Novosyolov. All rights reserved.
//

import Foundation

enum Presenter: Identifiable {
    var id: String { UUID().uuidString }
    case alert(AlertRole)
    case actionSheet
    case sheet
    enum AlertRole {
        case attention
        case error
    }
}
