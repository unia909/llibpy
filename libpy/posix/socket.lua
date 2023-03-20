local ffi = require "ffi"
local C = ffi.C

ffi.cdef [[
    struct hostent {
        char  *h_name;
        char  **h_aliases;
        short h_addrtype;
        short h_length;
        char  **h_addr_list;
    };

    int socket(int domain, int type, int protocol);
    int gethostname(char *name, int namelen);
    struct hostent *gethostbyname(const char *name);
]]

return {
    AF_UNSPEC = 0,
    AF_UNIX = 1,
    AF_INET = 2,
    AF_IPX = 4,
    AF_APPLETALK = 5,
    AF_INET6 = 10,
    AF_ALGA = 17,
    AF_IRDA = 23,
    AF_BLUETOOTH = 31,
    AF_ALG = 38,
    AF_VSOCK = 40,
    AF_QIPCRTR = 42,

    SOCK_STREAM = 1,
    SOCK_DGRAM = 2,
    SOCK_RAW = 3,
    SOCK_RDM = 4,
    SOCK_SEQPACKET = 5,
    SOCK_NONBLOCK = 2048,
    SOCK_CLOEXEC = 524288,

    IPPROTO_ICMP = 1,
    IPPROTO_IGMP = 2,
    BTPROTO_RFCOMM = 3,
    IPPROTO_TCP = 6,
    IPPROTO_UDP = 17,
    IPPROTO_ICMPV6 = 58,

    socket = C.socket,
    close = io.close,
    gethostname = function()
        local buf = chara(256)
        C.gethostname(buf, 256)
        return ffi.string(buf)
    end,
    sethostname = function(name)
        C.sethostname(name, #name)
    end,
    gethostbyname = function(hostname)
        return C.gethostbyname(hostname).h_name
    end
}
