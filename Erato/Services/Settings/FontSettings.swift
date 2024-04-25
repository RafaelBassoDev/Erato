//
//  File.swift
//  Erato
//
//  Created by Rafael Basso on 01/02/24.
//

import SwiftUI

final class FontSettings: ObservableObject {
    @AppStorage("fontSize") var size: Double = 22
    @AppStorage("fontFamily") var family: FontFamily = .verdana
    @AppStorage("fontCharacterSpacing") var characterSpacing: Double = 0
    @AppStorage("fontLineSpacing") var lineSpacing: Double = 0
}

extension FontSettings {
    public var fontSizeBounds: ClosedRange<Double> {
        return 4...80
    }
    
    public var characterSpacingBounds: ClosedRange<Double> {
        return 0...10
    }
    
    public var lineSpacingBounds: ClosedRange<Double> {
        return 0...40
    }
}

public enum FontFamily: String, CaseIterable, Identifiable {
    case arial = "ArialMT",
         charter = "Charter-Roman",
         helvetica = "Helvetica",
         georgia = "Georgia",
         palatino = "Palatino-Roman",
         verdana = "Verdana",
         timesNewRoman = "TimesNewRomanPSMT"
    
    public var id: Self { self }
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

