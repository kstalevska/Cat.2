import SwiftUICore

//  TagListView.swift
//  Cat.2
//
//  Created by Ihor Stalevskiy on 28.03.2025.


struct TagListView: View {
    let title: String
    let tags: [String]

    @State private var totalHeight: CGFloat = .zero

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text(title)
                .textCase(.uppercase)
                .fontWeight(.heavy)
                .padding(.bottom, 8)
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
            .padding(0)
            .frame(height: totalHeight)
        }
        .padding(.horizontal)
    }

    private func generateContent(in geometry: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return ZStack(alignment: .leading) {
            ForEach(tags, id: \.self) { tag in
                Text(tag)
                    .font(.system(size: 18))
//                    .padding(.horizontal, 8)
//                    .padding(.vertical, 6)
                    .padding(.all, 8)
                    .background(Colors.tagBackground)
                    .foregroundColor(Colors.foreground)
                    .cornerRadius(10)
                    .alignmentGuide(.leading) { d in
                        if width + d.width + 8 > geometry.size.width {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        width += d.width + 26
                        return result
                    }
                    .alignmentGuide(.top) { _ in
                        let result = height
                        return result
                    }
            }
        }
        .background(
            GeometryReader { proxy in
                Color.clear.preference(key: ViewHeightKey.self, value: proxy.size.height)
            }
        )
        .onPreferenceChange(ViewHeightKey.self) { self.totalHeight = $0 }
    }
}

private struct ViewHeightKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}
