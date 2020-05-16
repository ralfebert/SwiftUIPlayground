// SwiftUIPlayground

import SwiftUI

struct PlayerLoopView: View {
    @ObservedObject var player: Player

    var body: some View {
        ZStack {
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 10.0))
                .foregroundColor(Color.purple)
                .opacity(0.3)
                .overlay(
                    Circle()
                        .trim(
                            from: 0,
                            to: player.isPlaying ? 1.0 : 0.0
                        )
                        .stroke(
                            style: StrokeStyle(lineWidth: 10.0,
                                               lineCap: .round,
                                               lineJoin: .round)
                        )
                        .animation(
                            player.isPlaying ?
                                Animation
                                .linear(duration: player.duration)
                                .repeatForever(autoreverses: false) :
                                .none
                        )
                        .rotationEffect(Angle(degrees: -90))
                        .foregroundColor(Color.purple)
                )
        }
        .frame(width: 100, height: 100)
        .padding()
    }
}

struct PlayersProgressView: View {
    @ObservedObject var engine = Engine()

    var body: some View {
        NavigationView {
            VStack {
                ForEach(self.engine.players) { player in
                    HStack {
                        PlayerLoopView(player: player)
                    }
                }
            }
            .navigationBarItems(trailing:
                Button("Add Player") {
                    self.engine.addPlayer()
                }
            )
        }
    }
}

class Player: ObservableObject, Identifiable {
    var id = UUID()
    @Published var isPlaying: Bool = false
    var duration: Double = 1
}

class Engine: ObservableObject {
    @Published var players = [Player]()

    func addPlayer() {
        let player = Player()
        players.append(player)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            player.isPlaying = true
        }
    }
}

struct PlayersProgressView_Previews: PreviewProvider {
    static var previews: some View {
        PlayersProgressView()
    }
}
