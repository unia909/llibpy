local ffi = require "ffi"
local ffit = require "ffitypes"
local ws2 = ffi.load "Ws2_32.dll"
local chara = ffit.chara

require "win32.winntdef"

if jit.arch == "x64" then
    ffi.cdef [[
        typedef struct WSAData
        {
            WORD wVersion;
            WORD wHighVersion;
            WORD iMaxSockets;
            WORD iMaxUdpDg;
            char *lpVendorInfo;
            char szDescription[257];
            char szSystemStatus[129];
        } WSADATA;
    ]]
else
    ffi.cdef [[
        typedef struct WSAData
        {
            WORD wVersion;
            WORD wHighVersion;
            char szDescription[257];
            char szSystemStatus[129];
            WORD iMaxSockets;
            WORD iMaxUdpDg;
            char *lpVendorInfo;
        } WSADATA;
    ]]
end

ffi.cdef [[
    struct hostent {
        char  *h_name;
        char  **h_aliases;
        short h_addrtype;
        short h_length;
        char  **h_addr_list;
    };

    int WSAStartup(WORD wVersionRequested, WSADATA *lpWSAData);
    int WSAGetLastError();
    int socket(int domain, int type, int protocol);
    int closesocket(int socket);
    int gethostname(char *name, int namelen);
    struct hostent *gethostbyname(const char *name);
]]

local wsa_data = ffi.new "WSADATA"
ws2.WSAStartup(0x0202, wsa_data)

return {
    AF_UNSPEC = 0,
    AF_INET = 2,
    AF_IPX = 6,
    AF_APPLETALK = 16,
    AF_INET6 = 23,
    AF_IRDA = 26,

    SOCK_STREAM = 1,
    SOCK_DGRAM = 2,
    SOCK_RAW = 3,
    SOCK_RDM = 4,
    SOCK_SEQPACKET = 5,

    IPPROTO_ICMP = 1,
    IPPROTO_IGMP = 2,
    BTPROTO_RFCOMM = 3,
    IPPROTO_TCP = 6,
    IPPROTO_UDP = 17,
    IPPROTO_ICMPV6 = 58,

    socket = ws2.socket,
    close = ws2.closesocket,
    gethostname = function()
        local buf = chara(256)
        ws2.gethostname(buf, 256)
        return ffi.string(buf)
    end,
    gethostbyname = function(hostname)
        return ffi.string(ws2.gethostbyname(hostname).h_name)
    end
}
