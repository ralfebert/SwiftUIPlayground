// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

struct PickerExampleView: View {

    enum Weather {
        case sunny
        case cloudy
        case rainy
    }

    @State var selection = Weather.sunny

    var body: some View {
        VStack {
            Picker(selection: $selection, label:
                Text("Weather"),
                   content: {
                    Image(systemName: "sun.max").tag(Weather.sunny)
                    Image(systemName: "cloud").tag(Weather.cloudy)
                    Image(systemName: "cloud.rain").tag(Weather.rainy)
            })

            Picker(selection: $selection, label:
                Text("Weather"),
                   content: {
                    Image(systemName: "sun.max").tag(Weather.sunny)
                    Image(systemName: "cloud").tag(Weather.cloudy)
                    Image(systemName: "cloud.rain").tag(Weather.rainy)
            })
                .pickerStyle(SegmentedPickerStyle())

        }
    }
}

struct PickerExampleView_Previews: PreviewProvider {
    static var previews: some View {
        PickerExampleView()
    }
}
