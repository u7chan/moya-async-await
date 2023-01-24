//
//  DashboardView.swift
//  Moya+AsyncAwait
//
//  Created by unagami on 2023/01/24.
//

import SwiftUI

struct DashboardView: View {
    // MARK: - View

    var body: some View {
        NavigationLink("To Activation") {
            ActivationView(viewModel: VM.createLaunchViewModel())
        }
        VStack {
            Text("Hello 📊")
                .padding()
        }
        .navigationBarTitle("Dashboard", displayMode: .inline)
    }
}

// MARK: - Previews

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
