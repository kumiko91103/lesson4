//
//  OtherView.swift
//  lesson4
//
//  Created by 114-2Workshop17 on 2026/4/3.
//

import SwiftUI

struct OtherView: View {
    var OtherBanner = "Pokemon_Group"
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    headerSection
                    
                    quickActionSection
                    
                    menuSection
                    
                    accountInfoSection
                        .padding(.top, 18)
                    
                    Spacer(minLength: 20)
                }
            }
        }
    }
}

// MARK: - Sections
private extension OtherView {
    var headerSection: some View {
        ZStack(alignment: .bottom) {
            // 背景淡黃色區塊
            Spacer()
                .frame(height: 312)
            // 底部白色弧形
            Ellipse()
                .fill(Color.white)
                .frame(height: 95)
                .offset(y: 42)
        }
        .background(
            Image(OtherBanner)
                .resizable()
                .scaledToFill()
        )
    }
    
    var quickActionSection: some View {
        HStack(spacing: 0) {
            QuickActionItemView(
                icon: "iphone.gen3",
                iconColor: Color(red: 113/255, green: 173/255, blue: 240/255),
                title: "條碼載具"
            )
            
            QuickActionItemView(
                icon: "creditcard.fill",
                iconColor: Color(red: 92/255, green: 201/255, blue: 128/255),
                title: "會員卡"
            )
            
            QuickActionItemView(
                icon: "receipt.fill",
                iconColor: Color(red: 238/255, green: 200/255, blue: 92/255),
                title: "繳費服務"
            )
            
            QuickActionItemView(
                icon: "person.2.fill",
                iconColor: Color(red: 242/255, green: 136/255, blue: 145/255),
                title: "邀請好友"
            )
        }
        .padding(.top, 20)
        .padding(.bottom, 28)
    }
    
    var menuSection: some View {
        VStack(spacing: 0) {
            MenuRowView(
                icon: "scope",
                iconColor: Color(red: 247/255, green: 147/255, blue: 175/255),
                title: "末三碼快速對獎機"
            )
            
            MenuRowView(
                icon: "target",
                iconColor: Color(red: 154/255, green: 224/255, blue: 220/255),
                title: "統一發票開獎號碼"
            )
            
            MenuRowView(
                icon: "doc.text",
                iconColor: Color(red: 126/255, green: 206/255, blue: 231/255),
                title: "發票開獎FAQ"
            )
            
            Divider()
                .padding(.leading, 70)
                .padding(.trailing, 24)
                .padding(.vertical, 6)
            
            MenuRowView(
                icon: "gearshape",
                iconColor: Color(red: 176/255, green: 213/255, blue: 234/255),
                title: "系統設定"
            )
            
            MenuRowView(
                icon: "questionmark.circle",
                iconColor: Color(red: 190/255, green: 190/255, blue: 190/255),
                title: "常見問題說明"
            )
            
            MenuRowView(
                icon: "dot.radiowaves.left.and.right",
                iconColor: Color(red: 236/255, green: 208/255, blue: 93/255),
                title: "意見回饋中心"
            )
            
            MenuRowView(
                icon: "envelope",
                iconColor: Color(red: 222/255, green: 196/255, blue: 154/255),
                title: "怪獸合作提案"
            )
            
            Divider()
                .padding(.leading, 70)
                .padding(.trailing, 24)
                .padding(.vertical, 6)
        }
    }
    
    var accountInfoSection: some View {
        HStack {
            HStack(spacing: 8) {
                Text("登入號碼：0932886439")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(Color.gray.opacity(0.85))
                
                ZStack {
                    Circle()
                        .fill(Color(red: 100/255, green: 202/255, blue: 237/255))
                        .frame(width: 24, height: 24)
                    
                    Text("?")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                }
            }
            
            Spacer()
            
            Text("版本：4.12.0")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(Color(red: 237/255, green: 196/255, blue: 78/255))
        }
        .padding(.horizontal, 18)
        .frame(height: 52)
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(Color(red: 247/255, green: 247/255, blue: 247/255))
        )
        .padding(.horizontal, 16)
    }
}

// MARK: - Components
struct QuickActionItemView: View {
    let icon: String
    let iconColor: Color
    let title: String
    
    var body: some View {
        VStack(spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(iconColor.opacity(0.14))
                    .frame(width: 44, height: 44)
                
                Image(systemName: icon)
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(iconColor)
            }
            
            Text(title)
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(Color.gray.opacity(0.9))
        }
        .frame(maxWidth: .infinity)
    }
}

struct MenuRowView: View {
    let icon: String
    let iconColor: Color
    let title: String
    
    var body: some View {
        HStack(spacing: 18) {
            ZStack {
                Circle()
                    .fill(iconColor.opacity(0.12))
                    .frame(width: 34, height: 34)
                
                Image(systemName: icon)
                    .font(.system(size: 18, weight: .regular))
                    .foregroundColor(iconColor)
            }
            
            Text(title)
                .font(.system(size: 17, weight: .medium))
                .foregroundColor(Color.gray.opacity(0.9))
            
            Spacer()
        }
        .padding(.horizontal, 24)
        .frame(height: 62)
    }
}

// MARK: - Preview
#Preview {
    OtherView()
}
