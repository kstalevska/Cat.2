//
//  TagListView.swift
//  Cat.2
//
//  Created by Ihor Stalevskiy on 27.03.2025.
//

import SwiftUI

struct TagListView: View {
    let tags: [String]

    var body: some View {
        FlexibleView(
            data: tags,
            spacing: 8,
            alignment: .leading
        ) { tag in
            Text(tag)
                .font(.caption)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(Colors.cardBackground.opacity(0.3))
                .foregroundColor(Colors.foreground)
                .cornerRadius(12)
        }
    }
}
