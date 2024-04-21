//
//  MainView.swift
//  Yoga Assignment
//
//  Created by Pierre Janineh on 21/04/2024.
//

import SwiftUI

struct MainView: View {
    
    @State private var selectedTab: Int = 0
    
    init() {
        UITabBar.appearance().backgroundColor = .white
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            MyPlanView()
                .tabItem {
                    Label(Self.MY_PLAN,
                          image: tabImage(forTab: 0))
                }
                .tag(0)
            
            LibraryView()
                .tabItem {
                    Label(Self.LIBRARY,
                          image: tabImage(forTab: 1))
                }
                .tag(1)
            
            MilestonesView()
                .tabItem {
                    Label(Self.MILESTONES,
                          image: tabImage(forTab: 2))
                }
                .tag(2)
            
            MoreView()
                .tabItem {
                    Label(Self.MORE,
                          image: tabImage(forTab: 3))
                }
                .tag(3)
        }
        .tint(.tabItemTint)
    }
    
    /**
     Conditionally return the ImageResource according to selection.
     - Parameter forTab: the tab's assigned tag
     */
    private func tabImage(forTab tab: Int) -> ImageResource {
        switch tab {
        case selectedTab:
            switch selectedTab {
            case 0:
                return .myPlan
            case 1:
                return .library
            case 2:
                return .milestones
            case 3:
                return .more
            default:
                fatalError("Invalid tab index")
            }
        case 0:
            return .myPlanUnselected
        case 1:
            return .libraryUnselected
        case 2:
            return .milestonesUnselected
        case 3:
            return .moreUnselected
        default:
            fatalError("Invalid tab index")
        }
    }
}

#Preview {
    MainView()
}

extension MainView {
    static let MY_PLAN = "My Plan"
    static let LIBRARY = "Library"
    static let MILESTONES = "Milestones"
    static let MORE = "More"
}

extension UITabBarController {
    open override func viewWillLayoutSubviews() {
        guard let array = self.viewControllers else { return }
        
        for controller in array {
            if controller == array.last {
                return
            }
            controller.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        }
    }
}
