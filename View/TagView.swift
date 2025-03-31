//
//  TagView.swift
//  Cat.2
//
//  Created by Ihor Stalevskiy on 28.03.2025.
//

import SwiftUI

struct Wrap: View {
    let tags: [String]
    
    var body: some View {
        HStack() {
            ForEach(tags, id: \.self) { tag in
                Text(tag)
                    .padding(.all, 8)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(5)
            }
        }
        .padding(.all, 4)
        .background(Color.gray.opacity(0.5)) // для візуалізації границь Wrap
    }
    
    
    private func item(for text: String) -> some View {
        Text(text)
            .padding(.all, 8)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(5)
    }
}



struct TagListViewAdapter: UIViewRepresentable {
    typealias UIViewType =
    
    var tags: [String]
    
    func makeUIView(context: Context) -> TagListView {
        let tagListView = TagListView()
        tagListView.textFont = UIFont.systemFont(ofSize: 20)
        tagListView.tagBackgroundColor = UIColor(Color.init(hue: 0.54, saturation: 0.50, brightness: 0.43))
        tagListView.paddingY = 6
        tagListView.paddingX = 10
        tagListView.cornerRadius = 5
        tagListView.marginX = 12
        tagListView.marginY = 12
        
        return tagListView
    }
    
    func updateUIView(_ uiView: TagListView, context: Context) {
        uiView.removeAllTags()
        uiView.addTags(tags)
    }
}


#Preview {
    TagView()
}
