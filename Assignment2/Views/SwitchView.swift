//
//  SwitchView.swift
//  Assignment2
//
//  Created by Chenghou Si on 2024-09-25.
//

import SwiftUI

extension UISegmentedControl {
    override open func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.setContentHuggingPriority(.defaultLow, for: .vertical)
    }
}

struct SwitchView: View {
    enum Options: String, CaseIterable, Identifiable {
        case switches, button
        var id: Self { self }
    }

    @State private var selected: Options = .switches
    @State private var toggleOn = true
    @State private var button = false
    
    let pickerHeight: CGFloat
    let pickerPadding: CGFloat
    
    // Customize picker
    init(pickerHeight: CGFloat, pickerPadding: CGFloat) {
        // Sets the background color of the Picker
        UISegmentedControl.appearance().backgroundColor = .white
        
        // Disappears the divider
        // UISegmentedControl.appearance().setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)

        // Changes the color for the selected item
        UISegmentedControl.appearance().selectedSegmentTintColor = .blue
        
        // Changes the text color for the selected item
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        
        // Changes the text color for the normal item
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.blue], for: .normal)
        
        self.pickerHeight = pickerHeight
        self.pickerPadding = pickerPadding
    }

    var body: some View {
        VStack {
            Picker("Opt", selection: $selected) {
                ForEach(Options.allCases) {
                    opt in Text(opt.rawValue.capitalized)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal, pickerPadding)
            .frame(height: pickerHeight)
            
            HStack(spacing: 50) {
                if (selected == .switches) {
                    Toggle("Toggle" ,isOn: $toggleOn)
                        .labelsHidden()
                    
                    Toggle("Toggle" ,isOn: $toggleOn)
                        .labelsHidden()
                } else {
                    Button("Do Something") {
                        button = true
                    }
                    .alert(isPresented: $button) {
                        Alert(title: Text("Something was done."), message: Text("Everything's fine. You can breath easy now and continue."))
                    }
                }
            }
            .frame(height: 50)
        }
        
    }
}

#Preview {
    SwitchView(pickerHeight: 40, pickerPadding: 100)
}
