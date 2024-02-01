//
//  ReadingScreen.swift
//  Erato
//
//  Created by Rafael Basso on 01/02/24.
//

import SwiftUI

struct ReadingScreen: View {
    @EnvironmentObject var fontSettings: FontSettings
    
    let chapter: Chapter
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text(chapter.title)
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(chapter.content)
                    .font(
                        .system(
                            size: fontSettings.size,
                            weight: .regular,
                            design: .rounded
                        )
                    )
            }
            .padding()
        }
        .gesture(
            DragGesture(minimumDistance: 150)
                .onEnded { _ in
                    print("next chapter")
                }
        )
    }
}

#Preview {
    let text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus efficitur vel nunc eget sollicitudin. Pellentesque condimentum velit quis est congue blandit. Cras sed velit ac mi ullamcorper auctor sit amet at est. Integer mauris lorem, congue sit amet volutpat a, finibus vel nisi. Pellentesque laoreet, arcu sit amet sollicitudin hendrerit, enim neque congue tellus, eu accumsan sem ex ut ipsum. Etiam vulputate ex eget tortor consequat lobortis. Nunc dignissim at nibh a sollicitudin. Sed quis pretium augue, sed ullamcorper leo. Donec laoreet in lacus ut accumsan. Donec vel nunc bibendum, pretium enim ac, malesuada augue. Mauris suscipit auctor vehicula. Integer sagittis nunc lectus, non lacinia enim molestie ac.\n\n Mauris vitae leo id lorem accumsan interdum. Duis aliquam, dui non sodales viverra, risus mi volutpat turpis, suscipit tempor nisi tortor volutpat nunc. Mauris nec consequat justo, imperdiet varius felis. Maecenas ullamcorper convallis metus, vel vulputate mi pulvinar vitae. Nunc vitae ipsum feugiat, suscipit orci sed, tempus dui. Sed pharetra eros a enim porta, vitae commodo felis tempor. Etiam ut orci sollicitudin eros faucibus eleifend vel vel tortor. Sed iaculis dolor vel ligula maximus, id finibus neque blandit. Nam eu eleifend lectus.\n\n Mauris vitae leo id lorem accumsan interdum. Duis aliquam, dui non sodales viverra, risus mi volutpat turpis, suscipit tempor nisi tortor volutpat nunc. Mauris nec consequat justo, imperdiet varius felis. Maecenas ullamcorper convallis metus, vel vulputate mi pulvinar vitae. Nunc vitae ipsum feugiat, suscipit orci sed, tempus dui. Sed pharetra eros a enim porta, vitae commodo felis tempor. Etiam ut orci sollicitudin eros faucibus eleifend vel vel tortor. Sed iaculis dolor vel ligula maximus, id finibus neque blandit. Nam eu eleifend lectus.\n\n Mauris vitae leo id lorem accumsan interdum. Duis aliquam, dui non sodales viverra, risus mi volutpat turpis, suscipit tempor nisi tortor volutpat nunc. Mauris nec consequat justo, imperdiet varius felis. Maecenas ullamcorper convallis metus, vel vulputate mi pulvinar vitae. Nunc vitae ipsum feugiat, suscipit orci sed, tempus dui. Sed pharetra eros a enim porta, vitae commodo felis tempor. Etiam ut orci sollicitudin eros faucibus eleifend vel vel tortor. Sed iaculis dolor vel ligula maximus, id finibus neque blandit. Nam eu eleifend lectus."
    let chapter = Chapter(title: "Chapter 1 - The Beginning", content: text)
    
    let fontSettings = FontSettings()
    fontSettings.setSize(22)
    
    return ReadingScreen(chapter: chapter)
        .environmentObject(fontSettings)
}
