//
//  SettingsSheet.swift
//  Erato
//
//  Created by Rafael Basso on 25/04/24.
//

import SwiftUI

struct SettingsSheet<Content>: View where Content: View {
    @EnvironmentObject var fontSettings: FontSettings
    
    @Binding var showSettings: Bool
    @Binding var screenDimOpacity: Double
    
    @State var offset: CGSize = CGSize(width: 0, height: 400)
    let content: () -> Content
    
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .bottom) {
                content()
                    .onTapGesture {
                        showSettings = false
                    }
                
                Form {
                    Section("Font") {
                        VStack(alignment: .leading) {
                            Text("Size:")
                                .bold()
                            
                            Stepper(
                                value: $fontSettings.size,
                                in: fontSettings.fontSizeBounds,
                                step: 1
                            ) {
                                Text("\(Int(fontSettings.size))")
                            }
                        }
                        
                        Picker("Family", selection: $fontSettings.family) {
                            ForEach(FontFamily.allCases) { family in
                                Text(family.rawValue)
                            }
                        }
                        .pickerStyle(.menu)
                    }
                    
                    Section("Text") {
                        VStack(alignment: .leading) {
                            Text("Character Spacing:")
                                .bold()
                             
                            Stepper(
                                value: $fontSettings.characterSpacing,
                                in: fontSettings.characterSpacingBounds,
                                step: 1
                            ) {
                                Text("\(Int(fontSettings.characterSpacing))")
                            }
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Line Spacing:")
                                .bold()
                            
                            Stepper(
                                value: $fontSettings.lineSpacing,
                                in: fontSettings.lineSpacingBounds,
                                step: 1
                            ) {
                                Text("\(Int(fontSettings.lineSpacing))")
                            }
                        }
                    }
                    
                    Section("Screen Dim") {
                        Slider(
                            value: $screenDimOpacity,
                            in: 0...1,
                            step: 0.01
                        )
                    }
                }
                .padding(.bottom)
                .background(.background)
                .clipShape(
                    .rect(
                        topLeadingRadius: 8,
                        bottomLeadingRadius: 0,
                        bottomTrailingRadius: 0,
                        topTrailingRadius: 8
                    )
                )
                .ignoresSafeArea(.all, edges: .bottom)
                .frame(maxWidth: .infinity, maxHeight: proxy.size.height*0.4)
                .animation(.snappy, value: offset)
                .offset(offset)
            }
            .onChange(of: showSettings) {
                if showSettings {
                    offset = .zero
                } else {
                    offset = CGSize(width: 0, height: proxy.size.height*0.5)
                }
            }
        }
    }
}

struct SettingsSheet_Preview: PreviewProvider {
    struct ContainerView: View {
        @State var show = false
        @State var opacity = 0.0
        
        var body: some View {
            SettingsSheet(showSettings: $show, screenDimOpacity: $opacity) {
                Toggle(isOn: $show) {
                    Text("show options")
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.purple)
            }
        }
    }
    
    static var previews: some View {
        let fontSettings = FontSettings()
        
        ContainerView()
            .environmentObject(fontSettings)
    }
}
