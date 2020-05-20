// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

struct Person {
    var name: String
}

/// https://stackoverflow.com/questions/61910083/handling-optionals-nil-values-in-swiftui-views-using-if-let-in-swiftui?noredirect=1#comment109501063_61910083
struct OptionalsMapExampleView: View {

    var person: Person? = Person(name: "Bob")

    var body: some View {
        VStack {
            person.map { person in
                VStack {
                    Text("Name:")
                    Text(person.name)
                }
            }
        }
    }

}

/// see SwiftUI+IfLet
/// see https://stackoverflow.com/questions/60223711/how-to-set-default-clouse-param-in-view-method/60225784#60225784
struct OptionalsIfLetFunctionExampleView: View {

    var person: Person? = Person(name: "Bob")

    var body: some View {
        VStack {
            ifLet(
                person,
                then: { person in
                    VStack {
                        Text("Name:")
                        Text(person.name)
                    }
                },
                else: {
                    Text("No person available")
                }
            )
        }
    }

}

struct OptionalsGroupExampleView: View {

    var person: Person? = Person(name: "Bob")

    var body: some View {
        VStack {
            Group { () -> AnyView in
                if let person = person {
                    return AnyView(VStack {
                        Text("Name:")
                        Text(person.name)
                    })
                } else {
                    return AnyView(EmptyView())
                }
            }
        }
    }

}

struct OptionalsFuncExampleView: View {

    var person: Person? = Person(name: "Bob")

    var body: some View {
        VStack {
            personView()
        }
    }

    func personView() -> some View {
        if let person = person {
            return AnyView(
                VStack {
                    Text("Name:")
                    Text(person.name)
                }
            )
        } else {
            return AnyView(EmptyView())
        }
    }

}

struct OptionalsExampleView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OptionalsMapExampleView()
            OptionalsGroupExampleView()
            OptionalsFuncExampleView()
        }
    }
}
