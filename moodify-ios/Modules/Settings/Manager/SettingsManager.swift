//
//  SettingsManager.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 19.06.2022.
//

import UIKit
import CoreTableView

final class SettingsManager {
    
    typealias SettingsState = SettingsView.ViewState
    
    private weak var controller: UIViewController?
    
    init(controller: UIViewController?) {
        self.controller = controller
    }
    
    public func makeSettingsState() -> [State] {
        let general = makeGeneralBlock()
        let passcode = makePasscodeBlock()
        let notifications = makeNotificationsBlock()
        let share = makeShareAppBlock()
        return [share]//[general, passcode, notifications]
    }
    
    private func makeGeneralBlock() -> State {
        let generalHeader = SettingsState.SettingsHeader(title: "GENERAL")
        let theme = SettingsState.Settings(
            title: "Color theme",
            hasSeparator: false,
            leftImage: .init(named: "theme"),
            rightAccessory: nil,
            onItemSelect: Command {
                
            }
        ).toElement()
        let generalBlock = SectionState(header: generalHeader, footer: nil)
        return State(model: generalBlock, elements: [theme])
    }
    
    private func makePasscodeBlock() -> State {
        let passcodeHeader = SettingsState.SettingsHeader(title: "PASSCODE")
        let enabled = SettingsState.Settings(
            title: "Enable",
            hasSeparator: true,
            leftImage: nil,
            rightAccessory: .switcher,
            onItemSelect: Command {
                
            }
        ).toElement()
        let change = SettingsState.Settings(
            title: "Change passcode",
            hasSeparator: false,
            leftImage: nil,
            rightAccessory: nil,
            onItemSelect: Command {
                
            }
        ).toElement()
        let passcodeBlock = SectionState(header: passcodeHeader, footer: nil)
        return State(model: passcodeBlock, elements: [enabled, change])
    }
    
    private func makeNotificationsBlock() -> State {
        let notificationsHeader = SettingsState.SettingsHeader(title: "NOTIFICATIONS")
        let allow = SettingsState.Settings(
            title: "Allow",
            hasSeparator: true,
            leftImage: .init(named: "clock"),
            rightAccessory: .switcher,
            onItemSelect: Command {
                
            }
        ).toElement()
        let reminder = SettingsState.Settings(
            title: "Reminder at",
            hasSeparator: false,
            leftImage: nil,
            rightAccessory: .timePicker,
            onItemSelect: Command {
                
            }
        ).toElement()
        let notificationsBlock = SectionState(header: notificationsHeader, footer: nil)
        return State(model: notificationsBlock, elements: [allow, reminder])
    }
    
    private func makeShareAppBlock() -> State {
        let shareHeader = SettingsState.SettingsHeader(title: "SHARE")
        let share = SettingsState.Settings(
            title: "Share with friends",
            hasSeparator: false,
            leftImage: .init(named: "share_app"),
            rightAccessory: nil,
            onItemSelect: Command {
                let items = [URL(string: "https://apps.apple.com/ru/app/moodify-mood-tracker-app/id1632680760")!]
                let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
                self.controller?.present(ac, animated: true)
            }
        ).toElement()
        let shareBlock = SectionState(header: shareHeader, footer: nil)
        return State(model: shareBlock, elements: [share])
    }
}
