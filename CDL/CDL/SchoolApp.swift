//
//  schoolApp.swift
//  CDL
//
//  Created by mathieu schneider on 30.10.23.
//

import Foundation
import SwiftUI

@main
struct SchoolApp: App {
    var body: some Scene {
        #if os(iOS)
        WindowGroup {
            ContentView()
        }
        #elseif os(macOS)
        WindowGroup {
            ContentView()
        }
        #endif
    }
}
