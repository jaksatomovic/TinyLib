import Foundation

public struct DiskList: Codable {
    struct Container: Codable {
        let APFSContainerUUID: String
        let CapacityCeiling: UInt64
        let CapacityFree: UInt64
        let ContainerReference: String
    }

    let Containers: [Container]
}
