//
//  ActivationView.swift
//  Moya+AsyncAwait
//
//  Created by unagami on 2023/01/24.
//

import Combine
import SwiftUI

struct ActivationView: View {
    // MARK: - Private

    @ObservedObject private var viewModel: ActivationViewModel
    private var disposables = [AnyCancellable]()

    @Environment(\.dismiss) private var dismiss

    // MARK: - Init

    init(viewModel: ActivationViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - View

    var body: some View {
        VStack {
            TextField("Code", text: $viewModel.code)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 280)

            SecureField("Pin", text: $viewModel.pin)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 280)

            Button(action: {
                viewModel.activation()
            }) {
                Text("Activation")
                    .frame(width: 200, height: 45)
            }
            .frame(width: 200, height: 45)
            .foregroundColor(Color.white)
            .cornerRadius(10, antialiased: true)
            .background(viewModel.invalid ? Color.gray : Color.blue)
            .disabled(viewModel.invalid)
            .padding(EdgeInsets(top: 15, leading: 0, bottom: 30, trailing: 0))
            .onReceive(viewModel.$historyBack) { value in
                if value {
                    dismiss()
                }
            }
        }
    }
}

struct ActivationView_Previews: PreviewProvider {
    static var previews: some View {
        ActivationView(viewModel: VM.createLaunchViewModel())
    }
}
