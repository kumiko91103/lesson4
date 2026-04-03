//
//  ContentView.swift
//  lesson4
//
//  Created by 114-2Workshop17 on 2026/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 2 // 預設在首頁
    
    var body: some View {
        VStack(spacing: 0) {
            // 根據選擇切換內容
            ZStack {
                switch selectedTab {
                case 0: InvoiceView() 
                case 1: Text("探索頁面").frame(maxWidth: .infinity, maxHeight: .infinity)
                case 2: MonsterHomeView()
                case 3: Text("商城頁面").frame(maxWidth: .infinity, maxHeight: .infinity)
                case 4: OtherView()
                default: EmptyView()
                }
            }
            
            // 自定義 TabBar
            CustomTabBar(selectedTab: $selectedTab)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct CustomTabBar: View {
    @Binding var selectedTab: Int
    
    let tabs = [
        ("發票", "list.bullet.rectangle"),
        ("探索", "safari"),
        ("首頁", "house.fill"),
        ("商城", "bag"),
        ("更多", "ellipsis.circle")
    ]
    
    var body: some View {
        HStack {
            ForEach(0..<tabs.count, id: \.self) { index in
                Button(action: { selectedTab = index }) {
                    VStack(spacing: 4) {
                        Image(systemName: tabs[index].1)
                            .font(.system(size: 20))
                        Text(tabs[index].0)
                            .font(.caption2)
                    }
                    .foregroundColor(selectedTab == index ? .blue : .gray)
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .padding(.top, 10)
        .padding(.bottom, 30) // 預留給沒有 Home Indicator 的舊機型或安全區域
        .background(Color.white)
        .shadow(radius: 2)
    }
}
extension View {
    func debugBox(_ color: Color = .red) -> some View {
        self
            .background(color.opacity(0.12))
            .overlay(
                GeometryReader { geo in
                    ZStack(alignment: .topLeading) {
                        Rectangle()
                            .stroke(color, lineWidth: 1)
                        
                        Text("\(Int(geo.size.width)) × \(Int(geo.size.height))")
                            .font(.caption2)
                            .foregroundColor(.black)
                            .padding(3)
                            .background(Color.white.opacity(0.85))
                    }
                }
            )
    }
}
#Preview {
    ContentView()
}
