// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

// see https://stackoverflow.com/a/62005070/128083

struct Position {
    var id = UUID()
    var count: Int
    var name: String
}

class BookingModel: ObservableObject {

    @Published var positions: [Position]

    init(positions: [Position] = []) {
        self.positions = positions
    }

}

struct EditableListExample: View {

    @ObservedObject var bookingModel = BookingModel(
        positions: [
            Position(count: 1, name: "Candy"),
            Position(count: 0, name: "Bread"),
        ]
    )

    var body: some View {
        // >>> Passing a binding into an Array via index:
        List(bookingModel.positions.indexed(), id: \.element.id) { i, _ in
            PositionRowView(position: self.$bookingModel.positions[i])
        }
    }
}

struct PositionRowView: View {

    @Binding var position: Position

    var body: some View {
        Stepper(
            value: $position.count,
            label: {
                Text("\(position.count)x \(position.name)")
            }
        )
    }

}

struct EditableListExample_Previews: PreviewProvider {
    static var previews: some View {
        EditableListExample()
    }
}
