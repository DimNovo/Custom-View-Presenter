//
//  CustomViewPresenter.swift
//  Custom View Presenter
//
//  Created by Dmitry Novosyolov on 02/08/2020.
//  Copyright © 2020 Dmitry Novosyolov. All rights reserved.
//

import SwiftUI

struct CustomViewPresenter: ViewModifier {
    @Binding
    var presenter: Presenter?
    func body(content: Content) -> some View {
        switch presenter {
        case .alert(.attention):
            return content
                .alert(item: $presenter)
                { _ in Alert(title: Text("Attention"),
                             message: Text("message."),
                             dismissButton: .default(Text("OK")))}.wrappedToAny
        case .alert(.error):
            return content
                .alert(item: $presenter)
                { _ in Alert(title: Text("Error"),
                             message: Text("message."),
                             dismissButton: .destructive(Text("OK")))}.wrappedToAny
        case .actionSheet:
            return content
                .actionSheet(item: $presenter) { _ in
                    ActionSheet(title: Text("Action Sheet"),
                                message: Text("message."),
                                buttons: [
                                    .default(Text("OK")),
                                    .cancel()
                    ])
            }.wrappedToAny
        case .sheet:
            return content
                .sheet(item: $presenter) { _ in Text("Sheet is Presented!")}.wrappedToAny
        case .none:
            return content.wrappedToAny
        }
    }
}
