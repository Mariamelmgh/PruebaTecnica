//
//  MainScreenModule.swift
//  MagicApp
//
//  Created by Mariam El Mgharaz on 10/9/2024.
//

import Foundation
import SwiftUI


struct MainScreenModule {
    static func build() -> some View {
        let router = MainScreenRouter()
        let presenter = MainScreenPresenter(router: router)
        return MainScreenView(presenter: presenter)
    }
}
