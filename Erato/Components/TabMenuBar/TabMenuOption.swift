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
                    .frame(width: .infinity, height: 4)
                    .padding(.horizontal)
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
