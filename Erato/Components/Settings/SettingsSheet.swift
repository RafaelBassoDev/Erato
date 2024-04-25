//
//  SettingsSheet.swift
//  Erato
//
//  Created by Rafael Basso on 25/04/24.
//

import SwiftUI

struct SettingsSheet<Content>: View where Content: View {
    @State var offset: CGSize = CGSize(width: 0, height: 0)
    @Binding var showSettings: Bool
    let content: () -> Content
    
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .bottom) {
                content()
                    .onTapGesture {
                        showSettings = false
                    }

                HStack {
                    Button {
                    } label: {
                        Text("A")
                            .font(.system(size: 20))
                            .bold()
                    }
                    .buttonStyle(.plain)
                    
                    Button {
                    } label: {
                        Text("A")
                            .font(.system(size: 30))
                            .bold()
                    }
                    .buttonStyle(.plain)
                }
                .frame(maxWidth: .infinity, maxHeight: proxy.size.height*0.2)
                .background(.red)
                .animation(.snappy, value: offset)
                .offset(offset)
            }
            .onChange(of: showSettings) {
                if showSettings {
                    offset = .zero
                } else {
                    offset = CGSize(width: 0, height: proxy.size.height*0.25)
                }
            }
        }
    }
}

struct SettingsSheet_Preview: PreviewProvider {
    struct ContainerView: View {
        @State var show = true
        
        var body: some View {
            SettingsSheet(showSettings: $show) {
                Toggle(isOn: $show) {
                    Text("show options")
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.purple)
            }
        }
    }
    
    static var previews: some View {
        ContainerView()
    }
}
