//
//  HomeView.swift
//  lesson4
//
//  Created by 114-2Workshop17 on 2026/4/3.
//
import SwiftUI

import SwiftUI

struct MonsterHomeView: View {
    let InvoiceCarrierCode = "/8C2982A"
    
    let centerMonsterImage = "Seal_Ball.gif"      // 中間主圖（建議放 Assets）
    let leftGiftImage = "giftIcon"              // 左下圓形圖
    let rightStatusImage = "statusIcon"         // 右下圓形圖
    let topLeftBadgeImage = "mBadge"            // 左上 M 圓徽章
    let topRightCenterImage = "monsterCenter"   // 右上怪獸中心圖
    
    var body: some View {
        ZStack(alignment: .top) {
            Color(red: 107/255, green: 167/255, blue: 217/255)
                .ignoresSafeArea()
            
            VStack(spacing: 15) {
                // 1. 頂部 Bar
                HStack {
                    Label("我的", systemImage: "person.circle")
                        .padding(8)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(20)
                    
                    Spacer()
                    
                    Text("開獎專區")
                        .fontWeight(.bold)
                        .foregroundColor(.cyan)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 8)
                        .background(Color.white)
                        .cornerRadius(20)
                }
                .padding(.horizontal)
                
                // 2. 條碼卡片
                VStack(spacing: 10) {
                    BarcodeView(code: InvoiceCarrierCode)
                        .frame(height: 80)
                        .padding(.horizontal, 40)
                    
                    HStack {
                        Text(InvoiceCarrierCode)
                        Image(systemName: "doc.on.doc")
                        
                        Spacer()
                        
                        Toggle("", isOn: .constant(false))
                            .labelsHidden()
                    }
                    .font(.system(.body, design: .monospaced))
                    .foregroundColor(.gray)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(18)
                .padding(.horizontal)
                
                // 3. 掃描與手輸按鈕
                HStack(spacing: 15) {
                    FunctionButton(title: "掃描發票", icon: "qrcode.viewfinder")
                    FunctionButton(title: "手輸發票", icon: "square.and.pencil")
                }
                .padding(.horizontal)
                
                // 4. 跑馬燈提示
                Text("豹擊豹腹，豹心豹意，豹吼豹叫，豹鳴豹舞")
                    .font(.subheadline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white.opacity(0.55))
                    .cornerRadius(25)
                    .padding(.horizontal)
                
                // 5. 下半部主要區域
                ZStack {
                    // 背景區塊
//                    AssetImageView(
//                        imageName: centerMonsterImage,
//                        useSystemImageFallback: "face.smiling"
//                    )
                    VStack {
                        // 左上 M 徽章
                        HStack {
                            VStack(spacing: 2) {
                                CircularAssetImageView(
                                    imageName: topLeftBadgeImage,
                                    size: 70,
                                    backgroundColor: .yellow.opacity(0.95),
                                    useSystemImageFallback: "m.circle.fill"
                                )
                                
                                Text("980")
                                    .font(.caption)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 4)
                                    .background(Color.orange)
                                    .cornerRadius(12)
                            }
                            
                            Spacer()
                            
                            // 右上怪獸中心
                            VStack(spacing: 4) {
                                CircularAssetImageView(
                                    imageName: topRightCenterImage,
                                    size: 70,
                                    backgroundColor: .white,
                                    useSystemImageFallback: "house.fill"
                                )
                                
                                Text("怪獸中心")
                                    .font(.caption)
                                    .foregroundColor(.black)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 10)
                        
                        Spacer()
                    }
                    
                    // 左下與右下圓形按鈕
                    VStack {
                        Spacer()
                        
                        HStack {
                            CircularAssetImageView(
                                imageName: leftGiftImage,
                                size: 78,
                                backgroundColor: .white,
                                useSystemImageFallback: "gift.fill"
                            )
                            .offset(x: 12, y: -8)
                            
                            Spacer()
                            
                            CircularTextButtonView(
                                title: "沒發票\n可餵食",
                                size: 92,
                                fillColor: Color.red.opacity(0.75),
                                textColor: .white
                            )
                            .offset(x: -12, y: -8)
                        }
                        .padding(.horizontal, 18)
                        .padding(.bottom, 8)
                    }
                    
                }
                .background(
                    AssetImageView(
                        imageName: centerMonsterImage,
                        useSystemImageFallback: "face.smiling"
                    )
                    .scaledToFill()
                    
                )
                .frame(maxHeight: .infinity)
                .frame(maxWidth: .infinity)
                
                
            }
            .padding(.top, 8)
        }
    }
}
// 輔助組件：掃描/手輸按鈕
struct FunctionButton: View {
    let title: String
    let icon: String
    var body: some View {
        HStack {
            Image(systemName: icon)
            Text(title)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white)
        .cornerRadius(12)
    }
}
import CoreImage
import CoreImage.CIFilterBuiltins

struct BarcodeView: View {
    let code: String
    
    private let context = CIContext()
    private let filter = CIFilter.code128BarcodeGenerator()
    
    var body: some View {
        if let image = generateBarcode(from: code) {
            Image(uiImage: image)
                .interpolation(.none) // 保持條碼銳利
                .resizable()
                .scaledToFit()
        } else {
            Text("Barcode 產生失敗")
                .foregroundColor(.red)
        }
    }
    
    private func generateBarcode(from string: String) -> UIImage? {
        let data = Data(string.utf8)
        filter.message = data
        
        // 可調整條碼高度
        filter.quietSpace = 1
        
        guard let outputImage = filter.outputImage else { return nil }
        
        // 放大，避免模糊
        let transform = CGAffineTransform(scaleX: 3, y: 3)
        let scaledImage = outputImage.transformed(by: transform)
        
        guard let cgimg = context.createCGImage(scaledImage, from: scaledImage.extent) else {
            return nil
        }
        
        return UIImage(cgImage: cgimg)
    }
}
struct CircularAssetImageView: View {
    let imageName: String
    let size: CGFloat
    let backgroundColor: Color
    let useSystemImageFallback: String
    
    var body: some View {
        ZStack {
            Circle()
                .fill(backgroundColor)
                .frame(width: size, height: size)
                .shadow(color: .black.opacity(0.08), radius: 3, x: 0, y: 2)
            
            Group {
                if UIImage(named: imageName) != nil {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .padding(size * 0.18)
                } else {
                    Image(systemName: useSystemImageFallback)
                        .resizable()
                        .scaledToFit()
                        .padding(size * 0.24)
                        .foregroundColor(.orange)
                }
            }
            .frame(width: size, height: size)
        }
    }
}

struct CircularTextButtonView: View {
    let title: String
    let size: CGFloat
    let fillColor: Color
    let textColor: Color
    
    var body: some View {
        ZStack {
            Circle()
                .fill(fillColor)
                .frame(width: size, height: size)
                .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: 4)
                )
            
            Text(title)
                .font(.system(size: 16, weight: .bold))
                .multilineTextAlignment(.center)
                .foregroundColor(textColor)
        }
    }
}
import SDWebImageSwiftUI
struct AssetImageView: View {
    let imageName: String
    let useSystemImageFallback: String
    
    var body: some View {
        Group {
            if UIImage(named: imageName) != nil {
                AnimatedImage(name: imageName)
                    .resizable()
                    .clipped()
                    .scaledToFit()
                
            } else {
                Image(systemName: useSystemImageFallback)
                    .resizable()
                    .foregroundColor(.black)
            }
        }
    }
}




#Preview {
    MonsterHomeView()
}
