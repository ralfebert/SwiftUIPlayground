// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import Combine
import SwiftUI

struct TypiTodo: Codable, Identifiable {
    var id: Int
    var title: String
}

class TodosModel: ObservableObject {

    @Published var todos = [TypiTodo]()
    @Published var state = State.ready

    enum State {
        case ready
        case loading(Any)
        case loaded
        case error(Error)
    }

    let url = URL(string: "https://jsonplaceholder.typicode.com/photos/")!
    let urlSession = URLSession.shared

    var dataTask: AnyPublisher<[TypiTodo], Error> {
        self.urlSession
            .dataTaskPublisher(for: self.url)
            .map { $0.data }
            .decode(type: [TypiTodo].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }

    func load() {
        assert(Thread.isMainThread)
        self.state = .loading(self.dataTask.sink(
            receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case let .failure(error):
                    self.state = .error(error)
                }
            },
            receiveValue: { value in
                self.state = .loaded
                self.todos = value
            }
        ))
    }

    func loadIfNeeded() {
        assert(Thread.isMainThread)
        guard case .ready = self.state else { return }
        self.load()
    }
}

struct TodosURLSessionExampleView: View {

    @ObservedObject var model = TodosModel()

    var body: some View {
        List(model.todos) { todo in
            Text(todo.title)
        }
        .overlay(StatusOverlay(model: model))
        .onAppear { self.model.loadIfNeeded() }
    }
}

struct StatusOverlay: View {

    @ObservedObject var model: TodosModel

    var body: some View {
        switch model.state {
        case .ready:
            return AnyView(EmptyView())
        case .loading:
            return AnyView(ActivityIndicatorView(isAnimating: .constant(true), style: .large))
        case .loaded:
            return AnyView(EmptyView())
        case let .error(error):
            return AnyView(
                VStack(spacing: 10) {
                    Text(error.localizedDescription)
                        .frame(maxWidth: 300)
                    Button("Retry") {
                        self.model.load()
                    }
                }
                .padding()
                .background(Color.yellow)
            )
        }
    }

}

struct TodosURLSessionExampleView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TodosURLSessionExampleView(model: TodosModel())
            TodosURLSessionExampleView(model: self.loadedExampleModel)
            TodosURLSessionExampleView(model: self.loadingModel)
            TodosURLSessionExampleView(model: self.errorModel)
        }
    }

    static var loadedExampleModel: TodosModel {
        let todosModel = TodosModel()
        todosModel.todos = [TypiTodo(id: 1, title: "Drink water"), TypiTodo(id: 2, title: "Enjoy the sun")]
        todosModel.state = .loaded
        return todosModel
    }

    static var loadingModel: TodosModel {
        let todosModel = TodosModel()
        todosModel.state = .loading("foo")
        return todosModel
    }

    static var errorModel: TodosModel {
        let todosModel = TodosModel()
        todosModel.state = .error(ExampleError.exampleError)
        return todosModel
    }

    enum ExampleError: Error {
        case exampleError
    }

}
