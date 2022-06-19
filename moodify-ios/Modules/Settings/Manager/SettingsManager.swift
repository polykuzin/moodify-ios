//
//  SettingsManager.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 19.06.2022.
//

import Foundation
import CoreTableView

final class SettingsManager {
    
    typealias SettingsState = SettingsView.ViewState
    
    public func makeSettingsState() -> [State] {
        let general = makeGeneralBlock()
        let passcode = makePasscodeBlock()
        let notifications = makeNotificationsBlock()
        return [general, passcode, notifications]
    }
    
    private func makeGeneralBlock() -> State {
        let generalHeader = SettingsState.SettingsHeader(title: "GENERAL")
        let theme = SettingsState.Settings(
            title: "Color theme",
            hasSeparator: false,
            leftImage: .init(named: "theme"),
            rightAccessory: nil
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
            rightAccessory: .switcher
        ).toElement()
        let change = SettingsState.Settings(
            title: "Change passcode",
            hasSeparator: false,
            leftImage: nil,
            rightAccessory: nil
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
            rightAccessory: .switcher
        ).toElement()
        let reminder = SettingsState.Settings(
            title: "Reminder at",
            hasSeparator: false,
            leftImage: nil,
            rightAccessory: .timePicker
        ).toElement()
        let notificationsBlock = SectionState(header: notificationsHeader, footer: nil)
        return State(model: notificationsBlock, elements: [allow, reminder])
    }
}
