// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

class TextSettings: ObservableObject {
    @Published var count: Int = 1
}

struct TextSettingsView: View {
    @EnvironmentObject var settings: TextSettings

    var body: some View {
        Form {
            Picker(selection: $settings.count, label:
                Text("Text Repeat Count"))
            {
                ForEach(Array(1 ... 5), id: \.self) { value in
                    Text(String(value)).tag(value)
                }
            }
        }
    }
}

/// Example for a shared @EnvironmentObject/ObservableObject
/// see https://stackoverflow.com/questions/61941322/swiftui-updating-text-after-changes-in-settings/61943534#61943534
struct TextWithSettingExampleView: View {
    @EnvironmentObject var settings: TextSettings

    var body: some View {
        Text(String(repeating: "Hello ", count: Int(settings.count)))
            .navigationBarItems(trailing: NavigationLink("Settings", destination: TextSettingsView()))
    }

}

struct TextWithSettingExampleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TextWithSettingExampleView()
        }
        .environmentObject(TextSettings())
    }
}
