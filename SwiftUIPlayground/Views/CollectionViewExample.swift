// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI
import UIKit

/// see https://stackoverflow.com/questions/61952997/uicollectionview-with-swiftui-drag-and-drop-reordering-possible
struct CollectionViewExample: View {
    var body: some View {
        CollectionComponent()
    }
}

struct CollectionComponent: UIViewRepresentable {
    func makeCoordinator() -> CollectionComponent.Coordinator {
        Coordinator(data: [])
    }

    class Coordinator: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
        var data: [String] = []

        init(data: [String]) {

            for index in 0 ... 20 {
                self.data.append("\(index)")
            }

        }

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            self.data.count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! Cell
            cell.cellView.rootView = AnyView(CellView(text: self.data[indexPath.item]))
            return cell
        }

        func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
            true
        }

        func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
            print("Changing the cell order, moving: \(sourceIndexPath.row) to \(destinationIndexPath.row)")
        }
    }

    func makeUIView(context: Context) -> UICollectionView {

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 150, height: 150)
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = context.coordinator
        collectionView.delegate = context.coordinator
        collectionView.register(Cell.self, forCellWithReuseIdentifier: "cell")

        let longPressGesture = UILongPressGestureRecognizer(target: self, action: Selector(("handleLongGesture:")))
        collectionView.addGestureRecognizer(longPressGesture)

        func handleLongGesture(gesture: UILongPressGestureRecognizer) {

            switch gesture.state {

            case UIGestureRecognizerState.began:
                guard let selectedIndexPath = collectionView.indexPathForItem(at: gesture.location(in: collectionView)) else {
                    break
                }
                collectionView.beginInteractiveMovementForItem(at: selectedIndexPath)
            case UIGestureRecognizerState.changed:
                collectionView.updateInteractiveMovementTargetPosition(gesture.location(in: gesture.view!))
            case UIGestureRecognizerState.ended:
                collectionView.endInteractiveMovement()
            default:
                collectionView.cancelInteractiveMovement()
            }
        }

        return collectionView
    }

    func updateUIView(_ uiView: UICollectionView, context: Context) {}
}

class Cell: UICollectionViewCell {
    public var cellView = UIHostingController(rootView: AnyView(EmptyView()))

    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configure()
    }

    private func configure() {
        contentView.addSubview(self.cellView.view)

        self.cellView.view.preservesSuperviewLayoutMargins = false
        self.cellView.view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.cellView.view.leftAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leftAnchor),
            self.cellView.view.rightAnchor.constraint(equalTo: contentView.layoutMarginsGuide.rightAnchor),
            self.cellView.view.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            self.cellView.view.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
        ])
    }
}

struct CellView: View {
    let text: String

    var body: some View {
        ZStack {
            Text(text)
        }
        .frame(width: 150, height: 150)
        .background(Color.blue)
    }
}

struct CollectionViewExample_Previews: PreviewProvider {
    static var previews: some View {
        CollectionViewExample()
    }
}
