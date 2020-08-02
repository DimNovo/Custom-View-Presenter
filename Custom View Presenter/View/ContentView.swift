//
//  ContentView.swift
//  Custom View Presenter
//
//  Created by Dmitry Novosyolov on 02/08/2020.
//  Copyright © 2020 Dmitry Novosyolov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State
    private var presenter: Presenter?
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            Button(action: { self.presenter = .alert(.attention) }, label: { Text("Attention Alert")})
            Button(action: { self.presenter = .alert(.error) }, label: { Text("Error Alert").foregroundColor(.red)})
            Button(action: { self.presenter = .actionSheet }, label: { Text("Action Sheet")})
            Button(action: { self.presenter = .sheet }, label: { Text("Sheet")})
        }
        .font(.title)
        .modifier(CustomViewPresenter(presenter: $presenter))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
