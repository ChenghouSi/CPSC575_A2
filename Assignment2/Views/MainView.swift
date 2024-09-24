//
//  MainView.swift
//  Assignment2
//
//  Created by Chenghou Si on 2024-10-07.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case Home = "house"
    case Item = "cart"
    
    var tabName: String {
        switch self {
        case .Home:
            return "Home"
        case .Item:
            return "Items"
        }
    }
}

struct MainView: View {
    @State private var currentTab: Tab = .Home
    @Namespace private var animation

    var body: some View {
        TabView (selection: $currentTab) {
            HomeView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .tag(Tab.Home)
            
            ItemTableView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .tag(Tab.Item)
        }
        .overlay(
            HStack (spacing: 0) {
                ForEach (Tab.allCases, id: \.rawValue) { TabButton(tab: $0) }
                    .padding(.top)
                    .padding(.bottom, 30)
                    .background(Color.white)
            },
            alignment: .bottom
        ).ignoresSafeArea(.all, edges: .bottom)
    }
    
    func TabButton(tab: Tab) -> some View {
        GeometryReader { geometry in
            Button(action: {
                withAnimation(.spring()) {
                    currentTab = tab
                }
            }, label: {
                VStack {
                    Image(systemName: currentTab == tab ? tab.rawValue + ".fill" : tab.rawValue)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(currentTab == tab ? .primary : .secondary)
                        .background() {
                            ZStack {
                                if currentTab == tab {
                                    MaterialEffect(style: .light)
                                        .clipShape(Circle())
                                        .matchedGeometryEffect(id: "TAB", in: animation)
                                        .offset(y: 5)
                                    
                                    Text(tab.tabName)
                                        .foregroundStyle(.primary)
                                        .font(.footnote).padding(.top, 50)
                                }
                            }
                        }
                        .contentShape(Rectangle())
                        .offset(y: currentTab == tab ? -20 : 0)
                }
            })
        }
        .frame(height: 25)
    }
}

struct MaterialEffect: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> some UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}

#Preview {
    MainView()
}
