import SwiftUI

public struct MenuActionButtonView: View {
    let id: String
    let imageName: String
    let toolTip: String?
    var action: (() -> Void)?

    @EnvironmentObject var uiStore: UIStore

    var isOnHover: Bool {
        uiStore.hoveringID == id
    }

    public var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: 14, height: 14)
            .foregroundColor(isOnHover ? .primary : .secondary)
            .contentShape(Rectangle())
            .toolTip(toolTip?.localized(), isVisible: isOnHover)
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
