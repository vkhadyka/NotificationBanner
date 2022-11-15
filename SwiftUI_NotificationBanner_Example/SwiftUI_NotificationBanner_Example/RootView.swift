//
//  ContentView.swift
//  SwiftUI_NotificationBanner_Example
//
//  Created by Dominik Butz on 11/11/2022.
//

import SwiftUI
import SwiftUI_NotificationBanner

struct RootView: View {
    @EnvironmentObject var sceneDelegate: SceneDelegate
    @EnvironmentObject var notificationHandler:  DYNotificationHandler
    
    var body: some View {
        Example().environmentObject(notificationHandler)
        .onAppear {
            sceneDelegate.notificationHandler = notificationHandler
             
        }
    }
}

//struct RootView_Previews: PreviewProvider {
//    static var previews: some View {
//        RootView()
//    }
//}
