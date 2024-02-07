//
//  View.swift
//  Erato
//
//  Created by Rafael Basso on 07/02/24.
//

import SwiftUI

extension View {
    @ViewBuilder
    func loading(_ isLoading: Bool, scale: CGFloat = 2.0) -> some View {
        if isLoading {
            ZStack {
                ProgressView()
                    .scaleEffect(scale, anchor: .center)
                    .progressViewStyle(.circular)
                
                self
                    .disabled(isLoading)
                    .foregroundStyle(.foreground.opacity(0.1))
            }
        } else {
            self
        }
    }
}
