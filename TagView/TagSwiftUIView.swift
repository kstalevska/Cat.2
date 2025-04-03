//
//  TagSwiftUIView.swift
//  Cat.2
//
//  Created by Ihor Stalevskiy on 03.04.2025.
//

import SwiftUI

// MARK: - Модель тегу
struct TagItem: Identifiable, Hashable {
    var id = UUID().uuidString
    var name: String
    var size: CGFloat
}

// MARK: - Розширення
extension String {
    func getSize() -> CGFloat {
        let font = UIFont.systemFont(ofSize: 16)
        let attributes = [NSAttributedString.Key.font: font]
        let size = (self as NSString).size(withAttributes: attributes)
        return size.width
    }
}

// MARK: - ViewModel
class TagViewModel: ObservableObject {
    @Published var rows: [[TagItem]] = []

    // ⚠️ Отримані з мокових даних або API
    var tags: [TagItem] = [
        TagItem(name: "Спокійний", size: 0),
        TagItem(name: "Інтелігентний", size: 0),
        TagItem(name: "Грайливий", size: 0),
        TagItem(name: "Активний", size: 0),
        TagItem(name: "Терплячий", size: 0),
        TagItem(name: "Незалежний", size: 0),
        TagItem(name: "Доброзичливий", size: 0)
    ]
    init(temperament: String) {
        let rawTags = temperament
            .components(separatedBy: ", ")
            .filter { !$0.isEmpty }
        self.tags = rawTags.map { TagItem(name: $0, size: 0) }
        prepareTags()
    }


//    init() {
//        prepareTags()
//    }

    func prepareTags() {
        var tags = tags
        let screenWidth = UIScreen.main.bounds.width - 40
        var currentRow: [TagItem] = []
        var rows: [[TagItem]] = []
        var totalWidth: CGFloat = 0
        let spacing: CGFloat = 10

        tags.indices.forEach { i in
            tags[i].size = tags[i].name.getSize()
        }

        for tag in tags {
            let tagWidth = tag.size + 24 + 16 // padding left + right + spacing
            if totalWidth + tagWidth + spacing > screenWidth {
                rows.append(currentRow)
                currentRow = []
                totalWidth = 0
            }
            currentRow.append(tag)
            totalWidth += tagWidth + spacing
        }

        if !currentRow.isEmpty {
            rows.append(currentRow)
        }

        self.rows = rows
    }
}
struct ContentView: View {
    @StateObject var viewModel = TagViewModel(temperament: "Спокійний, Інтелігентний, Грайливий, Активний")

    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            Text("Темперамент:")
                .font(.headline)
                .foregroundColor(Colors.foreground)
                .padding(.horizontal)

            ForEach(viewModel.rows, id: \.self) { row in
                HStack(spacing: 8) {
                    ForEach(row) { tag in
                        Text(tag.name)
                            .font(.system(size: 14, weight: .medium))
                            .padding(.horizontal)
                            .padding(.vertical, 6)
                            .background(Colors.cardBackground.opacity(0.3))
                            .foregroundColor(Colors.foreground)
                            .cornerRadius(12)
                    }
                }
                .padding(.horizontal, 8)
            }
        }
        .padding(.vertical)
        .background(Colors.background.ignoresSafeArea())
    }
}

#Preview {
    ContentView()
}
