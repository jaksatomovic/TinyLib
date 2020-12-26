import SwiftUI

public class StatusBarMenuHostingView<Content: View>: NSHostingView<Content> {
    // https://stackoverflow.com/a/2437435/12514940
    public override func viewDidMoveToWindow() {
        super.viewDidMoveToWindow()
        window?.becomeKey()
    }
}
