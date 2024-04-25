//
//  View.swift
//  Erato
//
//  Created by Rafael Basso on 07/02/24.
//

import SwiftUI

extension View {
    @ViewBuilder
    func loading(_ isLoading: Bool, showBackground: Bool = true, label: String? = nil) -> some View {
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

struct SomeView_Preview: PreviewProvider {
    struct ContainerView: View {
        @State var isLoading = true
        
        var body: some View {
            VStack {
                VStack {
                    Toggle(isOn: $isLoading, label: {
                        Text("isLoading")
                    })
                }
                .padding()
                
                Text("Salve!Salve!Salve!Salve!Salve!Salve!Salve!Salve!Salve!Salve!Salve!Salve!Salve!Salve!Salve!Salve!Salve!Salve!")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .font(.system(size: 40))
                    .background(.purple)
                    .loading(isLoading, label: "Loading...")
            }
        }
    }
    
    static var previews: some View {
        ContainerView()
    }
}
