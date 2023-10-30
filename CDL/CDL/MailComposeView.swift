//
//  MailComposeView.swift
//  CDL
//
//  Created by mathieu schneider on 30.10.23.
//

import Foundation
import SwiftUI
import MessageUI

struct MailComposeView: UIViewControllerRepresentable {
    typealias UIViewControllerType = MFMailComposeViewController

    let recipients: [String]
    let subject: String
    let messageBody: String

    func makeUIViewController(context: UIViewControllerRepresentableContext<MailComposeView>) -> MFMailComposeViewController {
        let mailViewController = MFMailComposeViewController()
        mailViewController.setToRecipients(recipients)
        mailViewController.setSubject(subject)
        mailViewController.setMessageBody(messageBody, isHTML: false)
        mailViewController.mailComposeDelegate = context.coordinator
        return mailViewController
    }

    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: UIViewControllerRepresentableContext<MailComposeView>) {}

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        var parent: MailComposeView

        init(_ parent: MailComposeView) {
            self.parent = parent
        }

        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            parent.dismissViewController()
        }
    }

    func dismissViewController() {}
}
