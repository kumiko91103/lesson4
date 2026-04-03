//
//  InvoiceView.swift
//  lesson4
//
//  Created by 114-2Workshop17 on 2026/4/3.
//
import SwiftUI

struct InvoiceView: View {
    @State private var selectedPeriod = "115年3-4月"
    
    let invoices: [InvoiceItem] = [
        InvoiceItem(date: "4/02", title: "緋烏龍", code: "ZC17584388", amount: 50, isNew: true),
        InvoiceItem(date: "4/02", title: "爭鮮股份有限公司土城潤門市部", code: "YN76299867", amount: 780, isNew: true),
        InvoiceItem(date: "4/02", title: "造型靠墊 兔子 HC25a GY S", code: "YC61435836", amount: 399, isNew: true),
        InvoiceItem(date: "3/31", title: "嬰童用品", code: "ZF04812278", amount: 499, isNew: false),
        InvoiceItem(date: "3/30", title: "極品菁茶", code: "YZ66515650", amount: 170, isNew: false),
        InvoiceItem(date: "3/30", title: "小瓦27包裝/瓦煎燒禮盒", code: "YV67060025", amount: 940, isNew: false),
        InvoiceItem(date: "3/28", title: "聚寶盆螺螄粉-不要香菜,小辣,小酸", code: "ZU82578945", amount: 1000, isNew: false)
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.white.ignoresSafeArea()
            
            VStack(spacing: 0) {
                headerView
                monthSwitcher
                successBanner
                
                ScrollView(showsIndicators: false) {
                    LazyVStack(spacing: 0) {
                        ForEach(invoices) { invoice in
                            InvoiceRowView(item: invoice)
                            Divider()
                                .padding(.leading, 88)
                        }
                    }
                    .padding(.bottom, 90) // 避免被底部藍條蓋住
                }
            }
            
            bottomSummaryBar
        }
    }
    
    private var headerView: some View {
        HStack {
            Text("我的發票")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.black)
            
            Spacer()
            
            Button {
                print("filter tapped")
            } label: {
                Image(systemName: "line.3.horizontal.decrease")
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(.black)
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 18)
        .padding(.bottom, 20)
    }
    
    private var monthSwitcher: some View {
        HStack {
            Button {
                print("previous month")
            } label: {
                Image(systemName: "chevron.left")
                    .font(.system(size: 22, weight: .medium))
                    .foregroundColor(Color.cyanBlue)
            }
            
            Spacer()
            
            Text(selectedPeriod)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(Color.cyanBlue)
            
            Spacer()
            
            Button {
                print("next month")
            } label: {
                Image(systemName: "chevron.right")
                    .font(.system(size: 22, weight: .medium))
                    .foregroundColor(Color.cyanBlue)
            }
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 12)
    }
    
    private var successBanner: some View {
        HStack(spacing: 10) {
            Image(systemName: "checkmark.circle.fill")
                .foregroundColor(.white)
                .font(.system(size: 22))
            
            Text("載具驗證碼更新成功！發票匯入需等2–5天")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            
            Spacer()
            
            Button {
                print("close banner")
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .bold))
            }
        }
        .padding(.horizontal, 16)
        .frame(height: 54)
        .background(Color.greenBanner)
    }
    
    private var bottomSummaryBar: some View {
        HStack {
            Text("5/25 開獎")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.white)
                .padding(.horizontal, 22)
                .padding(.vertical, 14)
                .background(Color.bluePill)
                .clipShape(Capsule())
            
            Spacer()
                
            HStack(spacing: 12) {
                Text("33")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.white)
                Text("張")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.white.opacity(0.95))
            }
            
            Rectangle()
                .fill(Color.white.opacity(0.4))
                .frame(width: 3, height: 35)
            
            HStack(spacing: 6) {
                Text("共")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.white.opacity(0.95))
                Text("12,230")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.white)
                Text("元")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.white.opacity(0.95))
            }
        }
        .padding(.horizontal, 18)
        .frame(height: 78)
        .frame(maxWidth: .infinity)
        .background(Color.bottomBlue)
    }
}

struct InvoiceRowView: View {
    let item: InvoiceItem
    
    var body: some View {
        HStack(alignment: .top, spacing: 14) {
            
            // 左：日期圓圈
            ZStack {
                Circle()
                    .fill(Color.gray.opacity(0.12))
                    .frame(width: 58, height: 58)
                
                Text(item.date)
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(.black)
            }
            .padding(.top, 4)
            
            
            // 中：內容
            VStack(alignment: .leading, spacing: 6) {
                Text(item.title)
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(.black)
                    .lineLimit(2)
                
                HStack(spacing: 6) {
                    Text("載具")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.gray)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 3)
                        .background(Color.gray.opacity(0.15))
                        .cornerRadius(5)
                    
                    Text(item.code)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
            }
            
            
            Spacer()
            
            
            // 右：金額 + 新進發票（關鍵）
            VStack(alignment: .trailing, spacing: 6) {
                
                Text("$\(item.amount.formatted())")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)
                
                if item.isNew {
                    Text("新進發票")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(Color.cyanBlue)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(Color.cyanBlue.opacity(0.15))
                        .clipShape(Capsule())
                }
            }
            .padding(.top, 2)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 14)
        .background(Color.white)
    }
}

struct InvoiceItem: Identifiable {
    let id = UUID()
    let date: String
    let title: String
    let code: String
    let amount: Int
    let isNew: Bool
}

extension Color {
    static let cyanBlue = Color(red: 0.12, green: 0.72, blue: 0.90)
    static let greenBanner = Color(red: 0.15, green: 0.71, blue: 0.38)
    static let bottomBlue = Color(red: 0.05, green: 0.70, blue: 0.90)
    static let bluePill = Color(red: 0.19, green: 0.74, blue: 0.95)
}

#Preview {
    InvoiceView()
}
