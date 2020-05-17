// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

struct AllWidgetsView: View {

    @State var currentTab = Tab.widgets

    enum Tab {
        case widgets
    }

    var body: some View {
        TabView(selection: $currentTab) {
            NavigationView {
                Form {
                    Section(header: Text("Button")) {
                        ButtonExampleView()
                    }
                    Section(header: Text("DatePicker")) {
                        DatePickerExampleView()
                    }
                    Section(header: Text("EditButton")) {
                        NavigationLink(destination: EditButtonExampleView()) {
                            Text("Edit Button Example")
                        }
                    }
                    Section(header: Text("Form")) {
                        NavigationLink(destination: ContactFormView(contact: .bob)) {
                            Text("Form Example")
                        }
                    }
                    Section(header: Text("List")) {
                        ListExampleView()
                    }
                }
                .navigationBarTitle("All Widgets")
                .tabItem {
                    VStack {
                        Image(systemName: "rectangle.grid.3x2")
                        Text("Widgets")
                    }
                }.tag(Tab.widgets)
            }
        }
    }

}

struct ButtonExampleView: View {

    @State var text = "Button"

    var body: some View {
        VStack(spacing: 10.0) {
            Button(text) {
                self.text += "!"
            }

            Button(
                action: {
                    self.text += "!"
                }, label: {
                    Text(self.text)
                }
            )
        }
        .padding([.top, .bottom], 10)

    }
}

struct DatePickerExampleView: View {

    @State var date = Date()

    var body: some View {
        DatePicker(
            selection: $date,
            label: { Text("Date") }
        )
    }
}

struct Person {
    var name: String
}

struct ListExampleView: View {

    var names = ["Alice", "Bob"]

    var personArray = [Person(name: "Alice"), Person(name: "Bob")]

    var contactsArray = [Contact.alice, Contact.bob]

    var body: some View {
        Group {
            NavigationLink("List of Views", destination:
                List {
                    Text("Alice")
                    Text("Bob")
                })
            NavigationLink("List of Array of simple values", destination:
                List(names, id: \.self) { name in
                    Text(name)
                })
            NavigationLink("List of Array", destination:
                List(personArray, id: \.name) { person in
                    Text(person.name)
                })
            NavigationLink("List of Array with Identifiable objects", destination:
                List(contactsArray) { contact in
                    Text(contact.name)
                })
        }

    }
}

struct AllWidgetsView_Previews: PreviewProvider {
    static var previews: some View {
        AllWidgetsView()
    }
}
