//
//  ContentView.swift
//  SwiftUILearning
//
//  Created by Dhruv Ukani on 02/01/24.
//

import SwiftUI
struct HeartView: View {
    var body: some View {
        Circle()
            .fill(.yellow)
            .frame(width: 30, height: 30)
            .overlay(Image(systemName: "heart").foregroundColor(.red))
    }
}

struct ButtonView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color.blue.gradient)
            .frame(width: 150, height: 50)
    }
}

// ZStack
struct IconDemo1: View {
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ButtonView()
            HeartView()
                .alignmentGuide(.top, computeValue: { $0.height / 2 })
                .alignmentGuide(.trailing, computeValue: { $0.width / 2 })
        }
    }
}

// overlay
struct IconDemo2: View {
    var body: some View {
        ButtonView()
            .overlay(alignment: .topTrailing) {
                HeartView()
                    .alignmentGuide(.top, computeValue: { $0.height / 2 })
                    .alignmentGuide(.trailing, computeValue: { $0.width / 2 })
            }
    }
}

// background
struct IconDemo3: View {
    var body: some View {
            HeartView()
            .background(alignment:.center){
                ButtonView()
                    .alignmentGuide(HorizontalAlignment.center, computeValue: {$0[.trailing]})
                    .alignmentGuide(VerticalAlignment.center, computeValue: {$0[.top]})
            }
    }
}
struct ContentView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            IconDemo1()
            IconDemo2()
            IconDemo3()
        }
    }
}

#Preview {
    ContentView()
}
