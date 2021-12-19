//
//  newWatchAppApp.swift
//  newWatchApp WatchKit Extension
//
//  Created by Amey Sunu on 19/12/21.
//

import SwiftUI

@main
struct newWatchAppApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
