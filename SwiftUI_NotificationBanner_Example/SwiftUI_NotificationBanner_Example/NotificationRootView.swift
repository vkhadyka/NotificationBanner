//
//  DYNotificationWindowView.swift
//  
//
//  Created by Dominik Butz on 14/11/2022.
//

import SwiftUI
import SwiftUI_NotificationBanner

struct NotificationRootView: View {
    @EnvironmentObject var notificationHandler: DYNotificationHandler
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Color.clear
          .ignoresSafeArea(.all)
          .notificationBanner(handler: notificationHandler, notificationView: {notification in
              
              DYNotificationView(notification: notification, frameWidth: min(450, UIScreen.main.bounds.size.width))
                  .text(color: notification.type == .info || notification.type == .error ? .white : .primary)
                  .image(color: notification.type == .info || notification.type == .error ? .white : .primary)
//                  .backgroundGradientForNotificationType(success: LinearGradient(colors: [.green.opacity(0.4), .green], startPoint: .leading, endPoint: .trailing), error: LinearGradient(colors: [.red, .red.opacity(0.3)], startPoint: .top, endPoint: .bottom))
                  .dropShadow(color: colorScheme == .light ? .gray.opacity(0.4) : .clear, radius: 5, x: 0, y: notification.displayEdge == .top ? 5 : -5)
                  .cornerRadius(self.cornerRadius)
              
          }).statusBarHidden(notificationHandler.currentNotification?.displayEdge == .top)
         
    }

    
    var cornerRadius: CGFloat {
        guard UIDevice.current.userInterfaceIdiom == .phone else {
            return 10
        }
        return UIScreen.main.bounds.width <  UIScreen.main.bounds.height ? 0 : 10
    }
}


