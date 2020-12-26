import SwiftUI

public struct MenuActionTextView: View {
    let id: String
    let text: String
    var action: (() -> Void)?

    @EnvironmentObject public var uiStore: UIStore

    public var isOnHover: Bool {
        uiStore.hoveringID == id
    }
    
    init(id: String, text: String, action: (() -> Void)?) {
        self.id = id
        self.text = text
        self.action = action
    }

    public var body: some View {
        Text(text.localized())
            .font(.system(size: 11, weight: .regular))
            .foregroundColor(isOnHover ? .primary : .secondary)
            .contentShape(Rectangle())
            .animation(.none)
            .onHover(perform: { hovering in
                if hovering {
                    uiStore.hoveringID = id
                } else if uiStore.hoveringID == id {
                    uiStore.hoveringID = nil
                }
            })
            .onTapGesture {
                action?()
            }
    }
}
