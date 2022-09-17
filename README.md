# PeopleInSpacePackage

Swift Package for https://github.com/joreilly/PeopleInSpace.  Note that this uses https://github.com/rickclephas/KMP-NativeCoroutines library and right now Swift Package for this needs to be also manually added (looking at ways to do this automatically).


### Example SwiftUI code

```swift
import SwiftUI
import common
import KMPNativeCoroutinesAsync


struct ContentView: View {
    let repository = PeopleInSpaceRepository()
    @State var people = [Assignment]()

    
    var body: some View {
        List(people, id: \.name) { person in
            Text(person.name)
        }
        .task {
            await startObservingPeopleUpdates()
        }
    }

    func startObservingPeopleUpdates() async {
        do {
            let stream = asyncStream(for: repository.fetchPeopleAsFlowNative())
            for try await data in stream {
                self.people = data
            }
        } catch {
            print("Failed with error: \(error)")
        }
    }
}    
```

Note that it's also necessary to initialise Koin (like following for example)

```swift
import SwiftUI
import ConfettiKit

@main
struct YourApp: App {
    init() {
        KoinKt.doInitKoin()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

