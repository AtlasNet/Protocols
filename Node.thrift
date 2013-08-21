struct AtlasNodeInfo {
    1: string name,
    2: string host,
    3: i32 port,
    4: i32 protocolVersion
}

service AtlasNode {
    i32 ping(),
    AtlasNodeInfo getInfo(),
    void hello(1: AtlasNodeInfo info),
    void registerNode(1: AtlasNodeInfo info, 2: AtlasNodeInfo via),
    list<AtlasNodeInfo> getKnownNodes()
}