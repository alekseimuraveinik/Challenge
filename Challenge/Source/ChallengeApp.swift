import SwiftUI

@main
struct ChallengeApp: App {
    private let appContainer = Container()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView(viewModel: appContainer.listViewModel)
            }
        }
    }
}
