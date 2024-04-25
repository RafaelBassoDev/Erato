//
//  File.swift
//  Erato
//
//  Created by Rafael Basso on 01/02/24.
//

import SwiftUI

final class FontSettings: ObservableObject {
    public enum FontFamily: String {
        case arial = "ArialMT",
             charter = "Charter-Roman",
             helvetica = "Helvetica",
             georgia = "Georgia",
             palatino = "Palatino-Roman",
             verdana = "Verdana",
             timesNewRoman = "TimesNewRomanPSMT"
    }
    
    @AppStorage("fontSize") private(set) var size: Double = 22
    @AppStorage("fontFamily") private(set) var family: FontFamily = .verdana
    @AppStorage("fontCharacterSpacing") private(set) var characterSpacing: Double = 0
    @AppStorage("fontLineSpacing") private(set) var lineSpacing: Double = 0
}

extension FontSettings {
    public func setSize(_ newValue: Double) {
        size = newValue
    }
    
    public func setFamily(_ newValue: FontFamily) {
        family = newValue
    }
    
    public func setCharacterSpacing(_ newValue: Double) {
        characterSpacing = newValue
    }
    
    public func setLineSpacing(_ newValue: Double) {
        lineSpacing = newValue
    }
}

extension View {
    @ViewBuilder
    func applyingFontSettings(_ fontSettings: FontSettings) -> some View {
        self
            .font(.custom(fontSettings.family.rawValue, size: fontSettings.size))
            .kerning(fontSettings.characterSpacing)
            .lineSpacing(fontSettings.lineSpacing)
    }
}

