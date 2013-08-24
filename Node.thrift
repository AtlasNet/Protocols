struct AtlasNodeInfo {
    1: string name,
    2: string host,
    3: i64 port,
    4: i64 protocolVersion
}

struct AtlasMessage {
    1: string data,
    2: string recipientKey
}

struct AtlasListing {
    1: AtlasNodeInfo node,
    2: i64 id,    
}

service AtlasNode {
    i32                 ping(),
    AtlasNodeInfo       getInfo(),

    void                hello(1: AtlasNodeInfo info),
    void                join(),

    void                registerNode(1: AtlasNodeInfo info, 2: AtlasNodeInfo via),
    list<AtlasNodeInfo> getKnownNodes(),

    void                postMessage(1: AtlasMessage message),
    void                registerMessageListing(1: string recipientKey, 2: i64 messageId),
    void                unregisterMessageListing(1: i64 messageId),

    string              getAuthChallenge(1: string publicKey),
    i64                 confirmAuth(1: string response),

    list<AtlasListing>  getListings(),
    i64                 hasMessage(1: i64 id),
    AtlasMessage        retrieveMessage(1: i64 id)
}