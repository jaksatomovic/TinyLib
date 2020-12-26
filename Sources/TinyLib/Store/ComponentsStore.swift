import Combine
import Foundation

public class ComponentsStore<Component: JSONCodabble & Equatable>: ObservableObject {
    @Published public var showComponents = true
    @Published public var isActiveComponentToggling = false
    @Published public var activeComponents: [Component]
    @Published public var availableComponents: [Component]

    private let allComponents: [Component]
    private let userDefaultsKey: String
    private var cancellable: AnyCancellable?
    private var onDidChange: (() -> Void)?

    public var totalCount: Int {
        allComponents.count
    }

    public var json: JSON {
        JSON([
            "showComponents": showComponents,
            "activeComponents": activeComponents.map { $0.json },
            "availableComponents": availableComponents.map { $0.json },
        ])
    }

    public init(
        key: String = String(describing: Component.self),
        allComponents all: [Component],
        defaultComponents: [Component]? = nil,
        onDidChange didChange: (() -> Void)? = nil
    ) {
        let active = defaultComponents ?? all
        allComponents = all
        userDefaultsKey = key
        activeComponents = active
        availableComponents = all.filter { !active.contains($0) }
        onDidChange = didChange
        loadFromDefaults()
        cancellable = objectWillChange.sink {
            DispatchQueue.main.async { [self] in
                saveToDefaults()
                onDidChange?()
            }
        }
    }

    public func toggleActiveComponent(at index: Int) {
        isActiveComponentToggling = true
        availableComponents.append(activeComponents[index])
        activeComponents.remove(at: index)

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { // wait for rendering, will crash w/o delay
            self.isActiveComponentToggling = false
        }
    }

    public func toggleAvailableComponent(at index: Int) {
        activeComponents.append(availableComponents[index])
        availableComponents.remove(at: index)
    }

    public func loadFromDefaults() {
        if let raw = UserDefaults.standard.data(forKey: userDefaultsKey) {
            do {
                let data = try JSON(data: raw)

                print("⚙️ loaded data from user defaults", userDefaultsKey, data)

                if let value = data["showComponents"].bool {
                    showComponents = value
                }

                if let array = data["activeComponents"].array {
                    activeComponents = array.compactMap {
                        Component(json: $0)
                    }
                }
                if let array = data["availableComponents"].array {
                    availableComponents = array.compactMap {
                        Component(json: $0)
                    }
                    availableComponents += allComponents.filter {
                        !activeComponents.contains($0) && !availableComponents.contains($0)
                    }
                }
            } catch {
                print("Unable to get preference data from user defaults")
            }
        }
    }

    public func saveToDefaults() {
        do {
            let data = try json.rawData()
            UserDefaults.standard.set(data, forKey: userDefaultsKey)
        } catch {
            print("Unable to get preference data")
        }
    }
}

public extension ComponentsStore where Component: CaseIterable {
    convenience init(
        key: String = String(describing: Component.self),
        defaultComponents: [Component]? = nil,
        onDidChange: (() -> Void)? = nil
    ) {
        self.init(
            key: key,
            allComponents: Array(Component.allCases),
            defaultComponents: defaultComponents,
            onDidChange: onDidChange
        )
    }
}
