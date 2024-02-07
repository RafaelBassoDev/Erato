//
//  View.swift
//  Erato
//
//  Created by Rafael Basso on 07/02/24.
//

import SwiftUI

extension View {
    @ViewBuilder
    func loading(_ isLoading: Bool, label: String = "", scale: CGFloat = 2.0) -> some View {
        if isLoading {
            ZStack {
                ProgressView(label)
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

    @ViewBuilder
    func loading(_ isLoading: Bool, progress: CGFloat , label: String = "", scale: CGFloat = 0.9) -> some View {
        if isLoading {
            ZStack {
                ProgressView(label, value: progress)
                    .scaleEffect(scale, anchor: .center)
                    .progressViewStyle(.linear)
                
                self
                    .disabled(isLoading)
                    .foregroundStyle(.foreground.opacity(0.1))
            }
        } else {
            self
        }
    }
}
