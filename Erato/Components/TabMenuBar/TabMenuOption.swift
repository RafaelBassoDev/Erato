//
//  TabMenuOption.swift
//  Erato
//
//  Created by Rafael Basso on 02/02/24.
//

import SwiftUI

struct TabMenuOption: View {
    let title: String
    let onClick: () -> ()
    
    var body: some View {
        Button {
            onClick()
        } label: {
            Text(title)
                .foregroundStyle(.primary)
        }
        .padding(10)
        .buttonStyle(.plain)
        .frame(maxWidth: .infinity)
    }
}

extension TabMenuOption {
    func isSelected(_ isSelected: Bool) -> some View {
        ZStack(alignment: .bottom) {
            self
            
            if (isSelected) {
                Rectangle()
                    .fill(.primary)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, maxHeight: 4)
            }
        }
    }
}

#Preview {
    TabMenuOption(title: "Description") {
        print("opa")
    }
    .isSelected(true)
}
