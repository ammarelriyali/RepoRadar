//
//  View+IsHidden.swift
//  RepoRadar
//
//  Created by ammar on 24/10/2023.
//

import SwiftUI

extension View {
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}
