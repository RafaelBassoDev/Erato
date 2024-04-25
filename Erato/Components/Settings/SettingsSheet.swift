//
//  SettingsSheet.swift
//  Erato
//
//  Created by Rafael Basso on 25/04/24.
//

import SwiftUI

extension View {
    @ViewBuilder
    func settingsSheet(_ show: Bool) -> some View {
        GeometryReader { proxy in
            ZStack(alignment: .bottom) {
                self
                
                HStack {
                    Text("Opa")
                    
                    Text("Opa")
                }
                .frame(maxWidth: .infinity, maxHeight: proxy.size.height*0.3)
                .background(.red)
            }
        }
    }
}

struct SettingsSheet_Preview: PreviewProvider {
    struct ContainerView: View {
        @State var show = true
        
        var body: some View {
            Rectangle()
                .foregroundStyle(.purple)
                .settingsSheet(show)
        }
    }
    
    static var previews: some View {
        ContainerView()
    }
}

extension View {
    @ViewBuilder
    func teste(_ isLoading: Bool, showBackground: Bool = true, label: String? = nil) -> some View {
        GeometryReader { proxy in
            ZStack(alignment: .center) {
                self
                    .blur(radius: isLoading ? 2 : 0)
                
                if isLoading {
                    VStack(spacing: 20) {
                        ProgressView()
                            .controlSize(.large)
                        
                        if label != nil {
                            Text(label!)
                                .font(.system(size: 200))
                                .lineLimit(2)
                                .multilineTextAlignment(.center)
                                .minimumScaleFactor(0.01)
                        }
                    }
                    .padding(.horizontal, label != nil ? 10 : nil)
                    .padding(.vertical)
                    .frame(
                        maxWidth: label != nil ? proxy.size.width/3 : nil,
                        alignment: .center
                    )
                    .background {
                        if showBackground {
                            RoundedRectangle(cornerRadius: 12.0)
                                .foregroundStyle(.background)
                                .opacity(0.9)
                        }
                    }
                }
            }
        }
    }
}
