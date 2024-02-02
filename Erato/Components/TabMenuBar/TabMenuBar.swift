//
//  TabMenu.swift
//  Erato
//
//  Created by Rafael Basso on 02/02/24.
//

import SwiftUI

struct TabMenuBar: View {
    @State var optionMap: [String: Bool]
    
    let options : [String]
    let onSelect: (_ option: String) -> ()
    
    init(options: [String], onSelect: @escaping (String) -> ()) {
        self.options = options
        self.onSelect = onSelect
        
        var tmpMap: [String: Bool] = [:]
        
        options.forEach { option in
            let isFirst = options.first == option
            tmpMap[option] = isFirst
        }
        
        self.optionMap = tmpMap
    }
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(options, id: \.self) { option in
                TabMenuOption(title: option) {
                    toggleOption(option)
                    onSelect(option)
                }
                .isSelected(optionMap[option] ?? false)
            }
        }
        .foregroundStyle(.primary)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
    }
    
    func toggleOption(_ option: String) {
        for key in optionMap.keys {
            optionMap[key] = false
        }
        optionMap[option] = true
    }
}

#Preview {
    TabMenuBar(options: ["Description", "Chapters"]) { option in
        print(option)
    }
}
