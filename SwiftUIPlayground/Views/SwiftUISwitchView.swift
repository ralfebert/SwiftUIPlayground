// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

enum Status {
    case loggedIn, loggedOut, expired
}

struct SwiftUISwitchView: View {

    @State var userStatus: Status = .loggedIn

    // if it's always the same View, you can use some View
    func viewFor(status: Status) -> some View {
        switch status {
        case .loggedIn:
            return Text("Welcome!")
        case .loggedOut:
            return Text("Please log in")
        case .expired:
            return Text("Session expired")
        }
    }

    // if it's different types, you have to erase to AnyView
    func viewForStatusDifferentViews(status: Status) -> AnyView {
        switch status {
        case .loggedIn:
            return AnyView(Text("Welcome!"))
        case .loggedOut:
            return AnyView(Image(systemName: "person.fill"))
        case .expired:
            return AnyView(Text("Session expired"))
        }
    }

    var body: some View {
        VStack {
            Group { () -> Text in
                switch self.userStatus {
                case .loggedIn:
                    return Text("Welcome!")
                case .loggedOut:
                    return Text("Please log in")
                case .expired:
                    return Text("Session expired")
                }
            }

            viewFor(status: userStatus)
            viewForStatusDifferentViews(status: userStatus)
            StatusView(status: userStatus)
        }
    }
}

// Alternative: A separate view
struct StatusView: View {

    var status: Status

    var body: some View {
        switch status {
        case .loggedIn:
            return AnyView(Text("Welcome!"))
        case .loggedOut:
            return AnyView(Image(systemName: "person.fill"))
        case .expired:
            return AnyView(Text("Session expired"))
        }
    }

}

struct SwitchUsageInSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUISwitchView()
    }
}
