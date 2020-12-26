import SwiftUI

public extension View {
    func menuInfo() -> some View {
        font(.system(size: 14, weight: .regular))
            .foregroundColor(.info)
            .padding(.leading, 20)
            .padding(.trailing, 12)
            .padding(.top, -2)
            .padding(.bottom, 4)
            .fixedSize()
    }

    func menuBlock(radius: CGFloat = 8) -> some View {
        padding(.vertical, 8)
            .padding(.horizontal, 12)
            .background(
                RoundedRectangle(cornerRadius: radius, style: .continuous)
                    .stroke(Color.menuBorder.opacity(0.5), lineWidth: 1)
                    .background(
                        RoundedRectangle(cornerRadius: radius, style: .continuous)
                            .fill(Color.textBackground)
                            .brightness(0.05)
                            .opacity(0.5)
                            .blur(radius: 2)
                    )
                    .shadow(color: Color.shadow.opacity(0.1), radius: 5)
            )
    }
}
