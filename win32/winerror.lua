local ffi = require("ffi")

ffi.cdef[[
enum {
    FACILITY_NULL                  =  0,
    FACILITY_RPC                   =  1,
    FACILITY_DISPATCH              =  2,
    FACILITY_STORAGE               =  3,
    FACILITY_ITF                   =  4,
    FACILITY_WIN32                 =  7,
    FACILITY_WINDOWS               =  8,
    FACILITY_SSPI                  =  9,
    FACILITY_SECURITY              =  9,
    FACILITY_CONTROL               =  10,
    FACILITY_CERT                  =  11,
    FACILITY_INTERNET              =  12,
    FACILITY_MEDIASERVER           =  13,
    FACILITY_MSMQ                  =  14,
    FACILITY_SETUPAPI              =  15,
    FACILITY_SCARD                 =  16,
    FACILITY_COMPLUS               =  17,
    FACILITY_AAF                   =  18,
    FACILITY_URT                   =  19,
    FACILITY_ACS                   =  20,
    FACILITY_DPLAY                 =  21,
    FACILITY_UMI                   =  22,
    FACILITY_SXS                   =  23,
    FACILITY_WINDOWS_CE            =  24,
    FACILITY_HTTP                  =  25,
    FACILITY_USERMODE_COMMONLOG    =  26,
    FACILITY_WER                   =  27,
    FACILITY_USERMODE_FILTER_MANAGER =31,
    FACILITY_BACKGROUNDCOPY        =  32,
    FACILITY_CONFIGURATION         =  33,
    FACILITY_WIA                   =  33,
    FACILITY_STATE_MANAGEMENT      =  34,
    FACILITY_METADIRECTORY         =  35,
    FACILITY_WINDOWSUPDATE         =  36,
    FACILITY_DIRECTORYSERVICE      =  37,
    FACILITY_GRAPHICS              =  38,
    FACILITY_SHELL                 =  39,
    FACILITY_NAP                   =  39,
    FACILITY_TPM_SERVICES          =  40,
    FACILITY_TPM_SOFTWARE          =  41,
    FACILITY_UI                    =  42,
    FACILITY_XAML                  =  43,
    FACILITY_ACTION_QUEUE          =  44,
    FACILITY_PLA                   =  48,
    FACILITY_WINDOWS_SETUP         =  48,
    FACILITY_FVE                   =  49,
    FACILITY_FWP                   =  50,
    FACILITY_WINRM                 =  51,
    FACILITY_NDIS                  =  52,
    FACILITY_USERMODE_HYPERVISOR   =  53,
    FACILITY_CMI                   =  54,
    FACILITY_USERMODE_VIRTUALIZATION =55,
    FACILITY_USERMODE_VOLMGR       =  56,
    FACILITY_BCD                   =  57,
    FACILITY_USERMODE_VHD          =  58,
    FACILITY_USERMODE_HNS          =  59,
    FACILITY_SDIAG                 =  60,
    FACILITY_WEBSERVICES           =  61,
    FACILITY_WINPE                 =  61,
    FACILITY_WPN                   =  62,
    FACILITY_WINDOWS_STORE         =  63,
    FACILITY_INPUT                 =  64,
    FACILITY_EAP                   =  66,
    FACILITY_WINDOWS_DEFENDER      =  80,
    FACILITY_OPC                   =  81,
    FACILITY_XPS                   =  82,
    FACILITY_MBN                   =  84,
    FACILITY_POWERSHELL            =  84,
    FACILITY_RAS                   =  83,
    FACILITY_P2P_INT               =  98,
    FACILITY_P2P                   =  99,
    FACILITY_DAF                   =  100,
    FACILITY_BLUETOOTH_ATT         =  101,
    FACILITY_AUDIO                 =  102,
    FACILITY_STATEREPOSITORY       =  103,
    FACILITY_VISUALCPP             =  109,
    FACILITY_SCRIPT                =  112,
    FACILITY_PARSE                 =  113,
    FACILITY_BLB                   =  120,
    FACILITY_BLB_CLI               =  121,
    FACILITY_WSBAPP                =  122,
    FACILITY_BLBUI                 =  128,
    FACILITY_USN                   =  129,
    FACILITY_USERMODE_VOLSNAP      =  130,
    FACILITY_TIERING               =  131,
    FACILITY_WSB_ONLINE            =  133,
    FACILITY_ONLINE_ID             =  134,
    FACILITY_DEVICE_UPDATE_AGENT   =  135,
    FACILITY_DLS                   =  153,
    FACILITY_DELIVERY_OPTIMIZATION =  208,
    FACILITY_USERMODE_SPACES       =  231,
    FACILITY_USER_MODE_SECURITY_CORE= 232,
    FACILITY_USERMODE_LICENSING    =  234,
    FACILITY_SOS                   =  160,
    FACILITY_DEBUGGERS             =  176,
    FACILITY_SPP                   =  256,
    FACILITY_RESTORE               =  256,
    FACILITY_DMSERVER              =  256,
    FACILITY_DEPLOYMENT_SERVICES_SERVER =257,
    FACILITY_DEPLOYMENT_SERVICES_IMAGING =258,
    FACILITY_DEPLOYMENT_SERVICES_MANAGEMENT =259,
    FACILITY_DEPLOYMENT_SERVICES_UTIL =260,
    FACILITY_DEPLOYMENT_SERVICES_BINLSVC =261,
    FACILITY_DEPLOYMENT_SERVICES_PXE =263,
    FACILITY_DEPLOYMENT_SERVICES_TFTP =264,
    FACILITY_DEPLOYMENT_SERVICES_TRANSPORT_MANAGEMENT =272,
    FACILITY_DEPLOYMENT_SERVICES_DRIVER_PROVISIONING =278,
    FACILITY_DEPLOYMENT_SERVICES_MULTICAST_SERVER =289,
    FACILITY_DEPLOYMENT_SERVICES_MULTICAST_CLIENT =290,
    FACILITY_DEPLOYMENT_SERVICES_CONTENT_PROVIDER =293,
    FACILITY_LINGUISTIC_SERVICES    = 305,
    FACILITY_AUDIOSTREAMING         = 1094,
    FACILITY_ACCELERATOR            = 1536,
    FACILITY_WMAAECMA               = 1996,
    FACILITY_DIRECTMUSIC            = 2168,
    FACILITY_DIRECT3D10             = 2169,
    FACILITY_DXGI                   = 2170,
    FACILITY_DXGI_DDI               = 2171,
    FACILITY_DIRECT3D11             = 2172,
    FACILITY_DIRECT3D11_DEBUG       = 2173,
    FACILITY_DIRECT3D12             = 2174,
    FACILITY_DIRECT3D12_DEBUG       = 2175,
    FACILITY_LEAP                   = 2184,
    FACILITY_AUDCLNT                = 2185,
    FACILITY_WINCODEC_DWRITE_DWM    = 2200,
    FACILITY_WINML                  = 2192,
    FACILITY_DIRECT2D               = 2201,
    FACILITY_DEFRAG                 = 2304,
    FACILITY_USERMODE_SDBUS         = 2305,
    FACILITY_JSCRIPT                = 2306,
    FACILITY_PIDGENX                = 2561,
    FACILITY_EAS                    = 85,
    FACILITY_WEB                    = 885,
    FACILITY_WEB_SOCKET             = 886,
    FACILITY_MOBILE                 = 1793,
    FACILITY_SQLITE                 = 1967,
    FACILITY_UTC                    = 1989,
    FACILITY_WEP                    = 2049,
    FACILITY_SYNCENGINE             = 2050,
    FACILITY_XBOX                   = 2339,
    FACILITY_PIX                    = 2748
}
]]

ffi.cdef[[
enum {
    //
    // The operation completed successfully.
    //
    ERROR_SUCCESS                  = 0L,
    NO_ERROR                       = 0L,
    SEC_E_OK                       = 0,

    //
    // Incorrect function.
    //
    ERROR_INVALID_FUNCTION          = 1L,    // dderror

    //
    // The system cannot find the file specified.
    //
    ERROR_FILE_NOT_FOUND             = 2L,

    //
    // The system cannot find the path specified.
    //
    ERROR_PATH_NOT_FOUND            = 3L,

    //
    // The system cannot open the file.
    //
    ERROR_TOO_MANY_OPEN_FILES        = 4L,

    //
    // Access is denied.
    //
    ERROR_ACCESS_DENIED             =  5L,
    ERROR_INVALID_HANDLE         =  6,
    ERROR_ARENA_TRASHED          =  7,
    ERROR_NOT_ENOUGH_MEMORY      =  8,    // dderror
    ERROR_INVALID_BLOCK          =  9,
    ERROR_BAD_ENVIRONMENT        =  10,
    ERROR_BAD_FORMAT             =  11,
    //
    // MessageId: ERROR_INVALID_ACCESS
    //
    // MessageText:
    //
    // The access code is invalid.
    //
    ERROR_INVALID_ACCESS             = 12,

    //
    // MessageId: ERROR_INVALID_DATA
    //
    // MessageText:
    //
    // The data is invalid.
    //
    ERROR_INVALID_DATA               = 13,

    //
    // MessageId: ERROR_OUTOFMEMORY
    //
    // MessageText:
    //
    // Not enough memory resources are available to complete this operation.
    //
    ERROR_OUTOFMEMORY                = 14,

    //
    // MessageId: ERROR_INVALID_DRIVE
    //
    // MessageText:
    //
    // The system cannot find the drive specified.
    //
    ERROR_INVALID_DRIVE              = 15,

    //
    // MessageId: ERROR_CURRENT_DIRECTORY
    //
    // MessageText:
    //
    // The directory cannot be removed.
    //
    ERROR_CURRENT_DIRECTORY          = 16,

    //
    // MessageId: ERROR_NOT_SAME_DEVICE
    //
    // MessageText:
    //
    // The system cannot move the file to a different disk drive.
    //
    ERROR_NOT_SAME_DEVICE            = 17,

    //
    // MessageId: ERROR_NO_MORE_FILES
    //
    // MessageText:
    //
    // There are no more files.
    //
    ERROR_NO_MORE_FILES              = 18,

    //
    // MessageId: ERROR_WRITE_PROTECT
    //
    // MessageText:
    //
    // The media is write protected.
    //
    ERROR_WRITE_PROTECT              = 19,

    //
    // MessageId: ERROR_BAD_UNIT
    //
    // MessageText:
    //
    // The system cannot find the device specified.
    //
    ERROR_BAD_UNIT                   = 20,

    //
    // MessageId: ERROR_NOT_READY
    //
    // MessageText:
    //
    // The device is not ready.
    //
    ERROR_NOT_READY                  = 21,

    //
    // MessageId: ERROR_BAD_COMMAND
    //
    // MessageText:
    //
    // The device does not recognize the command.
    //
    ERROR_BAD_COMMAND                = 22,

    //
    // MessageId: ERROR_CRC
    //
    // MessageText:
    //
    // Data error (cyclic redundancy check).
    //
    ERROR_CRC                        = 23,

    //
    // MessageId: ERROR_BAD_LENGTH
    //
    // MessageText:
    //
    // The program issued a command but the command length is incorrect.
    //
    ERROR_BAD_LENGTH                 = 24,

    //
    // MessageId: ERROR_SEEK
    //
    // MessageText:
    //
    // The drive cannot locate a specific area or track on the disk.
    //
    ERROR_SEEK                       = 25,

    //
    // MessageId: ERROR_NOT_DOS_DISK
    //
    // MessageText:
    //
    // The specified disk or diskette cannot be accessed.
    //
    ERROR_NOT_DOS_DISK               = 26,

    //
    // MessageId: ERROR_SECTOR_NOT_FOUND
    //
    // MessageText:
    //
    // The drive cannot find the sector requested.
    //
    ERROR_SECTOR_NOT_FOUND           = 27,

    //
    // MessageId: ERROR_OUT_OF_PAPER
    //
    // MessageText:
    //
    // The printer is out of paper.
    //
    ERROR_OUT_OF_PAPER               = 28,

    //
    // MessageId: ERROR_WRITE_FAULT
    //
    // MessageText:
    //
    // The system cannot write to the specified device.
    //
    ERROR_WRITE_FAULT                = 29,

    //
    // MessageId: ERROR_READ_FAULT
    //
    // MessageText:
    //
    // The system cannot read from the specified device.
    //
    ERROR_READ_FAULT                 = 30,

    //
    // MessageId: ERROR_GEN_FAILURE
    //
    // MessageText:
    //
    // A device attached to the system is not functioning.
    //
    ERROR_GEN_FAILURE                = 31,

    //
    // MessageId: ERROR_SHARING_VIOLATION
    //
    // MessageText:
    //
    // The process cannot access the file because it is being used by another process.
    //
    ERROR_SHARING_VIOLATION          = 32,

    //
    // MessageId: ERROR_LOCK_VIOLATION
    //
    // MessageText:
    //
    // The process cannot access the file because another process has locked a portion of the file.
    //
    ERROR_LOCK_VIOLATION             = 33,

    //
    // MessageId: ERROR_WRONG_DISK
    //
    // MessageText:
    //
    // The wrong diskette is in the drive.
    // Insert %2 (Volume Serial Number: %3) into drive %1.
    //
    ERROR_WRONG_DISK                 = 34,
    ERROR_SHARING_BUFFER_EXCEEDED    = 36,
    ERROR_HANDLE_EOF                 = 38,
    ERROR_HANDLE_DISK_FULL           = 39,
    ERROR_NOT_SUPPORTED              = 50,
}
]]

--[[
//
// MessageId: ERROR_REM_NOT_LIST
//
// MessageText:
//
// Windows cannot find the network path. Verify that the network path is correct and the destination computer is not busy or turned off. If Windows still cannot find the network path, contact your network administrator.
//
static const int ERROR_REM_NOT_LIST               51L

//
// MessageId: ERROR_DUP_NAME
//
// MessageText:
//
// You were not connected because a duplicate name exists on the network. If joining a domain, go to System in Control Panel to change the computer name and try again. If joining a workgroup, choose another workgroup name.
//
static const int ERROR_DUP_NAME                   52L

//
// MessageId: ERROR_BAD_NETPATH
//
// MessageText:
//
// The network path was not found.
//
static const int ERROR_BAD_NETPATH                53L

//
// MessageId: ERROR_NETWORK_BUSY
//
// MessageText:
//
// The network is busy.
//
static const int ERROR_NETWORK_BUSY               54L

//
// MessageId: ERROR_DEV_NOT_EXIST
//
// MessageText:
//
// The specified network resource or device is no longer available.
//
static const int ERROR_DEV_NOT_EXIST              55L    // dderror

//
// MessageId: ERROR_TOO_MANY_CMDS
//
// MessageText:
//
// The network BIOS command limit has been reached.
//
static const int ERROR_TOO_MANY_CMDS              56L

//
// MessageId: ERROR_ADAP_HDW_ERR
//
// MessageText:
//
// A network adapter hardware error occurred.
//
static const int ERROR_ADAP_HDW_ERR               57L

//
// MessageId: ERROR_BAD_NET_RESP
//
// MessageText:
//
// The specified server cannot perform the requested operation.
//
static const int ERROR_BAD_NET_RESP               58L

//
// MessageId: ERROR_UNEXP_NET_ERR
//
// MessageText:
//
// An unexpected network error occurred.
//
static const int ERROR_UNEXP_NET_ERR              59L

//
// MessageId: ERROR_BAD_REM_ADAP
//
// MessageText:
//
// The remote adapter is not compatible.
//
static const int ERROR_BAD_REM_ADAP               60L

//
// MessageId: ERROR_PRINTQ_FULL
//
// MessageText:
//
// The printer queue is full.
//
static const int ERROR_PRINTQ_FULL                61L

//
// MessageId: ERROR_NO_SPOOL_SPACE
//
// MessageText:
//
// Space to store the file waiting to be printed is not available on the server.
//
static const int ERROR_NO_SPOOL_SPACE             62L

//
// MessageId: ERROR_PRINT_CANCELLED
//
// MessageText:
//
// Your file waiting to be printed was deleted.
//
static const int ERROR_PRINT_CANCELLED            63L

//
// MessageId: ERROR_NETNAME_DELETED
//
// MessageText:
//
// The specified network name is no longer available.
//
static const int ERROR_NETNAME_DELETED            64L

//
// MessageId: ERROR_NETWORK_ACCESS_DENIED
//
// MessageText:
//
// Network access is denied.
//
static const int ERROR_NETWORK_ACCESS_DENIED      65L

//
// MessageId: ERROR_BAD_DEV_TYPE
//
// MessageText:
//
// The network resource type is not correct.
//
static const int ERROR_BAD_DEV_TYPE               66L

//
// MessageId: ERROR_BAD_NET_NAME
//
// MessageText:
//
// The network name cannot be found.
//
static const int ERROR_BAD_NET_NAME               67L

//
// MessageId: ERROR_TOO_MANY_NAMES
//
// MessageText:
//
// The name limit for the local computer network adapter card was exceeded.
//
static const int ERROR_TOO_MANY_NAMES             68L

//
// MessageId: ERROR_TOO_MANY_SESS
//
// MessageText:
//
// The network BIOS session limit was exceeded.
//
static const int ERROR_TOO_MANY_SESS              69L

//
// MessageId: ERROR_SHARING_PAUSED
//
// MessageText:
//
// The remote server has been paused or is in the process of being started.
//
static const int ERROR_SHARING_PAUSED             70L

//
// MessageId: ERROR_REQ_NOT_ACCEP
//
// MessageText:
//
// No more connections can be made to this remote computer at this time because there are already as many connections as the computer can accept.
//
static const int ERROR_REQ_NOT_ACCEP              71L

//
// MessageId: ERROR_REDIR_PAUSED
//
// MessageText:
//
// The specified printer or disk device has been paused.
//
static const int ERROR_REDIR_PAUSED               72L

//
// MessageId: ERROR_FILE_EXISTS
//
// MessageText:
//
// The file exists.
//
static const int ERROR_FILE_EXISTS                80L

//
// MessageId: ERROR_CANNOT_MAKE
//
// MessageText:
//
// The directory or file cannot be created.
//
static const int ERROR_CANNOT_MAKE                82L

//
// MessageId: ERROR_FAIL_I24
//
// MessageText:
//
// Fail on INT 24.
//
static const int ERROR_FAIL_I24                   83L

//
// MessageId: ERROR_OUT_OF_STRUCTURES
//
// MessageText:
//
// Storage to process this request is not available.
//
static const int ERROR_OUT_OF_STRUCTURES          84L

//
// MessageId: ERROR_ALREADY_ASSIGNED
//
// MessageText:
//
// The local device name is already in use.
//
static const int ERROR_ALREADY_ASSIGNED           85L
--]]

ffi.cdef[[
static const int ERROR_INVALID_PASSWORD         =  86L;
static const int ERROR_INVALID_PARAMETER        =  87L;    // dderror
static const int ERROR_NET_WRITE_FAULT          =  88L;
static const int ERROR_NO_PROC_SLOTS            =  89L;
static const int ERROR_TOO_MANY_SEMAPHORES      =  100L;
static const int ERROR_EXCL_SEM_ALREADY_OWNED   =  101L;
]]

ffi.cdef[[
//
// MessageId: ERROR_SEM_IS_SET
//
// MessageText:
//
// The semaphore is set and cannot be closed.
//
static const int ERROR_SEM_IS_SET               =  102L;

//
// MessageId: ERROR_TOO_MANY_SEM_REQUESTS
//
// MessageText:
//
// The semaphore cannot be set again.
//
static const int ERROR_TOO_MANY_SEM_REQUESTS     = 103L;

//
// MessageId: ERROR_INVALID_AT_INTERRUPT_TIME
//
// MessageText:
//
// Cannot request exclusive semaphores at interrupt time.
//
static const int ERROR_INVALID_AT_INTERRUPT_TIME = 104L;

//
// MessageId: ERROR_SEM_OWNER_DIED
//
// MessageText:
//
// The previous ownership of this semaphore has ended.
//
static const int ERROR_SEM_OWNER_DIED            = 105L;

//
// MessageId: ERROR_SEM_USER_LIMIT
//
// MessageText:
//
// Insert the diskette for drive %1.
//
static const int ERROR_SEM_USER_LIMIT           =  106L;

//
// MessageId: ERROR_DISK_CHANGE
//
// MessageText:
//
// The program stopped because an alternate diskette was not inserted.
//
static const int ERROR_DISK_CHANGE              =  107L;

//
// MessageId: ERROR_DRIVE_LOCKED
//
// MessageText:
//
// The disk is in use or locked by another process.
//
static const int ERROR_DRIVE_LOCKED             =  108L;

//
// MessageId: ERROR_BROKEN_PIPE
//
// MessageText:
//
// The pipe has been ended.
//
static const int ERROR_BROKEN_PIPE              =  109L;

//
// MessageId: ERROR_OPEN_FAILED
//
// MessageText:
//
// The system cannot open the device or file specified.
//
static const int ERROR_OPEN_FAILED              =  110L;

//
// MessageId: ERROR_BUFFER_OVERFLOW
//
// MessageText:
//
// The file name is too long.
//
static const int ERROR_BUFFER_OVERFLOW          =  111L;

//
// MessageId: ERROR_DISK_FULL
//
// MessageText:
//
// There is not enough space on the disk.
//
static const int ERROR_DISK_FULL                =  112L;

//
// MessageId: ERROR_NO_MORE_SEARCH_HANDLES
//
// MessageText:
//
// No more internal file identifiers available.
//
static const int ERROR_NO_MORE_SEARCH_HANDLES   =  113L;

//
// MessageId: ERROR_INVALID_TARGET_HANDLE
//
// MessageText:
//
// The target internal file identifier is incorrect.
//
static const int ERROR_INVALID_TARGET_HANDLE    =  114L;

//
// MessageId: ERROR_INVALID_CATEGORY
//
// MessageText:
//
// The IOCTL call made by the application program is not correct.
//
static const int ERROR_INVALID_CATEGORY         =  117L;

//
// MessageId: ERROR_INVALID_VERIFY_SWITCH
//
// MessageText:
//
// The verify-on-write switch parameter value is not correct.
//
static const int ERROR_INVALID_VERIFY_SWITCH    =  118L;

//
// MessageId: ERROR_BAD_DRIVER_LEVEL
//
// MessageText:
//
// The system does not support the command requested.
//
static const int ERROR_BAD_DRIVER_LEVEL        =   119L;

//
// MessageId: ERROR_CALL_NOT_IMPLEMENTED
//
// MessageText:
//
// This function is not supported on this system.
//
static const int ERROR_CALL_NOT_IMPLEMENTED    =   120L;

//
// MessageId: ERROR_SEM_TIMEOUT
//
// MessageText:
//
// The semaphore timeout period has expired.
//
static const int ERROR_SEM_TIMEOUT             =   121L;

//
// MessageId: ERROR_INSUFFICIENT_BUFFER
//
// MessageText:
//
// The data area passed to a system call is too small.
//
static const int ERROR_INSUFFICIENT_BUFFER     =   122L;    // dderror

//
// MessageId: ERROR_INVALID_NAME
//
// MessageText:
//
// The filename, directory name, or volume label syntax is incorrect.
//
static const int ERROR_INVALID_NAME             =  123L;    // dderror

//
// MessageId: ERROR_INVALID_LEVEL
//
// MessageText:
//
// The system call level is not correct.
//
static const int ERROR_INVALID_LEVEL           =   124L;

//
// MessageId: ERROR_NO_VOLUME_LABEL
//
// MessageText:
//
// The disk has no volume label.
//
static const int ERROR_NO_VOLUME_LABEL        =    125L;

//
// MessageId: ERROR_MOD_NOT_FOUND
//
// MessageText:
//
// The specified module could not be found.
//
static const int ERROR_MOD_NOT_FOUND           =   126L;

//
// MessageId: ERROR_PROC_NOT_FOUND
//
// MessageText:
//
// The specified procedure could not be found.
//
static const int ERROR_PROC_NOT_FOUND         =    127L;

//
// MessageId: ERROR_WAIT_NO_CHILDREN
//
// MessageText:
//
// There are no child processes to wait for.
//
static const int ERROR_WAIT_NO_CHILDREN        =   128L;

//
// MessageId: ERROR_CHILD_NOT_COMPLETE
//
// MessageText:
//
// The %1 application cannot be run in Win32 mode.
//
static const int ERROR_CHILD_NOT_COMPLETE      =   129L;

//
// MessageId: ERROR_DIRECT_ACCESS_HANDLE
//
// MessageText:
//
// Attempt to use a file handle to an open disk partition for an operation other than raw disk I/O.
//
static const int ERROR_DIRECT_ACCESS_HANDLE    =   130L;

//
// MessageId: ERROR_NEGATIVE_SEEK
//
// MessageText:
//
// An attempt was made to move the file pointer before the beginning of the file.
//
static const int ERROR_NEGATIVE_SEEK           =   131L;

//
// MessageId: ERROR_SEEK_ON_DEVICE
//
// MessageText:
//
// The file pointer cannot be set on the specified device or file.
//
static const int ERROR_SEEK_ON_DEVICE          =   132L;

//
// MessageId: ERROR_IS_JOIN_TARGET
//
// MessageText:
//
// A JOIN or SUBST command cannot be used for a drive that contains previously joined drives.
//
static const int ERROR_IS_JOIN_TARGET         =    133L;

//
// MessageId: ERROR_IS_JOINED
//
// MessageText:
//
// An attempt was made to use a JOIN or SUBST command on a drive that has already been joined.
//
static const int ERROR_IS_JOINED               =   134L;

//
// MessageId: ERROR_IS_SUBSTED
//
// MessageText:
//
// An attempt was made to use a JOIN or SUBST command on a drive that has already been substituted.
//
static const int ERROR_IS_SUBSTED             =    135L;

//
// MessageId: ERROR_NOT_JOINED
//
// MessageText:
//
// The system tried to delete the JOIN of a drive that is not joined.
//
static const int ERROR_NOT_JOINED             =    136L;

//
// MessageId: ERROR_NOT_SUBSTED
//
// MessageText:
//
// The system tried to delete the substitution of a drive that is not substituted.
//
static const int ERROR_NOT_SUBSTED            =    137L;

//
// MessageId: ERROR_JOIN_TO_JOIN
//
// MessageText:
//
// The system tried to join a drive to a directory on a joined drive.
//
static const int ERROR_JOIN_TO_JOIN           =    138L;

//
// MessageId: ERROR_SUBST_TO_SUBST
//
// MessageText:
//
// The system tried to substitute a drive to a directory on a substituted drive.
//
static const int ERROR_SUBST_TO_SUBST         =    139L;

//
// MessageId: ERROR_JOIN_TO_SUBST
//
// MessageText:
//
// The system tried to join a drive to a directory on a substituted drive.
//
static const int ERROR_JOIN_TO_SUBST             = 140L;

//
// MessageId: ERROR_SUBST_TO_JOIN
//
// MessageText:
//
// The system tried to SUBST a drive to a directory on a joined drive.
//
static const int ERROR_SUBST_TO_JOIN             = 141L;

//
// MessageId: ERROR_BUSY_DRIVE
//
// MessageText:
//
// The system cannot perform a JOIN or SUBST at this time.
//
static const int ERROR_BUSY_DRIVE                = 142L;

//
// MessageId: ERROR_SAME_DRIVE
//
// MessageText:
//
// The system cannot join or substitute a drive to or for a directory on the same drive.
//
static const int ERROR_SAME_DRIVE                = 143L;

//
// MessageId: ERROR_DIR_NOT_ROOT
//
// MessageText:
//
// The directory is not a subdirectory of the root directory.
//
static const int ERROR_DIR_NOT_ROOT              = 144L;

//
// MessageId: ERROR_DIR_NOT_EMPTY
//
// MessageText:
//
// The directory is not empty.
//
static const int ERROR_DIR_NOT_EMPTY             = 145L;

//
// MessageId: ERROR_IS_SUBST_PATH
//
// MessageText:
//
// The path specified is being used in a substitute.
//
static const int ERROR_IS_SUBST_PATH             = 146L;

//
// MessageId: ERROR_IS_JOIN_PATH
//
// MessageText:
//
// Not enough resources are available to process this command.
//
static const int ERROR_IS_JOIN_PATH              = 147L;

//
// MessageId: ERROR_PATH_BUSY
//
// MessageText:
//
// The path specified cannot be used at this time.
//
static const int ERROR_PATH_BUSY                 = 148L;

//
// MessageId: ERROR_IS_SUBST_TARGET
//
// MessageText:
//
// An attempt was made to join or substitute a drive for which a directory on the drive is the target of a previous substitute.
//
static const int ERROR_IS_SUBST_TARGET           = 149L;

//
// MessageId: ERROR_SYSTEM_TRACE
//
// MessageText:
//
// System trace information was not specified in your CONFIG.SYS file, or tracing is disallowed.
//
static const int ERROR_SYSTEM_TRACE              = 150L;

//
// MessageId: ERROR_INVALID_EVENT_COUNT
//
// MessageText:
//
// The number of specified semaphore events for DosMuxSemWait is not correct.
//
static const int ERROR_INVALID_EVENT_COUNT       = 151L;

//
// MessageId: ERROR_TOO_MANY_MUXWAITERS
//
// MessageText:
//
// DosMuxSemWait did not execute; too many semaphores are already set.
//
static const int ERROR_TOO_MANY_MUXWAITERS       = 152L;

//
// MessageId: ERROR_INVALID_LIST_FORMAT
//
// MessageText:
//
// The DosMuxSemWait list is not correct.
//
static const int ERROR_INVALID_LIST_FORMAT       = 153L;

//
// MessageId: ERROR_LABEL_TOO_LONG
//
// MessageText:
//
// The volume label you entered exceeds the label character limit of the target file system.
//
static const int ERROR_LABEL_TOO_LONG            = 154L;

//
// MessageId: ERROR_TOO_MANY_TCBS
//
// MessageText:
//
// Cannot create another thread.
//
static const int ERROR_TOO_MANY_TCBS             = 155L;

//
// MessageId: ERROR_SIGNAL_REFUSED
//
// MessageText:
//
// The recipient process has refused the signal.
//
static const int ERROR_SIGNAL_REFUSED            = 156L;

//
// MessageId: ERROR_DISCARDED
//
// MessageText:
//
// The segment is already discarded and cannot be locked.
//
static const int ERROR_DISCARDED                 = 157L;

//
// MessageId: ERROR_NOT_LOCKED
//
// MessageText:
//
// The segment is already unlocked.
//
static const int ERROR_NOT_LOCKED                = 158L;

//
// MessageId: ERROR_BAD_THREADID_ADDR
//
// MessageText:
//
// The address for the thread ID is not correct.
//
static const int ERROR_BAD_THREADID_ADDR         = 159L;

//
// MessageId: ERROR_BAD_ARGUMENTS
//
// MessageText:
//
// One or more arguments are not correct.
//
static const int ERROR_BAD_ARGUMENTS             = 160L;

//
// MessageId: ERROR_BAD_PATHNAME
//
// MessageText:
//
// The specified path is invalid.
//
static const int ERROR_BAD_PATHNAME              = 161L;

//
// MessageId: ERROR_SIGNAL_PENDING
//
// MessageText:
//
// A signal is already pending.
//
static const int ERROR_SIGNAL_PENDING            = 162L;

//
// MessageId: ERROR_MAX_THRDS_REACHED
//
// MessageText:
//
// No more threads can be created in the system.
//
static const int ERROR_MAX_THRDS_REACHED         = 164L;

//
// MessageId: ERROR_LOCK_FAILED
//
// MessageText:
//
// Unable to lock a region of a file.
//
static const int ERROR_LOCK_FAILED               = 167L;

//
// MessageId: ERROR_BUSY
//
// MessageText:
//
// The requested resource is in use.
//
static const int ERROR_BUSY                      = 170L;    // dderror

//
// MessageId: ERROR_DEVICE_SUPPORT_IN_PROGRESS
//
// MessageText:
//
// Device's command support detection is in progress.
//
static const int ERROR_DEVICE_SUPPORT_IN_PROGRESS =171L;

//
// MessageId: ERROR_CANCEL_VIOLATION
//
// MessageText:
//
// A lock request was not outstanding for the supplied cancel region.
//
static const int ERROR_CANCEL_VIOLATION          = 173L;

//
// MessageId: ERROR_ATOMIC_LOCKS_NOT_SUPPORTED
//
// MessageText:
//
// The file system does not support atomic changes to the lock type.
//
static const int ERROR_ATOMIC_LOCKS_NOT_SUPPORTED =174L;

//
// MessageId: ERROR_INVALID_SEGMENT_NUMBER
//
// MessageText:
//
// The system detected a segment number that was not correct.
//
static const int ERROR_INVALID_SEGMENT_NUMBER    = 180L;

//
// MessageId: ERROR_INVALID_ORDINAL
//
// MessageText:
//
// The operating system cannot run %1.
//
static const int ERROR_INVALID_ORDINAL           = 182L;

//
// MessageId: ERROR_ALREADY_EXISTS
//
// MessageText:
//
// Cannot create a file when that file already exists.
//
static const int ERROR_ALREADY_EXISTS            = 183L;

//
// MessageId: ERROR_INVALID_FLAG_NUMBER
//
// MessageText:
//
// The flag passed is not correct.
//
static const int ERROR_INVALID_FLAG_NUMBER       = 186L;

//
// MessageId: ERROR_SEM_NOT_FOUND
//
// MessageText:
//
// The specified system semaphore name was not found.
//
static const int ERROR_SEM_NOT_FOUND             = 187L;

//
// MessageId: ERROR_INVALID_STARTING_CODESEG
//
// MessageText:
//
// The operating system cannot run %1.
//
static const int ERROR_INVALID_STARTING_CODESEG  = 188L;

//
// MessageId: ERROR_INVALID_STACKSEG
//
// MessageText:
//
// The operating system cannot run %1.
//
static const int ERROR_INVALID_STACKSEG          = 189L;

//
// MessageId: ERROR_INVALID_MODULETYPE
//
// MessageText:
//
// The operating system cannot run %1.
//
static const int ERROR_INVALID_MODULETYPE        = 190L;

//
// MessageId: ERROR_INVALID_EXE_SIGNATURE
//
// MessageText:
//
// Cannot run %1 in Win32 mode.
//
static const int ERROR_INVALID_EXE_SIGNATURE     = 191L;

//
// MessageId: ERROR_EXE_MARKED_INVALID
//
// MessageText:
//
// The operating system cannot run %1.
//
static const int ERROR_EXE_MARKED_INVALID        = 192L;

//
// MessageId: ERROR_BAD_EXE_FORMAT
//
// MessageText:
//
// %1 is not a valid Win32 application.
//
static const int ERROR_BAD_EXE_FORMAT            = 193L;

//
// MessageId: ERROR_ITERATED_DATA_EXCEEDS_64k
//
// MessageText:
//
// The operating system cannot run %1.
//
static const int ERROR_ITERATED_DATA_EXCEEDS_64k = 194L;

//
// MessageId: ERROR_INVALID_MINALLOCSIZE
//
// MessageText:
//
// The operating system cannot run %1.
//
static const int ERROR_INVALID_MINALLOCSIZE      = 195L;

//
// MessageId: ERROR_DYNLINK_FROM_INVALID_RING
//
// MessageText:
//
// The operating system cannot run this application program.
//
static const int ERROR_DYNLINK_FROM_INVALID_RING = 196L;

//
// MessageId: ERROR_IOPL_NOT_ENABLED
//
// MessageText:
//
// The operating system is not presently configured to run this application.
//
static const int ERROR_IOPL_NOT_ENABLED          = 197L;

//
// MessageId: ERROR_INVALID_SEGDPL
//
// MessageText:
//
// The operating system cannot run %1.
//
static const int ERROR_INVALID_SEGDPL            = 198L;

//
// MessageId: ERROR_AUTODATASEG_EXCEEDS_64k
//
// MessageText:
//
// The operating system cannot run this application program.
//
static const int ERROR_AUTODATASEG_EXCEEDS_64k   = 199L;

//
// MessageId: ERROR_RING2SEG_MUST_BE_MOVABLE
//
// MessageText:
//
// The code segment cannot be greater than or equal to 64K.
//
static const int ERROR_RING2SEG_MUST_BE_MOVABLE  = 200L;

//
// MessageId: ERROR_RELOC_CHAIN_XEEDS_SEGLIM
//
// MessageText:
//
// The operating system cannot run %1.
//
static const int ERROR_RELOC_CHAIN_XEEDS_SEGLIM  = 201L;

//
// MessageId: ERROR_INFLOOP_IN_RELOC_CHAIN
//
// MessageText:
//
// The operating system cannot run %1.
//
static const int ERROR_INFLOOP_IN_RELOC_CHAIN    = 202L;

//
// MessageId: ERROR_ENVVAR_NOT_FOUND
//
// MessageText:
//
// The system could not find the environment option that was entered.
//
static const int ERROR_ENVVAR_NOT_FOUND          = 203L;

//
// MessageId: ERROR_NO_SIGNAL_SENT
//
// MessageText:
//
// No process in the command subtree has a signal handler.
//
static const int ERROR_NO_SIGNAL_SENT            = 205L;

//
// MessageId: ERROR_FILENAME_EXCED_RANGE
//
// MessageText:
//
// The filename or extension is too long.
//
static const int ERROR_FILENAME_EXCED_RANGE      = 206L;

//
// MessageId: ERROR_RING2_STACK_IN_USE
//
// MessageText:
//
// The ring 2 stack is in use.
//
static const int ERROR_RING2_STACK_IN_USE        = 207L;

//
// MessageId: ERROR_META_EXPANSION_TOO_LONG
//
// MessageText:
//
// The global filename characters, * or ?, are entered incorrectly or too many global filename characters are specified.
//
static const int ERROR_META_EXPANSION_TOO_LONG   = 208L;

//
// MessageId: ERROR_INVALID_SIGNAL_NUMBER
//
// MessageText:
//
// The signal being posted is not correct.
//
static const int ERROR_INVALID_SIGNAL_NUMBER     = 209L;

//
// MessageId: ERROR_THREAD_1_INACTIVE
//
// MessageText:
//
// The signal handler cannot be set.
//
static const int ERROR_THREAD_1_INACTIVE         = 210L;

//
// MessageId: ERROR_LOCKED
//
// MessageText:
//
// The segment is locked and cannot be reallocated.
//
static const int ERROR_LOCKED                    = 212L;

//
// MessageId: ERROR_TOO_MANY_MODULES
//
// MessageText:
//
// Too many dynamic-link modules are attached to this program or dynamic-link module.
//
static const int ERROR_TOO_MANY_MODULES          = 214L;

//
// MessageId: ERROR_NESTING_NOT_ALLOWED
//
// MessageText:
//
// Cannot nest calls to LoadModule.
//
static const int ERROR_NESTING_NOT_ALLOWED       = 215L;

//
// MessageId: ERROR_EXE_MACHINE_TYPE_MISMATCH
//
// MessageText:
//
// This version of %1 is not compatible with the version of Windows you're running. Check your computer's system information and then contact the software publisher.
//
static const int ERROR_EXE_MACHINE_TYPE_MISMATCH  =216L;

//
// MessageId: ERROR_EXE_CANNOT_MODIFY_SIGNED_BINARY
//
// MessageText:
//
// The image file %1 is signed, unable to modify.
//
static const int ERROR_EXE_CANNOT_MODIFY_SIGNED_BINARY =217L;

//
// MessageId: ERROR_EXE_CANNOT_MODIFY_STRONG_SIGNED_BINARY
//
// MessageText:
//
// The image file %1 is strong signed, unable to modify.
//
static const int ERROR_EXE_CANNOT_MODIFY_STRONG_SIGNED_BINARY =218L;

//
// MessageId: ERROR_FILE_CHECKED_OUT
//
// MessageText:
//
// This file is checked out or locked for editing by another user.
//
static const int ERROR_FILE_CHECKED_OUT          = 220L;

//
// MessageId: ERROR_CHECKOUT_REQUIRED
//
// MessageText:
//
// The file must be checked out before saving changes.
//
static const int ERROR_CHECKOUT_REQUIRED         = 221L;

//
// MessageId: ERROR_BAD_FILE_TYPE
//
// MessageText:
//
// The file type being saved or retrieved has been blocked.
//
static const int ERROR_BAD_FILE_TYPE            =  222L;

//
// MessageId: ERROR_FILE_TOO_LARGE
//
// MessageText:
//
// The file size exceeds the limit allowed and cannot be saved.
//
static const int ERROR_FILE_TOO_LARGE            = 223L;

//
// MessageId: ERROR_FORMS_AUTH_REQUIRED
//
// MessageText:
//
// Access Denied. Before opening files in this location, you must first add the web site to your trusted sites list, browse to the web site, and select the option to login automatically.
//
static const int ERROR_FORMS_AUTH_REQUIRED       = 224L;

//
// MessageId: ERROR_VIRUS_INFECTED
//
// MessageText:
//
// Operation did not complete successfully because the file contains a virus or potentially unwanted software.
//
static const int ERROR_VIRUS_INFECTED            = 225L;

//
// MessageId: ERROR_VIRUS_DELETED
//
// MessageText:
//
// This file contains a virus or potentially unwanted software and cannot be opened. Due to the nature of this virus or potentially unwanted software, the file has been removed from this location.
//
static const int ERROR_VIRUS_DELETED             = 226L;

//
// MessageId: ERROR_PIPE_LOCAL
//
// MessageText:
//
// The pipe is local.
//
static const int ERROR_PIPE_LOCAL                = 229L;

//
// MessageId: ERROR_BAD_PIPE
//
// MessageText:
//
// The pipe state is invalid.
//
static const int ERROR_BAD_PIPE                  = 230L;

//
// MessageId: ERROR_PIPE_BUSY
//
// MessageText:
//
// All pipe instances are busy.
//
static const int ERROR_PIPE_BUSY                 = 231L;

//
// MessageId: ERROR_NO_DATA
//
// MessageText:
//
// The pipe is being closed.
//
static const int ERROR_NO_DATA                   = 232L;

//
// MessageId: ERROR_PIPE_NOT_CONNECTED
//
// MessageText:
//
// No process is on the other end of the pipe.
//
static const int ERROR_PIPE_NOT_CONNECTED        = 233L;
]]

ffi.cdef[[
// More data is available.
//
static const int ERROR_MORE_DATA                 = 234L;  // dderror

//
// MessageId: ERROR_NO_WORK_DONE
//
// MessageText:
//
// The action requested resulted in no work being done. Error-style clean-up has been performed.
//
static const int ERROR_NO_WORK_DONE              = 235L;

//
// MessageId: ERROR_VC_DISCONNECTED
//
// MessageText:
//
// The session was canceled.
//
static const int ERROR_VC_DISCONNECTED           = 240L;

//
// MessageId: ERROR_INVALID_EA_NAME
//
// MessageText:
//
// The specified extended attribute name was invalid.
//
static const int ERROR_INVALID_EA_NAME           = 254L;

//
// MessageId: ERROR_EA_LIST_INCONSISTENT
//
// MessageText:
//
// The extended attributes are inconsistent.
//
static const int ERROR_EA_LIST_INCONSISTENT      = 255L;
]]

ffi.cdef[[

static const int WAIT_TIMEOUT                    = 258L;    // dderror
static const int ERROR_NO_MORE_ITEMS             = 259L;
]]

--[[

static const int ERROR_CANNOT_COPY               = 266L


static const int ERROR_DIRECTORY                 = 267L

static const int ERROR_EAS_DIDNT_FIT             = 275L


static const int ERROR_EA_FILE_CORRUPT           = 276L


static const int ERROR_EA_TABLE_FULL             = 277L


static const int ERROR_INVALID_EA_HANDLE         = 278L


static const int ERROR_EAS_NOT_SUPPORTED         = 282L


static const int ERROR_NOT_OWNER                =  288L


static const int ERROR_TOO_MANY_POSTS             298L


static const int ERROR_PARTIAL_COPY               299L


static const int ERROR_OPLOCK_NOT_GRANTED         300L


static const int ERROR_INVALID_OPLOCK_PROTOCOL    301L


static const int ERROR_DISK_TOO_FRAGMENTED        302L


static const int ERROR_DELETE_PENDING             303L


static const int ERROR_INCOMPATIBLE_WITH_GLOBAL_SHORT_NAME_REGISTRY_SETTING 304L


static const int ERROR_SHORT_NAMES_NOT_ENABLED_ON_VOLUME 305L


static const int ERROR_SECURITY_STREAM_IS_INCONSISTENT 306L


static const int ERROR_INVALID_LOCK_RANGE         307L


static const int ERROR_IMAGE_SUBSYSTEM_NOT_PRESENT 308L

//
// MessageId: ERROR_NOTIFICATION_GUID_ALREADY_DEFINED
//
// MessageText:
//
// The specified file already has a notification GUID associated with it.
//
static const int ERROR_NOTIFICATION_GUID_ALREADY_DEFINED 309L

//
// MessageId: ERROR_INVALID_EXCEPTION_HANDLER
//
// MessageText:
//
// An invalid exception handler routine has been detected.
//
static const int ERROR_INVALID_EXCEPTION_HANDLER  310L

//
// MessageId: ERROR_DUPLICATE_PRIVILEGES
//
// MessageText:
//
// Duplicate privileges were specified for the token.
//
static const int ERROR_DUPLICATE_PRIVILEGES       311L

//
// MessageId: ERROR_NO_RANGES_PROCESSED
//
// MessageText:
//
// No ranges for the specified operation were able to be processed.
//
static const int ERROR_NO_RANGES_PROCESSED        312L

//
// MessageId: ERROR_NOT_ALLOWED_ON_SYSTEM_FILE
//
// MessageText:
//
// Operation is not allowed on a file system internal file.
//
static const int ERROR_NOT_ALLOWED_ON_SYSTEM_FILE 313L

//
// MessageId: ERROR_DISK_RESOURCES_EXHAUSTED
//
// MessageText:
//
// The physical resources of this disk have been exhausted.
//
static const int ERROR_DISK_RESOURCES_EXHAUSTED   314L

//
// MessageId: ERROR_INVALID_TOKEN
//
// MessageText:
//
// The token representing the data is invalid.
//
static const int ERROR_INVALID_TOKEN              315L

//
// MessageId: ERROR_DEVICE_FEATURE_NOT_SUPPORTED
//
// MessageText:
//
// The device does not support the command feature.
//
static const int ERROR_DEVICE_FEATURE_NOT_SUPPORTED 316L

//
// MessageId: ERROR_MR_MID_NOT_FOUND
//
// MessageText:
//
// The system cannot find message text for message number 0x%1 in the message file for %2.
//
static const int ERROR_MR_MID_NOT_FOUND           317L

//
// MessageId: ERROR_SCOPE_NOT_FOUND
//
// MessageText:
//
// The scope specified was not found.
//
static const int ERROR_SCOPE_NOT_FOUND            318L

//
// MessageId: ERROR_UNDEFINED_SCOPE
//
// MessageText:
//
// The Central Access Policy specified is not defined on the target machine.
//
static const int ERROR_UNDEFINED_SCOPE            319L

//
// MessageId: ERROR_INVALID_CAP
//
// MessageText:
//
// The Central Access Policy obtained from Active Directory is invalid.
//
static const int ERROR_INVALID_CAP                320L

//
// MessageId: ERROR_DEVICE_UNREACHABLE
//
// MessageText:
//
// The device is unreachable.
//
static const int ERROR_DEVICE_UNREACHABLE         321L

//
// MessageId: ERROR_DEVICE_NO_RESOURCES
//
// MessageText:
//
// The target device has insufficient resources to complete the operation.
//
static const int ERROR_DEVICE_NO_RESOURCES        322L

//
// MessageId: ERROR_DATA_CHECKSUM_ERROR
//
// MessageText:
//
// A data integrity checksum error occurred. Data in the file stream is corrupt.
//
static const int ERROR_DATA_CHECKSUM_ERROR        323L

//
// MessageId: ERROR_INTERMIXED_KERNEL_EA_OPERATION
//
// MessageText:
//
// An attempt was made to modify both a KERNEL and normal Extended Attribute (EA) in the same operation.
//
static const int ERROR_INTERMIXED_KERNEL_EA_OPERATION 324L

//
// MessageId: ERROR_FILE_LEVEL_TRIM_NOT_SUPPORTED
//
// MessageText:
//
// Device does not support file-level TRIM.
//
static const int ERROR_FILE_LEVEL_TRIM_NOT_SUPPORTED 326L

//
// MessageId: ERROR_OFFSET_ALIGNMENT_VIOLATION
//
// MessageText:
//
// The command specified a data offset that does not align to the device's granularity/alignment.
//
static const int ERROR_OFFSET_ALIGNMENT_VIOLATION 327L

//
// MessageId: ERROR_INVALID_FIELD_IN_PARAMETER_LIST
//
// MessageText:
//
// The command specified an invalid field in its parameter list.
//
static const int ERROR_INVALID_FIELD_IN_PARAMETER_LIST 328L

//
// MessageId: ERROR_OPERATION_IN_PROGRESS
//
// MessageText:
//
// An operation is currently in progress with the device.
//
static const int ERROR_OPERATION_IN_PROGRESS      329L

//
// MessageId: ERROR_BAD_DEVICE_PATH
//
// MessageText:
//
// An attempt was made to send down the command via an invalid path to the target device.
//
static const int ERROR_BAD_DEVICE_PATH            330L

//
// MessageId: ERROR_TOO_MANY_DESCRIPTORS
//
// MessageText:
//
// The command specified a number of descriptors that exceeded the maximum supported by the device.
//
static const int ERROR_TOO_MANY_DESCRIPTORS       331L

//
// MessageId: ERROR_SCRUB_DATA_DISABLED
//
// MessageText:
//
// Scrub is disabled on the specified file.
//
static const int ERROR_SCRUB_DATA_DISABLED        332L

//
// MessageId: ERROR_NOT_REDUNDANT_STORAGE
//
// MessageText:
//
// The storage device does not provide redundancy.
//
static const int ERROR_NOT_REDUNDANT_STORAGE      333L

//
// MessageId: ERROR_RESIDENT_FILE_NOT_SUPPORTED
//
// MessageText:
//
// An operation is not supported on a resident file.
//
static const int ERROR_RESIDENT_FILE_NOT_SUPPORTED 334L

//
// MessageId: ERROR_COMPRESSED_FILE_NOT_SUPPORTED
//
// MessageText:
//
// An operation is not supported on a compressed file.
//
static const int ERROR_COMPRESSED_FILE_NOT_SUPPORTED 335L

//
// MessageId: ERROR_DIRECTORY_NOT_SUPPORTED
//
// MessageText:
//
// An operation is not supported on a directory.
//
static const int ERROR_DIRECTORY_NOT_SUPPORTED    336L

//
// MessageId: ERROR_NOT_READ_FROM_COPY
//
// MessageText:
//
// The specified copy of the requested data could not be read.
//
static const int ERROR_NOT_READ_FROM_COPY         337L

//
// MessageId: ERROR_FT_WRITE_FAILURE
//
// MessageText:
//
// The specified data could not be written to any of the copies.
//
static const int ERROR_FT_WRITE_FAILURE           338L

//
// MessageId: ERROR_FT_DI_SCAN_REQUIRED
//
// MessageText:
//
// One or more copies of data on this device may be out of sync. No writes may be performed until a data integrity scan is completed.
//
static const int ERROR_FT_DI_SCAN_REQUIRED        339L

//
// MessageId: ERROR_INVALID_KERNEL_INFO_VERSION
//
// MessageText:
//
// The supplied kernel information version is invalid.
//
static const int ERROR_INVALID_KERNEL_INFO_VERSION 340L

//
// MessageId: ERROR_INVALID_PEP_INFO_VERSION
//
// MessageText:
//
// The supplied PEP information version is invalid.
//
static const int ERROR_INVALID_PEP_INFO_VERSION   341L

//
// MessageId: ERROR_OBJECT_NOT_EXTERNALLY_BACKED
//
// MessageText:
//
// This object is not externally backed by any provider.
//
static const int ERROR_OBJECT_NOT_EXTERNALLY_BACKED 342L

//
// MessageId: ERROR_EXTERNAL_BACKING_PROVIDER_UNKNOWN
//
// MessageText:
//
// The external backing provider is not recognized.
//
static const int ERROR_EXTERNAL_BACKING_PROVIDER_UNKNOWN 343L

//
// MessageId: ERROR_COMPRESSION_NOT_BENEFICIAL
//
// MessageText:
//
// Compressing this object would not save space.
//
static const int ERROR_COMPRESSION_NOT_BENEFICIAL 344L

//
// MessageId: ERROR_STORAGE_TOPOLOGY_ID_MISMATCH
//
// MessageText:
//
// The request failed due to a storage topology ID mismatch.
//
static const int ERROR_STORAGE_TOPOLOGY_ID_MISMATCH 345L

//
// MessageId: ERROR_BLOCKED_BY_PARENTAL_CONTROLS
//
// MessageText:
//
// The operation was blocked by parental controls.
//
static const int ERROR_BLOCKED_BY_PARENTAL_CONTROLS 346L

//
// MessageId: ERROR_BLOCK_TOO_MANY_REFERENCES
//
// MessageText:
//
// A file system block being referenced has already reached the maximum reference count and can't be referenced any further.
//
static const int ERROR_BLOCK_TOO_MANY_REFERENCES  347L

//
// MessageId: ERROR_MARKED_TO_DISALLOW_WRITES
//
// MessageText:
//
// The requested operation failed because the file stream is marked to disallow writes.
//
static const int ERROR_MARKED_TO_DISALLOW_WRITES  348L

//
// MessageId: ERROR_ENCLAVE_FAILURE
//
// MessageText:
//
// The requested operation failed with an architecture-specific failure code.
//
static const int ERROR_ENCLAVE_FAILURE            349L

//
// MessageId: ERROR_FAIL_NOACTION_REBOOT
//
// MessageText:
//
// No action was taken as a system reboot is required.
//
static const int ERROR_FAIL_NOACTION_REBOOT       350L

//
// MessageId: ERROR_FAIL_SHUTDOWN
//
// MessageText:
//
// The shutdown operation failed.
//
static const int ERROR_FAIL_SHUTDOWN              351L

//
// MessageId: ERROR_FAIL_RESTART
//
// MessageText:
//
// The restart operation failed.
//
static const int ERROR_FAIL_RESTART               352L

//
// MessageId: ERROR_MAX_SESSIONS_REACHED
//
// MessageText:
//
// The maximum number of sessions has been reached.
//
static const int ERROR_MAX_SESSIONS_REACHED       353L

//
// MessageId: ERROR_NETWORK_ACCESS_DENIED_EDP
//
// MessageText:
//
// Windows Information Protection policy does not allow access to this network resource.
//
static const int ERROR_NETWORK_ACCESS_DENIED_EDP  354L

//
// MessageId: ERROR_DEVICE_HINT_NAME_BUFFER_TOO_SMALL
//
// MessageText:
//
// The device hint name buffer is too small to receive the remaining name.
//
static const int ERROR_DEVICE_HINT_NAME_BUFFER_TOO_SMALL 355L

//
// MessageId: ERROR_EDP_POLICY_DENIES_OPERATION
//
// MessageText:
//
// The requested operation was blocked by Windows Information Protection policy. For more information, contact your system administrator.
//
static const int ERROR_EDP_POLICY_DENIES_OPERATION 356L

//
// MessageId: ERROR_EDP_DPL_POLICY_CANT_BE_SATISFIED
//
// MessageText:
//
// The requested operation cannot be performed because hardware or software configuration of the device does not comply with Windows Information Protection under Lock policy. Please, verify that user PIN has been created. For more information, contact your system administrator.
//
static const int ERROR_EDP_DPL_POLICY_CANT_BE_SATISFIED 357L

//
// MessageId: ERROR_CLOUD_FILE_SYNC_ROOT_METADATA_CORRUPT
//
// MessageText:
//
// The cloud sync root metadata is corrupted.
//
static const int ERROR_CLOUD_FILE_SYNC_ROOT_METADATA_CORRUPT 358L

//
// MessageId: ERROR_DEVICE_IN_MAINTENANCE
//
// MessageText:
//
// The device is in maintenance mode.
//
static const int ERROR_DEVICE_IN_MAINTENANCE      359L

//
// MessageId: ERROR_NOT_SUPPORTED_ON_DAX
//
// MessageText:
//
// This operation is not supported on a DAX volume.
//
static const int ERROR_NOT_SUPPORTED_ON_DAX       360L

//
// MessageId: ERROR_DAX_MAPPING_EXISTS
//
// MessageText:
//
// The volume has active DAX mappings.
//
static const int ERROR_DAX_MAPPING_EXISTS         361L

//
// MessageId: ERROR_CLOUD_FILE_PROVIDER_NOT_RUNNING
//
// MessageText:
//
// The cloud file provider is not running.
//
static const int ERROR_CLOUD_FILE_PROVIDER_NOT_RUNNING 362L

//
// MessageId: ERROR_CLOUD_FILE_METADATA_CORRUPT
//
// MessageText:
//
// The cloud file metadata is corrupt and unreadable.
//
static const int ERROR_CLOUD_FILE_METADATA_CORRUPT 363L

//
// MessageId: ERROR_CLOUD_FILE_METADATA_TOO_LARGE
//
// MessageText:
//
// The cloud file metadata is too large.
//
static const int ERROR_CLOUD_FILE_METADATA_TOO_LARGE 364L

//
// MessageId: ERROR_CLOUD_FILE_PROPERTY_BLOB_TOO_LARGE
//
// MessageText:
//
// The cloud file property is too large.
//
static const int ERROR_CLOUD_FILE_PROPERTY_BLOB_TOO_LARGE 365L

//
// MessageId: ERROR_CLOUD_FILE_PROPERTY_BLOB_CHECKSUM_MISMATCH
//
// MessageText:
//
// The cloud file property is possibly corrupt. The on-disk checksum does not match the computed checksum.
//
static const int ERROR_CLOUD_FILE_PROPERTY_BLOB_CHECKSUM_MISMATCH 366L

//
// MessageId: ERROR_CHILD_PROCESS_BLOCKED
//
// MessageText:
//
// The process creation has been blocked.
//
static const int ERROR_CHILD_PROCESS_BLOCKED      367L

//
// MessageId: ERROR_STORAGE_LOST_DATA_PERSISTENCE
//
// MessageText:
//
// The storage device has lost data or persistence.
//
static const int ERROR_STORAGE_LOST_DATA_PERSISTENCE 368L

//
// MessageId: ERROR_FILE_SYSTEM_VIRTUALIZATION_UNAVAILABLE
//
// MessageText:
//
// The provider that supports file system virtualization is temporarily unavailable.
//
static const int ERROR_FILE_SYSTEM_VIRTUALIZATION_UNAVAILABLE 369L

//
// MessageId: ERROR_FILE_SYSTEM_VIRTUALIZATION_METADATA_CORRUPT
//
// MessageText:
//
// The metadata for file system virtualization is corrupt and unreadable.
//
static const int ERROR_FILE_SYSTEM_VIRTUALIZATION_METADATA_CORRUPT 370L

//
// MessageId: ERROR_FILE_SYSTEM_VIRTUALIZATION_BUSY
//
// MessageText:
//
// The provider that supports file system virtualization is too busy to complete this operation.
//
static const int ERROR_FILE_SYSTEM_VIRTUALIZATION_BUSY 371L

//
// MessageId: ERROR_FILE_SYSTEM_VIRTUALIZATION_PROVIDER_UNKNOWN
//
// MessageText:
//
// The provider that supports file system virtualization is unknown.
//
static const int ERROR_FILE_SYSTEM_VIRTUALIZATION_PROVIDER_UNKNOWN 372L

//
// MessageId: ERROR_GDI_HANDLE_LEAK
//
// MessageText:
//
// GDI handles were potentially leaked by the application.
//
static const int ERROR_GDI_HANDLE_LEAK            373L

//
// MessageId: ERROR_CLOUD_FILE_TOO_MANY_PROPERTY_BLOBS
//
// MessageText:
//
// The maximum number of cloud file properties has been reached.
//
static const int ERROR_CLOUD_FILE_TOO_MANY_PROPERTY_BLOBS 374L

//
// MessageId: ERROR_CLOUD_FILE_PROPERTY_VERSION_NOT_SUPPORTED
//
// MessageText:
//
// The version of the cloud file property store is not supported.
//
static const int ERROR_CLOUD_FILE_PROPERTY_VERSION_NOT_SUPPORTED 375L

//
// MessageId: ERROR_NOT_A_CLOUD_FILE
//
// MessageText:
//
// The file is not a cloud file.
//
static const int ERROR_NOT_A_CLOUD_FILE           376L

//
// MessageId: ERROR_CLOUD_FILE_NOT_IN_SYNC
//
// MessageText:
//
// The file is not in sync with the cloud.
//
static const int ERROR_CLOUD_FILE_NOT_IN_SYNC     377L

//
// MessageId: ERROR_CLOUD_FILE_ALREADY_CONNECTED
//
// MessageText:
//
// The cloud sync root is already connected with another cloud sync provider.
//
static const int ERROR_CLOUD_FILE_ALREADY_CONNECTED 378L

//
// MessageId: ERROR_CLOUD_FILE_NOT_SUPPORTED
//
// MessageText:
//
// The operation is not supported by the cloud sync provider.
//
static const int ERROR_CLOUD_FILE_NOT_SUPPORTED   379L

//
// MessageId: ERROR_CLOUD_FILE_INVALID_REQUEST
//
// MessageText:
//
// The cloud operation is invalid.
//
static const int ERROR_CLOUD_FILE_INVALID_REQUEST 380L

//
// MessageId: ERROR_CLOUD_FILE_READ_ONLY_VOLUME
//
// MessageText:
//
// The cloud operation is not supported on a read-only volume.
//
static const int ERROR_CLOUD_FILE_READ_ONLY_VOLUME 381L

//
// MessageId: ERROR_CLOUD_FILE_CONNECTED_PROVIDER_ONLY
//
// MessageText:
//
// The operation is reserved for a connected cloud sync provider.
//
static const int ERROR_CLOUD_FILE_CONNECTED_PROVIDER_ONLY 382L

//
// MessageId: ERROR_CLOUD_FILE_VALIDATION_FAILED
//
// MessageText:
//
// The cloud sync provider failed to validate the downloaded data.
//
static const int ERROR_CLOUD_FILE_VALIDATION_FAILED 383L

//
// MessageId: ERROR_SMB1_NOT_AVAILABLE
//
// MessageText:
//
// You can't connect to the file share because it's not secure. This share requires the obsolete SMB1 protocol, which is unsafe and could expose your system to attack.
// Your system requires SMB2 or higher. For more info on resolving this issue, see: https://go.microsoft.com/fwlink/?linkid=852747
//
static const int ERROR_SMB1_NOT_AVAILABLE         384L

//
// MessageId: ERROR_FILE_SYSTEM_VIRTUALIZATION_INVALID_OPERATION
//
// MessageText:
//
// The virtualization operation is not allowed on the file in its current state.
//
static const int ERROR_FILE_SYSTEM_VIRTUALIZATION_INVALID_OPERATION 385L

//
// MessageId: ERROR_CLOUD_FILE_AUTHENTICATION_FAILED
//
// MessageText:
//
// The cloud sync provider failed user authentication.
//
static const int ERROR_CLOUD_FILE_AUTHENTICATION_FAILED 386L

//
// MessageId: ERROR_CLOUD_FILE_INSUFFICIENT_RESOURCES
//
// MessageText:
//
// The cloud sync provider failed to perform the operation due to low system resources.
//
static const int ERROR_CLOUD_FILE_INSUFFICIENT_RESOURCES 387L

//
// MessageId: ERROR_CLOUD_FILE_NETWORK_UNAVAILABLE
//
// MessageText:
//
// The cloud sync provider failed to perform the operation due to network being unavailable.
//
static const int ERROR_CLOUD_FILE_NETWORK_UNAVAILABLE 388L

//
// MessageId: ERROR_CLOUD_FILE_UNSUCCESSFUL
//
// MessageText:
//
// The cloud operation was unsuccessful.
//
static const int ERROR_CLOUD_FILE_UNSUCCESSFUL    389L

//
// MessageId: ERROR_CLOUD_FILE_NOT_UNDER_SYNC_ROOT
//
// MessageText:
//
// The operation is only supported on files under a cloud sync root.
//
static const int ERROR_CLOUD_FILE_NOT_UNDER_SYNC_ROOT 390L

//
// MessageId: ERROR_CLOUD_FILE_IN_USE
//
// MessageText:
//
// The operation cannot be performed on cloud files in use.
//
static const int ERROR_CLOUD_FILE_IN_USE          391L

//
// MessageId: ERROR_CLOUD_FILE_PINNED
//
// MessageText:
//
// The operation cannot be performed on pinned cloud files.
//
static const int ERROR_CLOUD_FILE_PINNED          392L

//
// MessageId: ERROR_CLOUD_FILE_REQUEST_ABORTED
//
// MessageText:
//
// The cloud operation was aborted.
//
static const int ERROR_CLOUD_FILE_REQUEST_ABORTED 393L

//
// MessageId: ERROR_CLOUD_FILE_PROPERTY_CORRUPT
//
// MessageText:
//
// The cloud file's property store is corrupt.
//
static const int ERROR_CLOUD_FILE_PROPERTY_CORRUPT 394L

//
// MessageId: ERROR_CLOUD_FILE_ACCESS_DENIED
//
// MessageText:
//
// Access to the cloud file is denied.
//
static const int ERROR_CLOUD_FILE_ACCESS_DENIED   395L

//
// MessageId: ERROR_CLOUD_FILE_INCOMPATIBLE_HARDLINKS
//
// MessageText:
//
// The cloud operation cannot be performed on a file with incompatible hardlinks.
//
static const int ERROR_CLOUD_FILE_INCOMPATIBLE_HARDLINKS 396L

//
// MessageId: ERROR_CLOUD_FILE_PROPERTY_LOCK_CONFLICT
//
// MessageText:
//
// The operation failed due to a conflicting cloud file property lock.
//
static const int ERROR_CLOUD_FILE_PROPERTY_LOCK_CONFLICT 397L

//
// MessageId: ERROR_CLOUD_FILE_REQUEST_CANCELED
//
// MessageText:
//
// The cloud operation was canceled by user.
//
static const int ERROR_CLOUD_FILE_REQUEST_CANCELED 398L

//
// MessageId: ERROR_EXTERNAL_SYSKEY_NOT_SUPPORTED
//
// MessageText:
//
// An externally encrypted syskey has been configured, but the system no longer supports this feature.  Please see https://go.microsoft.com/fwlink/?linkid=851152 for more information.
//
static const int ERROR_EXTERNAL_SYSKEY_NOT_SUPPORTED 399L

//
// MessageId: ERROR_THREAD_MODE_ALREADY_BACKGROUND
//
// MessageText:
//
// The thread is already in background processing mode.
//
static const int ERROR_THREAD_MODE_ALREADY_BACKGROUND 400L

//
// MessageId: ERROR_THREAD_MODE_NOT_BACKGROUND
//
// MessageText:
//
// The thread is not in background processing mode.
//
static const int ERROR_THREAD_MODE_NOT_BACKGROUND 401L

//
// MessageId: ERROR_PROCESS_MODE_ALREADY_BACKGROUND
//
// MessageText:
//
// The process is already in background processing mode.
//
static const int ERROR_PROCESS_MODE_ALREADY_BACKGROUND 402L

//
// MessageId: ERROR_PROCESS_MODE_NOT_BACKGROUND
//
// MessageText:
//
// The process is not in background processing mode.
//
static const int ERROR_PROCESS_MODE_NOT_BACKGROUND 403L

//
// MessageId: ERROR_CLOUD_FILE_PROVIDER_TERMINATED
//
// MessageText:
//
// The cloud file provider exited unexpectedly.
//
static const int ERROR_CLOUD_FILE_PROVIDER_TERMINATED 404L

//
// MessageId: ERROR_NOT_A_CLOUD_SYNC_ROOT
//
// MessageText:
//
// The file is not a cloud sync root.
//
static const int ERROR_NOT_A_CLOUD_SYNC_ROOT      405L

//
// MessageId: ERROR_FILE_PROTECTED_UNDER_DPL
//
// MessageText:
//
// File is not accessible because it's currently protected under DPL.
//
static const int ERROR_FILE_PROTECTED_UNDER_DPL   406L

//
// MessageId: ERROR_VOLUME_NOT_CLUSTER_ALIGNED
//
// MessageText:
//
// The volume is not cluster aligned on the disk.
//
static const int ERROR_VOLUME_NOT_CLUSTER_ALIGNED 407L

//
// MessageId: ERROR_NO_PHYSICALLY_ALIGNED_FREE_SPACE_FOUND
//
// MessageText:
//
// No physically aligned free space was found on the volume.
//
static const int ERROR_NO_PHYSICALLY_ALIGNED_FREE_SPACE_FOUND 408L

//
// MessageId: ERROR_APPX_FILE_NOT_ENCRYPTED
//
// MessageText:
//
// The APPX file can not be accessed because it is not encrypted as expected.
//
static const int ERROR_APPX_FILE_NOT_ENCRYPTED    409L

//
// MessageId: ERROR_RWRAW_ENCRYPTED_FILE_NOT_ENCRYPTED
//
// MessageText:
//
// A read or write of raw encrypted data cannot be performed because the file is not encrypted.
//
static const int ERROR_RWRAW_ENCRYPTED_FILE_NOT_ENCRYPTED 410L

//
// MessageId: ERROR_RWRAW_ENCRYPTED_INVALID_EDATAINFO_FILEOFFSET
//
// MessageText:
//
// An invalid file offset in the encrypted data info block was passed for read or write operation of file's raw encrypted data.
//
static const int ERROR_RWRAW_ENCRYPTED_INVALID_EDATAINFO_FILEOFFSET 411L

//
// MessageId: ERROR_RWRAW_ENCRYPTED_INVALID_EDATAINFO_FILERANGE
//
// MessageText:
//
// An invalid offset and length combination in the encrypted data info block was passed for read or write operation of file's raw encrypted data.
//
static const int ERROR_RWRAW_ENCRYPTED_INVALID_EDATAINFO_FILERANGE 412L

//
// MessageId: ERROR_RWRAW_ENCRYPTED_INVALID_EDATAINFO_PARAMETER
//
// MessageText:
//
// An invalid parameter in the encrypted data info block was passed for read or write operation of file's raw encrypted data.
//
static const int ERROR_RWRAW_ENCRYPTED_INVALID_EDATAINFO_PARAMETER 413L

//
// MessageId: ERROR_LINUX_SUBSYSTEM_NOT_PRESENT
//
// MessageText:
//
// The Windows Subsystem for Linux has not been enabled.
//
static const int ERROR_LINUX_SUBSYSTEM_NOT_PRESENT 414L

//
// **** Available SYSTEM error codes ****
//

///////////////////////////////////////////////////
//                                               //
//    Capability Authorization Error codes       //
//                                               //
//                 0450 to 0460                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_CAPAUTHZ_NOT_DEVUNLOCKED
//
// MessageText:
//
// Neither developer unlocked mode nor side loading mode is enabled on the device.
//
static const int ERROR_CAPAUTHZ_NOT_DEVUNLOCKED   450L

//
// MessageId: ERROR_CAPAUTHZ_CHANGE_TYPE
//
// MessageText:
//
// Can not change application type during upgrade or re-provision.
//
static const int ERROR_CAPAUTHZ_CHANGE_TYPE       451L

//
// MessageId: ERROR_CAPAUTHZ_NOT_PROVISIONED
//
// MessageText:
//
// The application has not been provisioned.
//
static const int ERROR_CAPAUTHZ_NOT_PROVISIONED   452L

//
// MessageId: ERROR_CAPAUTHZ_NOT_AUTHORIZED
//
// MessageText:
//
// The requested capability can not be authorized for this application.
//
static const int ERROR_CAPAUTHZ_NOT_AUTHORIZED    453L

//
// MessageId: ERROR_CAPAUTHZ_NO_POLICY
//
// MessageText:
//
// There is no capability authorization policy on the device.
//
static const int ERROR_CAPAUTHZ_NO_POLICY         454L

//
// MessageId: ERROR_CAPAUTHZ_DB_CORRUPTED
//
// MessageText:
//
// The capability authorization database has been corrupted.
//
static const int ERROR_CAPAUTHZ_DB_CORRUPTED      455L

//
// MessageId: ERROR_CAPAUTHZ_SCCD_INVALID_CATALOG
//
// MessageText:
//
// The custom capability's SCCD has an invalid catalog.
//
static const int ERROR_CAPAUTHZ_SCCD_INVALID_CATALOG 456L

//
// MessageId: ERROR_CAPAUTHZ_SCCD_NO_AUTH_ENTITY
//
// MessageText:
//
// None of the authorized entity elements in the SCCD matched the app being installed; either the PFNs don't match, or the element's signature hash doesn't validate.
//
static const int ERROR_CAPAUTHZ_SCCD_NO_AUTH_ENTITY 457L

//
// MessageId: ERROR_CAPAUTHZ_SCCD_PARSE_ERROR
//
// MessageText:
//
// The custom capability's SCCD failed to parse.
//
static const int ERROR_CAPAUTHZ_SCCD_PARSE_ERROR  458L

//
// MessageId: ERROR_CAPAUTHZ_SCCD_DEV_MODE_REQUIRED
//
// MessageText:
//
// The custom capability's SCCD requires developer mode.
//
static const int ERROR_CAPAUTHZ_SCCD_DEV_MODE_REQUIRED 459L

//
// MessageId: ERROR_CAPAUTHZ_SCCD_NO_CAPABILITY_MATCH
//
// MessageText:
//
// There not all declared custom capabilities are found in the SCCD.
//
static const int ERROR_CAPAUTHZ_SCCD_NO_CAPABILITY_MATCH 460L

//
// **** Available SYSTEM error codes ****
//
//
// MessageId: ERROR_PNP_QUERY_REMOVE_DEVICE_TIMEOUT
//
// MessageText:
//
// The operation timed out waiting for this device to complete a PnP query-remove request due to a potential hang in its device stack. The system may need to be rebooted to complete the request.
//
static const int ERROR_PNP_QUERY_REMOVE_DEVICE_TIMEOUT 480L

//
// MessageId: ERROR_PNP_QUERY_REMOVE_RELATED_DEVICE_TIMEOUT
//
// MessageText:
//
// The operation timed out waiting for this device to complete a PnP query-remove request due to a potential hang in the device stack of a related device. The system may need to be rebooted to complete the operation.
//
static const int ERROR_PNP_QUERY_REMOVE_RELATED_DEVICE_TIMEOUT 481L

//
// MessageId: ERROR_PNP_QUERY_REMOVE_UNRELATED_DEVICE_TIMEOUT
//
// MessageText:
//
// The operation timed out waiting for this device to complete a PnP query-remove request due to a potential hang in the device stack of an unrelated device. The system may need to be rebooted to complete the operation.
//
static const int ERROR_PNP_QUERY_REMOVE_UNRELATED_DEVICE_TIMEOUT 482L

//
// MessageId: ERROR_DEVICE_HARDWARE_ERROR
//
// MessageText:
//
// The request failed due to a fatal device hardware error.
//
static const int ERROR_DEVICE_HARDWARE_ERROR      483L

//
// MessageId: ERROR_INVALID_ADDRESS
//
// MessageText:
//
// Attempt to access invalid address.
//
static const int ERROR_INVALID_ADDRESS            487L

//
// MessageId: ERROR_VRF_CFG_ENABLED
//
// MessageText:
//
// Driver Verifier Volatile settings cannot be set when CFG is enabled.
//
static const int ERROR_VRF_CFG_ENABLED            1183L

//
// MessageId: ERROR_PARTITION_TERMINATING
//
// MessageText:
//
// An attempt was made to access a partition that has begun termination.
//
static const int ERROR_PARTITION_TERMINATING      1184L

//
// **** Available SYSTEM error codes ****
//
//
// MessageId: ERROR_USER_PROFILE_LOAD
//
// MessageText:
//
// User profile cannot be loaded.
//
static const int ERROR_USER_PROFILE_LOAD          500L

//
// **** Available SYSTEM error codes ****
//
//
// MessageId: ERROR_ARITHMETIC_OVERFLOW
//
// MessageText:
//
// Arithmetic result exceeded 32 bits.
//
static const int ERROR_ARITHMETIC_OVERFLOW        534L

//
// MessageId: ERROR_PIPE_CONNECTED
//
// MessageText:
//
// There is a process on other end of the pipe.
//
static const int ERROR_PIPE_CONNECTED             535L

//
// MessageId: ERROR_PIPE_LISTENING
//
// MessageText:
//
// Waiting for a process to open the other end of the pipe.
//
static const int ERROR_PIPE_LISTENING             536L

//
// MessageId: ERROR_VERIFIER_STOP
//
// MessageText:
//
// Application verifier has found an error in the current process.
//
static const int ERROR_VERIFIER_STOP              537L

//
// MessageId: ERROR_ABIOS_ERROR
//
// MessageText:
//
// An error occurred in the ABIOS subsystem.
//
static const int ERROR_ABIOS_ERROR                538L

//
// MessageId: ERROR_WX86_WARNING
//
// MessageText:
//
// A warning occurred in the WX86 subsystem.
//
static const int ERROR_WX86_WARNING               539L

//
// MessageId: ERROR_WX86_ERROR
//
// MessageText:
//
// An error occurred in the WX86 subsystem.
//
static const int ERROR_WX86_ERROR                 540L

//
// MessageId: ERROR_TIMER_NOT_CANCELED
//
// MessageText:
//
// An attempt was made to cancel or set a timer that has an associated APC and the subject thread is not the thread that originally set the timer with an associated APC routine.
//
static const int ERROR_TIMER_NOT_CANCELED         541L

//
// MessageId: ERROR_UNWIND
//
// MessageText:
//
// Unwind exception code.
//
static const int ERROR_UNWIND                     542L

//
// MessageId: ERROR_BAD_STACK
//
// MessageText:
//
// An invalid or unaligned stack was encountered during an unwind operation.
//
static const int ERROR_BAD_STACK                  543L

//
// MessageId: ERROR_INVALID_UNWIND_TARGET
//
// MessageText:
//
// An invalid unwind target was encountered during an unwind operation.
//
static const int ERROR_INVALID_UNWIND_TARGET      544L

//
// MessageId: ERROR_INVALID_PORT_ATTRIBUTES
//
// MessageText:
//
// Invalid Object Attributes specified to NtCreatePort or invalid Port Attributes specified to NtConnectPort
//
static const int ERROR_INVALID_PORT_ATTRIBUTES    545L

//
// MessageId: ERROR_PORT_MESSAGE_TOO_LONG
//
// MessageText:
//
// Length of message passed to NtRequestPort or NtRequestWaitReplyPort was longer than the maximum message allowed by the port.
//
static const int ERROR_PORT_MESSAGE_TOO_LONG      546L

//
// MessageId: ERROR_INVALID_QUOTA_LOWER
//
// MessageText:
//
// An attempt was made to lower a quota limit below the current usage.
//
static const int ERROR_INVALID_QUOTA_LOWER        547L

//
// MessageId: ERROR_DEVICE_ALREADY_ATTACHED
//
// MessageText:
//
// An attempt was made to attach to a device that was already attached to another device.
//
static const int ERROR_DEVICE_ALREADY_ATTACHED    548L

//
// MessageId: ERROR_INSTRUCTION_MISALIGNMENT
//
// MessageText:
//
// An attempt was made to execute an instruction at an unaligned address and the host system does not support unaligned instruction references.
//
static const int ERROR_INSTRUCTION_MISALIGNMENT   549L

//
// MessageId: ERROR_PROFILING_NOT_STARTED
//
// MessageText:
//
// Profiling not started.
//
static const int ERROR_PROFILING_NOT_STARTED      550L

//
// MessageId: ERROR_PROFILING_NOT_STOPPED
//
// MessageText:
//
// Profiling not stopped.
//
static const int ERROR_PROFILING_NOT_STOPPED      551L

//
// MessageId: ERROR_COULD_NOT_INTERPRET
//
// MessageText:
//
// The passed ACL did not contain the minimum required information.
//
static const int ERROR_COULD_NOT_INTERPRET        552L

//
// MessageId: ERROR_PROFILING_AT_LIMIT
//
// MessageText:
//
// The number of active profiling objects is at the maximum and no more may be started.
//
static const int ERROR_PROFILING_AT_LIMIT         553L

//
// MessageId: ERROR_CANT_WAIT
//
// MessageText:
//
// Used to indicate that an operation cannot continue without blocking for I/O.
//
static const int ERROR_CANT_WAIT                  554L

//
// MessageId: ERROR_CANT_TERMINATE_SELF
//
// MessageText:
//
// Indicates that a thread attempted to terminate itself by default (called NtTerminateThread with NULL) and it was the last thread in the current process.
//
static const int ERROR_CANT_TERMINATE_SELF        555L

//
// MessageId: ERROR_UNEXPECTED_MM_CREATE_ERR
//
// MessageText:
//
// If an MM error is returned which is not defined in the standard FsRtl filter, it is converted to one of the following errors which is guaranteed to be in the filter.
// In this case information is lost, however, the filter correctly handles the exception.
//
static const int ERROR_UNEXPECTED_MM_CREATE_ERR   556L

//
// MessageId: ERROR_UNEXPECTED_MM_MAP_ERROR
//
// MessageText:
//
// If an MM error is returned which is not defined in the standard FsRtl filter, it is converted to one of the following errors which is guaranteed to be in the filter.
// In this case information is lost, however, the filter correctly handles the exception.
//
static const int ERROR_UNEXPECTED_MM_MAP_ERROR    557L

//
// MessageId: ERROR_UNEXPECTED_MM_EXTEND_ERR
//
// MessageText:
//
// If an MM error is returned which is not defined in the standard FsRtl filter, it is converted to one of the following errors which is guaranteed to be in the filter.
// In this case information is lost, however, the filter correctly handles the exception.
//
static const int ERROR_UNEXPECTED_MM_EXTEND_ERR   558L

//
// MessageId: ERROR_BAD_FUNCTION_TABLE
//
// MessageText:
//
// A malformed function table was encountered during an unwind operation.
//
static const int ERROR_BAD_FUNCTION_TABLE         559L

//
// MessageId: ERROR_NO_GUID_TRANSLATION
//
// MessageText:
//
// Indicates that an attempt was made to assign protection to a file system file or directory and one of the SIDs in the security descriptor could not be translated into a GUID that could be stored by the file system.
// This causes the protection attempt to fail, which may cause a file creation attempt to fail.
//
static const int ERROR_NO_GUID_TRANSLATION        560L

//
// MessageId: ERROR_INVALID_LDT_SIZE
//
// MessageText:
//
// Indicates that an attempt was made to grow an LDT by setting its size, or that the size was not an even number of selectors.
//
static const int ERROR_INVALID_LDT_SIZE           561L

//
// MessageId: ERROR_INVALID_LDT_OFFSET
//
// MessageText:
//
// Indicates that the starting value for the LDT information was not an integral multiple of the selector size.
//
static const int ERROR_INVALID_LDT_OFFSET         563L

//
// MessageId: ERROR_INVALID_LDT_DESCRIPTOR
//
// MessageText:
//
// Indicates that the user supplied an invalid descriptor when trying to set up Ldt descriptors.
//
static const int ERROR_INVALID_LDT_DESCRIPTOR     564L

//
// MessageId: ERROR_TOO_MANY_THREADS
//
// MessageText:
//
// Indicates a process has too many threads to perform the requested action. For example, assignment of a primary token may only be performed when a process has zero or one threads.
//
static const int ERROR_TOO_MANY_THREADS           565L

//
// MessageId: ERROR_THREAD_NOT_IN_PROCESS
//
// MessageText:
//
// An attempt was made to operate on a thread within a specific process, but the thread specified is not in the process specified.
//
static const int ERROR_THREAD_NOT_IN_PROCESS      566L

//
// MessageId: ERROR_PAGEFILE_QUOTA_EXCEEDED
//
// MessageText:
//
// Page file quota was exceeded.
//
static const int ERROR_PAGEFILE_QUOTA_EXCEEDED    567L

//
// MessageId: ERROR_LOGON_SERVER_CONFLICT
//
// MessageText:
//
// The Netlogon service cannot start because another Netlogon service running in the domain conflicts with the specified role.
//
static const int ERROR_LOGON_SERVER_CONFLICT      568L

//
// MessageId: ERROR_SYNCHRONIZATION_REQUIRED
//
// MessageText:
//
// The SAM database on a Windows Server is significantly out of synchronization with the copy on the Domain Controller. A complete synchronization is required.
//
static const int ERROR_SYNCHRONIZATION_REQUIRED   569L

//
// MessageId: ERROR_NET_OPEN_FAILED
//
// MessageText:
//
// The NtCreateFile API failed. This error should never be returned to an application, it is a place holder for the Windows Lan Manager Redirector to use in its internal error mapping routines.
//
static const int ERROR_NET_OPEN_FAILED            570L

//
// MessageId: ERROR_IO_PRIVILEGE_FAILED
//
// MessageText:
//
// {Privilege Failed}
// The I/O permissions for the process could not be changed.
//
static const int ERROR_IO_PRIVILEGE_FAILED        571L

//
// MessageId: ERROR_CONTROL_C_EXIT
//
// MessageText:
//
// {Application Exit by CTRL+C}
// The application terminated as a result of a CTRL+C.
//
static const int ERROR_CONTROL_C_EXIT             572L    // winnt

//
// MessageId: ERROR_MISSING_SYSTEMFILE
//
// MessageText:
//
// {Missing System File}
// The required system file %hs is bad or missing.
//
static const int ERROR_MISSING_SYSTEMFILE         573L

//
// MessageId: ERROR_UNHANDLED_EXCEPTION
//
// MessageText:
//
// {Application Error}
// The exception %s (0x%08lx) occurred in the application at location 0x%08lx.
//
static const int ERROR_UNHANDLED_EXCEPTION        574L

//
// MessageId: ERROR_APP_INIT_FAILURE
//
// MessageText:
//
// {Application Error}
// The application was unable to start correctly (0x%lx). Click OK to close the application.
//
static const int ERROR_APP_INIT_FAILURE           575L

//
// MessageId: ERROR_PAGEFILE_CREATE_FAILED
//
// MessageText:
//
// {Unable to Create Paging File}
// The creation of the paging file %hs failed (%lx). The requested size was %ld.
//
static const int ERROR_PAGEFILE_CREATE_FAILED     576L

//
// MessageId: ERROR_INVALID_IMAGE_HASH
//
// MessageText:
//
// Windows cannot verify the digital signature for this file. A recent hardware or software change might have installed a file that is signed incorrectly or damaged, or that might be malicious software from an unknown source.
//
static const int ERROR_INVALID_IMAGE_HASH         577L

//
// MessageId: ERROR_NO_PAGEFILE
//
// MessageText:
//
// {No Paging File Specified}
// No paging file was specified in the system configuration.
//
static const int ERROR_NO_PAGEFILE                578L

//
// MessageId: ERROR_ILLEGAL_FLOAT_CONTEXT
//
// MessageText:
//
// {EXCEPTION}
// A real-mode application issued a floating-point instruction and floating-point hardware is not present.
//
static const int ERROR_ILLEGAL_FLOAT_CONTEXT      579L

//
// MessageId: ERROR_NO_EVENT_PAIR
//
// MessageText:
//
// An event pair synchronization operation was performed using the thread specific client/server event pair object, but no event pair object was associated with the thread.
//
static const int ERROR_NO_EVENT_PAIR              580L

//
// MessageId: ERROR_DOMAIN_CTRLR_CONFIG_ERROR
//
// MessageText:
//
// A Windows Server has an incorrect configuration.
//
static const int ERROR_DOMAIN_CTRLR_CONFIG_ERROR  581L

//
// MessageId: ERROR_ILLEGAL_CHARACTER
//
// MessageText:
//
// An illegal character was encountered. For a multi-byte character set this includes a lead byte without a succeeding trail byte. For the Unicode character set this includes the characters 0xFFFF and 0xFFFE.
//
static const int ERROR_ILLEGAL_CHARACTER          582L

//
// MessageId: ERROR_UNDEFINED_CHARACTER
//
// MessageText:
//
// The Unicode character is not defined in the Unicode character set installed on the system.
//
static const int ERROR_UNDEFINED_CHARACTER        583L

//
// MessageId: ERROR_FLOPPY_VOLUME
//
// MessageText:
//
// The paging file cannot be created on a floppy diskette.
//
static const int ERROR_FLOPPY_VOLUME              584L

//
// MessageId: ERROR_BIOS_FAILED_TO_CONNECT_INTERRUPT
//
// MessageText:
//
// The system BIOS failed to connect a system interrupt to the device or bus for which the device is connected.
//
static const int ERROR_BIOS_FAILED_TO_CONNECT_INTERRUPT 585L

//
// MessageId: ERROR_BACKUP_CONTROLLER
//
// MessageText:
//
// This operation is only allowed for the Primary Domain Controller of the domain.
//
static const int ERROR_BACKUP_CONTROLLER          586L

//
// MessageId: ERROR_MUTANT_LIMIT_EXCEEDED
//
// MessageText:
//
// An attempt was made to acquire a mutant such that its maximum count would have been exceeded.
//
static const int ERROR_MUTANT_LIMIT_EXCEEDED      587L

//
// MessageId: ERROR_FS_DRIVER_REQUIRED
//
// MessageText:
//
// A volume has been accessed for which a file system driver is required that has not yet been loaded.
//
static const int ERROR_FS_DRIVER_REQUIRED         588L

//
// MessageId: ERROR_CANNOT_LOAD_REGISTRY_FILE
//
// MessageText:
//
// {Registry File Failure}
// The registry cannot load the hive (file):
// %hs
// or its log or alternate.
// It is corrupt, absent, or not writable.
//
static const int ERROR_CANNOT_LOAD_REGISTRY_FILE  589L

//
// MessageId: ERROR_DEBUG_ATTACH_FAILED
//
// MessageText:
//
// {Unexpected Failure in DebugActiveProcess}
// An unexpected failure occurred while processing a DebugActiveProcess API request. You may choose OK to terminate the process, or Cancel to ignore the error.
//
static const int ERROR_DEBUG_ATTACH_FAILED        590L

//
// MessageId: ERROR_SYSTEM_PROCESS_TERMINATED
//
// MessageText:
//
// {Fatal System Error}
// The %hs system process terminated unexpectedly with a status of 0x%08x (0x%08x 0x%08x).
// The system has been shut down.
//
static const int ERROR_SYSTEM_PROCESS_TERMINATED  591L

//
// MessageId: ERROR_DATA_NOT_ACCEPTED
//
// MessageText:
//
// {Data Not Accepted}
// The TDI client could not handle the data received during an indication.
//
static const int ERROR_DATA_NOT_ACCEPTED          592L

//
// MessageId: ERROR_VDM_HARD_ERROR
//
// MessageText:
//
// NTVDM encountered a hard error.
//
static const int ERROR_VDM_HARD_ERROR             593L

//
// MessageId: ERROR_DRIVER_CANCEL_TIMEOUT
//
// MessageText:
//
// {Cancel Timeout}
// The driver %hs failed to complete a cancelled I/O request in the allotted time.
//
static const int ERROR_DRIVER_CANCEL_TIMEOUT      594L

//
// MessageId: ERROR_REPLY_MESSAGE_MISMATCH
//
// MessageText:
//
// {Reply Message Mismatch}
// An attempt was made to reply to an LPC message, but the thread specified by the client ID in the message was not waiting on that message.
//
static const int ERROR_REPLY_MESSAGE_MISMATCH     595L

//
// MessageId: ERROR_LOST_WRITEBEHIND_DATA
//
// MessageText:
//
// {Delayed Write Failed}
// Windows was unable to save all the data for the file %hs. The data has been lost.
// This error may be caused by a failure of your computer hardware or network connection. Please try to save this file elsewhere.
//
static const int ERROR_LOST_WRITEBEHIND_DATA      596L

//
// MessageId: ERROR_CLIENT_SERVER_PARAMETERS_INVALID
//
// MessageText:
//
// The parameter(s) passed to the server in the client/server shared memory window were invalid. Too much data may have been put in the shared memory window.
//
static const int ERROR_CLIENT_SERVER_PARAMETERS_INVALID 597L

//
// MessageId: ERROR_NOT_TINY_STREAM
//
// MessageText:
//
// The stream is not a tiny stream.
//
static const int ERROR_NOT_TINY_STREAM            598L

//
// MessageId: ERROR_STACK_OVERFLOW_READ
//
// MessageText:
//
// The request must be handled by the stack overflow code.
//
static const int ERROR_STACK_OVERFLOW_READ        599L

//
// MessageId: ERROR_CONVERT_TO_LARGE
//
// MessageText:
//
// Internal OFS status codes indicating how an allocation operation is handled. Either it is retried after the containing onode is moved or the extent stream is converted to a large stream.
//
static const int ERROR_CONVERT_TO_LARGE           600L

//
// MessageId: ERROR_FOUND_OUT_OF_SCOPE
//
// MessageText:
//
// The attempt to find the object found an object matching by ID on the volume but it is out of the scope of the handle used for the operation.
//
static const int ERROR_FOUND_OUT_OF_SCOPE         601L

//
// MessageId: ERROR_ALLOCATE_BUCKET
//
// MessageText:
//
// The bucket array must be grown. Retry transaction after doing so.
//
static const int ERROR_ALLOCATE_BUCKET            602L

//
// MessageId: ERROR_MARSHALL_OVERFLOW
//
// MessageText:
//
// The user/kernel marshalling buffer has overflowed.
//
static const int ERROR_MARSHALL_OVERFLOW          603L

//
// MessageId: ERROR_INVALID_VARIANT
//
// MessageText:
//
// The supplied variant structure contains invalid data.
//
static const int ERROR_INVALID_VARIANT            604L

//
// MessageId: ERROR_BAD_COMPRESSION_BUFFER
//
// MessageText:
//
// The specified buffer contains ill-formed data.
//
static const int ERROR_BAD_COMPRESSION_BUFFER     605L

//
// MessageId: ERROR_AUDIT_FAILED
//
// MessageText:
//
// {Audit Failed}
// An attempt to generate a security audit failed.
//
static const int ERROR_AUDIT_FAILED               606L

//
// MessageId: ERROR_TIMER_RESOLUTION_NOT_SET
//
// MessageText:
//
// The timer resolution was not previously set by the current process.
//
static const int ERROR_TIMER_RESOLUTION_NOT_SET   607L

//
// MessageId: ERROR_INSUFFICIENT_LOGON_INFO
//
// MessageText:
//
// There is insufficient account information to log you on.
//
static const int ERROR_INSUFFICIENT_LOGON_INFO    608L

//
// MessageId: ERROR_BAD_DLL_ENTRYPOINT
//
// MessageText:
//
// {Invalid DLL Entrypoint}
// The dynamic link library %hs is not written correctly. The stack pointer has been left in an inconsistent state.
// The entrypoint should be declared as WINAPI or STDCALL. Select YES to fail the DLL load. Select NO to continue execution. Selecting NO may cause the application to operate incorrectly.
//
static const int ERROR_BAD_DLL_ENTRYPOINT         609L

//
// MessageId: ERROR_BAD_SERVICE_ENTRYPOINT
//
// MessageText:
//
// {Invalid Service Callback Entrypoint}
// The %hs service is not written correctly. The stack pointer has been left in an inconsistent state.
// The callback entrypoint should be declared as WINAPI or STDCALL. Selecting OK will cause the service to continue operation. However, the service process may operate incorrectly.
//
static const int ERROR_BAD_SERVICE_ENTRYPOINT     610L

//
// MessageId: ERROR_IP_ADDRESS_CONFLICT1
//
// MessageText:
//
// There is an IP address conflict with another system on the network
//
static const int ERROR_IP_ADDRESS_CONFLICT1       611L

//
// MessageId: ERROR_IP_ADDRESS_CONFLICT2
//
// MessageText:
//
// There is an IP address conflict with another system on the network
//
static const int ERROR_IP_ADDRESS_CONFLICT2       612L

//
// MessageId: ERROR_REGISTRY_QUOTA_LIMIT
//
// MessageText:
//
// {Low On Registry Space}
// The system has reached the maximum size allowed for the system part of the registry. Additional storage requests will be ignored.
//
static const int ERROR_REGISTRY_QUOTA_LIMIT       613L

//
// MessageId: ERROR_NO_CALLBACK_ACTIVE
//
// MessageText:
//
// A callback return system service cannot be executed when no callback is active.
//
static const int ERROR_NO_CALLBACK_ACTIVE         614L

//
// MessageId: ERROR_PWD_TOO_SHORT
//
// MessageText:
//
// The password provided is too short to meet the policy of your user account.
// Please choose a longer password.
//
static const int ERROR_PWD_TOO_SHORT              615L

//
// MessageId: ERROR_PWD_TOO_RECENT
//
// MessageText:
//
// The policy of your user account does not allow you to change passwords too frequently.
// This is done to prevent users from changing back to a familiar, but potentially discovered, password.
// If you feel your password has been compromised then please contact your administrator immediately to have a new one assigned.
//
static const int ERROR_PWD_TOO_RECENT             616L

//
// MessageId: ERROR_PWD_HISTORY_CONFLICT
//
// MessageText:
//
// You have attempted to change your password to one that you have used in the past.
// The policy of your user account does not allow this. Please select a password that you have not previously used.
//
static const int ERROR_PWD_HISTORY_CONFLICT       617L

//
// MessageId: ERROR_UNSUPPORTED_COMPRESSION
//
// MessageText:
//
// The specified compression format is unsupported.
//
static const int ERROR_UNSUPPORTED_COMPRESSION    618L

//
// MessageId: ERROR_INVALID_HW_PROFILE
//
// MessageText:
//
// The specified hardware profile configuration is invalid.
//
static const int ERROR_INVALID_HW_PROFILE         619L

//
// MessageId: ERROR_INVALID_PLUGPLAY_DEVICE_PATH
//
// MessageText:
//
// The specified Plug and Play registry device path is invalid.
//
static const int ERROR_INVALID_PLUGPLAY_DEVICE_PATH 620L

//
// MessageId: ERROR_QUOTA_LIST_INCONSISTENT
//
// MessageText:
//
// The specified quota list is internally inconsistent with its descriptor.
//
static const int ERROR_QUOTA_LIST_INCONSISTENT    621L

//
// MessageId: ERROR_EVALUATION_EXPIRATION
//
// MessageText:
//
// {Windows Evaluation Notification}
// The evaluation period for this installation of Windows has expired. This system will shutdown in 1 hour. To restore access to this installation of Windows, please upgrade this installation using a licensed distribution of this product.
//
static const int ERROR_EVALUATION_EXPIRATION      622L

//
// MessageId: ERROR_ILLEGAL_DLL_RELOCATION
//
// MessageText:
//
// {Illegal System DLL Relocation}
// The system DLL %hs was relocated in memory. The application will not run properly.
// The relocation occurred because the DLL %hs occupied an address range reserved for Windows system DLLs. The vendor supplying the DLL should be contacted for a new DLL.
//
static const int ERROR_ILLEGAL_DLL_RELOCATION     623L

//
// MessageId: ERROR_DLL_INIT_FAILED_LOGOFF
//
// MessageText:
//
// {DLL Initialization Failed}
// The application failed to initialize because the window station is shutting down.
//
static const int ERROR_DLL_INIT_FAILED_LOGOFF     624L

//
// MessageId: ERROR_VALIDATE_CONTINUE
//
// MessageText:
//
// The validation process needs to continue on to the next step.
//
static const int ERROR_VALIDATE_CONTINUE          625L

//
// MessageId: ERROR_NO_MORE_MATCHES
//
// MessageText:
//
// There are no more matches for the current index enumeration.
//
static const int ERROR_NO_MORE_MATCHES            626L

//
// MessageId: ERROR_RANGE_LIST_CONFLICT
//
// MessageText:
//
// The range could not be added to the range list because of a conflict.
//
static const int ERROR_RANGE_LIST_CONFLICT        627L

//
// MessageId: ERROR_SERVER_SID_MISMATCH
//
// MessageText:
//
// The server process is running under a SID different than that required by client.
//
static const int ERROR_SERVER_SID_MISMATCH        628L

//
// MessageId: ERROR_CANT_ENABLE_DENY_ONLY
//
// MessageText:
//
// A group marked use for deny only cannot be enabled.
//
static const int ERROR_CANT_ENABLE_DENY_ONLY      629L

//
// MessageId: ERROR_FLOAT_MULTIPLE_FAULTS
//
// MessageText:
//
// {EXCEPTION}
// Multiple floating point faults.
//
static const int ERROR_FLOAT_MULTIPLE_FAULTS      630L    // winnt

//
// MessageId: ERROR_FLOAT_MULTIPLE_TRAPS
//
// MessageText:
//
// {EXCEPTION}
// Multiple floating point traps.
//
static const int ERROR_FLOAT_MULTIPLE_TRAPS       631L    // winnt

//
// MessageId: ERROR_NOINTERFACE
//
// MessageText:
//
// The requested interface is not supported.
//
static const int ERROR_NOINTERFACE                632L

//
// MessageId: ERROR_DRIVER_FAILED_SLEEP
//
// MessageText:
//
// {System Standby Failed}
// The driver %hs does not support standby mode. Updating this driver may allow the system to go to standby mode.
//
static const int ERROR_DRIVER_FAILED_SLEEP        633L

//
// MessageId: ERROR_CORRUPT_SYSTEM_FILE
//
// MessageText:
//
// The system file %1 has become corrupt and has been replaced.
//
static const int ERROR_CORRUPT_SYSTEM_FILE        634L

//
// MessageId: ERROR_COMMITMENT_MINIMUM
//
// MessageText:
//
// {Virtual Memory Minimum Too Low}
// Your system is low on virtual memory. Windows is increasing the size of your virtual memory paging file.
// During this process, memory requests for some applications may be denied. For more information, see Help.
//
static const int ERROR_COMMITMENT_MINIMUM         635L

//
// MessageId: ERROR_PNP_RESTART_ENUMERATION
//
// MessageText:
//
// A device was removed so enumeration must be restarted.
//
static const int ERROR_PNP_RESTART_ENUMERATION    636L

//
// MessageId: ERROR_SYSTEM_IMAGE_BAD_SIGNATURE
//
// MessageText:
//
// {Fatal System Error}
// The system image %s is not properly signed.
// The file has been replaced with the signed file.
// The system has been shut down.
//
static const int ERROR_SYSTEM_IMAGE_BAD_SIGNATURE 637L

//
// MessageId: ERROR_PNP_REBOOT_REQUIRED
//
// MessageText:
//
// Device will not start without a reboot.
//
static const int ERROR_PNP_REBOOT_REQUIRED        638L

//
// MessageId: ERROR_INSUFFICIENT_POWER
//
// MessageText:
//
// There is not enough power to complete the requested operation.
//
static const int ERROR_INSUFFICIENT_POWER         639L

//
// MessageId: ERROR_MULTIPLE_FAULT_VIOLATION
//
// MessageText:
//
//  ERROR_MULTIPLE_FAULT_VIOLATION
//
static const int ERROR_MULTIPLE_FAULT_VIOLATION   640L

//
// MessageId: ERROR_SYSTEM_SHUTDOWN
//
// MessageText:
//
// The system is in the process of shutting down.
//
static const int ERROR_SYSTEM_SHUTDOWN            641L

//
// MessageId: ERROR_PORT_NOT_SET
//
// MessageText:
//
// An attempt to remove a processes DebugPort was made, but a port was not already associated with the process.
//
static const int ERROR_PORT_NOT_SET               642L

//
// MessageId: ERROR_DS_VERSION_CHECK_FAILURE
//
// MessageText:
//
// This version of Windows is not compatible with the behavior version of directory forest, domain or domain controller.
//
static const int ERROR_DS_VERSION_CHECK_FAILURE   643L

//
// MessageId: ERROR_RANGE_NOT_FOUND
//
// MessageText:
//
// The specified range could not be found in the range list.
//
static const int ERROR_RANGE_NOT_FOUND            644L

//
// MessageId: ERROR_NOT_SAFE_MODE_DRIVER
//
// MessageText:
//
// The driver was not loaded because the system is booting into safe mode.
//
static const int ERROR_NOT_SAFE_MODE_DRIVER       646L

//
// MessageId: ERROR_FAILED_DRIVER_ENTRY
//
// MessageText:
//
// The driver was not loaded because it failed its initialization call.
//
static const int ERROR_FAILED_DRIVER_ENTRY        647L

//
// MessageId: ERROR_DEVICE_ENUMERATION_ERROR
//
// MessageText:
//
// The "%hs" encountered an error while applying power or reading the device configuration.
// This may be caused by a failure of your hardware or by a poor connection.
//
static const int ERROR_DEVICE_ENUMERATION_ERROR   648L

//
// MessageId: ERROR_MOUNT_POINT_NOT_RESOLVED
//
// MessageText:
//
// The create operation failed because the name contained at least one mount point which resolves to a volume to which the specified device object is not attached.
//
static const int ERROR_MOUNT_POINT_NOT_RESOLVED   649L

//
// MessageId: ERROR_INVALID_DEVICE_OBJECT_PARAMETER
//
// MessageText:
//
// The device object parameter is either not a valid device object or is not attached to the volume specified by the file name.
//
static const int ERROR_INVALID_DEVICE_OBJECT_PARAMETER 650L

//
// MessageId: ERROR_MCA_OCCURED
//
// MessageText:
//
// A Machine Check Error has occurred. Please check the system eventlog for additional information.
//
static const int ERROR_MCA_OCCURED                651L

//
// MessageId: ERROR_DRIVER_DATABASE_ERROR
//
// MessageText:
//
// There was error [%2] processing the driver database.
//
static const int ERROR_DRIVER_DATABASE_ERROR      652L

//
// MessageId: ERROR_SYSTEM_HIVE_TOO_LARGE
//
// MessageText:
//
// System hive size has exceeded its limit.
//
static const int ERROR_SYSTEM_HIVE_TOO_LARGE      653L

//
// MessageId: ERROR_DRIVER_FAILED_PRIOR_UNLOAD
//
// MessageText:
//
// The driver could not be loaded because a previous version of the driver is still in memory.
//
static const int ERROR_DRIVER_FAILED_PRIOR_UNLOAD 654L

//
// MessageId: ERROR_VOLSNAP_PREPARE_HIBERNATE
//
// MessageText:
//
// {Volume Shadow Copy Service}
// Please wait while the Volume Shadow Copy Service prepares volume %hs for hibernation.
//
static const int ERROR_VOLSNAP_PREPARE_HIBERNATE  655L

//
// MessageId: ERROR_HIBERNATION_FAILURE
//
// MessageText:
//
// The system has failed to hibernate (The error code is %hs). Hibernation will be disabled until the system is restarted.
//
static const int ERROR_HIBERNATION_FAILURE        656L

//
// MessageId: ERROR_PWD_TOO_LONG
//
// MessageText:
//
// The password provided is too long to meet the policy of your user account.
// Please choose a shorter password.
//
static const int ERROR_PWD_TOO_LONG               657L

//
// MessageId: ERROR_FILE_SYSTEM_LIMITATION
//
// MessageText:
//
// The requested operation could not be completed due to a file system limitation
//
static const int ERROR_FILE_SYSTEM_LIMITATION     665L

//
// MessageId: ERROR_ASSERTION_FAILURE
//
// MessageText:
//
// An assertion failure has occurred.
//
static const int ERROR_ASSERTION_FAILURE          668L

//
// MessageId: ERROR_ACPI_ERROR
//
// MessageText:
//
// An error occurred in the ACPI subsystem.
//
static const int ERROR_ACPI_ERROR                 669L

//
// MessageId: ERROR_WOW_ASSERTION
//
// MessageText:
//
// WOW Assertion Error.
//
static const int ERROR_WOW_ASSERTION              670L

//
// MessageId: ERROR_PNP_BAD_MPS_TABLE
//
// MessageText:
//
// A device is missing in the system BIOS MPS table. This device will not be used.
// Please contact your system vendor for system BIOS update.
//
static const int ERROR_PNP_BAD_MPS_TABLE          671L

//
// MessageId: ERROR_PNP_TRANSLATION_FAILED
//
// MessageText:
//
// A translator failed to translate resources.
//
static const int ERROR_PNP_TRANSLATION_FAILED     672L

//
// MessageId: ERROR_PNP_IRQ_TRANSLATION_FAILED
//
// MessageText:
//
// A IRQ translator failed to translate resources.
//
static const int ERROR_PNP_IRQ_TRANSLATION_FAILED 673L

//
// MessageId: ERROR_PNP_INVALID_ID
//
// MessageText:
//
// Driver %2 returned invalid ID for a child device (%3).
//
static const int ERROR_PNP_INVALID_ID             674L

//
// MessageId: ERROR_WAKE_SYSTEM_DEBUGGER
//
// MessageText:
//
// {Kernel Debugger Awakened}
// the system debugger was awakened by an interrupt.
//
static const int ERROR_WAKE_SYSTEM_DEBUGGER       675L

//
// MessageId: ERROR_HANDLES_CLOSED
//
// MessageText:
//
// {Handles Closed}
// Handles to objects have been automatically closed as a result of the requested operation.
//
static const int ERROR_HANDLES_CLOSED             676L

//
// MessageId: ERROR_EXTRANEOUS_INFORMATION
//
// MessageText:
//
// {Too Much Information}
// The specified access control list (ACL) contained more information than was expected.
//
static const int ERROR_EXTRANEOUS_INFORMATION     677L

//
// MessageId: ERROR_RXACT_COMMIT_NECESSARY
//
// MessageText:
//
// This warning level status indicates that the transaction state already exists for the registry sub-tree, but that a transaction commit was previously aborted.
// The commit has NOT been completed, but has not been rolled back either (so it may still be committed if desired).
//
static const int ERROR_RXACT_COMMIT_NECESSARY     678L

//
// MessageId: ERROR_MEDIA_CHECK
//
// MessageText:
//
// {Media Changed}
// The media may have changed.
//
static const int ERROR_MEDIA_CHECK                679L

//
// MessageId: ERROR_GUID_SUBSTITUTION_MADE
//
// MessageText:
//
// {GUID Substitution}
// During the translation of a global identifier (GUID) to a Windows security ID (SID), no administratively-defined GUID prefix was found.
// A substitute prefix was used, which will not compromise system security. However, this may provide a more restrictive access than intended.
//
static const int ERROR_GUID_SUBSTITUTION_MADE     680L

//
// MessageId: ERROR_STOPPED_ON_SYMLINK
//
// MessageText:
//
// The create operation stopped after reaching a symbolic link
//
static const int ERROR_STOPPED_ON_SYMLINK         681L

//
// MessageId: ERROR_LONGJUMP
//
// MessageText:
//
// A long jump has been executed.
//
static const int ERROR_LONGJUMP                   682L

//
// MessageId: ERROR_PLUGPLAY_QUERY_VETOED
//
// MessageText:
//
// The Plug and Play query operation was not successful.
//
static const int ERROR_PLUGPLAY_QUERY_VETOED      683L

//
// MessageId: ERROR_UNWIND_CONSOLIDATE
//
// MessageText:
//
// A frame consolidation has been executed.
//
static const int ERROR_UNWIND_CONSOLIDATE         684L

//
// MessageId: ERROR_REGISTRY_HIVE_RECOVERED
//
// MessageText:
//
// {Registry Hive Recovered}
// Registry hive (file):
// %hs
// was corrupted and it has been recovered. Some data might have been lost.
//
static const int ERROR_REGISTRY_HIVE_RECOVERED    685L

//
// MessageId: ERROR_DLL_MIGHT_BE_INSECURE
//
// MessageText:
//
// The application is attempting to run executable code from the module %hs. This may be insecure. An alternative, %hs, is available. Should the application use the secure module %hs?
//
static const int ERROR_DLL_MIGHT_BE_INSECURE      686L

//
// MessageId: ERROR_DLL_MIGHT_BE_INCOMPATIBLE
//
// MessageText:
//
// The application is loading executable code from the module %hs. This is secure, but may be incompatible with previous releases of the operating system. An alternative, %hs, is available. Should the application use the secure module %hs?
//
static const int ERROR_DLL_MIGHT_BE_INCOMPATIBLE  687L

//
// MessageId: ERROR_DBG_EXCEPTION_NOT_HANDLED
//
// MessageText:
//
// Debugger did not handle the exception.
//
static const int ERROR_DBG_EXCEPTION_NOT_HANDLED  688L    // winnt

//
// MessageId: ERROR_DBG_REPLY_LATER
//
// MessageText:
//
// Debugger will reply later.
//
static const int ERROR_DBG_REPLY_LATER            689L

//
// MessageId: ERROR_DBG_UNABLE_TO_PROVIDE_HANDLE
//
// MessageText:
//
// Debugger cannot provide handle.
//
static const int ERROR_DBG_UNABLE_TO_PROVIDE_HANDLE 690L

//
// MessageId: ERROR_DBG_TERMINATE_THREAD
//
// MessageText:
//
// Debugger terminated thread.
//
static const int ERROR_DBG_TERMINATE_THREAD       691L    // winnt

//
// MessageId: ERROR_DBG_TERMINATE_PROCESS
//
// MessageText:
//
// Debugger terminated process.
//
static const int ERROR_DBG_TERMINATE_PROCESS      692L    // winnt

//
// MessageId: ERROR_DBG_CONTROL_C
//
// MessageText:
//
// Debugger got control C.
//
static const int ERROR_DBG_CONTROL_C              693L    // winnt

//
// MessageId: ERROR_DBG_PRINTEXCEPTION_C
//
// MessageText:
//
// Debugger printed exception on control C.
//
static const int ERROR_DBG_PRINTEXCEPTION_C       694L

//
// MessageId: ERROR_DBG_RIPEXCEPTION
//
// MessageText:
//
// Debugger received RIP exception.
//
static const int ERROR_DBG_RIPEXCEPTION           695L

//
// MessageId: ERROR_DBG_CONTROL_BREAK
//
// MessageText:
//
// Debugger received control break.
//
static const int ERROR_DBG_CONTROL_BREAK          696L    // winnt

//
// MessageId: ERROR_DBG_COMMAND_EXCEPTION
//
// MessageText:
//
// Debugger command communication exception.
//
static const int ERROR_DBG_COMMAND_EXCEPTION      697L    // winnt

//
// MessageId: ERROR_OBJECT_NAME_EXISTS
//
// MessageText:
//
// {Object Exists}
// An attempt was made to create an object and the object name already existed.
//
static const int ERROR_OBJECT_NAME_EXISTS         698L

//
// MessageId: ERROR_THREAD_WAS_SUSPENDED
//
// MessageText:
//
// {Thread Suspended}
// A thread termination occurred while the thread was suspended. The thread was resumed, and termination proceeded.
//
static const int ERROR_THREAD_WAS_SUSPENDED       699L

//
// MessageId: ERROR_IMAGE_NOT_AT_BASE
//
// MessageText:
//
// {Image Relocated}
// An image file could not be mapped at the address specified in the image file. Local fixups must be performed on this image.
//
static const int ERROR_IMAGE_NOT_AT_BASE          700L

//
// MessageId: ERROR_RXACT_STATE_CREATED
//
// MessageText:
//
// This informational level status indicates that a specified registry sub-tree transaction state did not yet exist and had to be created.
//
static const int ERROR_RXACT_STATE_CREATED        701L

//
// MessageId: ERROR_SEGMENT_NOTIFICATION
//
// MessageText:
//
// {Segment Load}
// A virtual DOS machine (VDM) is loading, unloading, or moving an MS-DOS or Win16 program segment image.
// An exception is raised so a debugger can load, unload or track symbols and breakpoints within these 16-bit segments.
//
static const int ERROR_SEGMENT_NOTIFICATION       702L    // winnt

//
// MessageId: ERROR_BAD_CURRENT_DIRECTORY
//
// MessageText:
//
// {Invalid Current Directory}
// The process cannot switch to the startup current directory %hs.
// Select OK to set current directory to %hs, or select CANCEL to exit.
//
static const int ERROR_BAD_CURRENT_DIRECTORY      703L

//
// MessageId: ERROR_FT_READ_RECOVERY_FROM_BACKUP
//
// MessageText:
//
// {Redundant Read}
// To satisfy a read request, the NT fault-tolerant file system successfully read the requested data from a redundant copy.
// This was done because the file system encountered a failure on a member of the fault-tolerant volume, but was unable to reassign the failing area of the device.
//
static const int ERROR_FT_READ_RECOVERY_FROM_BACKUP 704L

//
// MessageId: ERROR_FT_WRITE_RECOVERY
//
// MessageText:
//
// {Redundant Write}
// To satisfy a write request, the NT fault-tolerant file system successfully wrote a redundant copy of the information.
// This was done because the file system encountered a failure on a member of the fault-tolerant volume, but was not able to reassign the failing area of the device.
//
static const int ERROR_FT_WRITE_RECOVERY          705L

//
// MessageId: ERROR_IMAGE_MACHINE_TYPE_MISMATCH
//
// MessageText:
//
// {Machine Type Mismatch}
// The image file %hs is valid, but is for a machine type other than the current machine. Select OK to continue, or CANCEL to fail the DLL load.
//
static const int ERROR_IMAGE_MACHINE_TYPE_MISMATCH 706L

//
// MessageId: ERROR_RECEIVE_PARTIAL
//
// MessageText:
//
// {Partial Data Received}
// The network transport returned partial data to its client. The remaining data will be sent later.
//
static const int ERROR_RECEIVE_PARTIAL            707L

//
// MessageId: ERROR_RECEIVE_EXPEDITED
//
// MessageText:
//
// {Expedited Data Received}
// The network transport returned data to its client that was marked as expedited by the remote system.
//
static const int ERROR_RECEIVE_EXPEDITED          708L

//
// MessageId: ERROR_RECEIVE_PARTIAL_EXPEDITED
//
// MessageText:
//
// {Partial Expedited Data Received}
// The network transport returned partial data to its client and this data was marked as expedited by the remote system. The remaining data will be sent later.
//
static const int ERROR_RECEIVE_PARTIAL_EXPEDITED  709L

//
// MessageId: ERROR_EVENT_DONE
//
// MessageText:
//
// {TDI Event Done}
// The TDI indication has completed successfully.
//
static const int ERROR_EVENT_DONE                 710L

//
// MessageId: ERROR_EVENT_PENDING
//
// MessageText:
//
// {TDI Event Pending}
// The TDI indication has entered the pending state.
//
static const int ERROR_EVENT_PENDING              711L

//
// MessageId: ERROR_CHECKING_FILE_SYSTEM
//
// MessageText:
//
// Checking file system on %wZ
//
static const int ERROR_CHECKING_FILE_SYSTEM       712L

//
// MessageId: ERROR_FATAL_APP_EXIT
//
// MessageText:
//
// {Fatal Application Exit}
// %hs
//
static const int ERROR_FATAL_APP_EXIT             713L

//
// MessageId: ERROR_PREDEFINED_HANDLE
//
// MessageText:
//
// The specified registry key is referenced by a predefined handle.
//
static const int ERROR_PREDEFINED_HANDLE          714L

//
// MessageId: ERROR_WAS_UNLOCKED
//
// MessageText:
//
// {Page Unlocked}
// The page protection of a locked page was changed to 'No Access' and the page was unlocked from memory and from the process.
//
static const int ERROR_WAS_UNLOCKED               715L

//
// MessageId: ERROR_SERVICE_NOTIFICATION
//
// MessageText:
//
// %hs
//
static const int ERROR_SERVICE_NOTIFICATION       716L

//
// MessageId: ERROR_WAS_LOCKED
//
// MessageText:
//
// {Page Locked}
// One of the pages to lock was already locked.
//
static const int ERROR_WAS_LOCKED                 717L

//
// MessageId: ERROR_LOG_HARD_ERROR
//
// MessageText:
//
// Application popup: %1 : %2
//
static const int ERROR_LOG_HARD_ERROR             718L

//
// MessageId: ERROR_ALREADY_WIN32
//
// MessageText:
//
//  ERROR_ALREADY_WIN32
//
static const int ERROR_ALREADY_WIN32              719L

//
// MessageId: ERROR_IMAGE_MACHINE_TYPE_MISMATCH_EXE
//
// MessageText:
//
// {Machine Type Mismatch}
// The image file %hs is valid, but is for a machine type other than the current machine.
//
static const int ERROR_IMAGE_MACHINE_TYPE_MISMATCH_EXE 720L

//
// MessageId: ERROR_NO_YIELD_PERFORMED
//
// MessageText:
//
// A yield execution was performed and no thread was available to run.
//
static const int ERROR_NO_YIELD_PERFORMED         721L

//
// MessageId: ERROR_TIMER_RESUME_IGNORED
//
// MessageText:
//
// The resumable flag to a timer API was ignored.
//
static const int ERROR_TIMER_RESUME_IGNORED       722L

//
// MessageId: ERROR_ARBITRATION_UNHANDLED
//
// MessageText:
//
// The arbiter has deferred arbitration of these resources to its parent
//
static const int ERROR_ARBITRATION_UNHANDLED      723L

//
// MessageId: ERROR_CARDBUS_NOT_SUPPORTED
//
// MessageText:
//
// The inserted CardBus device cannot be started because of a configuration error on "%hs".
//
static const int ERROR_CARDBUS_NOT_SUPPORTED      724L

//
// MessageId: ERROR_MP_PROCESSOR_MISMATCH
//
// MessageText:
//
// The CPUs in this multiprocessor system are not all the same revision level. To use all processors the operating system restricts itself to the features of the least capable processor in the system. Should problems occur with this system, contact the CPU manufacturer to see if this mix of processors is supported.
//
static const int ERROR_MP_PROCESSOR_MISMATCH      725L

//
// MessageId: ERROR_HIBERNATED
//
// MessageText:
//
// The system was put into hibernation.
//
static const int ERROR_HIBERNATED                 726L

//
// MessageId: ERROR_RESUME_HIBERNATION
//
// MessageText:
//
// The system was resumed from hibernation.
//
static const int ERROR_RESUME_HIBERNATION         727L

//
// MessageId: ERROR_FIRMWARE_UPDATED
//
// MessageText:
//
// Windows has detected that the system firmware (BIOS) was updated [previous firmware date = %2, current firmware date %3].
//
static const int ERROR_FIRMWARE_UPDATED           728L

//
// MessageId: ERROR_DRIVERS_LEAKING_LOCKED_PAGES
//
// MessageText:
//
// A device driver is leaking locked I/O pages causing system degradation. The system has automatically enabled tracking code in order to try and catch the culprit.
//
static const int ERROR_DRIVERS_LEAKING_LOCKED_PAGES 729L

//
// MessageId: ERROR_WAKE_SYSTEM
//
// MessageText:
//
// The system has awoken
//
static const int ERROR_WAKE_SYSTEM                730L

//
// MessageId: ERROR_WAIT_1
//
// MessageText:
//
//  ERROR_WAIT_1
//
static const int ERROR_WAIT_1                     731L

//
// MessageId: ERROR_WAIT_2
//
// MessageText:
//
//  ERROR_WAIT_2
//
static const int ERROR_WAIT_2                     732L

//
// MessageId: ERROR_WAIT_3
//
// MessageText:
//
//  ERROR_WAIT_3
//
static const int ERROR_WAIT_3                     733L

//
// MessageId: ERROR_WAIT_63
//
// MessageText:
//
//  ERROR_WAIT_63
//
static const int ERROR_WAIT_63                    734L

//
// MessageId: ERROR_ABANDONED_WAIT_0
//
// MessageText:
//
//  ERROR_ABANDONED_WAIT_0
//
static const int ERROR_ABANDONED_WAIT_0           735L    // winnt

//
// MessageId: ERROR_ABANDONED_WAIT_63
//
// MessageText:
//
//  ERROR_ABANDONED_WAIT_63
//
static const int ERROR_ABANDONED_WAIT_63          736L

//
// MessageId: ERROR_USER_APC
//
// MessageText:
//
//  ERROR_USER_APC
//
static const int ERROR_USER_APC                   737L    // winnt

//
// MessageId: ERROR_KERNEL_APC
//
// MessageText:
//
//  ERROR_KERNEL_APC
//
static const int ERROR_KERNEL_APC                 738L

//
// MessageId: ERROR_ALERTED
//
// MessageText:
//
//  ERROR_ALERTED
//
static const int ERROR_ALERTED                    739L

//
// MessageId: ERROR_ELEVATION_REQUIRED
//
// MessageText:
//
// The requested operation requires elevation.
//
static const int ERROR_ELEVATION_REQUIRED         740L

//
// MessageId: ERROR_REPARSE
//
// MessageText:
//
// A reparse should be performed by the Object Manager since the name of the file resulted in a symbolic link.
//
static const int ERROR_REPARSE                    741L

//
// MessageId: ERROR_OPLOCK_BREAK_IN_PROGRESS
//
// MessageText:
//
// An open/create operation completed while an oplock break is underway.
//
static const int ERROR_OPLOCK_BREAK_IN_PROGRESS   742L

//
// MessageId: ERROR_VOLUME_MOUNTED
//
// MessageText:
//
// A new volume has been mounted by a file system.
//
static const int ERROR_VOLUME_MOUNTED             743L

//
// MessageId: ERROR_RXACT_COMMITTED
//
// MessageText:
//
// This success level status indicates that the transaction state already exists for the registry sub-tree, but that a transaction commit was previously aborted.
// The commit has now been completed.
//
static const int ERROR_RXACT_COMMITTED            744L

//
// MessageId: ERROR_NOTIFY_CLEANUP
//
// MessageText:
//
// This indicates that a notify change request has been completed due to closing the handle which made the notify change request.
//
static const int ERROR_NOTIFY_CLEANUP             745L

//
// MessageId: ERROR_PRIMARY_TRANSPORT_CONNECT_FAILED
//
// MessageText:
//
// {Connect Failure on Primary Transport}
// An attempt was made to connect to the remote server %hs on the primary transport, but the connection failed.
// The computer WAS able to connect on a secondary transport.
//
static const int ERROR_PRIMARY_TRANSPORT_CONNECT_FAILED 746L

//
// MessageId: ERROR_PAGE_FAULT_TRANSITION
//
// MessageText:
//
// Page fault was a transition fault.
//
static const int ERROR_PAGE_FAULT_TRANSITION      747L

//
// MessageId: ERROR_PAGE_FAULT_DEMAND_ZERO
//
// MessageText:
//
// Page fault was a demand zero fault.
//
static const int ERROR_PAGE_FAULT_DEMAND_ZERO     748L

//
// MessageId: ERROR_PAGE_FAULT_COPY_ON_WRITE
//
// MessageText:
//
// Page fault was a demand zero fault.
//
static const int ERROR_PAGE_FAULT_COPY_ON_WRITE   749L

//
// MessageId: ERROR_PAGE_FAULT_GUARD_PAGE
//
// MessageText:
//
// Page fault was a demand zero fault.
//
static const int ERROR_PAGE_FAULT_GUARD_PAGE      750L

//
// MessageId: ERROR_PAGE_FAULT_PAGING_FILE
//
// MessageText:
//
// Page fault was satisfied by reading from a secondary storage device.
//
static const int ERROR_PAGE_FAULT_PAGING_FILE     751L

//
// MessageId: ERROR_CACHE_PAGE_LOCKED
//
// MessageText:
//
// Cached page was locked during operation.
//
static const int ERROR_CACHE_PAGE_LOCKED          752L

//
// MessageId: ERROR_CRASH_DUMP
//
// MessageText:
//
// Crash dump exists in paging file.
//
static const int ERROR_CRASH_DUMP                 753L

//
// MessageId: ERROR_BUFFER_ALL_ZEROS
//
// MessageText:
//
// Specified buffer contains all zeros.
//
static const int ERROR_BUFFER_ALL_ZEROS           754L

//
// MessageId: ERROR_REPARSE_OBJECT
//
// MessageText:
//
// A reparse should be performed by the Object Manager since the name of the file resulted in a symbolic link.
//
static const int ERROR_REPARSE_OBJECT             755L

//
// MessageId: ERROR_RESOURCE_REQUIREMENTS_CHANGED
//
// MessageText:
//
// The device has succeeded a query-stop and its resource requirements have changed.
//
static const int ERROR_RESOURCE_REQUIREMENTS_CHANGED 756L

//
// MessageId: ERROR_TRANSLATION_COMPLETE
//
// MessageText:
//
// The translator has translated these resources into the global space and no further translations should be performed.
//
static const int ERROR_TRANSLATION_COMPLETE       757L

//
// MessageId: ERROR_NOTHING_TO_TERMINATE
//
// MessageText:
//
// A process being terminated has no threads to terminate.
//
static const int ERROR_NOTHING_TO_TERMINATE       758L

//
// MessageId: ERROR_PROCESS_NOT_IN_JOB
//
// MessageText:
//
// The specified process is not part of a job.
//
static const int ERROR_PROCESS_NOT_IN_JOB         759L

//
// MessageId: ERROR_PROCESS_IN_JOB
//
// MessageText:
//
// The specified process is part of a job.
//
static const int ERROR_PROCESS_IN_JOB             760L

//
// MessageId: ERROR_VOLSNAP_HIBERNATE_READY
//
// MessageText:
//
// {Volume Shadow Copy Service}
// The system is now ready for hibernation.
//
static const int ERROR_VOLSNAP_HIBERNATE_READY    761L

//
// MessageId: ERROR_FSFILTER_OP_COMPLETED_SUCCESSFULLY
//
// MessageText:
//
// A file system or file system filter driver has successfully completed an FsFilter operation.
//
static const int ERROR_FSFILTER_OP_COMPLETED_SUCCESSFULLY 762L

//
// MessageId: ERROR_INTERRUPT_VECTOR_ALREADY_CONNECTED
//
// MessageText:
//
// The specified interrupt vector was already connected.
//
static const int ERROR_INTERRUPT_VECTOR_ALREADY_CONNECTED 763L

//
// MessageId: ERROR_INTERRUPT_STILL_CONNECTED
//
// MessageText:
//
// The specified interrupt vector is still connected.
//
static const int ERROR_INTERRUPT_STILL_CONNECTED  764L

//
// MessageId: ERROR_WAIT_FOR_OPLOCK
//
// MessageText:
//
// An operation is blocked waiting for an oplock.
//
static const int ERROR_WAIT_FOR_OPLOCK            765L

//
// MessageId: ERROR_DBG_EXCEPTION_HANDLED
//
// MessageText:
//
// Debugger handled exception
//
static const int ERROR_DBG_EXCEPTION_HANDLED      766L    // winnt

//
// MessageId: ERROR_DBG_CONTINUE
//
// MessageText:
//
// Debugger continued
//
static const int ERROR_DBG_CONTINUE               767L    // winnt

//
// MessageId: ERROR_CALLBACK_POP_STACK
//
// MessageText:
//
// An exception occurred in a user mode callback and the kernel callback frame should be removed.
//
static const int ERROR_CALLBACK_POP_STACK         768L

//
// MessageId: ERROR_COMPRESSION_DISABLED
//
// MessageText:
//
// Compression is disabled for this volume.
//
static const int ERROR_COMPRESSION_DISABLED       769L

//
// MessageId: ERROR_CANTFETCHBACKWARDS
//
// MessageText:
//
// The data provider cannot fetch backwards through a result set.
//
static const int ERROR_CANTFETCHBACKWARDS         770L

//
// MessageId: ERROR_CANTSCROLLBACKWARDS
//
// MessageText:
//
// The data provider cannot scroll backwards through a result set.
//
static const int ERROR_CANTSCROLLBACKWARDS        771L

//
// MessageId: ERROR_ROWSNOTRELEASED
//
// MessageText:
//
// The data provider requires that previously fetched data is released before asking for more data.
//
static const int ERROR_ROWSNOTRELEASED            772L

//
// MessageId: ERROR_BAD_ACCESSOR_FLAGS
//
// MessageText:
//
// The data provider was not able to interpret the flags set for a column binding in an accessor.
//
static const int ERROR_BAD_ACCESSOR_FLAGS         773L

//
// MessageId: ERROR_ERRORS_ENCOUNTERED
//
// MessageText:
//
// One or more errors occurred while processing the request.
//
static const int ERROR_ERRORS_ENCOUNTERED         774L

//
// MessageId: ERROR_NOT_CAPABLE
//
// MessageText:
//
// The implementation is not capable of performing the request.
//
static const int ERROR_NOT_CAPABLE                775L

//
// MessageId: ERROR_REQUEST_OUT_OF_SEQUENCE
//
// MessageText:
//
// The client of a component requested an operation which is not valid given the state of the component instance.
//
static const int ERROR_REQUEST_OUT_OF_SEQUENCE    776L

//
// MessageId: ERROR_VERSION_PARSE_ERROR
//
// MessageText:
//
// A version number could not be parsed.
//
static const int ERROR_VERSION_PARSE_ERROR        777L

//
// MessageId: ERROR_BADSTARTPOSITION
//
// MessageText:
//
// The iterator's start position is invalid.
//
static const int ERROR_BADSTARTPOSITION           778L

//
// MessageId: ERROR_MEMORY_HARDWARE
//
// MessageText:
//
// The hardware has reported an uncorrectable memory error.
//
static const int ERROR_MEMORY_HARDWARE            779L

//
// MessageId: ERROR_DISK_REPAIR_DISABLED
//
// MessageText:
//
// The attempted operation required self healing to be enabled.
//
static const int ERROR_DISK_REPAIR_DISABLED       780L

//
// MessageId: ERROR_INSUFFICIENT_RESOURCE_FOR_SPECIFIED_SHARED_SECTION_SIZE
//
// MessageText:
//
// The Desktop heap encountered an error while allocating session memory. There is more information in the system event log.
//
static const int ERROR_INSUFFICIENT_RESOURCE_FOR_SPECIFIED_SHARED_SECTION_SIZE 781L

//
// MessageId: ERROR_SYSTEM_POWERSTATE_TRANSITION
//
// MessageText:
//
// The system power state is transitioning from %2 to %3.
//
static const int ERROR_SYSTEM_POWERSTATE_TRANSITION 782L

//
// MessageId: ERROR_SYSTEM_POWERSTATE_COMPLEX_TRANSITION
//
// MessageText:
//
// The system power state is transitioning from %2 to %3 but could enter %4.
//
static const int ERROR_SYSTEM_POWERSTATE_COMPLEX_TRANSITION 783L

//
// MessageId: ERROR_MCA_EXCEPTION
//
// MessageText:
//
// A thread is getting dispatched with MCA EXCEPTION because of MCA.
//
static const int ERROR_MCA_EXCEPTION              784L

//
// MessageId: ERROR_ACCESS_AUDIT_BY_POLICY
//
// MessageText:
//
// Access to %1 is monitored by policy rule %2.
//
static const int ERROR_ACCESS_AUDIT_BY_POLICY     785L

//
// MessageId: ERROR_ACCESS_DISABLED_NO_SAFER_UI_BY_POLICY
//
// MessageText:
//
// Access to %1 has been restricted by your Administrator by policy rule %2.
//
static const int ERROR_ACCESS_DISABLED_NO_SAFER_UI_BY_POLICY 786L

//
// MessageId: ERROR_ABANDON_HIBERFILE
//
// MessageText:
//
// A valid hibernation file has been invalidated and should be abandoned.
//
static const int ERROR_ABANDON_HIBERFILE          787L

//
// MessageId: ERROR_LOST_WRITEBEHIND_DATA_NETWORK_DISCONNECTED
//
// MessageText:
//
// {Delayed Write Failed}
// Windows was unable to save all the data for the file %hs; the data has been lost.
// This error may be caused by network connectivity issues. Please try to save this file elsewhere.
//
static const int ERROR_LOST_WRITEBEHIND_DATA_NETWORK_DISCONNECTED 788L

//
// MessageId: ERROR_LOST_WRITEBEHIND_DATA_NETWORK_SERVER_ERROR
//
// MessageText:
//
// {Delayed Write Failed}
// Windows was unable to save all the data for the file %hs; the data has been lost.
// This error was returned by the server on which the file exists. Please try to save this file elsewhere.
//
static const int ERROR_LOST_WRITEBEHIND_DATA_NETWORK_SERVER_ERROR 789L

//
// MessageId: ERROR_LOST_WRITEBEHIND_DATA_LOCAL_DISK_ERROR
//
// MessageText:
//
// {Delayed Write Failed}
// Windows was unable to save all the data for the file %hs; the data has been lost.
// This error may be caused if the device has been removed or the media is write-protected.
//
static const int ERROR_LOST_WRITEBEHIND_DATA_LOCAL_DISK_ERROR 790L

//
// MessageId: ERROR_BAD_MCFG_TABLE
//
// MessageText:
//
// The resources required for this device conflict with the MCFG table.
//
static const int ERROR_BAD_MCFG_TABLE             791L

//
// MessageId: ERROR_DISK_REPAIR_REDIRECTED
//
// MessageText:
//
// The volume repair could not be performed while it is online.
// Please schedule to take the volume offline so that it can be repaired.
//
static const int ERROR_DISK_REPAIR_REDIRECTED     792L

//
// MessageId: ERROR_DISK_REPAIR_UNSUCCESSFUL
//
// MessageText:
//
// The volume repair was not successful.
//
static const int ERROR_DISK_REPAIR_UNSUCCESSFUL   793L

//
// MessageId: ERROR_CORRUPT_LOG_OVERFULL
//
// MessageText:
//
// One of the volume corruption logs is full. Further corruptions that may be detected won't be logged.
//
static const int ERROR_CORRUPT_LOG_OVERFULL       794L

//
// MessageId: ERROR_CORRUPT_LOG_CORRUPTED
//
// MessageText:
//
// One of the volume corruption logs is internally corrupted and needs to be recreated. The volume may contain undetected corruptions and must be scanned.
//
static const int ERROR_CORRUPT_LOG_CORRUPTED      795L

//
// MessageId: ERROR_CORRUPT_LOG_UNAVAILABLE
//
// MessageText:
//
// One of the volume corruption logs is unavailable for being operated on.
//
static const int ERROR_CORRUPT_LOG_UNAVAILABLE    796L

//
// MessageId: ERROR_CORRUPT_LOG_DELETED_FULL
//
// MessageText:
//
// One of the volume corruption logs was deleted while still having corruption records in them. The volume contains detected corruptions and must be scanned.
//
static const int ERROR_CORRUPT_LOG_DELETED_FULL   797L

//
// MessageId: ERROR_CORRUPT_LOG_CLEARED
//
// MessageText:
//
// One of the volume corruption logs was cleared by chkdsk and no longer contains real corruptions.
//
static const int ERROR_CORRUPT_LOG_CLEARED        798L

//
// MessageId: ERROR_ORPHAN_NAME_EXHAUSTED
//
// MessageText:
//
// Orphaned files exist on the volume but could not be recovered because no more new names could be created in the recovery directory. Files must be moved from the recovery directory.
//
static const int ERROR_ORPHAN_NAME_EXHAUSTED      799L

//
// MessageId: ERROR_OPLOCK_SWITCHED_TO_NEW_HANDLE
//
// MessageText:
//
// The oplock that was associated with this handle is now associated with a different handle.
//
static const int ERROR_OPLOCK_SWITCHED_TO_NEW_HANDLE 800L

//
// MessageId: ERROR_CANNOT_GRANT_REQUESTED_OPLOCK
//
// MessageText:
//
// An oplock of the requested level cannot be granted.  An oplock of a lower level may be available.
//
static const int ERROR_CANNOT_GRANT_REQUESTED_OPLOCK 801L

//
// MessageId: ERROR_CANNOT_BREAK_OPLOCK
//
// MessageText:
//
// The operation did not complete successfully because it would cause an oplock to be broken. The caller has requested that existing oplocks not be broken.
//
static const int ERROR_CANNOT_BREAK_OPLOCK        802L

//
// MessageId: ERROR_OPLOCK_HANDLE_CLOSED
//
// MessageText:
//
// The handle with which this oplock was associated has been closed.  The oplock is now broken.
//
static const int ERROR_OPLOCK_HANDLE_CLOSED       803L

//
// MessageId: ERROR_NO_ACE_CONDITION
//
// MessageText:
//
// The specified access control entry (ACE) does not contain a condition.
//
static const int ERROR_NO_ACE_CONDITION           804L

//
// MessageId: ERROR_INVALID_ACE_CONDITION
//
// MessageText:
//
// The specified access control entry (ACE) contains an invalid condition.
//
static const int ERROR_INVALID_ACE_CONDITION      805L

//
// MessageId: ERROR_FILE_HANDLE_REVOKED
//
// MessageText:
//
// Access to the specified file handle has been revoked.
//
static const int ERROR_FILE_HANDLE_REVOKED        806L

//
// MessageId: ERROR_IMAGE_AT_DIFFERENT_BASE
//
// MessageText:
//
// {Image Relocated}
// An image file was mapped at a different address from the one specified in the image file but fixups will still be automatically performed on the image.
//
static const int ERROR_IMAGE_AT_DIFFERENT_BASE    807L

//
// MessageId: ERROR_ENCRYPTED_IO_NOT_POSSIBLE
//
// MessageText:
//
// The read or write operation to an encrypted file could not be completed because the file has not been opened for data access.
//
static const int ERROR_ENCRYPTED_IO_NOT_POSSIBLE  808L

//
// MessageId: ERROR_FILE_METADATA_OPTIMIZATION_IN_PROGRESS
//
// MessageText:
//
// File metadata optimization is already in progress.
//
static const int ERROR_FILE_METADATA_OPTIMIZATION_IN_PROGRESS 809L

//
// MessageId: ERROR_QUOTA_ACTIVITY
//
// MessageText:
//
// The requested operation failed due to quota operation is still in progress.
//
static const int ERROR_QUOTA_ACTIVITY             810L

//
// MessageId: ERROR_HANDLE_REVOKED
//
// MessageText:
//
// Access to the specified handle has been revoked.
//
static const int ERROR_HANDLE_REVOKED             811L

//
// MessageId: ERROR_CALLBACK_INVOKE_INLINE
//
// MessageText:
//
// The callback function must be invoked inline.
//
static const int ERROR_CALLBACK_INVOKE_INLINE     812L

//
// MessageId: ERROR_CPU_SET_INVALID
//
// MessageText:
//
// The specified CPU Set IDs are invalid.
//
static const int ERROR_CPU_SET_INVALID            813L

//
// MessageId: ERROR_ENCLAVE_NOT_TERMINATED
//
// MessageText:
//
// The specified enclave has not yet been terminated.
//
static const int ERROR_ENCLAVE_NOT_TERMINATED     814L

//
// MessageId: ERROR_ENCLAVE_VIOLATION
//
// MessageText:
//
// An attempt was made to access protected memory in violation of its secure access policy.
//
static const int ERROR_ENCLAVE_VIOLATION          815L

//
// **** Available SYSTEM error codes ****
//
//
// MessageId: ERROR_EA_ACCESS_DENIED
//
// MessageText:
//
// Access to the extended attribute was denied.
//
static const int ERROR_EA_ACCESS_DENIED           994L
--]]

ffi.cdef[[
static const int ERROR_OPERATION_ABORTED        =  995L;
static const int ERROR_IO_INCOMPLETE            =  996L;
static const int ERROR_IO_PENDING               =  997L;    // dderror
static const int ERROR_NOACCESS                 =  998L;
]]

--[[
//
// MessageId: ERROR_SWAPERROR
//
// MessageText:
//
// Error performing inpage operation.
//
static const int ERROR_SWAPERROR                  999L

//
// MessageId: ERROR_STACK_OVERFLOW
//
// MessageText:
//
// Recursion too deep; the stack overflowed.
//
static const int ERROR_STACK_OVERFLOW             1001L

//
// MessageId: ERROR_INVALID_MESSAGE
//
// MessageText:
//
// The window cannot act on the sent message.
//
static const int ERROR_INVALID_MESSAGE            1002L

//
// MessageId: ERROR_CAN_NOT_COMPLETE
//
// MessageText:
//
// Cannot complete this function.
//
static const int ERROR_CAN_NOT_COMPLETE           1003L

//
// MessageId: ERROR_INVALID_FLAGS
//
// MessageText:
//
// Invalid flags.
//
static const int ERROR_INVALID_FLAGS              1004L

//
// MessageId: ERROR_UNRECOGNIZED_VOLUME
//
// MessageText:
//
// The volume does not contain a recognized file system.
// Please make sure that all required file system drivers are loaded and that the volume is not corrupted.
//
static const int ERROR_UNRECOGNIZED_VOLUME        1005L

//
// MessageId: ERROR_FILE_INVALID
//
// MessageText:
//
// The volume for a file has been externally altered so that the opened file is no longer valid.
//
static const int ERROR_FILE_INVALID               1006L

//
// MessageId: ERROR_FULLSCREEN_MODE
//
// MessageText:
//
// The requested operation cannot be performed in full-screen mode.
//
static const int ERROR_FULLSCREEN_MODE            1007L

//
// MessageId: ERROR_NO_TOKEN
//
// MessageText:
//
// An attempt was made to reference a token that does not exist.
//
static const int ERROR_NO_TOKEN                   1008L

//
// MessageId: ERROR_BADDB
//
// MessageText:
//
// The configuration registry database is corrupt.
//
static const int ERROR_BADDB                      1009L

//
// MessageId: ERROR_BADKEY
//
// MessageText:
//
// The configuration registry key is invalid.
//
static const int ERROR_BADKEY                     1010L

//
// MessageId: ERROR_CANTOPEN
//
// MessageText:
//
// The configuration registry key could not be opened.
//
static const int ERROR_CANTOPEN                   1011L

//
// MessageId: ERROR_CANTREAD
//
// MessageText:
//
// The configuration registry key could not be read.
//
static const int ERROR_CANTREAD                   1012L

//
// MessageId: ERROR_CANTWRITE
//
// MessageText:
//
// The configuration registry key could not be written.
//
static const int ERROR_CANTWRITE                  1013L

//
// MessageId: ERROR_REGISTRY_RECOVERED
//
// MessageText:
//
// One of the files in the registry database had to be recovered by use of a log or alternate copy. The recovery was successful.
//
static const int ERROR_REGISTRY_RECOVERED         1014L

//
// MessageId: ERROR_REGISTRY_CORRUPT
//
// MessageText:
//
// The registry is corrupted. The structure of one of the files containing registry data is corrupted, or the system's memory image of the file is corrupted, or the file could not be recovered because the alternate copy or log was absent or corrupted.
//
static const int ERROR_REGISTRY_CORRUPT           1015L

//
// MessageId: ERROR_REGISTRY_IO_FAILED
//
// MessageText:
//
// An I/O operation initiated by the registry failed unrecoverably. The registry could not read in, or write out, or flush, one of the files that contain the system's image of the registry.
//
static const int ERROR_REGISTRY_IO_FAILED         1016L

//
// MessageId: ERROR_NOT_REGISTRY_FILE
//
// MessageText:
//
// The system has attempted to load or restore a file into the registry, but the specified file is not in a registry file format.
//
static const int ERROR_NOT_REGISTRY_FILE          1017L

//
// MessageId: ERROR_KEY_DELETED
//
// MessageText:
//
// Illegal operation attempted on a registry key that has been marked for deletion.
//
static const int ERROR_KEY_DELETED                1018L

//
// MessageId: ERROR_NO_LOG_SPACE
//
// MessageText:
//
// System could not allocate the required space in a registry log.
//
static const int ERROR_NO_LOG_SPACE               1019L

//
// MessageId: ERROR_KEY_HAS_CHILDREN
//
// MessageText:
//
// Cannot create a symbolic link in a registry key that already has subkeys or values.
//
static const int ERROR_KEY_HAS_CHILDREN           1020L

//
// MessageId: ERROR_CHILD_MUST_BE_VOLATILE
//
// MessageText:
//
// Cannot create a stable subkey under a volatile parent key.
//
static const int ERROR_CHILD_MUST_BE_VOLATILE     1021L

//
// MessageId: ERROR_NOTIFY_ENUM_DIR
//
// MessageText:
//
// A notify change request is being completed and the information is not being returned in the caller's buffer. The caller now needs to enumerate the files to find the changes.
//
static const int ERROR_NOTIFY_ENUM_DIR            1022L

//
// MessageId: ERROR_DEPENDENT_SERVICES_RUNNING
//
// MessageText:
//
// A stop control has been sent to a service that other running services are dependent on.
//
static const int ERROR_DEPENDENT_SERVICES_RUNNING 1051L

//
// MessageId: ERROR_INVALID_SERVICE_CONTROL
//
// MessageText:
//
// The requested control is not valid for this service.
//
static const int ERROR_INVALID_SERVICE_CONTROL    1052L

//
// MessageId: ERROR_SERVICE_REQUEST_TIMEOUT
//
// MessageText:
//
// The service did not respond to the start or control request in a timely fashion.
//
static const int ERROR_SERVICE_REQUEST_TIMEOUT    1053L

//
// MessageId: ERROR_SERVICE_NO_THREAD
//
// MessageText:
//
// A thread could not be created for the service.
//
static const int ERROR_SERVICE_NO_THREAD          1054L

//
// MessageId: ERROR_SERVICE_DATABASE_LOCKED
//
// MessageText:
//
// The service database is locked.
//
static const int ERROR_SERVICE_DATABASE_LOCKED    1055L

//
// MessageId: ERROR_SERVICE_ALREADY_RUNNING
//
// MessageText:
//
// An instance of the service is already running.
//
static const int ERROR_SERVICE_ALREADY_RUNNING    1056L

//
// MessageId: ERROR_INVALID_SERVICE_ACCOUNT
//
// MessageText:
//
// The account name is invalid or does not exist, or the password is invalid for the account name specified.
//
static const int ERROR_INVALID_SERVICE_ACCOUNT    1057L

//
// MessageId: ERROR_SERVICE_DISABLED
//
// MessageText:
//
// The service cannot be started, either because it is disabled or because it has no enabled devices associated with it.
//
static const int ERROR_SERVICE_DISABLED           1058L

//
// MessageId: ERROR_CIRCULAR_DEPENDENCY
//
// MessageText:
//
// Circular service dependency was specified.
//
static const int ERROR_CIRCULAR_DEPENDENCY        1059L

//
// MessageId: ERROR_SERVICE_DOES_NOT_EXIST
//
// MessageText:
//
// The specified service does not exist as an installed service.
//
static const int ERROR_SERVICE_DOES_NOT_EXIST     1060L

//
// MessageId: ERROR_SERVICE_CANNOT_ACCEPT_CTRL
//
// MessageText:
//
// The service cannot accept control messages at this time.
//
static const int ERROR_SERVICE_CANNOT_ACCEPT_CTRL 1061L

//
// MessageId: ERROR_SERVICE_NOT_ACTIVE
//
// MessageText:
//
// The service has not been started.
//
static const int ERROR_SERVICE_NOT_ACTIVE         1062L

//
// MessageId: ERROR_FAILED_SERVICE_CONTROLLER_CONNECT
//
// MessageText:
//
// The service process could not connect to the service controller.
//
static const int ERROR_FAILED_SERVICE_CONTROLLER_CONNECT 1063L

//
// MessageId: ERROR_EXCEPTION_IN_SERVICE
//
// MessageText:
//
// An exception occurred in the service when handling the control request.
//
static const int ERROR_EXCEPTION_IN_SERVICE       1064L

//
// MessageId: ERROR_DATABASE_DOES_NOT_EXIST
//
// MessageText:
//
// The database specified does not exist.
//
static const int ERROR_DATABASE_DOES_NOT_EXIST    1065L

//
// MessageId: ERROR_SERVICE_SPECIFIC_ERROR
//
// MessageText:
//
// The service has returned a service-specific error code.
//
static const int ERROR_SERVICE_SPECIFIC_ERROR     1066L

//
// MessageId: ERROR_PROCESS_ABORTED
//
// MessageText:
//
// The process terminated unexpectedly.
//
static const int ERROR_PROCESS_ABORTED            1067L

//
// MessageId: ERROR_SERVICE_DEPENDENCY_FAIL
//
// MessageText:
//
// The dependency service or group failed to start.
//
static const int ERROR_SERVICE_DEPENDENCY_FAIL    1068L

//
// MessageId: ERROR_SERVICE_LOGON_FAILED
//
// MessageText:
//
// The service did not start due to a logon failure.
//
static const int ERROR_SERVICE_LOGON_FAILED       1069L

//
// MessageId: ERROR_SERVICE_START_HANG
//
// MessageText:
//
// After starting, the service hung in a start-pending state.
//
static const int ERROR_SERVICE_START_HANG         1070L

//
// MessageId: ERROR_INVALID_SERVICE_LOCK
//
// MessageText:
//
// The specified service database lock is invalid.
//
static const int ERROR_INVALID_SERVICE_LOCK       1071L

//
// MessageId: ERROR_SERVICE_MARKED_FOR_DELETE
//
// MessageText:
//
// The specified service has been marked for deletion.
//
static const int ERROR_SERVICE_MARKED_FOR_DELETE  1072L

//
// MessageId: ERROR_SERVICE_EXISTS
//
// MessageText:
//
// The specified service already exists.
//
static const int ERROR_SERVICE_EXISTS             1073L

//
// MessageId: ERROR_ALREADY_RUNNING_LKG
//
// MessageText:
//
// The system is currently running with the last-known-good configuration.
//
static const int ERROR_ALREADY_RUNNING_LKG        1074L

//
// MessageId: ERROR_SERVICE_DEPENDENCY_DELETED
//
// MessageText:
//
// The dependency service does not exist or has been marked for deletion.
//
static const int ERROR_SERVICE_DEPENDENCY_DELETED 1075L

//
// MessageId: ERROR_BOOT_ALREADY_ACCEPTED
//
// MessageText:
//
// The current boot has already been accepted for use as the last-known-good control set.
//
static const int ERROR_BOOT_ALREADY_ACCEPTED      1076L

//
// MessageId: ERROR_SERVICE_NEVER_STARTED
//
// MessageText:
//
// No attempts to start the service have been made since the last boot.
//
static const int ERROR_SERVICE_NEVER_STARTED      1077L

//
// MessageId: ERROR_DUPLICATE_SERVICE_NAME
//
// MessageText:
//
// The name is already in use as either a service name or a service display name.
//
static const int ERROR_DUPLICATE_SERVICE_NAME     1078L

//
// MessageId: ERROR_DIFFERENT_SERVICE_ACCOUNT
//
// MessageText:
//
// The account specified for this service is different from the account specified for other services running in the same process.
//
static const int ERROR_DIFFERENT_SERVICE_ACCOUNT  1079L

//
// MessageId: ERROR_CANNOT_DETECT_DRIVER_FAILURE
//
// MessageText:
//
// Failure actions can only be set for Win32 services, not for drivers.
//
static const int ERROR_CANNOT_DETECT_DRIVER_FAILURE 1080L

//
// MessageId: ERROR_CANNOT_DETECT_PROCESS_ABORT
//
// MessageText:
//
// This service runs in the same process as the service control manager.
// Therefore, the service control manager cannot take action if this service's process terminates unexpectedly.
//
static const int ERROR_CANNOT_DETECT_PROCESS_ABORT 1081L

//
// MessageId: ERROR_NO_RECOVERY_PROGRAM
//
// MessageText:
//
// No recovery program has been configured for this service.
//
static const int ERROR_NO_RECOVERY_PROGRAM        1082L

//
// MessageId: ERROR_SERVICE_NOT_IN_EXE
//
// MessageText:
//
// The executable program that this service is configured to run in does not implement the service.
//
static const int ERROR_SERVICE_NOT_IN_EXE         1083L

//
// MessageId: ERROR_NOT_SAFEBOOT_SERVICE
//
// MessageText:
//
// This service cannot be started in Safe Mode
//
static const int ERROR_NOT_SAFEBOOT_SERVICE       1084L

//
// MessageId: ERROR_END_OF_MEDIA
//
// MessageText:
//
// The physical end of the tape has been reached.
//
static const int ERROR_END_OF_MEDIA               1100L

//
// MessageId: ERROR_FILEMARK_DETECTED
//
// MessageText:
//
// A tape access reached a filemark.
//
static const int ERROR_FILEMARK_DETECTED          1101L

//
// MessageId: ERROR_BEGINNING_OF_MEDIA
//
// MessageText:
//
// The beginning of the tape or a partition was encountered.
//
static const int ERROR_BEGINNING_OF_MEDIA         1102L

//
// MessageId: ERROR_SETMARK_DETECTED
//
// MessageText:
//
// A tape access reached the end of a set of files.
//
static const int ERROR_SETMARK_DETECTED           1103L

//
// MessageId: ERROR_NO_DATA_DETECTED
//
// MessageText:
//
// No more data is on the tape.
//
static const int ERROR_NO_DATA_DETECTED           1104L

//
// MessageId: ERROR_PARTITION_FAILURE
//
// MessageText:
//
// Tape could not be partitioned.
//
static const int ERROR_PARTITION_FAILURE          1105L

//
// MessageId: ERROR_INVALID_BLOCK_LENGTH
//
// MessageText:
//
// When accessing a new tape of a multivolume partition, the current block size is incorrect.
//
static const int ERROR_INVALID_BLOCK_LENGTH       1106L

//
// MessageId: ERROR_DEVICE_NOT_PARTITIONED
//
// MessageText:
//
// Tape partition information could not be found when loading a tape.
//
static const int ERROR_DEVICE_NOT_PARTITIONED     1107L

//
// MessageId: ERROR_UNABLE_TO_LOCK_MEDIA
//
// MessageText:
//
// Unable to lock the media eject mechanism.
//
static const int ERROR_UNABLE_TO_LOCK_MEDIA       1108L

//
// MessageId: ERROR_UNABLE_TO_UNLOAD_MEDIA
//
// MessageText:
//
// Unable to unload the media.
//
static const int ERROR_UNABLE_TO_UNLOAD_MEDIA     1109L

//
// MessageId: ERROR_MEDIA_CHANGED
//
// MessageText:
//
// The media in the drive may have changed.
//
static const int ERROR_MEDIA_CHANGED              1110L

//
// MessageId: ERROR_BUS_RESET
//
// MessageText:
//
// The I/O bus was reset.
//
static const int ERROR_BUS_RESET                  1111L

//
// MessageId: ERROR_NO_MEDIA_IN_DRIVE
//
// MessageText:
//
// No media in drive.
//
static const int ERROR_NO_MEDIA_IN_DRIVE          1112L

//
// MessageId: ERROR_NO_UNICODE_TRANSLATION
//
// MessageText:
//
// No mapping for the Unicode character exists in the target multi-byte code page.
//
static const int ERROR_NO_UNICODE_TRANSLATION     1113L

//
// MessageId: ERROR_DLL_INIT_FAILED
//
// MessageText:
//
// A dynamic link library (DLL) initialization routine failed.
//
static const int ERROR_DLL_INIT_FAILED            1114L

//
// MessageId: ERROR_SHUTDOWN_IN_PROGRESS
//
// MessageText:
//
// A system shutdown is in progress.
//
static const int ERROR_SHUTDOWN_IN_PROGRESS       1115L

//
// MessageId: ERROR_NO_SHUTDOWN_IN_PROGRESS
//
// MessageText:
//
// Unable to abort the system shutdown because no shutdown was in progress.
//
static const int ERROR_NO_SHUTDOWN_IN_PROGRESS    1116L

//
// MessageId: ERROR_IO_DEVICE
//
// MessageText:
//
// The request could not be performed because of an I/O device error.
//
static const int ERROR_IO_DEVICE                  1117L

//
// MessageId: ERROR_SERIAL_NO_DEVICE
//
// MessageText:
//
// No serial device was successfully initialized. The serial driver will unload.
//
static const int ERROR_SERIAL_NO_DEVICE           1118L

//
// MessageId: ERROR_IRQ_BUSY
//
// MessageText:
//
// Unable to open a device that was sharing an interrupt request (IRQ) with other devices. At least one other device that uses that IRQ was already opened.
//
static const int ERROR_IRQ_BUSY                   1119L

//
// MessageId: ERROR_MORE_WRITES
//
// MessageText:
//
// A serial I/O operation was completed by another write to the serial port.
// (The IOCTL_SERIAL_XOFF_COUNTER reached zero.)
//
static const int ERROR_MORE_WRITES                1120L

//
// MessageId: ERROR_COUNTER_TIMEOUT
//
// MessageText:
//
// A serial I/O operation completed because the timeout period expired.
// (The IOCTL_SERIAL_XOFF_COUNTER did not reach zero.)
//
static const int ERROR_COUNTER_TIMEOUT            1121L

//
// MessageId: ERROR_FLOPPY_ID_MARK_NOT_FOUND
//
// MessageText:
//
// No ID address mark was found on the floppy disk.
//
static const int ERROR_FLOPPY_ID_MARK_NOT_FOUND   1122L

//
// MessageId: ERROR_FLOPPY_WRONG_CYLINDER
//
// MessageText:
//
// Mismatch between the floppy disk sector ID field and the floppy disk controller track address.
//
static const int ERROR_FLOPPY_WRONG_CYLINDER      1123L

//
// MessageId: ERROR_FLOPPY_UNKNOWN_ERROR
//
// MessageText:
//
// The floppy disk controller reported an error that is not recognized by the floppy disk driver.
//
static const int ERROR_FLOPPY_UNKNOWN_ERROR       1124L

//
// MessageId: ERROR_FLOPPY_BAD_REGISTERS
//
// MessageText:
//
// The floppy disk controller returned inconsistent results in its registers.
//
static const int ERROR_FLOPPY_BAD_REGISTERS       1125L

//
// MessageId: ERROR_DISK_RECALIBRATE_FAILED
//
// MessageText:
//
// While accessing the hard disk, a recalibrate operation failed, even after retries.
//
static const int ERROR_DISK_RECALIBRATE_FAILED    1126L

//
// MessageId: ERROR_DISK_OPERATION_FAILED
//
// MessageText:
//
// While accessing the hard disk, a disk operation failed even after retries.
//
static const int ERROR_DISK_OPERATION_FAILED      1127L

//
// MessageId: ERROR_DISK_RESET_FAILED
//
// MessageText:
//
// While accessing the hard disk, a disk controller reset was needed, but even that failed.
//
static const int ERROR_DISK_RESET_FAILED          1128L

//
// MessageId: ERROR_EOM_OVERFLOW
//
// MessageText:
//
// Physical end of tape encountered.
//
static const int ERROR_EOM_OVERFLOW               1129L

//
// MessageId: ERROR_NOT_ENOUGH_SERVER_MEMORY
//
// MessageText:
//
// Not enough server memory resources are available to process this command.
//
static const int ERROR_NOT_ENOUGH_SERVER_MEMORY   1130L

//
// MessageId: ERROR_POSSIBLE_DEADLOCK
//
// MessageText:
//
// A potential deadlock condition has been detected.
//
static const int ERROR_POSSIBLE_DEADLOCK          1131L

//
// MessageId: ERROR_MAPPED_ALIGNMENT
//
// MessageText:
//
// The base address or the file offset specified does not have the proper alignment.
//
static const int ERROR_MAPPED_ALIGNMENT           1132L

//
// MessageId: ERROR_SET_POWER_STATE_VETOED
//
// MessageText:
//
// An attempt to change the system power state was vetoed by another application or driver.
//
static const int ERROR_SET_POWER_STATE_VETOED     1140L

//
// MessageId: ERROR_SET_POWER_STATE_FAILED
//
// MessageText:
//
// The system BIOS failed an attempt to change the system power state.
//
static const int ERROR_SET_POWER_STATE_FAILED     1141L

//
// MessageId: ERROR_TOO_MANY_LINKS
//
// MessageText:
//
// An attempt was made to create more links on a file than the file system supports.
//
static const int ERROR_TOO_MANY_LINKS             1142L

//
// MessageId: ERROR_OLD_WIN_VERSION
//
// MessageText:
//
// The specified program requires a newer version of Windows.
//
static const int ERROR_OLD_WIN_VERSION            1150L

//
// MessageId: ERROR_APP_WRONG_OS
//
// MessageText:
//
// The specified program is not a Windows or MS-DOS program.
//
static const int ERROR_APP_WRONG_OS               1151L

//
// MessageId: ERROR_SINGLE_INSTANCE_APP
//
// MessageText:
//
// Cannot start more than one instance of the specified program.
//
static const int ERROR_SINGLE_INSTANCE_APP        1152L

//
// MessageId: ERROR_RMODE_APP
//
// MessageText:
//
// The specified program was written for an earlier version of Windows.
//
static const int ERROR_RMODE_APP                  1153L

//
// MessageId: ERROR_INVALID_DLL
//
// MessageText:
//
// One of the library files needed to run this application is damaged.
//
static const int ERROR_INVALID_DLL                1154L

//
// MessageId: ERROR_NO_ASSOCIATION
//
// MessageText:
//
// No application is associated with the specified file for this operation.
//
static const int ERROR_NO_ASSOCIATION             1155L

//
// MessageId: ERROR_DDE_FAIL
//
// MessageText:
//
// An error occurred in sending the command to the application.
//
static const int ERROR_DDE_FAIL                   1156L

//
// MessageId: ERROR_DLL_NOT_FOUND
//
// MessageText:
//
// One of the library files needed to run this application cannot be found.
//
static const int ERROR_DLL_NOT_FOUND              1157L

//
// MessageId: ERROR_NO_MORE_USER_HANDLES
//
// MessageText:
//
// The current process has used all of its system allowance of handles for Window Manager objects.
//
static const int ERROR_NO_MORE_USER_HANDLES       1158L

//
// MessageId: ERROR_MESSAGE_SYNC_ONLY
//
// MessageText:
//
// The message can be used only with synchronous operations.
//
static const int ERROR_MESSAGE_SYNC_ONLY          1159L

//
// MessageId: ERROR_SOURCE_ELEMENT_EMPTY
//
// MessageText:
//
// The indicated source element has no media.
//
static const int ERROR_SOURCE_ELEMENT_EMPTY       1160L

//
// MessageId: ERROR_DESTINATION_ELEMENT_FULL
//
// MessageText:
//
// The indicated destination element already contains media.
//
static const int ERROR_DESTINATION_ELEMENT_FULL   1161L

//
// MessageId: ERROR_ILLEGAL_ELEMENT_ADDRESS
//
// MessageText:
//
// The indicated element does not exist.
//
static const int ERROR_ILLEGAL_ELEMENT_ADDRESS    1162L

//
// MessageId: ERROR_MAGAZINE_NOT_PRESENT
//
// MessageText:
//
// The indicated element is part of a magazine that is not present.
//
static const int ERROR_MAGAZINE_NOT_PRESENT       1163L

//
// MessageId: ERROR_DEVICE_REINITIALIZATION_NEEDED
//
// MessageText:
//
// The indicated device requires reinitialization due to hardware errors.
//
static const int ERROR_DEVICE_REINITIALIZATION_NEEDED 1164L    // dderror

//
// MessageId: ERROR_DEVICE_REQUIRES_CLEANING
//
// MessageText:
//
// The device has indicated that cleaning is required before further operations are attempted.
//
static const int ERROR_DEVICE_REQUIRES_CLEANING   1165L

//
// MessageId: ERROR_DEVICE_DOOR_OPEN
//
// MessageText:
//
// The device has indicated that its door is open.
//
static const int ERROR_DEVICE_DOOR_OPEN           1166L

//
// MessageId: ERROR_DEVICE_NOT_CONNECTED
//
// MessageText:
//
// The device is not connected.
//
static const int ERROR_DEVICE_NOT_CONNECTED       1167L

//
// MessageId: ERROR_NOT_FOUND
//
// MessageText:
//
// Element not found.
//
static const int ERROR_NOT_FOUND                  1168L

//
// MessageId: ERROR_NO_MATCH
//
// MessageText:
//
// There was no match for the specified key in the index.
//
static const int ERROR_NO_MATCH                   1169L

//
// MessageId: ERROR_SET_NOT_FOUND
//
// MessageText:
//
// The property set specified does not exist on the object.
//
static const int ERROR_SET_NOT_FOUND              1170L

//
// MessageId: ERROR_POINT_NOT_FOUND
//
// MessageText:
//
// The point passed to GetMouseMovePoints is not in the buffer.
//
static const int ERROR_POINT_NOT_FOUND            1171L

//
// MessageId: ERROR_NO_TRACKING_SERVICE
//
// MessageText:
//
// The tracking (workstation) service is not running.
//
static const int ERROR_NO_TRACKING_SERVICE        1172L

//
// MessageId: ERROR_NO_VOLUME_ID
//
// MessageText:
//
// The Volume ID could not be found.
//
static const int ERROR_NO_VOLUME_ID               1173L

//
// MessageId: ERROR_UNABLE_TO_REMOVE_REPLACED
//
// MessageText:
//
// Unable to remove the file to be replaced.
//
static const int ERROR_UNABLE_TO_REMOVE_REPLACED  1175L

//
// MessageId: ERROR_UNABLE_TO_MOVE_REPLACEMENT
//
// MessageText:
//
// Unable to move the replacement file to the file to be replaced. The file to be replaced has retained its original name.
//
static const int ERROR_UNABLE_TO_MOVE_REPLACEMENT 1176L

//
// MessageId: ERROR_UNABLE_TO_MOVE_REPLACEMENT_2
//
// MessageText:
//
// Unable to move the replacement file to the file to be replaced. The file to be replaced has been renamed using the backup name.
//
static const int ERROR_UNABLE_TO_MOVE_REPLACEMENT_2 1177L

//
// MessageId: ERROR_JOURNAL_DELETE_IN_PROGRESS
//
// MessageText:
//
// The volume change journal is being deleted.
//
static const int ERROR_JOURNAL_DELETE_IN_PROGRESS 1178L

//
// MessageId: ERROR_JOURNAL_NOT_ACTIVE
//
// MessageText:
//
// The volume change journal is not active.
//
static const int ERROR_JOURNAL_NOT_ACTIVE         1179L

//
// MessageId: ERROR_POTENTIAL_FILE_FOUND
//
// MessageText:
//
// A file was found, but it may not be the correct file.
//
static const int ERROR_POTENTIAL_FILE_FOUND       1180L

//
// MessageId: ERROR_JOURNAL_ENTRY_DELETED
//
// MessageText:
//
// The journal entry has been deleted from the journal.
//
static const int ERROR_JOURNAL_ENTRY_DELETED      1181L

//
// MessageId: ERROR_SHUTDOWN_IS_SCHEDULED
//
// MessageText:
//
// A system shutdown has already been scheduled.
//
static const int ERROR_SHUTDOWN_IS_SCHEDULED      1190L

//
// MessageId: ERROR_SHUTDOWN_USERS_LOGGED_ON
//
// MessageText:
//
// The system shutdown cannot be initiated because there are other users logged on to the computer.
//
static const int ERROR_SHUTDOWN_USERS_LOGGED_ON   1191L

//
// MessageId: ERROR_BAD_DEVICE
//
// MessageText:
//
// The specified device name is invalid.
//
static const int ERROR_BAD_DEVICE                 1200L

//
// MessageId: ERROR_CONNECTION_UNAVAIL
//
// MessageText:
//
// The device is not currently connected but it is a remembered connection.
//
static const int ERROR_CONNECTION_UNAVAIL         1201L

//
// MessageId: ERROR_DEVICE_ALREADY_REMEMBERED
//
// MessageText:
//
// The local device name has a remembered connection to another network resource.
//
static const int ERROR_DEVICE_ALREADY_REMEMBERED  1202L

//
// MessageId: ERROR_NO_NET_OR_BAD_PATH
//
// MessageText:
//
// The network path was either typed incorrectly, does not exist, or the network provider is not currently available. Please try retyping the path or contact your network administrator.
//
static const int ERROR_NO_NET_OR_BAD_PATH         1203L

//
// MessageId: ERROR_BAD_PROVIDER
//
// MessageText:
//
// The specified network provider name is invalid.
//
static const int ERROR_BAD_PROVIDER               1204L

//
// MessageId: ERROR_CANNOT_OPEN_PROFILE
//
// MessageText:
//
// Unable to open the network connection profile.
//
static const int ERROR_CANNOT_OPEN_PROFILE        1205L

//
// MessageId: ERROR_BAD_PROFILE
//
// MessageText:
//
// The network connection profile is corrupted.
//
static const int ERROR_BAD_PROFILE                1206L

//
// MessageId: ERROR_NOT_CONTAINER
//
// MessageText:
//
// Cannot enumerate a noncontainer.
//
static const int ERROR_NOT_CONTAINER              1207L

//
// MessageId: ERROR_EXTENDED_ERROR
//
// MessageText:
//
// An extended error has occurred.
//
static const int ERROR_EXTENDED_ERROR             1208L

//
// MessageId: ERROR_INVALID_GROUPNAME
//
// MessageText:
//
// The format of the specified group name is invalid.
//
static const int ERROR_INVALID_GROUPNAME          1209L

//
// MessageId: ERROR_INVALID_COMPUTERNAME
//
// MessageText:
//
// The format of the specified computer name is invalid.
//
static const int ERROR_INVALID_COMPUTERNAME       1210L

//
// MessageId: ERROR_INVALID_EVENTNAME
//
// MessageText:
//
// The format of the specified event name is invalid.
//
static const int ERROR_INVALID_EVENTNAME          1211L

//
// MessageId: ERROR_INVALID_DOMAINNAME
//
// MessageText:
//
// The format of the specified domain name is invalid.
//
static const int ERROR_INVALID_DOMAINNAME         1212L

//
// MessageId: ERROR_INVALID_SERVICENAME
//
// MessageText:
//
// The format of the specified service name is invalid.
//
static const int ERROR_INVALID_SERVICENAME        1213L

//
// MessageId: ERROR_INVALID_NETNAME
//
// MessageText:
//
// The format of the specified network name is invalid.
//
static const int ERROR_INVALID_NETNAME            1214L

//
// MessageId: ERROR_INVALID_SHARENAME
//
// MessageText:
//
// The format of the specified share name is invalid.
//
static const int ERROR_INVALID_SHARENAME          1215L

//
// MessageId: ERROR_INVALID_PASSWORDNAME
//
// MessageText:
//
// The format of the specified password is invalid.
//
static const int ERROR_INVALID_PASSWORDNAME       1216L

//
// MessageId: ERROR_INVALID_MESSAGENAME
//
// MessageText:
//
// The format of the specified message name is invalid.
//
static const int ERROR_INVALID_MESSAGENAME        1217L

//
// MessageId: ERROR_INVALID_MESSAGEDEST
//
// MessageText:
//
// The format of the specified message destination is invalid.
//
static const int ERROR_INVALID_MESSAGEDEST        1218L

//
// MessageId: ERROR_SESSION_CREDENTIAL_CONFLICT
//
// MessageText:
//
// Multiple connections to a server or shared resource by the same user, using more than one user name, are not allowed. Disconnect all previous connections to the server or shared resource and try again.
//
static const int ERROR_SESSION_CREDENTIAL_CONFLICT 1219L

//
// MessageId: ERROR_REMOTE_SESSION_LIMIT_EXCEEDED
//
// MessageText:
//
// An attempt was made to establish a session to a network server, but there are already too many sessions established to that server.
//
static const int ERROR_REMOTE_SESSION_LIMIT_EXCEEDED 1220L

//
// MessageId: ERROR_DUP_DOMAINNAME
//
// MessageText:
//
// The workgroup or domain name is already in use by another computer on the network.
//
static const int ERROR_DUP_DOMAINNAME             1221L

//
// MessageId: ERROR_NO_NETWORK
//
// MessageText:
//
// The network is not present or not started.
//
static const int ERROR_NO_NETWORK                 1222L

//
// MessageId: ERROR_CANCELLED
//
// MessageText:
//
// The operation was canceled by the user.
//
static const int ERROR_CANCELLED                  1223L

//
// MessageId: ERROR_USER_MAPPED_FILE
//
// MessageText:
//
// The requested operation cannot be performed on a file with a user-mapped section open.
//
static const int ERROR_USER_MAPPED_FILE           1224L

//
// MessageId: ERROR_CONNECTION_REFUSED
//
// MessageText:
//
// The remote computer refused the network connection.
//
static const int ERROR_CONNECTION_REFUSED         1225L

//
// MessageId: ERROR_GRACEFUL_DISCONNECT
//
// MessageText:
//
// The network connection was gracefully closed.
//
static const int ERROR_GRACEFUL_DISCONNECT        1226L

//
// MessageId: ERROR_ADDRESS_ALREADY_ASSOCIATED
//
// MessageText:
//
// The network transport endpoint already has an address associated with it.
//
static const int ERROR_ADDRESS_ALREADY_ASSOCIATED 1227L

//
// MessageId: ERROR_ADDRESS_NOT_ASSOCIATED
//
// MessageText:
//
// An address has not yet been associated with the network endpoint.
//
static const int ERROR_ADDRESS_NOT_ASSOCIATED     1228L

//
// MessageId: ERROR_CONNECTION_INVALID
//
// MessageText:
//
// An operation was attempted on a nonexistent network connection.
//
static const int ERROR_CONNECTION_INVALID         1229L

//
// MessageId: ERROR_CONNECTION_ACTIVE
//
// MessageText:
//
// An invalid operation was attempted on an active network connection.
//
static const int ERROR_CONNECTION_ACTIVE          1230L

//
// MessageId: ERROR_NETWORK_UNREACHABLE
//
// MessageText:
//
// The network location cannot be reached. For information about network troubleshooting, see Windows Help.
//
static const int ERROR_NETWORK_UNREACHABLE        1231L

//
// MessageId: ERROR_HOST_UNREACHABLE
//
// MessageText:
//
// The network location cannot be reached. For information about network troubleshooting, see Windows Help.
//
static const int ERROR_HOST_UNREACHABLE           1232L

//
// MessageId: ERROR_PROTOCOL_UNREACHABLE
//
// MessageText:
//
// The network location cannot be reached. For information about network troubleshooting, see Windows Help.
//
static const int ERROR_PROTOCOL_UNREACHABLE       1233L

//
// MessageId: ERROR_PORT_UNREACHABLE
//
// MessageText:
//
// No service is operating at the destination network endpoint on the remote system.
//
static const int ERROR_PORT_UNREACHABLE           1234L

//
// MessageId: ERROR_REQUEST_ABORTED
//
// MessageText:
//
// The request was aborted.
//
static const int ERROR_REQUEST_ABORTED            1235L

//
// MessageId: ERROR_CONNECTION_ABORTED
//
// MessageText:
//
// The network connection was aborted by the local system.
//
static const int ERROR_CONNECTION_ABORTED         1236L

//
// MessageId: ERROR_RETRY
//
// MessageText:
//
// The operation could not be completed. A retry should be performed.
//
static const int ERROR_RETRY                      1237L

//
// MessageId: ERROR_CONNECTION_COUNT_LIMIT
//
// MessageText:
//
// A connection to the server could not be made because the limit on the number of concurrent connections for this account has been reached.
//
static const int ERROR_CONNECTION_COUNT_LIMIT     1238L

//
// MessageId: ERROR_LOGIN_TIME_RESTRICTION
//
// MessageText:
//
// Attempting to log in during an unauthorized time of day for this account.
//
static const int ERROR_LOGIN_TIME_RESTRICTION     1239L

//
// MessageId: ERROR_LOGIN_WKSTA_RESTRICTION
//
// MessageText:
//
// The account is not authorized to log in from this station.
//
static const int ERROR_LOGIN_WKSTA_RESTRICTION    1240L

//
// MessageId: ERROR_INCORRECT_ADDRESS
//
// MessageText:
//
// The network address could not be used for the operation requested.
//
static const int ERROR_INCORRECT_ADDRESS          1241L

//
// MessageId: ERROR_ALREADY_REGISTERED
//
// MessageText:
//
// The service is already registered.
//
static const int ERROR_ALREADY_REGISTERED         1242L

//
// MessageId: ERROR_SERVICE_NOT_FOUND
//
// MessageText:
//
// The specified service does not exist.
//
static const int ERROR_SERVICE_NOT_FOUND          1243L

//
// MessageId: ERROR_NOT_AUTHENTICATED
//
// MessageText:
//
// The operation being requested was not performed because the user has not been authenticated.
//
static const int ERROR_NOT_AUTHENTICATED          1244L

//
// MessageId: ERROR_NOT_LOGGED_ON
//
// MessageText:
//
// The operation being requested was not performed because the user has not logged on to the network. The specified service does not exist.
//
static const int ERROR_NOT_LOGGED_ON              1245L

//
// MessageId: ERROR_CONTINUE
//
// MessageText:
//
// Continue with work in progress.
//
static const int ERROR_CONTINUE                   1246L    // dderror

//
// MessageId: ERROR_ALREADY_INITIALIZED
//
// MessageText:
//
// An attempt was made to perform an initialization operation when initialization has already been completed.
//
static const int ERROR_ALREADY_INITIALIZED        1247L

//
// MessageId: ERROR_NO_MORE_DEVICES
//
// MessageText:
//
// No more local devices.
//
static const int ERROR_NO_MORE_DEVICES            1248L    // dderror

//
// MessageId: ERROR_NO_SUCH_SITE
//
// MessageText:
//
// The specified site does not exist.
//
static const int ERROR_NO_SUCH_SITE               1249L

//
// MessageId: ERROR_DOMAIN_CONTROLLER_EXISTS
//
// MessageText:
//
// A domain controller with the specified name already exists.
//
static const int ERROR_DOMAIN_CONTROLLER_EXISTS   1250L

//
// MessageId: ERROR_ONLY_IF_CONNECTED
//
// MessageText:
//
// This operation is supported only when you are connected to the server.
//
static const int ERROR_ONLY_IF_CONNECTED          1251L

//
// MessageId: ERROR_OVERRIDE_NOCHANGES
//
// MessageText:
//
// The group policy framework should call the extension even if there are no changes.
//
static const int ERROR_OVERRIDE_NOCHANGES         1252L

//
// MessageId: ERROR_BAD_USER_PROFILE
//
// MessageText:
//
// The specified user does not have a valid profile.
//
static const int ERROR_BAD_USER_PROFILE           1253L

//
// MessageId: ERROR_NOT_SUPPORTED_ON_SBS
//
// MessageText:
//
// This operation is not supported on a computer running Windows Server 2003 for Small Business Server
//
static const int ERROR_NOT_SUPPORTED_ON_SBS       1254L

//
// MessageId: ERROR_SERVER_SHUTDOWN_IN_PROGRESS
//
// MessageText:
//
// The server machine is shutting down.
//
static const int ERROR_SERVER_SHUTDOWN_IN_PROGRESS 1255L

//
// MessageId: ERROR_HOST_DOWN
//
// MessageText:
//
// The remote system is not available. For information about network troubleshooting, see Windows Help.
//
static const int ERROR_HOST_DOWN                  1256L

//
// MessageId: ERROR_NON_ACCOUNT_SID
//
// MessageText:
//
// The security identifier provided is not from an account domain.
//
static const int ERROR_NON_ACCOUNT_SID            1257L

//
// MessageId: ERROR_NON_DOMAIN_SID
//
// MessageText:
//
// The security identifier provided does not have a domain component.
//
static const int ERROR_NON_DOMAIN_SID             1258L

//
// MessageId: ERROR_APPHELP_BLOCK
//
// MessageText:
//
// AppHelp dialog canceled thus preventing the application from starting.
//
static const int ERROR_APPHELP_BLOCK              1259L

//
// MessageId: ERROR_ACCESS_DISABLED_BY_POLICY
//
// MessageText:
//
// This program is blocked by group policy. For more information, contact your system administrator.
//
static const int ERROR_ACCESS_DISABLED_BY_POLICY  1260L

//
// MessageId: ERROR_REG_NAT_CONSUMPTION
//
// MessageText:
//
// A program attempt to use an invalid register value. Normally caused by an uninitialized register. This error is Itanium specific.
//
static const int ERROR_REG_NAT_CONSUMPTION        1261L

//
// MessageId: ERROR_CSCSHARE_OFFLINE
//
// MessageText:
//
// The share is currently offline or does not exist.
//
static const int ERROR_CSCSHARE_OFFLINE           1262L

//
// MessageId: ERROR_PKINIT_FAILURE
//
// MessageText:
//
// The Kerberos protocol encountered an error while validating the KDC certificate during smartcard logon. There is more information in the system event log.
//
static const int ERROR_PKINIT_FAILURE             1263L

//
// MessageId: ERROR_SMARTCARD_SUBSYSTEM_FAILURE
//
// MessageText:
//
// The Kerberos protocol encountered an error while attempting to utilize the smartcard subsystem.
//
static const int ERROR_SMARTCARD_SUBSYSTEM_FAILURE 1264L

//
// MessageId: ERROR_DOWNGRADE_DETECTED
//
// MessageText:
//
// The system cannot contact a domain controller to service the authentication request. Please try again later.
//
static const int ERROR_DOWNGRADE_DETECTED         1265L

//
// Do not use ID's 1266 - 1270 as the symbolicNames have been moved to SEC_E_*
//
//
// MessageId: ERROR_MACHINE_LOCKED
//
// MessageText:
//
// The machine is locked and cannot be shut down without the force option.
//
static const int ERROR_MACHINE_LOCKED             1271L

//
// MessageId: ERROR_SMB_GUEST_LOGON_BLOCKED
//
// MessageText:
//
// You can't access this shared folder because your organization's security policies block unauthenticated guest access. These policies help protect your PC from unsafe or malicious devices on the network.
//
static const int ERROR_SMB_GUEST_LOGON_BLOCKED    1272L

//
// MessageId: ERROR_CALLBACK_SUPPLIED_INVALID_DATA
//
// MessageText:
//
// An application-defined callback gave invalid data when called.
//
static const int ERROR_CALLBACK_SUPPLIED_INVALID_DATA 1273L

//
// MessageId: ERROR_SYNC_FOREGROUND_REFRESH_REQUIRED
//
// MessageText:
//
// The group policy framework should call the extension in the synchronous foreground policy refresh.
//
static const int ERROR_SYNC_FOREGROUND_REFRESH_REQUIRED 1274L

//
// MessageId: ERROR_DRIVER_BLOCKED
//
// MessageText:
//
// This driver has been blocked from loading
//
static const int ERROR_DRIVER_BLOCKED             1275L

//
// MessageId: ERROR_INVALID_IMPORT_OF_NON_DLL
//
// MessageText:
//
// A dynamic link library (DLL) referenced a module that was neither a DLL nor the process's executable image.
//
static const int ERROR_INVALID_IMPORT_OF_NON_DLL  1276L

//
// MessageId: ERROR_ACCESS_DISABLED_WEBBLADE
//
// MessageText:
//
// Windows cannot open this program since it has been disabled.
//
static const int ERROR_ACCESS_DISABLED_WEBBLADE   1277L

//
// MessageId: ERROR_ACCESS_DISABLED_WEBBLADE_TAMPER
//
// MessageText:
//
// Windows cannot open this program because the license enforcement system has been tampered with or become corrupted.
//
static const int ERROR_ACCESS_DISABLED_WEBBLADE_TAMPER 1278L

//
// MessageId: ERROR_RECOVERY_FAILURE
//
// MessageText:
//
// A transaction recover failed.
//
static const int ERROR_RECOVERY_FAILURE           1279L

//
// MessageId: ERROR_ALREADY_FIBER
//
// MessageText:
//
// The current thread has already been converted to a fiber.
//
static const int ERROR_ALREADY_FIBER              1280L

//
// MessageId: ERROR_ALREADY_THREAD
//
// MessageText:
//
// The current thread has already been converted from a fiber.
//
static const int ERROR_ALREADY_THREAD             1281L

//
// MessageId: ERROR_STACK_BUFFER_OVERRUN
//
// MessageText:
//
// The system detected an overrun of a stack-based buffer in this application. This overrun could potentially allow a malicious user to gain control of this application.
//
static const int ERROR_STACK_BUFFER_OVERRUN       1282L

//
// MessageId: ERROR_PARAMETER_QUOTA_EXCEEDED
//
// MessageText:
//
// Data present in one of the parameters is more than the function can operate on.
//
static const int ERROR_PARAMETER_QUOTA_EXCEEDED   1283L

//
// MessageId: ERROR_DEBUGGER_INACTIVE
//
// MessageText:
//
// An attempt to do an operation on a debug object failed because the object is in the process of being deleted.
//
static const int ERROR_DEBUGGER_INACTIVE          1284L

//
// MessageId: ERROR_DELAY_LOAD_FAILED
//
// MessageText:
//
// An attempt to delay-load a .dll or get a function address in a delay-loaded .dll failed.
//
static const int ERROR_DELAY_LOAD_FAILED          1285L

//
// MessageId: ERROR_VDM_DISALLOWED
//
// MessageText:
//
// %1 is a 16-bit application. You do not have permissions to execute 16-bit applications. Check your permissions with your system administrator.
//
static const int ERROR_VDM_DISALLOWED             1286L

//
// MessageId: ERROR_UNIDENTIFIED_ERROR
//
// MessageText:
//
// Insufficient information exists to identify the cause of failure.
//
static const int ERROR_UNIDENTIFIED_ERROR         1287L

//
// MessageId: ERROR_INVALID_CRUNTIME_PARAMETER
//
// MessageText:
//
// The parameter passed to a C runtime function is incorrect.
//
static const int ERROR_INVALID_CRUNTIME_PARAMETER 1288L

//
// MessageId: ERROR_BEYOND_VDL
//
// MessageText:
//
// The operation occurred beyond the valid data length of the file.
//
static const int ERROR_BEYOND_VDL                 1289L

//
// MessageId: ERROR_INCOMPATIBLE_SERVICE_SID_TYPE
//
// MessageText:
//
// The service start failed since one or more services in the same process have an incompatible service SID type setting. A service with restricted service SID type can only coexist in the same process with other services with a restricted SID type. If the service SID type for this service was just configured, the hosting process must be restarted in order to start this service.
//
static const int ERROR_INCOMPATIBLE_SERVICE_SID_TYPE 1290L

//
// MessageId: ERROR_DRIVER_PROCESS_TERMINATED
//
// MessageText:
//
// The process hosting the driver for this device has been terminated.
//
static const int ERROR_DRIVER_PROCESS_TERMINATED  1291L

//
// MessageId: ERROR_IMPLEMENTATION_LIMIT
//
// MessageText:
//
// An operation attempted to exceed an implementation-defined limit.
//
static const int ERROR_IMPLEMENTATION_LIMIT       1292L

//
// MessageId: ERROR_PROCESS_IS_PROTECTED
//
// MessageText:
//
// Either the target process, or the target thread's containing process, is a protected process.
//
static const int ERROR_PROCESS_IS_PROTECTED       1293L

//
// MessageId: ERROR_SERVICE_NOTIFY_CLIENT_LAGGING
//
// MessageText:
//
// The service notification client is lagging too far behind the current state of services in the machine.
//
static const int ERROR_SERVICE_NOTIFY_CLIENT_LAGGING 1294L

//
// MessageId: ERROR_DISK_QUOTA_EXCEEDED
//
// MessageText:
//
// The requested file operation failed because the storage quota was exceeded.
// To free up disk space, move files to a different location or delete unnecessary files. For more information, contact your system administrator.
//
static const int ERROR_DISK_QUOTA_EXCEEDED        1295L

//
// MessageId: ERROR_CONTENT_BLOCKED
//
// MessageText:
//
// The requested file operation failed because the storage policy blocks that type of file. For more information, contact your system administrator.
//
static const int ERROR_CONTENT_BLOCKED            1296L

//
// MessageId: ERROR_INCOMPATIBLE_SERVICE_PRIVILEGE
//
// MessageText:
//
// A privilege that the service requires to function properly does not exist in the service account configuration.
// You may use the Services Microsoft Management Console (MMC) snap-in (services.msc) and the Local Security Settings MMC snap-in (secpol.msc) to view the service configuration and the account configuration.
//
static const int ERROR_INCOMPATIBLE_SERVICE_PRIVILEGE 1297L

//
// MessageId: ERROR_APP_HANG
//
// MessageText:
//
// A thread involved in this operation appears to be unresponsive.
//
static const int ERROR_APP_HANG                   1298L


///////////////////////////////////////////////////
//                                               //
//             SECURITY Error codes              //
//                                               //
//                 1299 to 1399                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_INVALID_LABEL
//
// MessageText:
//
// Indicates a particular Security ID may not be assigned as the label of an object.
//
static const int ERROR_INVALID_LABEL              1299L

//
// MessageId: ERROR_NOT_ALL_ASSIGNED
//
// MessageText:
//
// Not all privileges or groups referenced are assigned to the caller.
//
static const int ERROR_NOT_ALL_ASSIGNED           1300L

//
// MessageId: ERROR_SOME_NOT_MAPPED
//
// MessageText:
//
// Some mapping between account names and security IDs was not done.
//
static const int ERROR_SOME_NOT_MAPPED            1301L

//
// MessageId: ERROR_NO_QUOTAS_FOR_ACCOUNT
//
// MessageText:
//
// No system quota limits are specifically set for this account.
//
static const int ERROR_NO_QUOTAS_FOR_ACCOUNT      1302L

//
// MessageId: ERROR_LOCAL_USER_SESSION_KEY
//
// MessageText:
//
// No encryption key is available. A well-known encryption key was returned.
//
static const int ERROR_LOCAL_USER_SESSION_KEY     1303L

//
// MessageId: ERROR_NULL_LM_PASSWORD
//
// MessageText:
//
// The password is too complex to be converted to a LAN Manager password. The LAN Manager password returned is a NULL string.
//
static const int ERROR_NULL_LM_PASSWORD           1304L

//
// MessageId: ERROR_UNKNOWN_REVISION
//
// MessageText:
//
// The revision level is unknown.
//
static const int ERROR_UNKNOWN_REVISION           1305L

//
// MessageId: ERROR_REVISION_MISMATCH
//
// MessageText:
//
// Indicates two revision levels are incompatible.
//
static const int ERROR_REVISION_MISMATCH          1306L

//
// MessageId: ERROR_INVALID_OWNER
//
// MessageText:
//
// This security ID may not be assigned as the owner of this object.
//
static const int ERROR_INVALID_OWNER              1307L

//
// MessageId: ERROR_INVALID_PRIMARY_GROUP
//
// MessageText:
//
// This security ID may not be assigned as the primary group of an object.
//
static const int ERROR_INVALID_PRIMARY_GROUP      1308L

//
// MessageId: ERROR_NO_IMPERSONATION_TOKEN
//
// MessageText:
//
// An attempt has been made to operate on an impersonation token by a thread that is not currently impersonating a client.
//
static const int ERROR_NO_IMPERSONATION_TOKEN     1309L

//
// MessageId: ERROR_CANT_DISABLE_MANDATORY
//
// MessageText:
//
// The group may not be disabled.
//
static const int ERROR_CANT_DISABLE_MANDATORY     1310L

//
// MessageId: ERROR_NO_LOGON_SERVERS
//
// MessageText:
//
// We can't sign you in with this credential because your domain isn't available. Make sure your device is connected to your organization's network and try again. If you previously signed in on this device with another credential, you can sign in with that credential.
//
static const int ERROR_NO_LOGON_SERVERS           1311L

//
// MessageId: ERROR_NO_SUCH_LOGON_SESSION
//
// MessageText:
//
// A specified logon session does not exist. It may already have been terminated.
//
static const int ERROR_NO_SUCH_LOGON_SESSION      1312L

//
// MessageId: ERROR_NO_SUCH_PRIVILEGE
//
// MessageText:
//
// A specified privilege does not exist.
//
static const int ERROR_NO_SUCH_PRIVILEGE          1313L

//
// MessageId: ERROR_PRIVILEGE_NOT_HELD
//
// MessageText:
//
// A required privilege is not held by the client.
//
static const int ERROR_PRIVILEGE_NOT_HELD         1314L

//
// MessageId: ERROR_INVALID_ACCOUNT_NAME
//
// MessageText:
//
// The name provided is not a properly formed account name.
//
static const int ERROR_INVALID_ACCOUNT_NAME       1315L

//
// MessageId: ERROR_USER_EXISTS
//
// MessageText:
//
// The specified account already exists.
//
static const int ERROR_USER_EXISTS                1316L

//
// MessageId: ERROR_NO_SUCH_USER
//
// MessageText:
//
// The specified account does not exist.
//
static const int ERROR_NO_SUCH_USER               1317L

//
// MessageId: ERROR_GROUP_EXISTS
//
// MessageText:
//
// The specified group already exists.
//
static const int ERROR_GROUP_EXISTS               1318L

//
// MessageId: ERROR_NO_SUCH_GROUP
//
// MessageText:
//
// The specified group does not exist.
//
static const int ERROR_NO_SUCH_GROUP              1319L

//
// MessageId: ERROR_MEMBER_IN_GROUP
//
// MessageText:
//
// Either the specified user account is already a member of the specified group, or the specified group cannot be deleted because it contains a member.
//
static const int ERROR_MEMBER_IN_GROUP            1320L

//
// MessageId: ERROR_MEMBER_NOT_IN_GROUP
//
// MessageText:
//
// The specified user account is not a member of the specified group account.
//
static const int ERROR_MEMBER_NOT_IN_GROUP        1321L

//
// MessageId: ERROR_LAST_ADMIN
//
// MessageText:
//
// This operation is disallowed as it could result in an administration account being disabled, deleted or unable to logon.
//
static const int ERROR_LAST_ADMIN                 1322L

//
// MessageId: ERROR_WRONG_PASSWORD
//
// MessageText:
//
// Unable to update the password. The value provided as the current password is incorrect.
//
static const int ERROR_WRONG_PASSWORD             1323L

//
// MessageId: ERROR_ILL_FORMED_PASSWORD
//
// MessageText:
//
// Unable to update the password. The value provided for the new password contains values that are not allowed in passwords.
//
static const int ERROR_ILL_FORMED_PASSWORD        1324L

//
// MessageId: ERROR_PASSWORD_RESTRICTION
//
// MessageText:
//
// Unable to update the password. The value provided for the new password does not meet the length, complexity, or history requirements of the domain.
//
static const int ERROR_PASSWORD_RESTRICTION       1325L

//
// MessageId: ERROR_LOGON_FAILURE
//
// MessageText:
//
// The user name or password is incorrect.
//
static const int ERROR_LOGON_FAILURE              1326L

//
// MessageId: ERROR_ACCOUNT_RESTRICTION
//
// MessageText:
//
// Account restrictions are preventing this user from signing in. For example: blank passwords aren't allowed, sign-in times are limited, or a policy restriction has been enforced.
//
static const int ERROR_ACCOUNT_RESTRICTION        1327L

//
// MessageId: ERROR_INVALID_LOGON_HOURS
//
// MessageText:
//
// Your account has time restrictions that keep you from signing in right now.
//
static const int ERROR_INVALID_LOGON_HOURS        1328L

//
// MessageId: ERROR_INVALID_WORKSTATION
//
// MessageText:
//
// This user isn't allowed to sign in to this computer.
//
static const int ERROR_INVALID_WORKSTATION        1329L

//
// MessageId: ERROR_PASSWORD_EXPIRED
//
// MessageText:
//
// The password for this account has expired.
//
static const int ERROR_PASSWORD_EXPIRED           1330L

//
// MessageId: ERROR_ACCOUNT_DISABLED
//
// MessageText:
//
// This user can't sign in because this account is currently disabled.
//
static const int ERROR_ACCOUNT_DISABLED           1331L

//
// MessageId: ERROR_NONE_MAPPED
//
// MessageText:
//
// No mapping between account names and security IDs was done.
//
static const int ERROR_NONE_MAPPED                1332L

//
// MessageId: ERROR_TOO_MANY_LUIDS_REQUESTED
//
// MessageText:
//
// Too many local user identifiers (LUIDs) were requested at one time.
//
static const int ERROR_TOO_MANY_LUIDS_REQUESTED   1333L

//
// MessageId: ERROR_LUIDS_EXHAUSTED
//
// MessageText:
//
// No more local user identifiers (LUIDs) are available.
//
static const int ERROR_LUIDS_EXHAUSTED            1334L

//
// MessageId: ERROR_INVALID_SUB_AUTHORITY
//
// MessageText:
//
// The subauthority part of a security ID is invalid for this particular use.
//
static const int ERROR_INVALID_SUB_AUTHORITY      1335L

//
// MessageId: ERROR_INVALID_ACL
//
// MessageText:
//
// The access control list (ACL) structure is invalid.
//
static const int ERROR_INVALID_ACL                1336L

//
// MessageId: ERROR_INVALID_SID
//
// MessageText:
//
// The security ID structure is invalid.
//
static const int ERROR_INVALID_SID                1337L

//
// MessageId: ERROR_INVALID_SECURITY_DESCR
//
// MessageText:
//
// The security descriptor structure is invalid.
//
static const int ERROR_INVALID_SECURITY_DESCR     1338L

//
// MessageId: ERROR_BAD_INHERITANCE_ACL
//
// MessageText:
//
// The inherited access control list (ACL) or access control entry (ACE) could not be built.
//
static const int ERROR_BAD_INHERITANCE_ACL        1340L

//
// MessageId: ERROR_SERVER_DISABLED
//
// MessageText:
//
// The server is currently disabled.
//
static const int ERROR_SERVER_DISABLED            1341L

//
// MessageId: ERROR_SERVER_NOT_DISABLED
//
// MessageText:
//
// The server is currently enabled.
//
static const int ERROR_SERVER_NOT_DISABLED        1342L

//
// MessageId: ERROR_INVALID_ID_AUTHORITY
//
// MessageText:
//
// The value provided was an invalid value for an identifier authority.
//
static const int ERROR_INVALID_ID_AUTHORITY       1343L

//
// MessageId: ERROR_ALLOTTED_SPACE_EXCEEDED
//
// MessageText:
//
// No more memory is available for security information updates.
//
static const int ERROR_ALLOTTED_SPACE_EXCEEDED    1344L

//
// MessageId: ERROR_INVALID_GROUP_ATTRIBUTES
//
// MessageText:
//
// The specified attributes are invalid, or incompatible with the attributes for the group as a whole.
//
static const int ERROR_INVALID_GROUP_ATTRIBUTES   1345L

//
// MessageId: ERROR_BAD_IMPERSONATION_LEVEL
//
// MessageText:
//
// Either a required impersonation level was not provided, or the provided impersonation level is invalid.
//
static const int ERROR_BAD_IMPERSONATION_LEVEL    1346L

//
// MessageId: ERROR_CANT_OPEN_ANONYMOUS
//
// MessageText:
//
// Cannot open an anonymous level security token.
//
static const int ERROR_CANT_OPEN_ANONYMOUS        1347L

//
// MessageId: ERROR_BAD_VALIDATION_CLASS
//
// MessageText:
//
// The validation information class requested was invalid.
//
static const int ERROR_BAD_VALIDATION_CLASS       1348L

//
// MessageId: ERROR_BAD_TOKEN_TYPE
//
// MessageText:
//
// The type of the token is inappropriate for its attempted use.
//
static const int ERROR_BAD_TOKEN_TYPE             1349L

//
// MessageId: ERROR_NO_SECURITY_ON_OBJECT
//
// MessageText:
//
// Unable to perform a security operation on an object that has no associated security.
//
static const int ERROR_NO_SECURITY_ON_OBJECT      1350L

//
// MessageId: ERROR_CANT_ACCESS_DOMAIN_INFO
//
// MessageText:
//
// Configuration information could not be read from the domain controller, either because the machine is unavailable, or access has been denied.
//
static const int ERROR_CANT_ACCESS_DOMAIN_INFO    1351L

//
// MessageId: ERROR_INVALID_SERVER_STATE
//
// MessageText:
//
// The security account manager (SAM) or local security authority (LSA) server was in the wrong state to perform the security operation.
//
static const int ERROR_INVALID_SERVER_STATE       1352L

//
// MessageId: ERROR_INVALID_DOMAIN_STATE
//
// MessageText:
//
// The domain was in the wrong state to perform the security operation.
//
static const int ERROR_INVALID_DOMAIN_STATE       1353L

//
// MessageId: ERROR_INVALID_DOMAIN_ROLE
//
// MessageText:
//
// This operation is only allowed for the Primary Domain Controller of the domain.
//
static const int ERROR_INVALID_DOMAIN_ROLE        1354L

//
// MessageId: ERROR_NO_SUCH_DOMAIN
//
// MessageText:
//
// The specified domain either does not exist or could not be contacted.
//
static const int ERROR_NO_SUCH_DOMAIN             1355L

//
// MessageId: ERROR_DOMAIN_EXISTS
//
// MessageText:
//
// The specified domain already exists.
//
static const int ERROR_DOMAIN_EXISTS              1356L

//
// MessageId: ERROR_DOMAIN_LIMIT_EXCEEDED
//
// MessageText:
//
// An attempt was made to exceed the limit on the number of domains per server.
//
static const int ERROR_DOMAIN_LIMIT_EXCEEDED      1357L

//
// MessageId: ERROR_INTERNAL_DB_CORRUPTION
//
// MessageText:
//
// Unable to complete the requested operation because of either a catastrophic media failure or a data structure corruption on the disk.
//
static const int ERROR_INTERNAL_DB_CORRUPTION     1358L

//
// MessageId: ERROR_INTERNAL_ERROR
//
// MessageText:
//
// An internal error occurred.
//
static const int ERROR_INTERNAL_ERROR             1359L

//
// MessageId: ERROR_GENERIC_NOT_MAPPED
//
// MessageText:
//
// Generic access types were contained in an access mask which should already be mapped to nongeneric types.
//
static const int ERROR_GENERIC_NOT_MAPPED         1360L

//
// MessageId: ERROR_BAD_DESCRIPTOR_FORMAT
//
// MessageText:
//
// A security descriptor is not in the right format (absolute or self-relative).
//
static const int ERROR_BAD_DESCRIPTOR_FORMAT      1361L

//
// MessageId: ERROR_NOT_LOGON_PROCESS
//
// MessageText:
//
// The requested action is restricted for use by logon processes only. The calling process has not registered as a logon process.
//
static const int ERROR_NOT_LOGON_PROCESS          1362L

//
// MessageId: ERROR_LOGON_SESSION_EXISTS
//
// MessageText:
//
// Cannot start a new logon session with an ID that is already in use.
//
static const int ERROR_LOGON_SESSION_EXISTS       1363L

//
// MessageId: ERROR_NO_SUCH_PACKAGE
//
// MessageText:
//
// A specified authentication package is unknown.
//
static const int ERROR_NO_SUCH_PACKAGE            1364L

//
// MessageId: ERROR_BAD_LOGON_SESSION_STATE
//
// MessageText:
//
// The logon session is not in a state that is consistent with the requested operation.
//
static const int ERROR_BAD_LOGON_SESSION_STATE    1365L

//
// MessageId: ERROR_LOGON_SESSION_COLLISION
//
// MessageText:
//
// The logon session ID is already in use.
//
static const int ERROR_LOGON_SESSION_COLLISION    1366L

//
// MessageId: ERROR_INVALID_LOGON_TYPE
//
// MessageText:
//
// A logon request contained an invalid logon type value.
//
static const int ERROR_INVALID_LOGON_TYPE         1367L

//
// MessageId: ERROR_CANNOT_IMPERSONATE
//
// MessageText:
//
// Unable to impersonate using a named pipe until data has been read from that pipe.
//
static const int ERROR_CANNOT_IMPERSONATE         1368L

//
// MessageId: ERROR_RXACT_INVALID_STATE
//
// MessageText:
//
// The transaction state of a registry subtree is incompatible with the requested operation.
//
static const int ERROR_RXACT_INVALID_STATE        1369L

//
// MessageId: ERROR_RXACT_COMMIT_FAILURE
//
// MessageText:
//
// An internal security database corruption has been encountered.
//
static const int ERROR_RXACT_COMMIT_FAILURE       1370L

//
// MessageId: ERROR_SPECIAL_ACCOUNT
//
// MessageText:
//
// Cannot perform this operation on built-in accounts.
//
static const int ERROR_SPECIAL_ACCOUNT            1371L

//
// MessageId: ERROR_SPECIAL_GROUP
//
// MessageText:
//
// Cannot perform this operation on this built-in special group.
//
static const int ERROR_SPECIAL_GROUP              1372L

//
// MessageId: ERROR_SPECIAL_USER
//
// MessageText:
//
// Cannot perform this operation on this built-in special user.
//
static const int ERROR_SPECIAL_USER               1373L

//
// MessageId: ERROR_MEMBERS_PRIMARY_GROUP
//
// MessageText:
//
// The user cannot be removed from a group because the group is currently the user's primary group.
//
static const int ERROR_MEMBERS_PRIMARY_GROUP      1374L

//
// MessageId: ERROR_TOKEN_ALREADY_IN_USE
//
// MessageText:
//
// The token is already in use as a primary token.
//
static const int ERROR_TOKEN_ALREADY_IN_USE       1375L

//
// MessageId: ERROR_NO_SUCH_ALIAS
//
// MessageText:
//
// The specified local group does not exist.
//
static const int ERROR_NO_SUCH_ALIAS              1376L

//
// MessageId: ERROR_MEMBER_NOT_IN_ALIAS
//
// MessageText:
//
// The specified account name is not a member of the group.
//
static const int ERROR_MEMBER_NOT_IN_ALIAS        1377L

//
// MessageId: ERROR_MEMBER_IN_ALIAS
//
// MessageText:
//
// The specified account name is already a member of the group.
//
static const int ERROR_MEMBER_IN_ALIAS            1378L

//
// MessageId: ERROR_ALIAS_EXISTS
//
// MessageText:
//
// The specified local group already exists.
//
static const int ERROR_ALIAS_EXISTS               1379L

//
// MessageId: ERROR_LOGON_NOT_GRANTED
//
// MessageText:
//
// Logon failure: the user has not been granted the requested logon type at this computer.
//
static const int ERROR_LOGON_NOT_GRANTED          1380L

//
// MessageId: ERROR_TOO_MANY_SECRETS
//
// MessageText:
//
// The maximum number of secrets that may be stored in a single system has been exceeded.
//
static const int ERROR_TOO_MANY_SECRETS           1381L

//
// MessageId: ERROR_SECRET_TOO_LONG
//
// MessageText:
//
// The length of a secret exceeds the maximum length allowed.
//
static const int ERROR_SECRET_TOO_LONG            1382L

//
// MessageId: ERROR_INTERNAL_DB_ERROR
//
// MessageText:
//
// The local security authority database contains an internal inconsistency.
//
static const int ERROR_INTERNAL_DB_ERROR          1383L

//
// MessageId: ERROR_TOO_MANY_CONTEXT_IDS
//
// MessageText:
//
// During a logon attempt, the user's security context accumulated too many security IDs.
//
static const int ERROR_TOO_MANY_CONTEXT_IDS       1384L

//
// MessageId: ERROR_LOGON_TYPE_NOT_GRANTED
//
// MessageText:
//
// Logon failure: the user has not been granted the requested logon type at this computer.
//
static const int ERROR_LOGON_TYPE_NOT_GRANTED     1385L

//
// MessageId: ERROR_NT_CROSS_ENCRYPTION_REQUIRED
//
// MessageText:
//
// A cross-encrypted password is necessary to change a user password.
//
static const int ERROR_NT_CROSS_ENCRYPTION_REQUIRED 1386L

//
// MessageId: ERROR_NO_SUCH_MEMBER
//
// MessageText:
//
// A member could not be added to or removed from the local group because the member does not exist.
//
static const int ERROR_NO_SUCH_MEMBER             1387L

//
// MessageId: ERROR_INVALID_MEMBER
//
// MessageText:
//
// A new member could not be added to a local group because the member has the wrong account type.
//
static const int ERROR_INVALID_MEMBER             1388L

//
// MessageId: ERROR_TOO_MANY_SIDS
//
// MessageText:
//
// Too many security IDs have been specified.
//
static const int ERROR_TOO_MANY_SIDS              1389L

//
// MessageId: ERROR_LM_CROSS_ENCRYPTION_REQUIRED
//
// MessageText:
//
// A cross-encrypted password is necessary to change this user password.
//
static const int ERROR_LM_CROSS_ENCRYPTION_REQUIRED 1390L

//
// MessageId: ERROR_NO_INHERITANCE
//
// MessageText:
//
// Indicates an ACL contains no inheritable components.
//
static const int ERROR_NO_INHERITANCE             1391L

//
// MessageId: ERROR_FILE_CORRUPT
//
// MessageText:
//
// The file or directory is corrupted and unreadable.
//
static const int ERROR_FILE_CORRUPT               1392L

//
// MessageId: ERROR_DISK_CORRUPT
//
// MessageText:
//
// The disk structure is corrupted and unreadable.
//
static const int ERROR_DISK_CORRUPT               1393L

//
// MessageId: ERROR_NO_USER_SESSION_KEY
//
// MessageText:
//
// There is no user session key for the specified logon session.
//
static const int ERROR_NO_USER_SESSION_KEY        1394L

//
// MessageId: ERROR_LICENSE_QUOTA_EXCEEDED
//
// MessageText:
//
// The service being accessed is licensed for a particular number of connections. No more connections can be made to the service at this time because there are already as many connections as the service can accept.
//
static const int ERROR_LICENSE_QUOTA_EXCEEDED     1395L

//
// MessageId: ERROR_WRONG_TARGET_NAME
//
// MessageText:
//
// The target account name is incorrect.
//
static const int ERROR_WRONG_TARGET_NAME          1396L

//
// MessageId: ERROR_MUTUAL_AUTH_FAILED
//
// MessageText:
//
// Mutual Authentication failed. The server's password is out of date at the domain controller.
//
static const int ERROR_MUTUAL_AUTH_FAILED         1397L

//
// MessageId: ERROR_TIME_SKEW
//
// MessageText:
//
// There is a time and/or date difference between the client and server.
//
static const int ERROR_TIME_SKEW                  1398L

//
// MessageId: ERROR_CURRENT_DOMAIN_NOT_ALLOWED
//
// MessageText:
//
// This operation cannot be performed on the current domain.
//
static const int ERROR_CURRENT_DOMAIN_NOT_ALLOWED 1399L


///////////////////////////////////////////////////
//                                               //
//              WinUser Error codes              //
//                                               //
//                 1400 to 1499                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_INVALID_WINDOW_HANDLE
//
// MessageText:
//
// Invalid window handle.
//
static const int ERROR_INVALID_WINDOW_HANDLE      1400L

//
// MessageId: ERROR_INVALID_MENU_HANDLE
//
// MessageText:
//
// Invalid menu handle.
//
static const int ERROR_INVALID_MENU_HANDLE        1401L

//
// MessageId: ERROR_INVALID_CURSOR_HANDLE
//
// MessageText:
//
// Invalid cursor handle.
//
static const int ERROR_INVALID_CURSOR_HANDLE      1402L

//
// MessageId: ERROR_INVALID_ACCEL_HANDLE
//
// MessageText:
//
// Invalid accelerator table handle.
//
static const int ERROR_INVALID_ACCEL_HANDLE       1403L

//
// MessageId: ERROR_INVALID_HOOK_HANDLE
//
// MessageText:
//
// Invalid hook handle.
//
static const int ERROR_INVALID_HOOK_HANDLE        1404L

//
// MessageId: ERROR_INVALID_DWP_HANDLE
//
// MessageText:
//
// Invalid handle to a multiple-window position structure.
//
static const int ERROR_INVALID_DWP_HANDLE         1405L

//
// MessageId: ERROR_TLW_WITH_WSCHILD
//
// MessageText:
//
// Cannot create a top-level child window.
//
static const int ERROR_TLW_WITH_WSCHILD           1406L

//
// MessageId: ERROR_CANNOT_FIND_WND_CLASS
//
// MessageText:
//
// Cannot find window class.
//
static const int ERROR_CANNOT_FIND_WND_CLASS      1407L

//
// MessageId: ERROR_WINDOW_OF_OTHER_THREAD
//
// MessageText:
//
// Invalid window; it belongs to other thread.
//
static const int ERROR_WINDOW_OF_OTHER_THREAD     1408L

//
// MessageId: ERROR_HOTKEY_ALREADY_REGISTERED
//
// MessageText:
//
// Hot key is already registered.
//
static const int ERROR_HOTKEY_ALREADY_REGISTERED  1409L

//
// MessageId: ERROR_CLASS_ALREADY_EXISTS
//
// MessageText:
//
// Class already exists.
//
static const int ERROR_CLASS_ALREADY_EXISTS       1410L

//
// MessageId: ERROR_CLASS_DOES_NOT_EXIST
//
// MessageText:
//
// Class does not exist.
//
static const int ERROR_CLASS_DOES_NOT_EXIST       1411L

//
// MessageId: ERROR_CLASS_HAS_WINDOWS
//
// MessageText:
//
// Class still has open windows.
//
static const int ERROR_CLASS_HAS_WINDOWS          1412L

//
// MessageId: ERROR_INVALID_INDEX
//
// MessageText:
//
// Invalid index.
//
static const int ERROR_INVALID_INDEX              1413L

//
// MessageId: ERROR_INVALID_ICON_HANDLE
//
// MessageText:
//
// Invalid icon handle.
//
static const int ERROR_INVALID_ICON_HANDLE        1414L

//
// MessageId: ERROR_PRIVATE_DIALOG_INDEX
//
// MessageText:
//
// Using private DIALOG window words.
//
static const int ERROR_PRIVATE_DIALOG_INDEX       1415L

//
// MessageId: ERROR_LISTBOX_ID_NOT_FOUND
//
// MessageText:
//
// The list box identifier was not found.
//
static const int ERROR_LISTBOX_ID_NOT_FOUND       1416L

//
// MessageId: ERROR_NO_WILDCARD_CHARACTERS
//
// MessageText:
//
// No wildcards were found.
//
static const int ERROR_NO_WILDCARD_CHARACTERS     1417L

//
// MessageId: ERROR_CLIPBOARD_NOT_OPEN
//
// MessageText:
//
// Thread does not have a clipboard open.
//
static const int ERROR_CLIPBOARD_NOT_OPEN         1418L

//
// MessageId: ERROR_HOTKEY_NOT_REGISTERED
//
// MessageText:
//
// Hot key is not registered.
//
static const int ERROR_HOTKEY_NOT_REGISTERED      1419L

//
// MessageId: ERROR_WINDOW_NOT_DIALOG
//
// MessageText:
//
// The window is not a valid dialog window.
//
static const int ERROR_WINDOW_NOT_DIALOG          1420L

//
// MessageId: ERROR_CONTROL_ID_NOT_FOUND
//
// MessageText:
//
// Control ID not found.
//
static const int ERROR_CONTROL_ID_NOT_FOUND       1421L

//
// MessageId: ERROR_INVALID_COMBOBOX_MESSAGE
//
// MessageText:
//
// Invalid message for a combo box because it does not have an edit control.
//
static const int ERROR_INVALID_COMBOBOX_MESSAGE   1422L

//
// MessageId: ERROR_WINDOW_NOT_COMBOBOX
//
// MessageText:
//
// The window is not a combo box.
//
static const int ERROR_WINDOW_NOT_COMBOBOX        1423L

//
// MessageId: ERROR_INVALID_EDIT_HEIGHT
//
// MessageText:
//
// Height must be less than 256.
//
static const int ERROR_INVALID_EDIT_HEIGHT        1424L

//
// MessageId: ERROR_DC_NOT_FOUND
//
// MessageText:
//
// Invalid device context (DC) handle.
//
static const int ERROR_DC_NOT_FOUND               1425L

//
// MessageId: ERROR_INVALID_HOOK_FILTER
//
// MessageText:
//
// Invalid hook procedure type.
//
static const int ERROR_INVALID_HOOK_FILTER        1426L

//
// MessageId: ERROR_INVALID_FILTER_PROC
//
// MessageText:
//
// Invalid hook procedure.
//
static const int ERROR_INVALID_FILTER_PROC        1427L

//
// MessageId: ERROR_HOOK_NEEDS_HMOD
//
// MessageText:
//
// Cannot set nonlocal hook without a module handle.
//
static const int ERROR_HOOK_NEEDS_HMOD            1428L

//
// MessageId: ERROR_GLOBAL_ONLY_HOOK
//
// MessageText:
//
// This hook procedure can only be set globally.
//
static const int ERROR_GLOBAL_ONLY_HOOK           1429L

//
// MessageId: ERROR_JOURNAL_HOOK_SET
//
// MessageText:
//
// The journal hook procedure is already installed.
//
static const int ERROR_JOURNAL_HOOK_SET           1430L

//
// MessageId: ERROR_HOOK_NOT_INSTALLED
//
// MessageText:
//
// The hook procedure is not installed.
//
static const int ERROR_HOOK_NOT_INSTALLED         1431L

//
// MessageId: ERROR_INVALID_LB_MESSAGE
//
// MessageText:
//
// Invalid message for single-selection list box.
//
static const int ERROR_INVALID_LB_MESSAGE         1432L

//
// MessageId: ERROR_SETCOUNT_ON_BAD_LB
//
// MessageText:
//
// LB_SETCOUNT sent to non-lazy list box.
//
static const int ERROR_SETCOUNT_ON_BAD_LB         1433L

//
// MessageId: ERROR_LB_WITHOUT_TABSTOPS
//
// MessageText:
//
// This list box does not support tab stops.
//
static const int ERROR_LB_WITHOUT_TABSTOPS        1434L

//
// MessageId: ERROR_DESTROY_OBJECT_OF_OTHER_THREAD
//
// MessageText:
//
// Cannot destroy object created by another thread.
//
static const int ERROR_DESTROY_OBJECT_OF_OTHER_THREAD 1435L

//
// MessageId: ERROR_CHILD_WINDOW_MENU
//
// MessageText:
//
// Child windows cannot have menus.
//
static const int ERROR_CHILD_WINDOW_MENU          1436L

//
// MessageId: ERROR_NO_SYSTEM_MENU
//
// MessageText:
//
// The window does not have a system menu.
//
static const int ERROR_NO_SYSTEM_MENU             1437L

//
// MessageId: ERROR_INVALID_MSGBOX_STYLE
//
// MessageText:
//
// Invalid message box style.
//
static const int ERROR_INVALID_MSGBOX_STYLE       1438L

//
// MessageId: ERROR_INVALID_SPI_VALUE
//
// MessageText:
//
// Invalid system-wide (SPI_*) parameter.
//
static const int ERROR_INVALID_SPI_VALUE          1439L

//
// MessageId: ERROR_SCREEN_ALREADY_LOCKED
//
// MessageText:
//
// Screen already locked.
//
static const int ERROR_SCREEN_ALREADY_LOCKED      1440L

//
// MessageId: ERROR_HWNDS_HAVE_DIFF_PARENT
//
// MessageText:
//
// All handles to windows in a multiple-window position structure must have the same parent.
//
static const int ERROR_HWNDS_HAVE_DIFF_PARENT     1441L

//
// MessageId: ERROR_NOT_CHILD_WINDOW
//
// MessageText:
//
// The window is not a child window.
//
static const int ERROR_NOT_CHILD_WINDOW           1442L

//
// MessageId: ERROR_INVALID_GW_COMMAND
//
// MessageText:
//
// Invalid GW_* command.
//
static const int ERROR_INVALID_GW_COMMAND         1443L

//
// MessageId: ERROR_INVALID_THREAD_ID
//
// MessageText:
//
// Invalid thread identifier.
//
static const int ERROR_INVALID_THREAD_ID          1444L

//
// MessageId: ERROR_NON_MDICHILD_WINDOW
//
// MessageText:
//
// Cannot process a message from a window that is not a multiple document interface (MDI) window.
//
static const int ERROR_NON_MDICHILD_WINDOW        1445L

//
// MessageId: ERROR_POPUP_ALREADY_ACTIVE
//
// MessageText:
//
// Popup menu already active.
//
static const int ERROR_POPUP_ALREADY_ACTIVE       1446L

//
// MessageId: ERROR_NO_SCROLLBARS
//
// MessageText:
//
// The window does not have scroll bars.
//
static const int ERROR_NO_SCROLLBARS              1447L

//
// MessageId: ERROR_INVALID_SCROLLBAR_RANGE
//
// MessageText:
//
// Scroll bar range cannot be greater than MAXLONG.
//
static const int ERROR_INVALID_SCROLLBAR_RANGE    1448L

//
// MessageId: ERROR_INVALID_SHOWWIN_COMMAND
//
// MessageText:
//
// Cannot show or remove the window in the way specified.
//
static const int ERROR_INVALID_SHOWWIN_COMMAND    1449L

//
// MessageId: ERROR_NO_SYSTEM_RESOURCES
//
// MessageText:
//
// Insufficient system resources exist to complete the requested service.
//
static const int ERROR_NO_SYSTEM_RESOURCES        1450L

//
// MessageId: ERROR_NONPAGED_SYSTEM_RESOURCES
//
// MessageText:
//
// Insufficient system resources exist to complete the requested service.
//
static const int ERROR_NONPAGED_SYSTEM_RESOURCES  1451L

//
// MessageId: ERROR_PAGED_SYSTEM_RESOURCES
//
// MessageText:
//
// Insufficient system resources exist to complete the requested service.
//
static const int ERROR_PAGED_SYSTEM_RESOURCES     1452L

//
// MessageId: ERROR_WORKING_SET_QUOTA
//
// MessageText:
//
// Insufficient quota to complete the requested service.
//
static const int ERROR_WORKING_SET_QUOTA          1453L

//
// MessageId: ERROR_PAGEFILE_QUOTA
//
// MessageText:
//
// Insufficient quota to complete the requested service.
//
static const int ERROR_PAGEFILE_QUOTA             1454L

//
// MessageId: ERROR_COMMITMENT_LIMIT
//
// MessageText:
//
// The paging file is too small for this operation to complete.
//
static const int ERROR_COMMITMENT_LIMIT           1455L

//
// MessageId: ERROR_MENU_ITEM_NOT_FOUND
//
// MessageText:
//
// A menu item was not found.
//
static const int ERROR_MENU_ITEM_NOT_FOUND        1456L

//
// MessageId: ERROR_INVALID_KEYBOARD_HANDLE
//
// MessageText:
//
// Invalid keyboard layout handle.
//
static const int ERROR_INVALID_KEYBOARD_HANDLE    1457L

//
// MessageId: ERROR_HOOK_TYPE_NOT_ALLOWED
//
// MessageText:
//
// Hook type not allowed.
//
static const int ERROR_HOOK_TYPE_NOT_ALLOWED      1458L

//
// MessageId: ERROR_REQUIRES_INTERACTIVE_WINDOWSTATION
//
// MessageText:
//
// This operation requires an interactive window station.
//
static const int ERROR_REQUIRES_INTERACTIVE_WINDOWSTATION 1459L

//
// MessageId: ERROR_TIMEOUT
//
// MessageText:
//
// This operation returned because the timeout period expired.
//
static const int ERROR_TIMEOUT                    1460L

//
// MessageId: ERROR_INVALID_MONITOR_HANDLE
//
// MessageText:
//
// Invalid monitor handle.
//
static const int ERROR_INVALID_MONITOR_HANDLE     1461L

//
// MessageId: ERROR_INCORRECT_SIZE
//
// MessageText:
//
// Incorrect size argument.
//
static const int ERROR_INCORRECT_SIZE             1462L

//
// MessageId: ERROR_SYMLINK_CLASS_DISABLED
//
// MessageText:
//
// The symbolic link cannot be followed because its type is disabled.
//
static const int ERROR_SYMLINK_CLASS_DISABLED     1463L

//
// MessageId: ERROR_SYMLINK_NOT_SUPPORTED
//
// MessageText:
//
// This application does not support the current operation on symbolic links.
//
static const int ERROR_SYMLINK_NOT_SUPPORTED      1464L

//
// MessageId: ERROR_XML_PARSE_ERROR
//
// MessageText:
//
// Windows was unable to parse the requested XML data.
//
static const int ERROR_XML_PARSE_ERROR            1465L

//
// MessageId: ERROR_XMLDSIG_ERROR
//
// MessageText:
//
// An error was encountered while processing an XML digital signature.
//
static const int ERROR_XMLDSIG_ERROR              1466L

//
// MessageId: ERROR_RESTART_APPLICATION
//
// MessageText:
//
// This application must be restarted.
//
static const int ERROR_RESTART_APPLICATION        1467L

//
// MessageId: ERROR_WRONG_COMPARTMENT
//
// MessageText:
//
// The caller made the connection request in the wrong routing compartment.
//
static const int ERROR_WRONG_COMPARTMENT          1468L

//
// MessageId: ERROR_AUTHIP_FAILURE
//
// MessageText:
//
// There was an AuthIP failure when attempting to connect to the remote host.
//
static const int ERROR_AUTHIP_FAILURE             1469L

//
// MessageId: ERROR_NO_NVRAM_RESOURCES
//
// MessageText:
//
// Insufficient NVRAM resources exist to complete the requested service. A reboot might be required.
//
static const int ERROR_NO_NVRAM_RESOURCES         1470L

//
// MessageId: ERROR_NOT_GUI_PROCESS
//
// MessageText:
//
// Unable to finish the requested operation because the specified process is not a GUI process.
//
static const int ERROR_NOT_GUI_PROCESS            1471L


///////////////////////////////////////////////////
//                                               //
//             EventLog Error codes              //
//                                               //
//                 1500 to 1549                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_EVENTLOG_FILE_CORRUPT
//
// MessageText:
//
// The event log file is corrupted.
//
static const int ERROR_EVENTLOG_FILE_CORRUPT      1500L

//
// MessageId: ERROR_EVENTLOG_CANT_START
//
// MessageText:
//
// No event log file could be opened, so the event logging service did not start.
//
static const int ERROR_EVENTLOG_CANT_START        1501L

//
// MessageId: ERROR_LOG_FILE_FULL
//
// MessageText:
//
// The event log file is full.
//
static const int ERROR_LOG_FILE_FULL              1502L

//
// MessageId: ERROR_EVENTLOG_FILE_CHANGED
//
// MessageText:
//
// The event log file has changed between read operations.
//
static const int ERROR_EVENTLOG_FILE_CHANGED      1503L

//
// MessageId: ERROR_CONTAINER_ASSIGNED
//
// MessageText:
//
// The specified Job already has a container assigned to it.
//
static const int ERROR_CONTAINER_ASSIGNED         1504L

//
// MessageId: ERROR_JOB_NO_CONTAINER
//
// MessageText:
//
// The specified Job does not have a container assigned to it.
//
static const int ERROR_JOB_NO_CONTAINER           1505L


///////////////////////////////////////////////////
//                                               //
//            Class Scheduler Error codes        //
//                                               //
//                 1550 to 1599                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_INVALID_TASK_NAME
//
// MessageText:
//
// The specified task name is invalid.
//
static const int ERROR_INVALID_TASK_NAME          1550L

//
// MessageId: ERROR_INVALID_TASK_INDEX
//
// MessageText:
//
// The specified task index is invalid.
//
static const int ERROR_INVALID_TASK_INDEX         1551L

//
// MessageId: ERROR_THREAD_ALREADY_IN_TASK
//
// MessageText:
//
// The specified thread is already joining a task.
//
static const int ERROR_THREAD_ALREADY_IN_TASK     1552L


///////////////////////////////////////////////////
//                                               //
//                MSI Error codes                //
//                                               //
//                 1600 to 1699                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_INSTALL_SERVICE_FAILURE
//
// MessageText:
//
// The Windows Installer Service could not be accessed. This can occur if the Windows Installer is not correctly installed. Contact your support personnel for assistance.
//
static const int ERROR_INSTALL_SERVICE_FAILURE    1601L

//
// MessageId: ERROR_INSTALL_USEREXIT
//
// MessageText:
//
// User cancelled installation.
//
static const int ERROR_INSTALL_USEREXIT           1602L

//
// MessageId: ERROR_INSTALL_FAILURE
//
// MessageText:
//
// Fatal error during installation.
//
static const int ERROR_INSTALL_FAILURE            1603L

//
// MessageId: ERROR_INSTALL_SUSPEND
//
// MessageText:
//
// Installation suspended, incomplete.
//
static const int ERROR_INSTALL_SUSPEND            1604L

//
// MessageId: ERROR_UNKNOWN_PRODUCT
//
// MessageText:
//
// This action is only valid for products that are currently installed.
//
static const int ERROR_UNKNOWN_PRODUCT            1605L

//
// MessageId: ERROR_UNKNOWN_FEATURE
//
// MessageText:
//
// Feature ID not registered.
//
static const int ERROR_UNKNOWN_FEATURE            1606L

//
// MessageId: ERROR_UNKNOWN_COMPONENT
//
// MessageText:
//
// Component ID not registered.
//
static const int ERROR_UNKNOWN_COMPONENT          1607L

//
// MessageId: ERROR_UNKNOWN_PROPERTY
//
// MessageText:
//
// Unknown property.
//
static const int ERROR_UNKNOWN_PROPERTY           1608L

//
// MessageId: ERROR_INVALID_HANDLE_STATE
//
// MessageText:
//
// Handle is in an invalid state.
//
static const int ERROR_INVALID_HANDLE_STATE       1609L

//
// MessageId: ERROR_BAD_CONFIGURATION
//
// MessageText:
//
// The configuration data for this product is corrupt. Contact your support personnel.
//
static const int ERROR_BAD_CONFIGURATION          1610L

//
// MessageId: ERROR_INDEX_ABSENT
//
// MessageText:
//
// Component qualifier not present.
//
static const int ERROR_INDEX_ABSENT               1611L

//
// MessageId: ERROR_INSTALL_SOURCE_ABSENT
//
// MessageText:
//
// The installation source for this product is not available. Verify that the source exists and that you can access it.
//
static const int ERROR_INSTALL_SOURCE_ABSENT      1612L

//
// MessageId: ERROR_INSTALL_PACKAGE_VERSION
//
// MessageText:
//
// This installation package cannot be installed by the Windows Installer service. You must install a Windows service pack that contains a newer version of the Windows Installer service.
//
static const int ERROR_INSTALL_PACKAGE_VERSION    1613L

//
// MessageId: ERROR_PRODUCT_UNINSTALLED
//
// MessageText:
//
// Product is uninstalled.
//
static const int ERROR_PRODUCT_UNINSTALLED        1614L

//
// MessageId: ERROR_BAD_QUERY_SYNTAX
//
// MessageText:
//
// SQL query syntax invalid or unsupported.
//
static const int ERROR_BAD_QUERY_SYNTAX           1615L

//
// MessageId: ERROR_INVALID_FIELD
//
// MessageText:
//
// Record field does not exist.
//
static const int ERROR_INVALID_FIELD              1616L

//
// MessageId: ERROR_DEVICE_REMOVED
//
// MessageText:
//
// The device has been removed.
//
static const int ERROR_DEVICE_REMOVED             1617L

//
// MessageId: ERROR_INSTALL_ALREADY_RUNNING
//
// MessageText:
//
// Another installation is already in progress. Complete that installation before proceeding with this install.
//
static const int ERROR_INSTALL_ALREADY_RUNNING    1618L

//
// MessageId: ERROR_INSTALL_PACKAGE_OPEN_FAILED
//
// MessageText:
//
// This installation package could not be opened. Verify that the package exists and that you can access it, or contact the application vendor to verify that this is a valid Windows Installer package.
//
static const int ERROR_INSTALL_PACKAGE_OPEN_FAILED 1619L

//
// MessageId: ERROR_INSTALL_PACKAGE_INVALID
//
// MessageText:
//
// This installation package could not be opened. Contact the application vendor to verify that this is a valid Windows Installer package.
//
static const int ERROR_INSTALL_PACKAGE_INVALID    1620L

//
// MessageId: ERROR_INSTALL_UI_FAILURE
//
// MessageText:
//
// There was an error starting the Windows Installer service user interface. Contact your support personnel.
//
static const int ERROR_INSTALL_UI_FAILURE         1621L

//
// MessageId: ERROR_INSTALL_LOG_FAILURE
//
// MessageText:
//
// Error opening installation log file. Verify that the specified log file location exists and that you can write to it.
//
static const int ERROR_INSTALL_LOG_FAILURE        1622L

//
// MessageId: ERROR_INSTALL_LANGUAGE_UNSUPPORTED
//
// MessageText:
//
// The language of this installation package is not supported by your system.
//
static const int ERROR_INSTALL_LANGUAGE_UNSUPPORTED 1623L

//
// MessageId: ERROR_INSTALL_TRANSFORM_FAILURE
//
// MessageText:
//
// Error applying transforms. Verify that the specified transform paths are valid.
//
static const int ERROR_INSTALL_TRANSFORM_FAILURE  1624L

//
// MessageId: ERROR_INSTALL_PACKAGE_REJECTED
//
// MessageText:
//
// This installation is forbidden by system policy. Contact your system administrator.
//
static const int ERROR_INSTALL_PACKAGE_REJECTED   1625L

//
// MessageId: ERROR_FUNCTION_NOT_CALLED
//
// MessageText:
//
// Function could not be executed.
//
static const int ERROR_FUNCTION_NOT_CALLED        1626L

//
// MessageId: ERROR_FUNCTION_FAILED
//
// MessageText:
//
// Function failed during execution.
//
static const int ERROR_FUNCTION_FAILED            1627L

//
// MessageId: ERROR_INVALID_TABLE
//
// MessageText:
//
// Invalid or unknown table specified.
//
static const int ERROR_INVALID_TABLE              1628L

//
// MessageId: ERROR_DATATYPE_MISMATCH
//
// MessageText:
//
// Data supplied is of wrong type.
//
static const int ERROR_DATATYPE_MISMATCH          1629L

//
// MessageId: ERROR_UNSUPPORTED_TYPE
//
// MessageText:
//
// Data of this type is not supported.
//
static const int ERROR_UNSUPPORTED_TYPE           1630L

//
// MessageId: ERROR_CREATE_FAILED
//
// MessageText:
//
// The Windows Installer service failed to start. Contact your support personnel.
//
static const int ERROR_CREATE_FAILED              1631L

//
// MessageId: ERROR_INSTALL_TEMP_UNWRITABLE
//
// MessageText:
//
// The Temp folder is on a drive that is full or is inaccessible. Free up space on the drive or verify that you have write permission on the Temp folder.
//
static const int ERROR_INSTALL_TEMP_UNWRITABLE    1632L

//
// MessageId: ERROR_INSTALL_PLATFORM_UNSUPPORTED
//
// MessageText:
//
// This installation package is not supported by this processor type. Contact your product vendor.
//
static const int ERROR_INSTALL_PLATFORM_UNSUPPORTED 1633L

//
// MessageId: ERROR_INSTALL_NOTUSED
//
// MessageText:
//
// Component not used on this computer.
//
static const int ERROR_INSTALL_NOTUSED            1634L

//
// MessageId: ERROR_PATCH_PACKAGE_OPEN_FAILED
//
// MessageText:
//
// This update package could not be opened. Verify that the update package exists and that you can access it, or contact the application vendor to verify that this is a valid Windows Installer update package.
//
static const int ERROR_PATCH_PACKAGE_OPEN_FAILED  1635L

//
// MessageId: ERROR_PATCH_PACKAGE_INVALID
//
// MessageText:
//
// This update package could not be opened. Contact the application vendor to verify that this is a valid Windows Installer update package.
//
static const int ERROR_PATCH_PACKAGE_INVALID      1636L

//
// MessageId: ERROR_PATCH_PACKAGE_UNSUPPORTED
//
// MessageText:
//
// This update package cannot be processed by the Windows Installer service. You must install a Windows service pack that contains a newer version of the Windows Installer service.
//
static const int ERROR_PATCH_PACKAGE_UNSUPPORTED  1637L

//
// MessageId: ERROR_PRODUCT_VERSION
//
// MessageText:
//
// Another version of this product is already installed. Installation of this version cannot continue. To configure or remove the existing version of this product, use Add/Remove Programs on the Control Panel.
//
static const int ERROR_PRODUCT_VERSION            1638L

//
// MessageId: ERROR_INVALID_COMMAND_LINE
//
// MessageText:
//
// Invalid command line argument. Consult the Windows Installer SDK for detailed command line help.
//
static const int ERROR_INVALID_COMMAND_LINE       1639L

//
// MessageId: ERROR_INSTALL_REMOTE_DISALLOWED
//
// MessageText:
//
// Only administrators have permission to add, remove, or configure server software during a Terminal services remote session. If you want to install or configure software on the server, contact your network administrator.
//
static const int ERROR_INSTALL_REMOTE_DISALLOWED  1640L

//
// MessageId: ERROR_SUCCESS_REBOOT_INITIATED
//
// MessageText:
//
// The requested operation completed successfully. The system will be restarted so the changes can take effect.
//
static const int ERROR_SUCCESS_REBOOT_INITIATED   1641L

//
// MessageId: ERROR_PATCH_TARGET_NOT_FOUND
//
// MessageText:
//
// The upgrade cannot be installed by the Windows Installer service because the program to be upgraded may be missing, or the upgrade may update a different version of the program. Verify that the program to be upgraded exists on your computer and that you have the correct upgrade.
//
static const int ERROR_PATCH_TARGET_NOT_FOUND     1642L

//
// MessageId: ERROR_PATCH_PACKAGE_REJECTED
//
// MessageText:
//
// The update package is not permitted by software restriction policy.
//
static const int ERROR_PATCH_PACKAGE_REJECTED     1643L

//
// MessageId: ERROR_INSTALL_TRANSFORM_REJECTED
//
// MessageText:
//
// One or more customizations are not permitted by software restriction policy.
//
static const int ERROR_INSTALL_TRANSFORM_REJECTED 1644L

//
// MessageId: ERROR_INSTALL_REMOTE_PROHIBITED
//
// MessageText:
//
// The Windows Installer does not permit installation from a Remote Desktop Connection.
//
static const int ERROR_INSTALL_REMOTE_PROHIBITED  1645L

//
// MessageId: ERROR_PATCH_REMOVAL_UNSUPPORTED
//
// MessageText:
//
// Uninstallation of the update package is not supported.
//
static const int ERROR_PATCH_REMOVAL_UNSUPPORTED  1646L

//
// MessageId: ERROR_UNKNOWN_PATCH
//
// MessageText:
//
// The update is not applied to this product.
//
static const int ERROR_UNKNOWN_PATCH              1647L

//
// MessageId: ERROR_PATCH_NO_SEQUENCE
//
// MessageText:
//
// No valid sequence could be found for the set of updates.
//
static const int ERROR_PATCH_NO_SEQUENCE          1648L

//
// MessageId: ERROR_PATCH_REMOVAL_DISALLOWED
//
// MessageText:
//
// Update removal was disallowed by policy.
//
static const int ERROR_PATCH_REMOVAL_DISALLOWED   1649L

//
// MessageId: ERROR_INVALID_PATCH_XML
//
// MessageText:
//
// The XML update data is invalid.
//
static const int ERROR_INVALID_PATCH_XML          1650L

//
// MessageId: ERROR_PATCH_MANAGED_ADVERTISED_PRODUCT
//
// MessageText:
//
// Windows Installer does not permit updating of managed advertised products. At least one feature of the product must be installed before applying the update.
//
static const int ERROR_PATCH_MANAGED_ADVERTISED_PRODUCT 1651L

//
// MessageId: ERROR_INSTALL_SERVICE_SAFEBOOT
//
// MessageText:
//
// The Windows Installer service is not accessible in Safe Mode. Please try again when your computer is not in Safe Mode or you can use System Restore to return your machine to a previous good state.
//
static const int ERROR_INSTALL_SERVICE_SAFEBOOT   1652L

//
// MessageId: ERROR_FAIL_FAST_EXCEPTION
//
// MessageText:
//
// A fail fast exception occurred. Exception handlers will not be invoked and the process will be terminated immediately.
//
static const int ERROR_FAIL_FAST_EXCEPTION        1653L

//
// MessageId: ERROR_INSTALL_REJECTED
//
// MessageText:
//
// The app that you are trying to run is not supported on this version of Windows.
//
static const int ERROR_INSTALL_REJECTED           1654L

//
// MessageId: ERROR_DYNAMIC_CODE_BLOCKED
//
// MessageText:
//
// The operation was blocked as the process prohibits dynamic code generation.
//
static const int ERROR_DYNAMIC_CODE_BLOCKED       1655L

//
// MessageId: ERROR_NOT_SAME_OBJECT
//
// MessageText:
//
// The objects are not identical.
//
static const int ERROR_NOT_SAME_OBJECT            1656L

//
// MessageId: ERROR_STRICT_CFG_VIOLATION
//
// MessageText:
//
// The specified image file was blocked from loading because it does not enable a feature required by the process: Control Flow Guard.
//
static const int ERROR_STRICT_CFG_VIOLATION       1657L

//
// MessageId: ERROR_SET_CONTEXT_DENIED
//
// MessageText:
//
// The thread context could not be updated because this has been restricted for the process.
//
static const int ERROR_SET_CONTEXT_DENIED         1660L

//
// MessageId: ERROR_CROSS_PARTITION_VIOLATION
//
// MessageText:
//
// An invalid cross-partition private file/section access was attempted.
//
static const int ERROR_CROSS_PARTITION_VIOLATION  1661L


///////////////////////////////////////////////////
//                                               //
//               RPC Error codes                 //
//                                               //
//                 1700 to 1999                  //
///////////////////////////////////////////////////

//
// MessageId: RPC_S_INVALID_STRING_BINDING
//
// MessageText:
//
// The string binding is invalid.
//
static const int RPC_S_INVALID_STRING_BINDING     1700L

//
// MessageId: RPC_S_WRONG_KIND_OF_BINDING
//
// MessageText:
//
// The binding handle is not the correct type.
//
static const int RPC_S_WRONG_KIND_OF_BINDING      1701L

//
// MessageId: RPC_S_INVALID_BINDING
//
// MessageText:
//
// The binding handle is invalid.
//
static const int RPC_S_INVALID_BINDING            1702L

//
// MessageId: RPC_S_PROTSEQ_NOT_SUPPORTED
//
// MessageText:
//
// The RPC protocol sequence is not supported.
//
static const int RPC_S_PROTSEQ_NOT_SUPPORTED      1703L

//
// MessageId: RPC_S_INVALID_RPC_PROTSEQ
//
// MessageText:
//
// The RPC protocol sequence is invalid.
//
static const int RPC_S_INVALID_RPC_PROTSEQ        1704L

//
// MessageId: RPC_S_INVALID_STRING_UUID
//
// MessageText:
//
// The string universal unique identifier (UUID) is invalid.
//
static const int RPC_S_INVALID_STRING_UUID        1705L

//
// MessageId: RPC_S_INVALID_ENDPOINT_FORMAT
//
// MessageText:
//
// The endpoint format is invalid.
//
static const int RPC_S_INVALID_ENDPOINT_FORMAT    1706L

//
// MessageId: RPC_S_INVALID_NET_ADDR
//
// MessageText:
//
// The network address is invalid.
//
static const int RPC_S_INVALID_NET_ADDR           1707L

//
// MessageId: RPC_S_NO_ENDPOINT_FOUND
//
// MessageText:
//
// No endpoint was found.
//
static const int RPC_S_NO_ENDPOINT_FOUND          1708L

//
// MessageId: RPC_S_INVALID_TIMEOUT
//
// MessageText:
//
// The timeout value is invalid.
//
static const int RPC_S_INVALID_TIMEOUT            1709L

//
// MessageId: RPC_S_OBJECT_NOT_FOUND
//
// MessageText:
//
// The object universal unique identifier (UUID) was not found.
//
static const int RPC_S_OBJECT_NOT_FOUND           1710L

//
// MessageId: RPC_S_ALREADY_REGISTERED
//
// MessageText:
//
// The object universal unique identifier (UUID) has already been registered.
//
static const int RPC_S_ALREADY_REGISTERED         1711L

//
// MessageId: RPC_S_TYPE_ALREADY_REGISTERED
//
// MessageText:
//
// The type universal unique identifier (UUID) has already been registered.
//
static const int RPC_S_TYPE_ALREADY_REGISTERED    1712L

//
// MessageId: RPC_S_ALREADY_LISTENING
//
// MessageText:
//
// The RPC server is already listening.
//
static const int RPC_S_ALREADY_LISTENING          1713L

//
// MessageId: RPC_S_NO_PROTSEQS_REGISTERED
//
// MessageText:
//
// No protocol sequences have been registered.
//
static const int RPC_S_NO_PROTSEQS_REGISTERED     1714L

//
// MessageId: RPC_S_NOT_LISTENING
//
// MessageText:
//
// The RPC server is not listening.
//
static const int RPC_S_NOT_LISTENING              1715L

//
// MessageId: RPC_S_UNKNOWN_MGR_TYPE
//
// MessageText:
//
// The manager type is unknown.
//
static const int RPC_S_UNKNOWN_MGR_TYPE           1716L

//
// MessageId: RPC_S_UNKNOWN_IF
//
// MessageText:
//
// The interface is unknown.
//
static const int RPC_S_UNKNOWN_IF                 1717L

//
// MessageId: RPC_S_NO_BINDINGS
//
// MessageText:
//
// There are no bindings.
//
static const int RPC_S_NO_BINDINGS                1718L

//
// MessageId: RPC_S_NO_PROTSEQS
//
// MessageText:
//
// There are no protocol sequences.
//
static const int RPC_S_NO_PROTSEQS                1719L

//
// MessageId: RPC_S_CANT_CREATE_ENDPOINT
//
// MessageText:
//
// The endpoint cannot be created.
//
static const int RPC_S_CANT_CREATE_ENDPOINT       1720L

//
// MessageId: RPC_S_OUT_OF_RESOURCES
//
// MessageText:
//
// Not enough resources are available to complete this operation.
//
static const int RPC_S_OUT_OF_RESOURCES           1721L

//
// MessageId: RPC_S_SERVER_UNAVAILABLE
//
// MessageText:
//
// The RPC server is unavailable.
//
static const int RPC_S_SERVER_UNAVAILABLE         1722L

//
// MessageId: RPC_S_SERVER_TOO_BUSY
//
// MessageText:
//
// The RPC server is too busy to complete this operation.
//
static const int RPC_S_SERVER_TOO_BUSY            1723L

//
// MessageId: RPC_S_INVALID_NETWORK_OPTIONS
//
// MessageText:
//
// The network options are invalid.
//
static const int RPC_S_INVALID_NETWORK_OPTIONS    1724L

//
// MessageId: RPC_S_NO_CALL_ACTIVE
//
// MessageText:
//
// There are no remote procedure calls active on this thread.
//
static const int RPC_S_NO_CALL_ACTIVE             1725L

//
// MessageId: RPC_S_CALL_FAILED
//
// MessageText:
//
// The remote procedure call failed.
//
static const int RPC_S_CALL_FAILED                1726L

//
// MessageId: RPC_S_CALL_FAILED_DNE
//
// MessageText:
//
// The remote procedure call failed and did not execute.
//
static const int RPC_S_CALL_FAILED_DNE            1727L

//
// MessageId: RPC_S_PROTOCOL_ERROR
//
// MessageText:
//
// A remote procedure call (RPC) protocol error occurred.
//
static const int RPC_S_PROTOCOL_ERROR             1728L

//
// MessageId: RPC_S_PROXY_ACCESS_DENIED
//
// MessageText:
//
// Access to the HTTP proxy is denied.
//
static const int RPC_S_PROXY_ACCESS_DENIED        1729L

//
// MessageId: RPC_S_UNSUPPORTED_TRANS_SYN
//
// MessageText:
//
// The transfer syntax is not supported by the RPC server.
//
static const int RPC_S_UNSUPPORTED_TRANS_SYN      1730L

//
// MessageId: RPC_S_UNSUPPORTED_TYPE
//
// MessageText:
//
// The universal unique identifier (UUID) type is not supported.
//
static const int RPC_S_UNSUPPORTED_TYPE           1732L

//
// MessageId: RPC_S_INVALID_TAG
//
// MessageText:
//
// The tag is invalid.
//
static const int RPC_S_INVALID_TAG                1733L

//
// MessageId: RPC_S_INVALID_BOUND
//
// MessageText:
//
// The array bounds are invalid.
//
static const int RPC_S_INVALID_BOUND              1734L

//
// MessageId: RPC_S_NO_ENTRY_NAME
//
// MessageText:
//
// The binding does not contain an entry name.
//
static const int RPC_S_NO_ENTRY_NAME              1735L

//
// MessageId: RPC_S_INVALID_NAME_SYNTAX
//
// MessageText:
//
// The name syntax is invalid.
//
static const int RPC_S_INVALID_NAME_SYNTAX        1736L

//
// MessageId: RPC_S_UNSUPPORTED_NAME_SYNTAX
//
// MessageText:
//
// The name syntax is not supported.
//
static const int RPC_S_UNSUPPORTED_NAME_SYNTAX    1737L

//
// MessageId: RPC_S_UUID_NO_ADDRESS
//
// MessageText:
//
// No network address is available to use to construct a universal unique identifier (UUID).
//
static const int RPC_S_UUID_NO_ADDRESS            1739L

//
// MessageId: RPC_S_DUPLICATE_ENDPOINT
//
// MessageText:
//
// The endpoint is a duplicate.
//
static const int RPC_S_DUPLICATE_ENDPOINT         1740L

//
// MessageId: RPC_S_UNKNOWN_AUTHN_TYPE
//
// MessageText:
//
// The authentication type is unknown.
//
static const int RPC_S_UNKNOWN_AUTHN_TYPE         1741L

//
// MessageId: RPC_S_MAX_CALLS_TOO_SMALL
//
// MessageText:
//
// The maximum number of calls is too small.
//
static const int RPC_S_MAX_CALLS_TOO_SMALL        1742L

//
// MessageId: RPC_S_STRING_TOO_LONG
//
// MessageText:
//
// The string is too long.
//
static const int RPC_S_STRING_TOO_LONG            1743L

//
// MessageId: RPC_S_PROTSEQ_NOT_FOUND
//
// MessageText:
//
// The RPC protocol sequence was not found.
//
static const int RPC_S_PROTSEQ_NOT_FOUND          1744L

//
// MessageId: RPC_S_PROCNUM_OUT_OF_RANGE
//
// MessageText:
//
// The procedure number is out of range.
//
static const int RPC_S_PROCNUM_OUT_OF_RANGE       1745L

//
// MessageId: RPC_S_BINDING_HAS_NO_AUTH
//
// MessageText:
//
// The binding does not contain any authentication information.
//
static const int RPC_S_BINDING_HAS_NO_AUTH        1746L

//
// MessageId: RPC_S_UNKNOWN_AUTHN_SERVICE
//
// MessageText:
//
// The authentication service is unknown.
//
static const int RPC_S_UNKNOWN_AUTHN_SERVICE      1747L

//
// MessageId: RPC_S_UNKNOWN_AUTHN_LEVEL
//
// MessageText:
//
// The authentication level is unknown.
//
static const int RPC_S_UNKNOWN_AUTHN_LEVEL        1748L

//
// MessageId: RPC_S_INVALID_AUTH_IDENTITY
//
// MessageText:
//
// The security context is invalid.
//
static const int RPC_S_INVALID_AUTH_IDENTITY      1749L

//
// MessageId: RPC_S_UNKNOWN_AUTHZ_SERVICE
//
// MessageText:
//
// The authorization service is unknown.
//
static const int RPC_S_UNKNOWN_AUTHZ_SERVICE      1750L

//
// MessageId: EPT_S_INVALID_ENTRY
//
// MessageText:
//
// The entry is invalid.
//
static const int EPT_S_INVALID_ENTRY              1751L

//
// MessageId: EPT_S_CANT_PERFORM_OP
//
// MessageText:
//
// The server endpoint cannot perform the operation.
//
static const int EPT_S_CANT_PERFORM_OP            1752L

//
// MessageId: EPT_S_NOT_REGISTERED
//
// MessageText:
//
// There are no more endpoints available from the endpoint mapper.
//
static const int EPT_S_NOT_REGISTERED             1753L

//
// MessageId: RPC_S_NOTHING_TO_EXPORT
//
// MessageText:
//
// No interfaces have been exported.
//
static const int RPC_S_NOTHING_TO_EXPORT          1754L

//
// MessageId: RPC_S_INCOMPLETE_NAME
//
// MessageText:
//
// The entry name is incomplete.
//
static const int RPC_S_INCOMPLETE_NAME            1755L

//
// MessageId: RPC_S_INVALID_VERS_OPTION
//
// MessageText:
//
// The version option is invalid.
//
static const int RPC_S_INVALID_VERS_OPTION        1756L

//
// MessageId: RPC_S_NO_MORE_MEMBERS
//
// MessageText:
//
// There are no more members.
//
static const int RPC_S_NO_MORE_MEMBERS            1757L

//
// MessageId: RPC_S_NOT_ALL_OBJS_UNEXPORTED
//
// MessageText:
//
// There is nothing to unexport.
//
static const int RPC_S_NOT_ALL_OBJS_UNEXPORTED    1758L

//
// MessageId: RPC_S_INTERFACE_NOT_FOUND
//
// MessageText:
//
// The interface was not found.
//
static const int RPC_S_INTERFACE_NOT_FOUND        1759L

//
// MessageId: RPC_S_ENTRY_ALREADY_EXISTS
//
// MessageText:
//
// The entry already exists.
//
static const int RPC_S_ENTRY_ALREADY_EXISTS       1760L

//
// MessageId: RPC_S_ENTRY_NOT_FOUND
//
// MessageText:
//
// The entry is not found.
//
static const int RPC_S_ENTRY_NOT_FOUND            1761L

//
// MessageId: RPC_S_NAME_SERVICE_UNAVAILABLE
//
// MessageText:
//
// The name service is unavailable.
//
static const int RPC_S_NAME_SERVICE_UNAVAILABLE   1762L

//
// MessageId: RPC_S_INVALID_NAF_ID
//
// MessageText:
//
// The network address family is invalid.
//
static const int RPC_S_INVALID_NAF_ID             1763L

//
// MessageId: RPC_S_CANNOT_SUPPORT
//
// MessageText:
//
// The requested operation is not supported.
//
static const int RPC_S_CANNOT_SUPPORT             1764L

//
// MessageId: RPC_S_NO_CONTEXT_AVAILABLE
//
// MessageText:
//
// No security context is available to allow impersonation.
//
static const int RPC_S_NO_CONTEXT_AVAILABLE       1765L

//
// MessageId: RPC_S_INTERNAL_ERROR
//
// MessageText:
//
// An internal error occurred in a remote procedure call (RPC).
//
static const int RPC_S_INTERNAL_ERROR             1766L

//
// MessageId: RPC_S_ZERO_DIVIDE
//
// MessageText:
//
// The RPC server attempted an integer division by zero.
//
static const int RPC_S_ZERO_DIVIDE                1767L

//
// MessageId: RPC_S_ADDRESS_ERROR
//
// MessageText:
//
// An addressing error occurred in the RPC server.
//
static const int RPC_S_ADDRESS_ERROR              1768L

//
// MessageId: RPC_S_FP_DIV_ZERO
//
// MessageText:
//
// A floating-point operation at the RPC server caused a division by zero.
//
static const int RPC_S_FP_DIV_ZERO                1769L

//
// MessageId: RPC_S_FP_UNDERFLOW
//
// MessageText:
//
// A floating-point underflow occurred at the RPC server.
//
static const int RPC_S_FP_UNDERFLOW               1770L

//
// MessageId: RPC_S_FP_OVERFLOW
//
// MessageText:
//
// A floating-point overflow occurred at the RPC server.
//
static const int RPC_S_FP_OVERFLOW                1771L

//
// MessageId: RPC_X_NO_MORE_ENTRIES
//
// MessageText:
//
// The list of RPC servers available for the binding of auto handles has been exhausted.
//
static const int RPC_X_NO_MORE_ENTRIES            1772L

//
// MessageId: RPC_X_SS_CHAR_TRANS_OPEN_FAIL
//
// MessageText:
//
// Unable to open the character translation table file.
//
static const int RPC_X_SS_CHAR_TRANS_OPEN_FAIL    1773L

//
// MessageId: RPC_X_SS_CHAR_TRANS_SHORT_FILE
//
// MessageText:
//
// The file containing the character translation table has fewer than 512 bytes.
//
static const int RPC_X_SS_CHAR_TRANS_SHORT_FILE   1774L

//
// MessageId: RPC_X_SS_IN_NULL_CONTEXT
//
// MessageText:
//
// A null context handle was passed from the client to the host during a remote procedure call.
//
static const int RPC_X_SS_IN_NULL_CONTEXT         1775L

//
// MessageId: RPC_X_SS_CONTEXT_DAMAGED
//
// MessageText:
//
// The context handle changed during a remote procedure call.
//
static const int RPC_X_SS_CONTEXT_DAMAGED         1777L

//
// MessageId: RPC_X_SS_HANDLES_MISMATCH
//
// MessageText:
//
// The binding handles passed to a remote procedure call do not match.
//
static const int RPC_X_SS_HANDLES_MISMATCH        1778L

//
// MessageId: RPC_X_SS_CANNOT_GET_CALL_HANDLE
//
// MessageText:
//
// The stub is unable to get the remote procedure call handle.
//
static const int RPC_X_SS_CANNOT_GET_CALL_HANDLE  1779L

//
// MessageId: RPC_X_NULL_REF_POINTER
//
// MessageText:
//
// A null reference pointer was passed to the stub.
//
static const int RPC_X_NULL_REF_POINTER           1780L

//
// MessageId: RPC_X_ENUM_VALUE_OUT_OF_RANGE
//
// MessageText:
//
// The enumeration value is out of range.
//
static const int RPC_X_ENUM_VALUE_OUT_OF_RANGE    1781L

//
// MessageId: RPC_X_BYTE_COUNT_TOO_SMALL
//
// MessageText:
//
// The byte count is too small.
//
static const int RPC_X_BYTE_COUNT_TOO_SMALL       1782L

//
// MessageId: RPC_X_BAD_STUB_DATA
//
// MessageText:
//
// The stub received bad data.
//
static const int RPC_X_BAD_STUB_DATA              1783L
--]]

ffi.cdef[[
//
// MessageId: ERROR_INVALID_USER_BUFFER
//
// MessageText:
//
// The supplied user buffer is not valid for the requested operation.
//
static const int ERROR_INVALID_USER_BUFFER     =   1784L;
]]

--[[
//
// MessageId: ERROR_UNRECOGNIZED_MEDIA
//
// MessageText:
//
// The disk media is not recognized. It may not be formatted.
//
static const int ERROR_UNRECOGNIZED_MEDIA         1785L

//
// MessageId: ERROR_NO_TRUST_LSA_SECRET
//
// MessageText:
//
// The workstation does not have a trust secret.
//
static const int ERROR_NO_TRUST_LSA_SECRET        1786L

//
// MessageId: ERROR_NO_TRUST_SAM_ACCOUNT
//
// MessageText:
//
// The security database on the server does not have a computer account for this workstation trust relationship.
//
static const int ERROR_NO_TRUST_SAM_ACCOUNT       1787L

//
// MessageId: ERROR_TRUSTED_DOMAIN_FAILURE
//
// MessageText:
//
// The trust relationship between the primary domain and the trusted domain failed.
//
static const int ERROR_TRUSTED_DOMAIN_FAILURE     1788L

//
// MessageId: ERROR_TRUSTED_RELATIONSHIP_FAILURE
//
// MessageText:
//
// The trust relationship between this workstation and the primary domain failed.
//
static const int ERROR_TRUSTED_RELATIONSHIP_FAILURE 1789L

//
// MessageId: ERROR_TRUST_FAILURE
//
// MessageText:
//
// The network logon failed.
//
static const int ERROR_TRUST_FAILURE              1790L

//
// MessageId: RPC_S_CALL_IN_PROGRESS
//
// MessageText:
//
// A remote procedure call is already in progress for this thread.
//
static const int RPC_S_CALL_IN_PROGRESS           1791L

//
// MessageId: ERROR_NETLOGON_NOT_STARTED
//
// MessageText:
//
// An attempt was made to logon, but the network logon service was not started.
//
static const int ERROR_NETLOGON_NOT_STARTED       1792L

//
// MessageId: ERROR_ACCOUNT_EXPIRED
//
// MessageText:
//
// The user's account has expired.
//
static const int ERROR_ACCOUNT_EXPIRED            1793L

//
// MessageId: ERROR_REDIRECTOR_HAS_OPEN_HANDLES
//
// MessageText:
//
// The redirector is in use and cannot be unloaded.
//
static const int ERROR_REDIRECTOR_HAS_OPEN_HANDLES 1794L

//
// MessageId: ERROR_PRINTER_DRIVER_ALREADY_INSTALLED
//
// MessageText:
//
// The specified printer driver is already installed.
//
static const int ERROR_PRINTER_DRIVER_ALREADY_INSTALLED 1795L

//
// MessageId: ERROR_UNKNOWN_PORT
//
// MessageText:
//
// The specified port is unknown.
//
static const int ERROR_UNKNOWN_PORT               1796L

//
// MessageId: ERROR_UNKNOWN_PRINTER_DRIVER
//
// MessageText:
//
// The printer driver is unknown.
//
static const int ERROR_UNKNOWN_PRINTER_DRIVER     1797L

//
// MessageId: ERROR_UNKNOWN_PRINTPROCESSOR
//
// MessageText:
//
// The print processor is unknown.
//
static const int ERROR_UNKNOWN_PRINTPROCESSOR     1798L

//
// MessageId: ERROR_INVALID_SEPARATOR_FILE
//
// MessageText:
//
// The specified separator file is invalid.
//
static const int ERROR_INVALID_SEPARATOR_FILE     1799L

//
// MessageId: ERROR_INVALID_PRIORITY
//
// MessageText:
//
// The specified priority is invalid.
//
static const int ERROR_INVALID_PRIORITY           1800L

//
// MessageId: ERROR_INVALID_PRINTER_NAME
//
// MessageText:
//
// The printer name is invalid.
//
static const int ERROR_INVALID_PRINTER_NAME       1801L

//
// MessageId: ERROR_PRINTER_ALREADY_EXISTS
//
// MessageText:
//
// The printer already exists.
//
static const int ERROR_PRINTER_ALREADY_EXISTS     1802L

//
// MessageId: ERROR_INVALID_PRINTER_COMMAND
//
// MessageText:
//
// The printer command is invalid.
//
static const int ERROR_INVALID_PRINTER_COMMAND    1803L

//
// MessageId: ERROR_INVALID_DATATYPE
//
// MessageText:
//
// The specified datatype is invalid.
//
static const int ERROR_INVALID_DATATYPE           1804L

//
// MessageId: ERROR_INVALID_ENVIRONMENT
//
// MessageText:
//
// The environment specified is invalid.
//
static const int ERROR_INVALID_ENVIRONMENT        1805L

//
// MessageId: RPC_S_NO_MORE_BINDINGS
//
// MessageText:
//
// There are no more bindings.
//
static const int RPC_S_NO_MORE_BINDINGS           1806L

//
// MessageId: ERROR_NOLOGON_INTERDOMAIN_TRUST_ACCOUNT
//
// MessageText:
//
// The account used is an interdomain trust account. Use your global user account or local user account to access this server.
//
static const int ERROR_NOLOGON_INTERDOMAIN_TRUST_ACCOUNT 1807L

//
// MessageId: ERROR_NOLOGON_WORKSTATION_TRUST_ACCOUNT
//
// MessageText:
//
// The account used is a computer account. Use your global user account or local user account to access this server.
//
static const int ERROR_NOLOGON_WORKSTATION_TRUST_ACCOUNT 1808L

//
// MessageId: ERROR_NOLOGON_SERVER_TRUST_ACCOUNT
//
// MessageText:
//
// The account used is a server trust account. Use your global user account or local user account to access this server.
//
static const int ERROR_NOLOGON_SERVER_TRUST_ACCOUNT 1809L

//
// MessageId: ERROR_DOMAIN_TRUST_INCONSISTENT
//
// MessageText:
//
// The name or security ID (SID) of the domain specified is inconsistent with the trust information for that domain.
//
static const int ERROR_DOMAIN_TRUST_INCONSISTENT  1810L

//
// MessageId: ERROR_SERVER_HAS_OPEN_HANDLES
//
// MessageText:
//
// The server is in use and cannot be unloaded.
//
static const int ERROR_SERVER_HAS_OPEN_HANDLES    1811L

//
// MessageId: ERROR_RESOURCE_DATA_NOT_FOUND
//
// MessageText:
//
// The specified image file did not contain a resource section.
//
static const int ERROR_RESOURCE_DATA_NOT_FOUND    1812L

//
// MessageId: ERROR_RESOURCE_TYPE_NOT_FOUND
//
// MessageText:
//
// The specified resource type cannot be found in the image file.
//
static const int ERROR_RESOURCE_TYPE_NOT_FOUND    1813L

//
// MessageId: ERROR_RESOURCE_NAME_NOT_FOUND
//
// MessageText:
//
// The specified resource name cannot be found in the image file.
//
static const int ERROR_RESOURCE_NAME_NOT_FOUND    1814L

//
// MessageId: ERROR_RESOURCE_LANG_NOT_FOUND
//
// MessageText:
//
// The specified resource language ID cannot be found in the image file.
//
static const int ERROR_RESOURCE_LANG_NOT_FOUND    1815L

//
// MessageId: ERROR_NOT_ENOUGH_QUOTA
//
// MessageText:
//
// Not enough quota is available to process this command.
//
static const int ERROR_NOT_ENOUGH_QUOTA           1816L

//
// MessageId: RPC_S_NO_INTERFACES
//
// MessageText:
//
// No interfaces have been registered.
//
static const int RPC_S_NO_INTERFACES              1817L

//
// MessageId: RPC_S_CALL_CANCELLED
//
// MessageText:
//
// The remote procedure call was cancelled.
//
static const int RPC_S_CALL_CANCELLED             1818L

//
// MessageId: RPC_S_BINDING_INCOMPLETE
//
// MessageText:
//
// The binding handle does not contain all required information.
//
static const int RPC_S_BINDING_INCOMPLETE         1819L

//
// MessageId: RPC_S_COMM_FAILURE
//
// MessageText:
//
// A communications failure occurred during a remote procedure call.
//
static const int RPC_S_COMM_FAILURE               1820L

//
// MessageId: RPC_S_UNSUPPORTED_AUTHN_LEVEL
//
// MessageText:
//
// The requested authentication level is not supported.
//
static const int RPC_S_UNSUPPORTED_AUTHN_LEVEL    1821L

//
// MessageId: RPC_S_NO_PRINC_NAME
//
// MessageText:
//
// No principal name registered.
//
static const int RPC_S_NO_PRINC_NAME              1822L

//
// MessageId: RPC_S_NOT_RPC_ERROR
//
// MessageText:
//
// The error specified is not a valid Windows RPC error code.
//
static const int RPC_S_NOT_RPC_ERROR              1823L

//
// MessageId: RPC_S_UUID_LOCAL_ONLY
//
// MessageText:
//
// A UUID that is valid only on this computer has been allocated.
//
static const int RPC_S_UUID_LOCAL_ONLY            1824L

//
// MessageId: RPC_S_SEC_PKG_ERROR
//
// MessageText:
//
// A security package specific error occurred.
//
static const int RPC_S_SEC_PKG_ERROR              1825L

//
// MessageId: RPC_S_NOT_CANCELLED
//
// MessageText:
//
// Thread is not canceled.
//
static const int RPC_S_NOT_CANCELLED              1826L

//
// MessageId: RPC_X_INVALID_ES_ACTION
//
// MessageText:
//
// Invalid operation on the encoding/decoding handle.
//
static const int RPC_X_INVALID_ES_ACTION          1827L

//
// MessageId: RPC_X_WRONG_ES_VERSION
//
// MessageText:
//
// Incompatible version of the serializing package.
//
static const int RPC_X_WRONG_ES_VERSION           1828L

//
// MessageId: RPC_X_WRONG_STUB_VERSION
//
// MessageText:
//
// Incompatible version of the RPC stub.
//
static const int RPC_X_WRONG_STUB_VERSION         1829L

//
// MessageId: RPC_X_INVALID_PIPE_OBJECT
//
// MessageText:
//
// The RPC pipe object is invalid or corrupted.
//
static const int RPC_X_INVALID_PIPE_OBJECT        1830L

//
// MessageId: RPC_X_WRONG_PIPE_ORDER
//
// MessageText:
//
// An invalid operation was attempted on an RPC pipe object.
//
static const int RPC_X_WRONG_PIPE_ORDER           1831L

//
// MessageId: RPC_X_WRONG_PIPE_VERSION
//
// MessageText:
//
// Unsupported RPC pipe version.
//
static const int RPC_X_WRONG_PIPE_VERSION         1832L

//
// MessageId: RPC_S_COOKIE_AUTH_FAILED
//
// MessageText:
//
// HTTP proxy server rejected the connection because the cookie authentication failed.
//
static const int RPC_S_COOKIE_AUTH_FAILED         1833L

//
// MessageId: RPC_S_DO_NOT_DISTURB
//
// MessageText:
//
// The RPC server is suspended, and could not be resumed for this request. The call did not execute.
//
static const int RPC_S_DO_NOT_DISTURB             1834L

//
// MessageId: RPC_S_SYSTEM_HANDLE_COUNT_EXCEEDED
//
// MessageText:
//
// The RPC call contains too many handles to be transmitted in a single request.
//
static const int RPC_S_SYSTEM_HANDLE_COUNT_EXCEEDED 1835L

//
// MessageId: RPC_S_SYSTEM_HANDLE_TYPE_MISMATCH
//
// MessageText:
//
// The RPC call contains a handle that differs from the declared handle type.
//
static const int RPC_S_SYSTEM_HANDLE_TYPE_MISMATCH 1836L

//
// MessageId: RPC_S_GROUP_MEMBER_NOT_FOUND
//
// MessageText:
//
// The group member was not found.
//
static const int RPC_S_GROUP_MEMBER_NOT_FOUND     1898L

//
// MessageId: EPT_S_CANT_CREATE
//
// MessageText:
//
// The endpoint mapper database entry could not be created.
//
static const int EPT_S_CANT_CREATE                1899L

//
// MessageId: RPC_S_INVALID_OBJECT
//
// MessageText:
//
// The object universal unique identifier (UUID) is the nil UUID.
//
static const int RPC_S_INVALID_OBJECT             1900L

//
// MessageId: ERROR_INVALID_TIME
//
// MessageText:
//
// The specified time is invalid.
//
static const int ERROR_INVALID_TIME               1901L

//
// MessageId: ERROR_INVALID_FORM_NAME
//
// MessageText:
//
// The specified form name is invalid.
//
static const int ERROR_INVALID_FORM_NAME          1902L

//
// MessageId: ERROR_INVALID_FORM_SIZE
//
// MessageText:
//
// The specified form size is invalid.
//
static const int ERROR_INVALID_FORM_SIZE          1903L

//
// MessageId: ERROR_ALREADY_WAITING
//
// MessageText:
//
// The specified printer handle is already being waited on
//
static const int ERROR_ALREADY_WAITING            1904L

//
// MessageId: ERROR_PRINTER_DELETED
//
// MessageText:
//
// The specified printer has been deleted.
//
static const int ERROR_PRINTER_DELETED            1905L

//
// MessageId: ERROR_INVALID_PRINTER_STATE
//
// MessageText:
//
// The state of the printer is invalid.
//
static const int ERROR_INVALID_PRINTER_STATE      1906L

//
// MessageId: ERROR_PASSWORD_MUST_CHANGE
//
// MessageText:
//
// The user's password must be changed before signing in.
//
static const int ERROR_PASSWORD_MUST_CHANGE       1907L

//
// MessageId: ERROR_DOMAIN_CONTROLLER_NOT_FOUND
//
// MessageText:
//
// Could not find the domain controller for this domain.
//
static const int ERROR_DOMAIN_CONTROLLER_NOT_FOUND 1908L

//
// MessageId: ERROR_ACCOUNT_LOCKED_OUT
//
// MessageText:
//
// The referenced account is currently locked out and may not be logged on to.
//
static const int ERROR_ACCOUNT_LOCKED_OUT         1909L

//
// MessageId: OR_INVALID_OXID
//
// MessageText:
//
// The object exporter specified was not found.
//
static const int OR_INVALID_OXID                  1910L

//
// MessageId: OR_INVALID_OID
//
// MessageText:
//
// The object specified was not found.
//
static const int OR_INVALID_OID                   1911L

//
// MessageId: OR_INVALID_SET
//
// MessageText:
//
// The object resolver set specified was not found.
//
static const int OR_INVALID_SET                   1912L

//
// MessageId: RPC_S_SEND_INCOMPLETE
//
// MessageText:
//
// Some data remains to be sent in the request buffer.
//
static const int RPC_S_SEND_INCOMPLETE            1913L

//
// MessageId: RPC_S_INVALID_ASYNC_HANDLE
//
// MessageText:
//
// Invalid asynchronous remote procedure call handle.
//
static const int RPC_S_INVALID_ASYNC_HANDLE       1914L

//
// MessageId: RPC_S_INVALID_ASYNC_CALL
//
// MessageText:
//
// Invalid asynchronous RPC call handle for this operation.
//
static const int RPC_S_INVALID_ASYNC_CALL         1915L

//
// MessageId: RPC_X_PIPE_CLOSED
//
// MessageText:
//
// The RPC pipe object has already been closed.
//
static const int RPC_X_PIPE_CLOSED                1916L

//
// MessageId: RPC_X_PIPE_DISCIPLINE_ERROR
//
// MessageText:
//
// The RPC call completed before all pipes were processed.
//
static const int RPC_X_PIPE_DISCIPLINE_ERROR      1917L

//
// MessageId: RPC_X_PIPE_EMPTY
//
// MessageText:
//
// No more data is available from the RPC pipe.
//
static const int RPC_X_PIPE_EMPTY                 1918L

//
// MessageId: ERROR_NO_SITENAME
//
// MessageText:
//
// No site name is available for this machine.
//
static const int ERROR_NO_SITENAME                1919L

//
// MessageId: ERROR_CANT_ACCESS_FILE
//
// MessageText:
//
// The file cannot be accessed by the system.
//
static const int ERROR_CANT_ACCESS_FILE           1920L

//
// MessageId: ERROR_CANT_RESOLVE_FILENAME
//
// MessageText:
//
// The name of the file cannot be resolved by the system.
//
static const int ERROR_CANT_RESOLVE_FILENAME      1921L

//
// MessageId: RPC_S_ENTRY_TYPE_MISMATCH
//
// MessageText:
//
// The entry is not of the expected type.
//
static const int RPC_S_ENTRY_TYPE_MISMATCH        1922L

//
// MessageId: RPC_S_NOT_ALL_OBJS_EXPORTED
//
// MessageText:
//
// Not all object UUIDs could be exported to the specified entry.
//
static const int RPC_S_NOT_ALL_OBJS_EXPORTED      1923L

//
// MessageId: RPC_S_INTERFACE_NOT_EXPORTED
//
// MessageText:
//
// Interface could not be exported to the specified entry.
//
static const int RPC_S_INTERFACE_NOT_EXPORTED     1924L

//
// MessageId: RPC_S_PROFILE_NOT_ADDED
//
// MessageText:
//
// The specified profile entry could not be added.
//
static const int RPC_S_PROFILE_NOT_ADDED          1925L

//
// MessageId: RPC_S_PRF_ELT_NOT_ADDED
//
// MessageText:
//
// The specified profile element could not be added.
//
static const int RPC_S_PRF_ELT_NOT_ADDED          1926L

//
// MessageId: RPC_S_PRF_ELT_NOT_REMOVED
//
// MessageText:
//
// The specified profile element could not be removed.
//
static const int RPC_S_PRF_ELT_NOT_REMOVED        1927L

//
// MessageId: RPC_S_GRP_ELT_NOT_ADDED
//
// MessageText:
//
// The group element could not be added.
//
static const int RPC_S_GRP_ELT_NOT_ADDED          1928L

//
// MessageId: RPC_S_GRP_ELT_NOT_REMOVED
//
// MessageText:
//
// The group element could not be removed.
//
static const int RPC_S_GRP_ELT_NOT_REMOVED        1929L

//
// MessageId: ERROR_KM_DRIVER_BLOCKED
//
// MessageText:
//
// The printer driver is not compatible with a policy enabled on your computer that blocks NT 4.0 drivers.
//
static const int ERROR_KM_DRIVER_BLOCKED          1930L

//
// MessageId: ERROR_CONTEXT_EXPIRED
//
// MessageText:
//
// The context has expired and can no longer be used.
//
static const int ERROR_CONTEXT_EXPIRED            1931L

//
// MessageId: ERROR_PER_USER_TRUST_QUOTA_EXCEEDED
//
// MessageText:
//
// The current user's delegated trust creation quota has been exceeded.
//
static const int ERROR_PER_USER_TRUST_QUOTA_EXCEEDED 1932L

//
// MessageId: ERROR_ALL_USER_TRUST_QUOTA_EXCEEDED
//
// MessageText:
//
// The total delegated trust creation quota has been exceeded.
//
static const int ERROR_ALL_USER_TRUST_QUOTA_EXCEEDED 1933L

//
// MessageId: ERROR_USER_DELETE_TRUST_QUOTA_EXCEEDED
//
// MessageText:
//
// The current user's delegated trust deletion quota has been exceeded.
//
static const int ERROR_USER_DELETE_TRUST_QUOTA_EXCEEDED 1934L

//
// MessageId: ERROR_AUTHENTICATION_FIREWALL_FAILED
//
// MessageText:
//
// The computer you are signing into is protected by an authentication firewall. The specified account is not allowed to authenticate to the computer.
//
static const int ERROR_AUTHENTICATION_FIREWALL_FAILED 1935L

//
// MessageId: ERROR_REMOTE_PRINT_CONNECTIONS_BLOCKED
//
// MessageText:
//
// Remote connections to the Print Spooler are blocked by a policy set on your machine.
//
static const int ERROR_REMOTE_PRINT_CONNECTIONS_BLOCKED 1936L

//
// MessageId: ERROR_NTLM_BLOCKED
//
// MessageText:
//
// Authentication failed because NTLM authentication has been disabled.
//
static const int ERROR_NTLM_BLOCKED               1937L

//
// MessageId: ERROR_PASSWORD_CHANGE_REQUIRED
//
// MessageText:
//
// Logon Failure: EAS policy requires that the user change their password before this operation can be performed.
//
static const int ERROR_PASSWORD_CHANGE_REQUIRED   1938L

//
// MessageId: ERROR_LOST_MODE_LOGON_RESTRICTION
//
// MessageText:
//
// An administrator has restricted sign in. To sign in, make sure your device is connected to the Internet, and have your administrator sign in first.
//
static const int ERROR_LOST_MODE_LOGON_RESTRICTION 1939L


///////////////////////////////////////////////////
//                                               //
//              OpenGL Error codes               //
//                                               //
//                 2000 to 2009                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_INVALID_PIXEL_FORMAT
//
// MessageText:
//
// The pixel format is invalid.
//
static const int ERROR_INVALID_PIXEL_FORMAT       2000L

//
// MessageId: ERROR_BAD_DRIVER
//
// MessageText:
//
// The specified driver is invalid.
//
static const int ERROR_BAD_DRIVER                 2001L

//
// MessageId: ERROR_INVALID_WINDOW_STYLE
//
// MessageText:
//
// The window style or class attribute is invalid for this operation.
//
static const int ERROR_INVALID_WINDOW_STYLE       2002L

//
// MessageId: ERROR_METAFILE_NOT_SUPPORTED
//
// MessageText:
//
// The requested metafile operation is not supported.
//
static const int ERROR_METAFILE_NOT_SUPPORTED     2003L

//
// MessageId: ERROR_TRANSFORM_NOT_SUPPORTED
//
// MessageText:
//
// The requested transformation operation is not supported.
//
static const int ERROR_TRANSFORM_NOT_SUPPORTED    2004L

//
// MessageId: ERROR_CLIPPING_NOT_SUPPORTED
//
// MessageText:
//
// The requested clipping operation is not supported.
//
static const int ERROR_CLIPPING_NOT_SUPPORTED     2005L


///////////////////////////////////////////////////
//                                               //
//       Image Color Management Error codes      //
//                                               //
//                 2010 to 2049                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_INVALID_CMM
//
// MessageText:
//
// The specified color management module is invalid.
//
static const int ERROR_INVALID_CMM                2010L

//
// MessageId: ERROR_INVALID_PROFILE
//
// MessageText:
//
// The specified color profile is invalid.
//
static const int ERROR_INVALID_PROFILE            2011L

//
// MessageId: ERROR_TAG_NOT_FOUND
//
// MessageText:
//
// The specified tag was not found.
//
static const int ERROR_TAG_NOT_FOUND              2012L

//
// MessageId: ERROR_TAG_NOT_PRESENT
//
// MessageText:
//
// A required tag is not present.
//
static const int ERROR_TAG_NOT_PRESENT            2013L

//
// MessageId: ERROR_DUPLICATE_TAG
//
// MessageText:
//
// The specified tag is already present.
//
static const int ERROR_DUPLICATE_TAG              2014L

//
// MessageId: ERROR_PROFILE_NOT_ASSOCIATED_WITH_DEVICE
//
// MessageText:
//
// The specified color profile is not associated with the specified device.
//
static const int ERROR_PROFILE_NOT_ASSOCIATED_WITH_DEVICE 2015L

//
// MessageId: ERROR_PROFILE_NOT_FOUND
//
// MessageText:
//
// The specified color profile was not found.
//
static const int ERROR_PROFILE_NOT_FOUND          2016L

//
// MessageId: ERROR_INVALID_COLORSPACE
//
// MessageText:
//
// The specified color space is invalid.
//
static const int ERROR_INVALID_COLORSPACE         2017L

//
// MessageId: ERROR_ICM_NOT_ENABLED
//
// MessageText:
//
// Image Color Management is not enabled.
//
static const int ERROR_ICM_NOT_ENABLED            2018L

//
// MessageId: ERROR_DELETING_ICM_XFORM
//
// MessageText:
//
// There was an error while deleting the color transform.
//
static const int ERROR_DELETING_ICM_XFORM         2019L

//
// MessageId: ERROR_INVALID_TRANSFORM
//
// MessageText:
//
// The specified color transform is invalid.
//
static const int ERROR_INVALID_TRANSFORM          2020L

//
// MessageId: ERROR_COLORSPACE_MISMATCH
//
// MessageText:
//
// The specified transform does not match the bitmap's color space.
//
static const int ERROR_COLORSPACE_MISMATCH        2021L

//
// MessageId: ERROR_INVALID_COLORINDEX
//
// MessageText:
//
// The specified named color index is not present in the profile.
//
static const int ERROR_INVALID_COLORINDEX         2022L

//
// MessageId: ERROR_PROFILE_DOES_NOT_MATCH_DEVICE
//
// MessageText:
//
// The specified profile is intended for a device of a different type than the specified device.
//
static const int ERROR_PROFILE_DOES_NOT_MATCH_DEVICE 2023L


///////////////////////////////////////////////////
//                                               //
//             Winnet32 Error codes              //
//                                               //
//                 2100 to 2999                  //
//                                               //
// The range 2100 through 2999 is reserved for   //
// network status codes. See lmerr.h for a       //
// complete listing                              //
///////////////////////////////////////////////////

//
// MessageId: ERROR_CONNECTED_OTHER_PASSWORD
//
// MessageText:
//
// The network connection was made successfully, but the user had to be prompted for a password other than the one originally specified.
//
static const int ERROR_CONNECTED_OTHER_PASSWORD   2108L

//
// MessageId: ERROR_CONNECTED_OTHER_PASSWORD_DEFAULT
//
// MessageText:
//
// The network connection was made successfully using default credentials.
//
static const int ERROR_CONNECTED_OTHER_PASSWORD_DEFAULT 2109L

//
// MessageId: ERROR_BAD_USERNAME
//
// MessageText:
//
// The specified username is invalid.
//
static const int ERROR_BAD_USERNAME               2202L

//
// MessageId: ERROR_NOT_CONNECTED
//
// MessageText:
//
// This network connection does not exist.
//
static const int ERROR_NOT_CONNECTED              2250L

//
// MessageId: ERROR_OPEN_FILES
//
// MessageText:
//
// This network connection has files open or requests pending.
//
static const int ERROR_OPEN_FILES                 2401L

//
// MessageId: ERROR_ACTIVE_CONNECTIONS
//
// MessageText:
//
// Active connections still exist.
//
static const int ERROR_ACTIVE_CONNECTIONS         2402L

//
// MessageId: ERROR_DEVICE_IN_USE
//
// MessageText:
//
// The device is in use by an active process and cannot be disconnected.
//
static const int ERROR_DEVICE_IN_USE              2404L


///////////////////////////////////////////////////
//                                               //
//           Win32 Spooler Error codes           //
//                                               //
//                 3000 to 3049                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_UNKNOWN_PRINT_MONITOR
//
// MessageText:
//
// The specified print monitor is unknown.
//
static const int ERROR_UNKNOWN_PRINT_MONITOR      3000L

//
// MessageId: ERROR_PRINTER_DRIVER_IN_USE
//
// MessageText:
//
// The specified printer driver is currently in use.
//
static const int ERROR_PRINTER_DRIVER_IN_USE      3001L

//
// MessageId: ERROR_SPOOL_FILE_NOT_FOUND
//
// MessageText:
//
// The spool file was not found.
//
static const int ERROR_SPOOL_FILE_NOT_FOUND       3002L

//
// MessageId: ERROR_SPL_NO_STARTDOC
//
// MessageText:
//
// A StartDocPrinter call was not issued.
//
static const int ERROR_SPL_NO_STARTDOC            3003L

//
// MessageId: ERROR_SPL_NO_ADDJOB
//
// MessageText:
//
// An AddJob call was not issued.
//
static const int ERROR_SPL_NO_ADDJOB              3004L

//
// MessageId: ERROR_PRINT_PROCESSOR_ALREADY_INSTALLED
//
// MessageText:
//
// The specified print processor has already been installed.
//
static const int ERROR_PRINT_PROCESSOR_ALREADY_INSTALLED 3005L

//
// MessageId: ERROR_PRINT_MONITOR_ALREADY_INSTALLED
//
// MessageText:
//
// The specified print monitor has already been installed.
//
static const int ERROR_PRINT_MONITOR_ALREADY_INSTALLED 3006L

//
// MessageId: ERROR_INVALID_PRINT_MONITOR
//
// MessageText:
//
// The specified print monitor does not have the required functions.
//
static const int ERROR_INVALID_PRINT_MONITOR      3007L

//
// MessageId: ERROR_PRINT_MONITOR_IN_USE
//
// MessageText:
//
// The specified print monitor is currently in use.
//
static const int ERROR_PRINT_MONITOR_IN_USE       3008L

//
// MessageId: ERROR_PRINTER_HAS_JOBS_QUEUED
//
// MessageText:
//
// The requested operation is not allowed when there are jobs queued to the printer.
//
static const int ERROR_PRINTER_HAS_JOBS_QUEUED    3009L

//
// MessageId: ERROR_SUCCESS_REBOOT_REQUIRED
//
// MessageText:
//
// The requested operation is successful. Changes will not be effective until the system is rebooted.
//
static const int ERROR_SUCCESS_REBOOT_REQUIRED    3010L

//
// MessageId: ERROR_SUCCESS_RESTART_REQUIRED
//
// MessageText:
//
// The requested operation is successful. Changes will not be effective until the service is restarted.
//
static const int ERROR_SUCCESS_RESTART_REQUIRED   3011L

//
// MessageId: ERROR_PRINTER_NOT_FOUND
//
// MessageText:
//
// No printers were found.
//
static const int ERROR_PRINTER_NOT_FOUND          3012L

//
// MessageId: ERROR_PRINTER_DRIVER_WARNED
//
// MessageText:
//
// The printer driver is known to be unreliable.
//
static const int ERROR_PRINTER_DRIVER_WARNED      3013L

//
// MessageId: ERROR_PRINTER_DRIVER_BLOCKED
//
// MessageText:
//
// The printer driver is known to harm the system.
//
static const int ERROR_PRINTER_DRIVER_BLOCKED     3014L

//
// MessageId: ERROR_PRINTER_DRIVER_PACKAGE_IN_USE
//
// MessageText:
//
// The specified printer driver package is currently in use.
//
static const int ERROR_PRINTER_DRIVER_PACKAGE_IN_USE 3015L

//
// MessageId: ERROR_CORE_DRIVER_PACKAGE_NOT_FOUND
//
// MessageText:
//
// Unable to find a core driver package that is required by the printer driver package.
//
static const int ERROR_CORE_DRIVER_PACKAGE_NOT_FOUND 3016L

//
// MessageId: ERROR_FAIL_REBOOT_REQUIRED
//
// MessageText:
//
// The requested operation failed. A system reboot is required to roll back changes made.
//
static const int ERROR_FAIL_REBOOT_REQUIRED       3017L

//
// MessageId: ERROR_FAIL_REBOOT_INITIATED
//
// MessageText:
//
// The requested operation failed. A system reboot has been initiated to roll back changes made.
//
static const int ERROR_FAIL_REBOOT_INITIATED      3018L

//
// MessageId: ERROR_PRINTER_DRIVER_DOWNLOAD_NEEDED
//
// MessageText:
//
// The specified printer driver was not found on the system and needs to be downloaded.
//
static const int ERROR_PRINTER_DRIVER_DOWNLOAD_NEEDED 3019L

//
// MessageId: ERROR_PRINT_JOB_RESTART_REQUIRED
//
// MessageText:
//
// The requested print job has failed to print. A print system update requires the job to be resubmitted.
//
static const int ERROR_PRINT_JOB_RESTART_REQUIRED 3020L

//
// MessageId: ERROR_INVALID_PRINTER_DRIVER_MANIFEST
//
// MessageText:
//
// The printer driver does not contain a valid manifest, or contains too many manifests.
//
static const int ERROR_INVALID_PRINTER_DRIVER_MANIFEST 3021L

//
// MessageId: ERROR_PRINTER_NOT_SHAREABLE
//
// MessageText:
//
// The specified printer cannot be shared.
//
static const int ERROR_PRINTER_NOT_SHAREABLE      3022L


///////////////////////////////////////////////////
//                                               //
//           CopyFile ext. Error codes           //
//                                               //
//                 3050 to 3059                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_REQUEST_PAUSED
//
// MessageText:
//
// The operation was paused.
//
static const int ERROR_REQUEST_PAUSED             3050L


///////////////////////////////////////////////////
//                                               //
//           AppExec Error codes                 //
//                                               //
//                 3060 to 3079                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_APPEXEC_CONDITION_NOT_SATISFIED
//
// MessageText:
//
// The condition supplied for the app execution request was not satisfied, so the request was not performed.
//
static const int ERROR_APPEXEC_CONDITION_NOT_SATISFIED 3060L

//
// MessageId: ERROR_APPEXEC_HANDLE_INVALIDATED
//
// MessageText:
//
// The supplied handle has been invalidated and may not be used for the requested operation.
//
static const int ERROR_APPEXEC_HANDLE_INVALIDATED 3061L

//
// MessageId: ERROR_APPEXEC_INVALID_HOST_GENERATION
//
// MessageText:
//
// The supplied host generation has been invalidated and may not be used for the requested operation.
//
static const int ERROR_APPEXEC_INVALID_HOST_GENERATION 3062L

//
// MessageId: ERROR_APPEXEC_UNEXPECTED_PROCESS_REGISTRATION
//
// MessageText:
//
// An attempt to register a process failed because the target host was not in a valid state to receive process registrations.
//
static const int ERROR_APPEXEC_UNEXPECTED_PROCESS_REGISTRATION 3063L

//
// MessageId: ERROR_APPEXEC_INVALID_HOST_STATE
//
// MessageText:
//
// The host is not in a valid state to support the execution request.
//
static const int ERROR_APPEXEC_INVALID_HOST_STATE 3064L

//
// MessageId: ERROR_APPEXEC_NO_DONOR
//
// MessageText:
//
// The operation was not completed because a required resource donor was not found for the host.
//
static const int ERROR_APPEXEC_NO_DONOR           3065L

//
// MessageId: ERROR_APPEXEC_HOST_ID_MISMATCH
//
// MessageText:
//
// The operation was not completed because an unexpected host ID was encountered.
//
static const int ERROR_APPEXEC_HOST_ID_MISMATCH   3066L


///////////////////////////////////////////////////
//                                               //
//                  Available                    //
//                                               //
//                 3080 to 3199                  //
///////////////////////////////////////////////////


//
//               the message range
//                 3200 to 3299
//      is reserved and used in isolation lib
//

///////////////////////////////////////////////////
//                                               //
//                  Available                    //
//                                               //
//                 3300 to 3899                  //
///////////////////////////////////////////////////


///////////////////////////////////////////////////
//                                               //
//                IO Error Codes                 //
//                                               //
//                 3900 to 3999                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_IO_REISSUE_AS_CACHED
//
// MessageText:
//
// Reissue the given operation as a cached IO operation
//
static const int ERROR_IO_REISSUE_AS_CACHED       3950L



///////////////////////////////////////////////////
//                                               //
//                Wins Error codes               //
//                                               //
//                 4000 to 4049                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_WINS_INTERNAL
//
// MessageText:
//
// WINS encountered an error while processing the command.
//
static const int ERROR_WINS_INTERNAL              4000L

//
// MessageId: ERROR_CAN_NOT_DEL_LOCAL_WINS
//
// MessageText:
//
// The local WINS cannot be deleted.
//
static const int ERROR_CAN_NOT_DEL_LOCAL_WINS     4001L

//
// MessageId: ERROR_STATIC_INIT
//
// MessageText:
//
// The importation from the file failed.
//
static const int ERROR_STATIC_INIT                4002L

//
// MessageId: ERROR_INC_BACKUP
//
// MessageText:
//
// The backup failed. Was a full backup done before?
//
static const int ERROR_INC_BACKUP                 4003L

//
// MessageId: ERROR_FULL_BACKUP
//
// MessageText:
//
// The backup failed. Check the directory to which you are backing the database.
//
static const int ERROR_FULL_BACKUP                4004L

//
// MessageId: ERROR_REC_NON_EXISTENT
//
// MessageText:
//
// The name does not exist in the WINS database.
//
static const int ERROR_REC_NON_EXISTENT           4005L

//
// MessageId: ERROR_RPL_NOT_ALLOWED
//
// MessageText:
//
// Replication with a nonconfigured partner is not allowed.
//
static const int ERROR_RPL_NOT_ALLOWED            4006L


///////////////////////////////////////////////////
//                                               //
//              PeerDist Error codes             //
//                                               //
//                 4050 to 4099                  //
///////////////////////////////////////////////////

//
// MessageId: PEERDIST_ERROR_CONTENTINFO_VERSION_UNSUPPORTED
//
// MessageText:
//
// The version of the supplied content information is not supported.
//
static const int PEERDIST_ERROR_CONTENTINFO_VERSION_UNSUPPORTED 4050L

//
// MessageId: PEERDIST_ERROR_CANNOT_PARSE_CONTENTINFO
//
// MessageText:
//
// The supplied content information is malformed.
//
static const int PEERDIST_ERROR_CANNOT_PARSE_CONTENTINFO 4051L

//
// MessageId: PEERDIST_ERROR_MISSING_DATA
//
// MessageText:
//
// The requested data cannot be found in local or peer caches.
//
static const int PEERDIST_ERROR_MISSING_DATA      4052L

//
// MessageId: PEERDIST_ERROR_NO_MORE
//
// MessageText:
//
// No more data is available or required.
//
static const int PEERDIST_ERROR_NO_MORE           4053L

//
// MessageId: PEERDIST_ERROR_NOT_INITIALIZED
//
// MessageText:
//
// The supplied object has not been initialized.
//
static const int PEERDIST_ERROR_NOT_INITIALIZED   4054L

//
// MessageId: PEERDIST_ERROR_ALREADY_INITIALIZED
//
// MessageText:
//
// The supplied object has already been initialized.
//
static const int PEERDIST_ERROR_ALREADY_INITIALIZED 4055L

//
// MessageId: PEERDIST_ERROR_SHUTDOWN_IN_PROGRESS
//
// MessageText:
//
// A shutdown operation is already in progress.
//
static const int PEERDIST_ERROR_SHUTDOWN_IN_PROGRESS 4056L

//
// MessageId: PEERDIST_ERROR_INVALIDATED
//
// MessageText:
//
// The supplied object has already been invalidated.
//
static const int PEERDIST_ERROR_INVALIDATED       4057L

//
// MessageId: PEERDIST_ERROR_ALREADY_EXISTS
//
// MessageText:
//
// An element already exists and was not replaced.
//
static const int PEERDIST_ERROR_ALREADY_EXISTS    4058L

//
// MessageId: PEERDIST_ERROR_OPERATION_NOTFOUND
//
// MessageText:
//
// Can not cancel the requested operation as it has already been completed.
//
static const int PEERDIST_ERROR_OPERATION_NOTFOUND 4059L

//
// MessageId: PEERDIST_ERROR_ALREADY_COMPLETED
//
// MessageText:
//
// Can not perform the reqested operation because it has already been carried out.
//
static const int PEERDIST_ERROR_ALREADY_COMPLETED 4060L

//
// MessageId: PEERDIST_ERROR_OUT_OF_BOUNDS
//
// MessageText:
//
// An operation accessed data beyond the bounds of valid data.
//
static const int PEERDIST_ERROR_OUT_OF_BOUNDS     4061L

//
// MessageId: PEERDIST_ERROR_VERSION_UNSUPPORTED
//
// MessageText:
//
// The requested version is not supported.
//
static const int PEERDIST_ERROR_VERSION_UNSUPPORTED 4062L

//
// MessageId: PEERDIST_ERROR_INVALID_CONFIGURATION
//
// MessageText:
//
// A configuration value is invalid.
//
static const int PEERDIST_ERROR_INVALID_CONFIGURATION 4063L

//
// MessageId: PEERDIST_ERROR_NOT_LICENSED
//
// MessageText:
//
// The SKU is not licensed.
//
static const int PEERDIST_ERROR_NOT_LICENSED      4064L

//
// MessageId: PEERDIST_ERROR_SERVICE_UNAVAILABLE
//
// MessageText:
//
// PeerDist Service is still initializing and will be available shortly.
//
static const int PEERDIST_ERROR_SERVICE_UNAVAILABLE 4065L

//
// MessageId: PEERDIST_ERROR_TRUST_FAILURE
//
// MessageText:
//
// Communication with one or more computers will be temporarily blocked due to recent errors.
//
static const int PEERDIST_ERROR_TRUST_FAILURE     4066L


///////////////////////////////////////////////////
//                                               //
//               DHCP Error codes                //
//                                               //
//                 4100 to 4149                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_DHCP_ADDRESS_CONFLICT
//
// MessageText:
//
// The DHCP client has obtained an IP address that is already in use on the network. The local interface will be disabled until the DHCP client can obtain a new address.
//
static const int ERROR_DHCP_ADDRESS_CONFLICT      4100L


///////////////////////////////////////////////////
//                                               //
//                  Available                    //
//                                               //
//                 4150 to 4199                  //
///////////////////////////////////////////////////


///////////////////////////////////////////////////
//                                               //
//               WMI Error codes                 //
//                                               //
//                 4200 to 4249                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_WMI_GUID_NOT_FOUND
//
// MessageText:
//
// The GUID passed was not recognized as valid by a WMI data provider.
//
static const int ERROR_WMI_GUID_NOT_FOUND         4200L

//
// MessageId: ERROR_WMI_INSTANCE_NOT_FOUND
//
// MessageText:
//
// The instance name passed was not recognized as valid by a WMI data provider.
//
static const int ERROR_WMI_INSTANCE_NOT_FOUND     4201L

//
// MessageId: ERROR_WMI_ITEMID_NOT_FOUND
//
// MessageText:
//
// The data item ID passed was not recognized as valid by a WMI data provider.
//
static const int ERROR_WMI_ITEMID_NOT_FOUND       4202L

//
// MessageId: ERROR_WMI_TRY_AGAIN
//
// MessageText:
//
// The WMI request could not be completed and should be retried.
//
static const int ERROR_WMI_TRY_AGAIN              4203L

//
// MessageId: ERROR_WMI_DP_NOT_FOUND
//
// MessageText:
//
// The WMI data provider could not be located.
//
static const int ERROR_WMI_DP_NOT_FOUND           4204L

//
// MessageId: ERROR_WMI_UNRESOLVED_INSTANCE_REF
//
// MessageText:
//
// The WMI data provider references an instance set that has not been registered.
//
static const int ERROR_WMI_UNRESOLVED_INSTANCE_REF 4205L

//
// MessageId: ERROR_WMI_ALREADY_ENABLED
//
// MessageText:
//
// The WMI data block or event notification has already been enabled.
//
static const int ERROR_WMI_ALREADY_ENABLED        4206L

//
// MessageId: ERROR_WMI_GUID_DISCONNECTED
//
// MessageText:
//
// The WMI data block is no longer available.
//
static const int ERROR_WMI_GUID_DISCONNECTED      4207L

//
// MessageId: ERROR_WMI_SERVER_UNAVAILABLE
//
// MessageText:
//
// The WMI data service is not available.
//
static const int ERROR_WMI_SERVER_UNAVAILABLE     4208L

//
// MessageId: ERROR_WMI_DP_FAILED
//
// MessageText:
//
// The WMI data provider failed to carry out the request.
//
static const int ERROR_WMI_DP_FAILED              4209L

//
// MessageId: ERROR_WMI_INVALID_MOF
//
// MessageText:
//
// The WMI MOF information is not valid.
//
static const int ERROR_WMI_INVALID_MOF            4210L

//
// MessageId: ERROR_WMI_INVALID_REGINFO
//
// MessageText:
//
// The WMI registration information is not valid.
//
static const int ERROR_WMI_INVALID_REGINFO        4211L

//
// MessageId: ERROR_WMI_ALREADY_DISABLED
//
// MessageText:
//
// The WMI data block or event notification has already been disabled.
//
static const int ERROR_WMI_ALREADY_DISABLED       4212L

//
// MessageId: ERROR_WMI_READ_ONLY
//
// MessageText:
//
// The WMI data item or data block is read only.
//
static const int ERROR_WMI_READ_ONLY              4213L

//
// MessageId: ERROR_WMI_SET_FAILURE
//
// MessageText:
//
// The WMI data item or data block could not be changed.
//
static const int ERROR_WMI_SET_FAILURE            4214L


///////////////////////////////////////////////////
//                                               //
//      app container Specific Error Codes        //
//                                               //
//                 4250 to 4299                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_NOT_APPCONTAINER
//
// MessageText:
//
// This operation is only valid in the context of an app container.
//
static const int ERROR_NOT_APPCONTAINER           4250L

//
// MessageId: ERROR_APPCONTAINER_REQUIRED
//
// MessageText:
//
// This application can only run in the context of an app container.
//
static const int ERROR_APPCONTAINER_REQUIRED      4251L

//
// MessageId: ERROR_NOT_SUPPORTED_IN_APPCONTAINER
//
// MessageText:
//
// This functionality is not supported in the context of an app container.
//
static const int ERROR_NOT_SUPPORTED_IN_APPCONTAINER 4252L

//
// MessageId: ERROR_INVALID_PACKAGE_SID_LENGTH
//
// MessageText:
//
// The length of the SID supplied is not a valid length for app container SIDs.
//
static const int ERROR_INVALID_PACKAGE_SID_LENGTH 4253L

///////////////////////////////////////////////////
//                                               //
//        RSM (Media Services) Error codes       //
//                                               //
//                 4300 to 4349                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_INVALID_MEDIA
//
// MessageText:
//
// The media identifier does not represent a valid medium.
//
static const int ERROR_INVALID_MEDIA              4300L

//
// MessageId: ERROR_INVALID_LIBRARY
//
// MessageText:
//
// The library identifier does not represent a valid library.
//
static const int ERROR_INVALID_LIBRARY            4301L

//
// MessageId: ERROR_INVALID_MEDIA_POOL
//
// MessageText:
//
// The media pool identifier does not represent a valid media pool.
//
static const int ERROR_INVALID_MEDIA_POOL         4302L

//
// MessageId: ERROR_DRIVE_MEDIA_MISMATCH
//
// MessageText:
//
// The drive and medium are not compatible or exist in different libraries.
//
static const int ERROR_DRIVE_MEDIA_MISMATCH       4303L

//
// MessageId: ERROR_MEDIA_OFFLINE
//
// MessageText:
//
// The medium currently exists in an offline library and must be online to perform this operation.
//
static const int ERROR_MEDIA_OFFLINE              4304L

//
// MessageId: ERROR_LIBRARY_OFFLINE
//
// MessageText:
//
// The operation cannot be performed on an offline library.
//
static const int ERROR_LIBRARY_OFFLINE            4305L

//
// MessageId: ERROR_EMPTY
//
// MessageText:
//
// The library, drive, or media pool is empty.
//
static const int ERROR_EMPTY                      4306L

//
// MessageId: ERROR_NOT_EMPTY
//
// MessageText:
//
// The library, drive, or media pool must be empty to perform this operation.
//
static const int ERROR_NOT_EMPTY                  4307L

//
// MessageId: ERROR_MEDIA_UNAVAILABLE
//
// MessageText:
//
// No media is currently available in this media pool or library.
//
static const int ERROR_MEDIA_UNAVAILABLE          4308L

//
// MessageId: ERROR_RESOURCE_DISABLED
//
// MessageText:
//
// A resource required for this operation is disabled.
//
static const int ERROR_RESOURCE_DISABLED          4309L

//
// MessageId: ERROR_INVALID_CLEANER
//
// MessageText:
//
// The media identifier does not represent a valid cleaner.
//
static const int ERROR_INVALID_CLEANER            4310L

//
// MessageId: ERROR_UNABLE_TO_CLEAN
//
// MessageText:
//
// The drive cannot be cleaned or does not support cleaning.
//
static const int ERROR_UNABLE_TO_CLEAN            4311L

//
// MessageId: ERROR_OBJECT_NOT_FOUND
//
// MessageText:
//
// The object identifier does not represent a valid object.
//
static const int ERROR_OBJECT_NOT_FOUND           4312L

//
// MessageId: ERROR_DATABASE_FAILURE
//
// MessageText:
//
// Unable to read from or write to the database.
//
static const int ERROR_DATABASE_FAILURE           4313L

//
// MessageId: ERROR_DATABASE_FULL
//
// MessageText:
//
// The database is full.
//
static const int ERROR_DATABASE_FULL              4314L

//
// MessageId: ERROR_MEDIA_INCOMPATIBLE
//
// MessageText:
//
// The medium is not compatible with the device or media pool.
//
static const int ERROR_MEDIA_INCOMPATIBLE         4315L

//
// MessageId: ERROR_RESOURCE_NOT_PRESENT
//
// MessageText:
//
// The resource required for this operation does not exist.
//
static const int ERROR_RESOURCE_NOT_PRESENT       4316L

//
// MessageId: ERROR_INVALID_OPERATION
//
// MessageText:
//
// The operation identifier is not valid.
//
static const int ERROR_INVALID_OPERATION          4317L

//
// MessageId: ERROR_MEDIA_NOT_AVAILABLE
//
// MessageText:
//
// The media is not mounted or ready for use.
//
static const int ERROR_MEDIA_NOT_AVAILABLE        4318L

//
// MessageId: ERROR_DEVICE_NOT_AVAILABLE
//
// MessageText:
//
// The device is not ready for use.
//
static const int ERROR_DEVICE_NOT_AVAILABLE       4319L

//
// MessageId: ERROR_REQUEST_REFUSED
//
// MessageText:
//
// The operator or administrator has refused the request.
//
static const int ERROR_REQUEST_REFUSED            4320L

//
// MessageId: ERROR_INVALID_DRIVE_OBJECT
//
// MessageText:
//
// The drive identifier does not represent a valid drive.
//
static const int ERROR_INVALID_DRIVE_OBJECT       4321L

//
// MessageId: ERROR_LIBRARY_FULL
//
// MessageText:
//
// Library is full. No slot is available for use.
//
static const int ERROR_LIBRARY_FULL               4322L

//
// MessageId: ERROR_MEDIUM_NOT_ACCESSIBLE
//
// MessageText:
//
// The transport cannot access the medium.
//
static const int ERROR_MEDIUM_NOT_ACCESSIBLE      4323L

//
// MessageId: ERROR_UNABLE_TO_LOAD_MEDIUM
//
// MessageText:
//
// Unable to load the medium into the drive.
//
static const int ERROR_UNABLE_TO_LOAD_MEDIUM      4324L

//
// MessageId: ERROR_UNABLE_TO_INVENTORY_DRIVE
//
// MessageText:
//
// Unable to retrieve the drive status.
//
static const int ERROR_UNABLE_TO_INVENTORY_DRIVE  4325L

//
// MessageId: ERROR_UNABLE_TO_INVENTORY_SLOT
//
// MessageText:
//
// Unable to retrieve the slot status.
//
static const int ERROR_UNABLE_TO_INVENTORY_SLOT   4326L

//
// MessageId: ERROR_UNABLE_TO_INVENTORY_TRANSPORT
//
// MessageText:
//
// Unable to retrieve status about the transport.
//
static const int ERROR_UNABLE_TO_INVENTORY_TRANSPORT 4327L

//
// MessageId: ERROR_TRANSPORT_FULL
//
// MessageText:
//
// Cannot use the transport because it is already in use.
//
static const int ERROR_TRANSPORT_FULL             4328L

//
// MessageId: ERROR_CONTROLLING_IEPORT
//
// MessageText:
//
// Unable to open or close the inject/eject port.
//
static const int ERROR_CONTROLLING_IEPORT         4329L

//
// MessageId: ERROR_UNABLE_TO_EJECT_MOUNTED_MEDIA
//
// MessageText:
//
// Unable to eject the medium because it is in a drive.
//
static const int ERROR_UNABLE_TO_EJECT_MOUNTED_MEDIA 4330L

//
// MessageId: ERROR_CLEANER_SLOT_SET
//
// MessageText:
//
// A cleaner slot is already reserved.
//
static const int ERROR_CLEANER_SLOT_SET           4331L

//
// MessageId: ERROR_CLEANER_SLOT_NOT_SET
//
// MessageText:
//
// A cleaner slot is not reserved.
//
static const int ERROR_CLEANER_SLOT_NOT_SET       4332L

//
// MessageId: ERROR_CLEANER_CARTRIDGE_SPENT
//
// MessageText:
//
// The cleaner cartridge has performed the maximum number of drive cleanings.
//
static const int ERROR_CLEANER_CARTRIDGE_SPENT    4333L

//
// MessageId: ERROR_UNEXPECTED_OMID
//
// MessageText:
//
// Unexpected on-medium identifier.
//
static const int ERROR_UNEXPECTED_OMID            4334L

//
// MessageId: ERROR_CANT_DELETE_LAST_ITEM
//
// MessageText:
//
// The last remaining item in this group or resource cannot be deleted.
//
static const int ERROR_CANT_DELETE_LAST_ITEM      4335L

//
// MessageId: ERROR_MESSAGE_EXCEEDS_MAX_SIZE
//
// MessageText:
//
// The message provided exceeds the maximum size allowed for this parameter.
//
static const int ERROR_MESSAGE_EXCEEDS_MAX_SIZE   4336L

//
// MessageId: ERROR_VOLUME_CONTAINS_SYS_FILES
//
// MessageText:
//
// The volume contains system or paging files.
//
static const int ERROR_VOLUME_CONTAINS_SYS_FILES  4337L

//
// MessageId: ERROR_INDIGENOUS_TYPE
//
// MessageText:
//
// The media type cannot be removed from this library since at least one drive in the library reports it can support this media type.
//
static const int ERROR_INDIGENOUS_TYPE            4338L

//
// MessageId: ERROR_NO_SUPPORTING_DRIVES
//
// MessageText:
//
// This offline media cannot be mounted on this system since no enabled drives are present which can be used.
//
static const int ERROR_NO_SUPPORTING_DRIVES       4339L

//
// MessageId: ERROR_CLEANER_CARTRIDGE_INSTALLED
//
// MessageText:
//
// A cleaner cartridge is present in the tape library.
//
static const int ERROR_CLEANER_CARTRIDGE_INSTALLED 4340L

//
// MessageId: ERROR_IEPORT_FULL
//
// MessageText:
//
// Cannot use the inject/eject port because it is not empty.
//
static const int ERROR_IEPORT_FULL                4341L


///////////////////////////////////////////////////
//                                               //
//       Remote Storage Service Error codes      //
//                                               //
//                 4350 to 4389                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_FILE_OFFLINE
//
// MessageText:
//
// This file is currently not available for use on this computer.
//
static const int ERROR_FILE_OFFLINE               4350L

//
// MessageId: ERROR_REMOTE_STORAGE_NOT_ACTIVE
//
// MessageText:
//
// The remote storage service is not operational at this time.
//
static const int ERROR_REMOTE_STORAGE_NOT_ACTIVE  4351L

//
// MessageId: ERROR_REMOTE_STORAGE_MEDIA_ERROR
//
// MessageText:
//
// The remote storage service encountered a media error.
//
static const int ERROR_REMOTE_STORAGE_MEDIA_ERROR 4352L


///////////////////////////////////////////////////
//                                               //
//           Reparse Point Error codes           //
//                                               //
//                 4390 to 4399                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_NOT_A_REPARSE_POINT
//
// MessageText:
//
// The file or directory is not a reparse point.
//
static const int ERROR_NOT_A_REPARSE_POINT        4390L

//
// MessageId: ERROR_REPARSE_ATTRIBUTE_CONFLICT
//
// MessageText:
//
// The reparse point attribute cannot be set because it conflicts with an existing attribute.
//
static const int ERROR_REPARSE_ATTRIBUTE_CONFLICT 4391L

//
// MessageId: ERROR_INVALID_REPARSE_DATA
//
// MessageText:
//
// The data present in the reparse point buffer is invalid.
//
static const int ERROR_INVALID_REPARSE_DATA       4392L

//
// MessageId: ERROR_REPARSE_TAG_INVALID
//
// MessageText:
//
// The tag present in the reparse point buffer is invalid.
//
static const int ERROR_REPARSE_TAG_INVALID        4393L

//
// MessageId: ERROR_REPARSE_TAG_MISMATCH
//
// MessageText:
//
// There is a mismatch between the tag specified in the request and the tag present in the reparse point.
//
static const int ERROR_REPARSE_TAG_MISMATCH       4394L

//
// MessageId: ERROR_REPARSE_POINT_ENCOUNTERED
//
// MessageText:
//
// The object manager encountered a reparse point while retrieving an object.
//
static const int ERROR_REPARSE_POINT_ENCOUNTERED  4395L


///////////////////////////////////////////////////
//                                               //
//         Fast Cache Specific Error Codes       //
//                                               //
//                 4400 to 4419                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_APP_DATA_NOT_FOUND
//
// MessageText:
//
// Fast Cache data not found.
//
static const int ERROR_APP_DATA_NOT_FOUND         4400L

//
// MessageId: ERROR_APP_DATA_EXPIRED
//
// MessageText:
//
// Fast Cache data expired.
//
static const int ERROR_APP_DATA_EXPIRED           4401L

//
// MessageId: ERROR_APP_DATA_CORRUPT
//
// MessageText:
//
// Fast Cache data corrupt.
//
static const int ERROR_APP_DATA_CORRUPT           4402L

//
// MessageId: ERROR_APP_DATA_LIMIT_EXCEEDED
//
// MessageText:
//
// Fast Cache data has exceeded its max size and cannot be updated.
//
static const int ERROR_APP_DATA_LIMIT_EXCEEDED    4403L

//
// MessageId: ERROR_APP_DATA_REBOOT_REQUIRED
//
// MessageText:
//
// Fast Cache has been ReArmed and requires a reboot until it can be updated.
//
static const int ERROR_APP_DATA_REBOOT_REQUIRED   4404L


///////////////////////////////////////////////////
//                                               //
//             SecureBoot Error codes            //
//                                               //
//                 4420 to 4439                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_SECUREBOOT_ROLLBACK_DETECTED
//
// MessageText:
//
// Secure Boot detected that rollback of protected data has been attempted.
//
static const int ERROR_SECUREBOOT_ROLLBACK_DETECTED 4420L

//
// MessageId: ERROR_SECUREBOOT_POLICY_VIOLATION
//
// MessageText:
//
// The value is protected by Secure Boot policy and cannot be modified or deleted.
//
static const int ERROR_SECUREBOOT_POLICY_VIOLATION 4421L

//
// MessageId: ERROR_SECUREBOOT_INVALID_POLICY
//
// MessageText:
//
// The Secure Boot policy is invalid.
//
static const int ERROR_SECUREBOOT_INVALID_POLICY  4422L

//
// MessageId: ERROR_SECUREBOOT_POLICY_PUBLISHER_NOT_FOUND
//
// MessageText:
//
// A new Secure Boot policy did not contain the current publisher on its update list.
//
static const int ERROR_SECUREBOOT_POLICY_PUBLISHER_NOT_FOUND 4423L

//
// MessageId: ERROR_SECUREBOOT_POLICY_NOT_SIGNED
//
// MessageText:
//
// The Secure Boot policy is either not signed or is signed by a non-trusted signer.
//
static const int ERROR_SECUREBOOT_POLICY_NOT_SIGNED 4424L

//
// MessageId: ERROR_SECUREBOOT_NOT_ENABLED
//
// MessageText:
//
// Secure Boot is not enabled on this machine.
//
static const int ERROR_SECUREBOOT_NOT_ENABLED     4425L

//
// MessageId: ERROR_SECUREBOOT_FILE_REPLACED
//
// MessageText:
//
// Secure Boot requires that certain files and drivers are not replaced by other files or drivers.
//
static const int ERROR_SECUREBOOT_FILE_REPLACED   4426L

//
// MessageId: ERROR_SECUREBOOT_POLICY_NOT_AUTHORIZED
//
// MessageText:
//
// The Secure Boot Supplemental Policy file was not authorized on this machine.
//
static const int ERROR_SECUREBOOT_POLICY_NOT_AUTHORIZED 4427L

//
// MessageId: ERROR_SECUREBOOT_POLICY_UNKNOWN
//
// MessageText:
//
// The Supplemntal Policy is not recognized on this device.
//
static const int ERROR_SECUREBOOT_POLICY_UNKNOWN  4428L

//
// MessageId: ERROR_SECUREBOOT_POLICY_MISSING_ANTIROLLBACKVERSION
//
// MessageText:
//
// The Antirollback version was not found in the Secure Boot Policy.
//
static const int ERROR_SECUREBOOT_POLICY_MISSING_ANTIROLLBACKVERSION 4429L

//
// MessageId: ERROR_SECUREBOOT_PLATFORM_ID_MISMATCH
//
// MessageText:
//
// The Platform ID specified in the Secure Boot policy does not match the Platform ID on this device.
//
static const int ERROR_SECUREBOOT_PLATFORM_ID_MISMATCH 4430L

//
// MessageId: ERROR_SECUREBOOT_POLICY_ROLLBACK_DETECTED
//
// MessageText:
//
// The Secure Boot policy file has an older Antirollback Version than this device.
//
static const int ERROR_SECUREBOOT_POLICY_ROLLBACK_DETECTED 4431L

//
// MessageId: ERROR_SECUREBOOT_POLICY_UPGRADE_MISMATCH
//
// MessageText:
//
// The Secure Boot policy file does not match the upgraded legacy policy.
//
static const int ERROR_SECUREBOOT_POLICY_UPGRADE_MISMATCH 4432L

//
// MessageId: ERROR_SECUREBOOT_REQUIRED_POLICY_FILE_MISSING
//
// MessageText:
//
// The Secure Boot policy file is required but could not be found.
//
static const int ERROR_SECUREBOOT_REQUIRED_POLICY_FILE_MISSING 4433L

//
// MessageId: ERROR_SECUREBOOT_NOT_BASE_POLICY
//
// MessageText:
//
// Supplemental Secure Boot policy file can not be loaded as a base Secure Boot policy.
//
static const int ERROR_SECUREBOOT_NOT_BASE_POLICY 4434L

//
// MessageId: ERROR_SECUREBOOT_NOT_SUPPLEMENTAL_POLICY
//
// MessageText:
//
// Base Secure Boot policy file can not be loaded as a Supplemental Secure Boot policy.
//
static const int ERROR_SECUREBOOT_NOT_SUPPLEMENTAL_POLICY 4435L


///////////////////////////////////////////////////
//                                               //
//       File System Specific Error Codes        //
//                                               //
//                 4440 to 4499                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_OFFLOAD_READ_FLT_NOT_SUPPORTED
//
// MessageText:
//
// The copy offload read operation is not supported by a filter.
//
static const int ERROR_OFFLOAD_READ_FLT_NOT_SUPPORTED 4440L

//
// MessageId: ERROR_OFFLOAD_WRITE_FLT_NOT_SUPPORTED
//
// MessageText:
//
// The copy offload write operation is not supported by a filter.
//
static const int ERROR_OFFLOAD_WRITE_FLT_NOT_SUPPORTED 4441L

//
// MessageId: ERROR_OFFLOAD_READ_FILE_NOT_SUPPORTED
//
// MessageText:
//
// The copy offload read operation is not supported for the file.
//
static const int ERROR_OFFLOAD_READ_FILE_NOT_SUPPORTED 4442L

//
// MessageId: ERROR_OFFLOAD_WRITE_FILE_NOT_SUPPORTED
//
// MessageText:
//
// The copy offload write operation is not supported for the file.
//
static const int ERROR_OFFLOAD_WRITE_FILE_NOT_SUPPORTED 4443L

//
// MessageId: ERROR_ALREADY_HAS_STREAM_ID
//
// MessageText:
//
// This file is currently associated with a different stream id.
//
static const int ERROR_ALREADY_HAS_STREAM_ID      4444L

//
// MessageId: ERROR_SMR_GARBAGE_COLLECTION_REQUIRED
//
// MessageText:
//
// The volume must undergo garbage collection.
//
static const int ERROR_SMR_GARBAGE_COLLECTION_REQUIRED 4445L

//
// MessageId: ERROR_WOF_WIM_HEADER_CORRUPT
//
// MessageText:
//
// The WOF driver encountered a corruption in WIM image's Header.
//
static const int ERROR_WOF_WIM_HEADER_CORRUPT     4446L

//
// MessageId: ERROR_WOF_WIM_RESOURCE_TABLE_CORRUPT
//
// MessageText:
//
// The WOF driver encountered a corruption in WIM image's Resource Table.
//
static const int ERROR_WOF_WIM_RESOURCE_TABLE_CORRUPT 4447L

//
// MessageId: ERROR_WOF_FILE_RESOURCE_TABLE_CORRUPT
//
// MessageText:
//
// The WOF driver encountered a corruption in the compressed file's Resource Table.
//
static const int ERROR_WOF_FILE_RESOURCE_TABLE_CORRUPT 4448L


///////////////////////////////////////////////////
//                                               //
//    Single Instance Store (SIS) Error codes    //
//                                               //
//                 4500 to 4549                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_VOLUME_NOT_SIS_ENABLED
//
// MessageText:
//
// Single Instance Storage is not available on this volume.
//
static const int ERROR_VOLUME_NOT_SIS_ENABLED     4500L


///////////////////////////////////////////////////
//                                               //
//             System Integrity Error codes      //
//                                               //
//                 4550 to 4559                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_SYSTEM_INTEGRITY_ROLLBACK_DETECTED
//
// MessageText:
//
// System Integrity detected that policy rollback has been attempted.
//
static const int ERROR_SYSTEM_INTEGRITY_ROLLBACK_DETECTED 4550L

//
// MessageId: ERROR_SYSTEM_INTEGRITY_POLICY_VIOLATION
//
// MessageText:
//
// Your organization used Device Guard to block this app. Contact your support person for more info.
//
static const int ERROR_SYSTEM_INTEGRITY_POLICY_VIOLATION 4551L

//
// MessageId: ERROR_SYSTEM_INTEGRITY_INVALID_POLICY
//
// MessageText:
//
// The System Integrity policy is invalid.
//
static const int ERROR_SYSTEM_INTEGRITY_INVALID_POLICY 4552L

//
// MessageId: ERROR_SYSTEM_INTEGRITY_POLICY_NOT_SIGNED
//
// MessageText:
//
// The System Integrity policy is either not signed or is signed by a non-trusted signer.
//
static const int ERROR_SYSTEM_INTEGRITY_POLICY_NOT_SIGNED 4553L


///////////////////////////////////////////////////
//                                               //
//             VSM Error codes                   //
//                                               //
//                 4560 to 4569                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_VSM_NOT_INITIALIZED
//
// MessageText:
//
// Virtual Secure Mode (VSM) is not initialized. The hypervisor or VSM may not be present or enabled.
//
static const int ERROR_VSM_NOT_INITIALIZED        4560L

//
// MessageId: ERROR_VSM_DMA_PROTECTION_NOT_IN_USE
//
// MessageText:
//
// The hypervisor is not protecting DMA because an IOMMU is not present or not enabled in the BIOS.
//
static const int ERROR_VSM_DMA_PROTECTION_NOT_IN_USE 4561L

///////////////////////////////////////////////////
//                                               //
//         Platform Manifest Error Codes         //
//                                               //
//                 4570 to 4579                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_PLATFORM_MANIFEST_NOT_AUTHORIZED
//
// MessageText:
//
// The Platform Manifest file was not authorized on this machine.
//
static const int ERROR_PLATFORM_MANIFEST_NOT_AUTHORIZED 4570L

//
// MessageId: ERROR_PLATFORM_MANIFEST_INVALID
//
// MessageText:
//
// The Platform Manifest file was not valid.
//
static const int ERROR_PLATFORM_MANIFEST_INVALID  4571L

//
// MessageId: ERROR_PLATFORM_MANIFEST_FILE_NOT_AUTHORIZED
//
// MessageText:
//
// The file is not authorized on this platform because an entry was not found in the Platform Manifest.
//
static const int ERROR_PLATFORM_MANIFEST_FILE_NOT_AUTHORIZED 4572L

//
// MessageId: ERROR_PLATFORM_MANIFEST_CATALOG_NOT_AUTHORIZED
//
// MessageText:
//
// The catalog is not authorized on this platform because an entry was not found in the Platform Manifest.
//
static const int ERROR_PLATFORM_MANIFEST_CATALOG_NOT_AUTHORIZED 4573L

//
// MessageId: ERROR_PLATFORM_MANIFEST_BINARY_ID_NOT_FOUND
//
// MessageText:
//
// The file is not authorized on this platform because a Binary ID was not found in the embedded signature.
//
static const int ERROR_PLATFORM_MANIFEST_BINARY_ID_NOT_FOUND 4574L

//
// MessageId: ERROR_PLATFORM_MANIFEST_NOT_ACTIVE
//
// MessageText:
//
// No active Platform Manifest exists on this system.
//
static const int ERROR_PLATFORM_MANIFEST_NOT_ACTIVE 4575L

//
// MessageId: ERROR_PLATFORM_MANIFEST_NOT_SIGNED
//
// MessageText:
//
// The Platform Manifest file was not properly signed.
//
static const int ERROR_PLATFORM_MANIFEST_NOT_SIGNED 4576L

///////////////////////////////////////////////////
//                                               //
//                  Available                    //
//                                               //
//                 4580 to 4599                  //
///////////////////////////////////////////////////

///////////////////////////////////////////////////
//                                               //
//             Cluster Error codes               //
//                                               //
//                 5000 to 5999                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_DEPENDENT_RESOURCE_EXISTS
//
// MessageText:
//
// The operation cannot be completed because other resources are dependent on this resource.
//
static const int ERROR_DEPENDENT_RESOURCE_EXISTS  5001L

//
// MessageId: ERROR_DEPENDENCY_NOT_FOUND
//
// MessageText:
//
// The cluster resource dependency cannot be found.
//
static const int ERROR_DEPENDENCY_NOT_FOUND       5002L

//
// MessageId: ERROR_DEPENDENCY_ALREADY_EXISTS
//
// MessageText:
//
// The cluster resource cannot be made dependent on the specified resource because it is already dependent.
//
static const int ERROR_DEPENDENCY_ALREADY_EXISTS  5003L

//
// MessageId: ERROR_RESOURCE_NOT_ONLINE
//
// MessageText:
//
// The cluster resource is not online.
//
static const int ERROR_RESOURCE_NOT_ONLINE        5004L

//
// MessageId: ERROR_HOST_NODE_NOT_AVAILABLE
//
// MessageText:
//
// A cluster node is not available for this operation.
//
static const int ERROR_HOST_NODE_NOT_AVAILABLE    5005L

//
// MessageId: ERROR_RESOURCE_NOT_AVAILABLE
//
// MessageText:
//
// The cluster resource is not available.
//
static const int ERROR_RESOURCE_NOT_AVAILABLE     5006L

//
// MessageId: ERROR_RESOURCE_NOT_FOUND
//
// MessageText:
//
// The cluster resource could not be found.
//
static const int ERROR_RESOURCE_NOT_FOUND         5007L

//
// MessageId: ERROR_SHUTDOWN_CLUSTER
//
// MessageText:
//
// The cluster is being shut down.
//
static const int ERROR_SHUTDOWN_CLUSTER           5008L

//
// MessageId: ERROR_CANT_EVICT_ACTIVE_NODE
//
// MessageText:
//
// A cluster node cannot be evicted from the cluster unless the node is down or it is the last node.
//
static const int ERROR_CANT_EVICT_ACTIVE_NODE     5009L

//
// MessageId: ERROR_OBJECT_ALREADY_EXISTS
//
// MessageText:
//
// The object already exists.
//
static const int ERROR_OBJECT_ALREADY_EXISTS      5010L

//
// MessageId: ERROR_OBJECT_IN_LIST
//
// MessageText:
//
// The object is already in the list.
//
static const int ERROR_OBJECT_IN_LIST             5011L

//
// MessageId: ERROR_GROUP_NOT_AVAILABLE
//
// MessageText:
//
// The cluster group is not available for any new requests.
//
static const int ERROR_GROUP_NOT_AVAILABLE        5012L

//
// MessageId: ERROR_GROUP_NOT_FOUND
//
// MessageText:
//
// The cluster group could not be found.
//
static const int ERROR_GROUP_NOT_FOUND            5013L

//
// MessageId: ERROR_GROUP_NOT_ONLINE
//
// MessageText:
//
// The operation could not be completed because the cluster group is not online.
//
static const int ERROR_GROUP_NOT_ONLINE           5014L

//
// MessageId: ERROR_HOST_NODE_NOT_RESOURCE_OWNER
//
// MessageText:
//
// The operation failed because either the specified cluster node is not the owner of the resource, or the node is not a possible owner of the resource.
//
static const int ERROR_HOST_NODE_NOT_RESOURCE_OWNER 5015L

//
// MessageId: ERROR_HOST_NODE_NOT_GROUP_OWNER
//
// MessageText:
//
// The operation failed because either the specified cluster node is not the owner of the group, or the node is not a possible owner of the group.
//
static const int ERROR_HOST_NODE_NOT_GROUP_OWNER  5016L

//
// MessageId: ERROR_RESMON_CREATE_FAILED
//
// MessageText:
//
// The cluster resource could not be created in the specified resource monitor.
//
static const int ERROR_RESMON_CREATE_FAILED       5017L

//
// MessageId: ERROR_RESMON_ONLINE_FAILED
//
// MessageText:
//
// The cluster resource could not be brought online by the resource monitor.
//
static const int ERROR_RESMON_ONLINE_FAILED       5018L

//
// MessageId: ERROR_RESOURCE_ONLINE
//
// MessageText:
//
// The operation could not be completed because the cluster resource is online.
//
static const int ERROR_RESOURCE_ONLINE            5019L

//
// MessageId: ERROR_QUORUM_RESOURCE
//
// MessageText:
//
// The cluster resource could not be deleted or brought offline because it is the quorum resource.
//
static const int ERROR_QUORUM_RESOURCE            5020L

//
// MessageId: ERROR_NOT_QUORUM_CAPABLE
//
// MessageText:
//
// The cluster could not make the specified resource a quorum resource because it is not capable of being a quorum resource.
//
static const int ERROR_NOT_QUORUM_CAPABLE         5021L

//
// MessageId: ERROR_CLUSTER_SHUTTING_DOWN
//
// MessageText:
//
// The cluster software is shutting down.
//
static const int ERROR_CLUSTER_SHUTTING_DOWN      5022L

//
// MessageId: ERROR_INVALID_STATE
//
// MessageText:
//
// The group or resource is not in the correct state to perform the requested operation.
//
static const int ERROR_INVALID_STATE              5023L

//
// MessageId: ERROR_RESOURCE_PROPERTIES_STORED
//
// MessageText:
//
// The properties were stored but not all changes will take effect until the next time the resource is brought online.
//
static const int ERROR_RESOURCE_PROPERTIES_STORED 5024L

//
// MessageId: ERROR_NOT_QUORUM_CLASS
//
// MessageText:
//
// The cluster could not make the specified resource a quorum resource because it does not belong to a shared storage class.
//
static const int ERROR_NOT_QUORUM_CLASS           5025L

//
// MessageId: ERROR_CORE_RESOURCE
//
// MessageText:
//
// The cluster resource could not be deleted since it is a core resource.
//
static const int ERROR_CORE_RESOURCE              5026L

//
// MessageId: ERROR_QUORUM_RESOURCE_ONLINE_FAILED
//
// MessageText:
//
// The quorum resource failed to come online.
//
static const int ERROR_QUORUM_RESOURCE_ONLINE_FAILED 5027L

//
// MessageId: ERROR_QUORUMLOG_OPEN_FAILED
//
// MessageText:
//
// The quorum log could not be created or mounted successfully.
//
static const int ERROR_QUORUMLOG_OPEN_FAILED      5028L

//
// MessageId: ERROR_CLUSTERLOG_CORRUPT
//
// MessageText:
//
// The cluster log is corrupt.
//
static const int ERROR_CLUSTERLOG_CORRUPT         5029L

//
// MessageId: ERROR_CLUSTERLOG_RECORD_EXCEEDS_MAXSIZE
//
// MessageText:
//
// The record could not be written to the cluster log since it exceeds the maximum size.
//
static const int ERROR_CLUSTERLOG_RECORD_EXCEEDS_MAXSIZE 5030L

//
// MessageId: ERROR_CLUSTERLOG_EXCEEDS_MAXSIZE
//
// MessageText:
//
// The cluster log exceeds its maximum size.
//
static const int ERROR_CLUSTERLOG_EXCEEDS_MAXSIZE 5031L

//
// MessageId: ERROR_CLUSTERLOG_CHKPOINT_NOT_FOUND
//
// MessageText:
//
// No checkpoint record was found in the cluster log.
//
static const int ERROR_CLUSTERLOG_CHKPOINT_NOT_FOUND 5032L

//
// MessageId: ERROR_CLUSTERLOG_NOT_ENOUGH_SPACE
//
// MessageText:
//
// The minimum required disk space needed for logging is not available.
//
static const int ERROR_CLUSTERLOG_NOT_ENOUGH_SPACE 5033L

//
// MessageId: ERROR_QUORUM_OWNER_ALIVE
//
// MessageText:
//
// The cluster node failed to take control of the quorum resource because the resource is owned by another active node.
//
static const int ERROR_QUORUM_OWNER_ALIVE         5034L

//
// MessageId: ERROR_NETWORK_NOT_AVAILABLE
//
// MessageText:
//
// A cluster network is not available for this operation.
//
static const int ERROR_NETWORK_NOT_AVAILABLE      5035L

//
// MessageId: ERROR_NODE_NOT_AVAILABLE
//
// MessageText:
//
// A cluster node is not available for this operation.
//
static const int ERROR_NODE_NOT_AVAILABLE         5036L

//
// MessageId: ERROR_ALL_NODES_NOT_AVAILABLE
//
// MessageText:
//
// All cluster nodes must be running to perform this operation.
//
static const int ERROR_ALL_NODES_NOT_AVAILABLE    5037L

//
// MessageId: ERROR_RESOURCE_FAILED
//
// MessageText:
//
// A cluster resource failed.
//
static const int ERROR_RESOURCE_FAILED            5038L

//
// MessageId: ERROR_CLUSTER_INVALID_NODE
//
// MessageText:
//
// The cluster node is not valid.
//
static const int ERROR_CLUSTER_INVALID_NODE       5039L

//
// MessageId: ERROR_CLUSTER_NODE_EXISTS
//
// MessageText:
//
// The cluster node already exists.
//
static const int ERROR_CLUSTER_NODE_EXISTS        5040L

//
// MessageId: ERROR_CLUSTER_JOIN_IN_PROGRESS
//
// MessageText:
//
// A node is in the process of joining the cluster.
//
static const int ERROR_CLUSTER_JOIN_IN_PROGRESS   5041L

//
// MessageId: ERROR_CLUSTER_NODE_NOT_FOUND
//
// MessageText:
//
// The cluster node was not found.
//
static const int ERROR_CLUSTER_NODE_NOT_FOUND     5042L

//
// MessageId: ERROR_CLUSTER_LOCAL_NODE_NOT_FOUND
//
// MessageText:
//
// The cluster local node information was not found.
//
static const int ERROR_CLUSTER_LOCAL_NODE_NOT_FOUND 5043L

//
// MessageId: ERROR_CLUSTER_NETWORK_EXISTS
//
// MessageText:
//
// The cluster network already exists.
//
static const int ERROR_CLUSTER_NETWORK_EXISTS     5044L

//
// MessageId: ERROR_CLUSTER_NETWORK_NOT_FOUND
//
// MessageText:
//
// The cluster network was not found.
//
static const int ERROR_CLUSTER_NETWORK_NOT_FOUND  5045L

//
// MessageId: ERROR_CLUSTER_NETINTERFACE_EXISTS
//
// MessageText:
//
// The cluster network interface already exists.
//
static const int ERROR_CLUSTER_NETINTERFACE_EXISTS 5046L

//
// MessageId: ERROR_CLUSTER_NETINTERFACE_NOT_FOUND
//
// MessageText:
//
// The cluster network interface was not found.
//
static const int ERROR_CLUSTER_NETINTERFACE_NOT_FOUND 5047L

//
// MessageId: ERROR_CLUSTER_INVALID_REQUEST
//
// MessageText:
//
// The cluster request is not valid for this object.
//
static const int ERROR_CLUSTER_INVALID_REQUEST    5048L

//
// MessageId: ERROR_CLUSTER_INVALID_NETWORK_PROVIDER
//
// MessageText:
//
// The cluster network provider is not valid.
//
static const int ERROR_CLUSTER_INVALID_NETWORK_PROVIDER 5049L

//
// MessageId: ERROR_CLUSTER_NODE_DOWN
//
// MessageText:
//
// The cluster node is down.
//
static const int ERROR_CLUSTER_NODE_DOWN          5050L

//
// MessageId: ERROR_CLUSTER_NODE_UNREACHABLE
//
// MessageText:
//
// The cluster node is not reachable.
//
static const int ERROR_CLUSTER_NODE_UNREACHABLE   5051L

//
// MessageId: ERROR_CLUSTER_NODE_NOT_MEMBER
//
// MessageText:
//
// The cluster node is not a member of the cluster.
//
static const int ERROR_CLUSTER_NODE_NOT_MEMBER    5052L

//
// MessageId: ERROR_CLUSTER_JOIN_NOT_IN_PROGRESS
//
// MessageText:
//
// A cluster join operation is not in progress.
//
static const int ERROR_CLUSTER_JOIN_NOT_IN_PROGRESS 5053L

//
// MessageId: ERROR_CLUSTER_INVALID_NETWORK
//
// MessageText:
//
// The cluster network is not valid.
//
static const int ERROR_CLUSTER_INVALID_NETWORK    5054L

//
// MessageId: ERROR_CLUSTER_NODE_UP
//
// MessageText:
//
// The cluster node is up.
//
static const int ERROR_CLUSTER_NODE_UP            5056L

//
// MessageId: ERROR_CLUSTER_IPADDR_IN_USE
//
// MessageText:
//
// The cluster IP address is already in use.
//
static const int ERROR_CLUSTER_IPADDR_IN_USE      5057L

//
// MessageId: ERROR_CLUSTER_NODE_NOT_PAUSED
//
// MessageText:
//
// The cluster node is not paused.
//
static const int ERROR_CLUSTER_NODE_NOT_PAUSED    5058L

//
// MessageId: ERROR_CLUSTER_NO_SECURITY_CONTEXT
//
// MessageText:
//
// No cluster security context is available.
//
static const int ERROR_CLUSTER_NO_SECURITY_CONTEXT 5059L

//
// MessageId: ERROR_CLUSTER_NETWORK_NOT_INTERNAL
//
// MessageText:
//
// The cluster network is not configured for internal cluster communication.
//
static const int ERROR_CLUSTER_NETWORK_NOT_INTERNAL 5060L

//
// MessageId: ERROR_CLUSTER_NODE_ALREADY_UP
//
// MessageText:
//
// The cluster node is already up.
//
static const int ERROR_CLUSTER_NODE_ALREADY_UP    5061L

//
// MessageId: ERROR_CLUSTER_NODE_ALREADY_DOWN
//
// MessageText:
//
// The cluster node is already down.
//
static const int ERROR_CLUSTER_NODE_ALREADY_DOWN  5062L

//
// MessageId: ERROR_CLUSTER_NETWORK_ALREADY_ONLINE
//
// MessageText:
//
// The cluster network is already online.
//
static const int ERROR_CLUSTER_NETWORK_ALREADY_ONLINE 5063L

//
// MessageId: ERROR_CLUSTER_NETWORK_ALREADY_OFFLINE
//
// MessageText:
//
// The cluster network is already offline.
//
static const int ERROR_CLUSTER_NETWORK_ALREADY_OFFLINE 5064L

//
// MessageId: ERROR_CLUSTER_NODE_ALREADY_MEMBER
//
// MessageText:
//
// The cluster node is already a member of the cluster.
//
static const int ERROR_CLUSTER_NODE_ALREADY_MEMBER 5065L

//
// MessageId: ERROR_CLUSTER_LAST_INTERNAL_NETWORK
//
// MessageText:
//
// The cluster network is the only one configured for internal cluster communication between two or more active cluster nodes. The internal communication capability cannot be removed from the network.
//
static const int ERROR_CLUSTER_LAST_INTERNAL_NETWORK 5066L

//
// MessageId: ERROR_CLUSTER_NETWORK_HAS_DEPENDENTS
//
// MessageText:
//
// One or more cluster resources depend on the network to provide service to clients. The client access capability cannot be removed from the network.
//
static const int ERROR_CLUSTER_NETWORK_HAS_DEPENDENTS 5067L

//
// MessageId: ERROR_INVALID_OPERATION_ON_QUORUM
//
// MessageText:
//
// This operation cannot currently be performed on the cluster group containing the quorum resource.
//
static const int ERROR_INVALID_OPERATION_ON_QUORUM 5068L

//
// MessageId: ERROR_DEPENDENCY_NOT_ALLOWED
//
// MessageText:
//
// The cluster quorum resource is not allowed to have any dependencies.
//
static const int ERROR_DEPENDENCY_NOT_ALLOWED     5069L

//
// MessageId: ERROR_CLUSTER_NODE_PAUSED
//
// MessageText:
//
// The cluster node is paused.
//
static const int ERROR_CLUSTER_NODE_PAUSED        5070L

//
// MessageId: ERROR_NODE_CANT_HOST_RESOURCE
//
// MessageText:
//
// The cluster resource cannot be brought online. The owner node cannot run this resource.
//
static const int ERROR_NODE_CANT_HOST_RESOURCE    5071L

//
// MessageId: ERROR_CLUSTER_NODE_NOT_READY
//
// MessageText:
//
// The cluster node is not ready to perform the requested operation.
//
static const int ERROR_CLUSTER_NODE_NOT_READY     5072L

//
// MessageId: ERROR_CLUSTER_NODE_SHUTTING_DOWN
//
// MessageText:
//
// The cluster node is shutting down.
//
static const int ERROR_CLUSTER_NODE_SHUTTING_DOWN 5073L

//
// MessageId: ERROR_CLUSTER_JOIN_ABORTED
//
// MessageText:
//
// The cluster join operation was aborted.
//
static const int ERROR_CLUSTER_JOIN_ABORTED       5074L

//
// MessageId: ERROR_CLUSTER_INCOMPATIBLE_VERSIONS
//
// MessageText:
//
// The node failed to join the cluster because the joining node and other nodes in the cluster have incompatible operating system versions. To get more information about operating system versions of the cluster, run the Validate a Configuration Wizard or the Test-Cluster Windows PowerShell cmdlet.
//
static const int ERROR_CLUSTER_INCOMPATIBLE_VERSIONS 5075L

//
// MessageId: ERROR_CLUSTER_MAXNUM_OF_RESOURCES_EXCEEDED
//
// MessageText:
//
// This resource cannot be created because the cluster has reached the limit on the number of resources it can monitor.
//
static const int ERROR_CLUSTER_MAXNUM_OF_RESOURCES_EXCEEDED 5076L

//
// MessageId: ERROR_CLUSTER_SYSTEM_CONFIG_CHANGED
//
// MessageText:
//
// The system configuration changed during the cluster join or form operation. The join or form operation was aborted.
//
static const int ERROR_CLUSTER_SYSTEM_CONFIG_CHANGED 5077L

//
// MessageId: ERROR_CLUSTER_RESOURCE_TYPE_NOT_FOUND
//
// MessageText:
//
// The specified resource type was not found.
//
static const int ERROR_CLUSTER_RESOURCE_TYPE_NOT_FOUND 5078L

//
// MessageId: ERROR_CLUSTER_RESTYPE_NOT_SUPPORTED
//
// MessageText:
//
// The specified node does not support a resource of this type. This may be due to version inconsistencies or due to the absence of the resource DLL on this node.
//
static const int ERROR_CLUSTER_RESTYPE_NOT_SUPPORTED 5079L

//
// MessageId: ERROR_CLUSTER_RESNAME_NOT_FOUND
//
// MessageText:
//
// The specified resource name is not supported by this resource DLL. This may be due to a bad (or changed) name supplied to the resource DLL.
//
static const int ERROR_CLUSTER_RESNAME_NOT_FOUND  5080L

//
// MessageId: ERROR_CLUSTER_NO_RPC_PACKAGES_REGISTERED
//
// MessageText:
//
// No authentication package could be registered with the RPC server.
//
static const int ERROR_CLUSTER_NO_RPC_PACKAGES_REGISTERED 5081L

//
// MessageId: ERROR_CLUSTER_OWNER_NOT_IN_PREFLIST
//
// MessageText:
//
// You cannot bring the group online because the owner of the group is not in the preferred list for the group. To change the owner node for the group, move the group.
//
static const int ERROR_CLUSTER_OWNER_NOT_IN_PREFLIST 5082L

//
// MessageId: ERROR_CLUSTER_DATABASE_SEQMISMATCH
//
// MessageText:
//
// The join operation failed because the cluster database sequence number has changed or is incompatible with the locker node. This may happen during a join operation if the cluster database was changing during the join.
//
static const int ERROR_CLUSTER_DATABASE_SEQMISMATCH 5083L

//
// MessageId: ERROR_RESMON_INVALID_STATE
//
// MessageText:
//
// The resource monitor will not allow the fail operation to be performed while the resource is in its current state. This may happen if the resource is in a pending state.
//
static const int ERROR_RESMON_INVALID_STATE       5084L

//
// MessageId: ERROR_CLUSTER_GUM_NOT_LOCKER
//
// MessageText:
//
// A non locker code got a request to reserve the lock for making global updates.
//
static const int ERROR_CLUSTER_GUM_NOT_LOCKER     5085L

//
// MessageId: ERROR_QUORUM_DISK_NOT_FOUND
//
// MessageText:
//
// The quorum disk could not be located by the cluster service.
//
static const int ERROR_QUORUM_DISK_NOT_FOUND      5086L

//
// MessageId: ERROR_DATABASE_BACKUP_CORRUPT
//
// MessageText:
//
// The backed up cluster database is possibly corrupt.
//
static const int ERROR_DATABASE_BACKUP_CORRUPT    5087L

//
// MessageId: ERROR_CLUSTER_NODE_ALREADY_HAS_DFS_ROOT
//
// MessageText:
//
// A DFS root already exists in this cluster node.
//
static const int ERROR_CLUSTER_NODE_ALREADY_HAS_DFS_ROOT 5088L

//
// MessageId: ERROR_RESOURCE_PROPERTY_UNCHANGEABLE
//
// MessageText:
//
// An attempt to modify a resource property failed because it conflicts with another existing property.
//
static const int ERROR_RESOURCE_PROPERTY_UNCHANGEABLE 5089L

//
// MessageId: ERROR_NO_ADMIN_ACCESS_POINT
//
// MessageText:
//
// This operation is not supported on a cluster without an Administrator Access Point.
//
static const int ERROR_NO_ADMIN_ACCESS_POINT      5090L

/*
 Codes from 4300 through 5889 overlap with codes in ds\published\inc\apperr2.w.
 Do not add any more error codes in that range.
*/
//
// MessageId: ERROR_CLUSTER_MEMBERSHIP_INVALID_STATE
//
// MessageText:
//
// An operation was attempted that is incompatible with the current membership state of the node.
//
static const int ERROR_CLUSTER_MEMBERSHIP_INVALID_STATE 5890L

//
// MessageId: ERROR_CLUSTER_QUORUMLOG_NOT_FOUND
//
// MessageText:
//
// The quorum resource does not contain the quorum log.
//
static const int ERROR_CLUSTER_QUORUMLOG_NOT_FOUND 5891L

//
// MessageId: ERROR_CLUSTER_MEMBERSHIP_HALT
//
// MessageText:
//
// The membership engine requested shutdown of the cluster service on this node.
//
static const int ERROR_CLUSTER_MEMBERSHIP_HALT    5892L

//
// MessageId: ERROR_CLUSTER_INSTANCE_ID_MISMATCH
//
// MessageText:
//
// The join operation failed because the cluster instance ID of the joining node does not match the cluster instance ID of the sponsor node.
//
static const int ERROR_CLUSTER_INSTANCE_ID_MISMATCH 5893L

//
// MessageId: ERROR_CLUSTER_NETWORK_NOT_FOUND_FOR_IP
//
// MessageText:
//
// A matching cluster network for the specified IP address could not be found.
//
static const int ERROR_CLUSTER_NETWORK_NOT_FOUND_FOR_IP 5894L

//
// MessageId: ERROR_CLUSTER_PROPERTY_DATA_TYPE_MISMATCH
//
// MessageText:
//
// The actual data type of the property did not match the expected data type of the property.
//
static const int ERROR_CLUSTER_PROPERTY_DATA_TYPE_MISMATCH 5895L

//
// MessageId: ERROR_CLUSTER_EVICT_WITHOUT_CLEANUP
//
// MessageText:
//
// The cluster node was evicted from the cluster successfully, but the node was not cleaned up. To determine what cleanup steps failed and how to recover, see the Failover Clustering application event log using Event Viewer.
//
static const int ERROR_CLUSTER_EVICT_WITHOUT_CLEANUP 5896L

//
// MessageId: ERROR_CLUSTER_PARAMETER_MISMATCH
//
// MessageText:
//
// Two or more parameter values specified for a resource's properties are in conflict.
//
static const int ERROR_CLUSTER_PARAMETER_MISMATCH 5897L

//
// MessageId: ERROR_NODE_CANNOT_BE_CLUSTERED
//
// MessageText:
//
// This computer cannot be made a member of a cluster.
//
static const int ERROR_NODE_CANNOT_BE_CLUSTERED   5898L

//
// MessageId: ERROR_CLUSTER_WRONG_OS_VERSION
//
// MessageText:
//
// This computer cannot be made a member of a cluster because it does not have the correct version of Windows installed.
//
static const int ERROR_CLUSTER_WRONG_OS_VERSION   5899L

//
// MessageId: ERROR_CLUSTER_CANT_CREATE_DUP_CLUSTER_NAME
//
// MessageText:
//
// A cluster cannot be created with the specified cluster name because that cluster name is already in use. Specify a different name for the cluster.
//
static const int ERROR_CLUSTER_CANT_CREATE_DUP_CLUSTER_NAME 5900L

//
// MessageId: ERROR_CLUSCFG_ALREADY_COMMITTED
//
// MessageText:
//
// The cluster configuration action has already been committed.
//
static const int ERROR_CLUSCFG_ALREADY_COMMITTED  5901L

//
// MessageId: ERROR_CLUSCFG_ROLLBACK_FAILED
//
// MessageText:
//
// The cluster configuration action could not be rolled back.
//
static const int ERROR_CLUSCFG_ROLLBACK_FAILED    5902L

//
// MessageId: ERROR_CLUSCFG_SYSTEM_DISK_DRIVE_LETTER_CONFLICT
//
// MessageText:
//
// The drive letter assigned to a system disk on one node conflicted with the drive letter assigned to a disk on another node.
//
static const int ERROR_CLUSCFG_SYSTEM_DISK_DRIVE_LETTER_CONFLICT 5903L

//
// MessageId: ERROR_CLUSTER_OLD_VERSION
//
// MessageText:
//
// One or more nodes in the cluster are running a version of Windows that does not support this operation.
//
static const int ERROR_CLUSTER_OLD_VERSION        5904L

//
// MessageId: ERROR_CLUSTER_MISMATCHED_COMPUTER_ACCT_NAME
//
// MessageText:
//
// The name of the corresponding computer account doesn't match the Network Name for this resource.
//
static const int ERROR_CLUSTER_MISMATCHED_COMPUTER_ACCT_NAME 5905L

//
// MessageId: ERROR_CLUSTER_NO_NET_ADAPTERS
//
// MessageText:
//
// No network adapters are available.
//
static const int ERROR_CLUSTER_NO_NET_ADAPTERS    5906L

//
// MessageId: ERROR_CLUSTER_POISONED
//
// MessageText:
//
// The cluster node has been poisoned.
//
static const int ERROR_CLUSTER_POISONED           5907L

//
// MessageId: ERROR_CLUSTER_GROUP_MOVING
//
// MessageText:
//
// The group is unable to accept the request since it is moving to another node.
//
static const int ERROR_CLUSTER_GROUP_MOVING       5908L

//
// MessageId: ERROR_CLUSTER_RESOURCE_TYPE_BUSY
//
// MessageText:
//
// The resource type cannot accept the request since is too busy performing another operation.
//
static const int ERROR_CLUSTER_RESOURCE_TYPE_BUSY 5909L

//
// MessageId: ERROR_RESOURCE_CALL_TIMED_OUT
//
// MessageText:
//
// The call to the cluster resource DLL timed out.
//
static const int ERROR_RESOURCE_CALL_TIMED_OUT    5910L

//
// MessageId: ERROR_INVALID_CLUSTER_IPV6_ADDRESS
//
// MessageText:
//
// The address is not valid for an IPv6 Address resource. A global IPv6 address is required, and it must match a cluster network. Compatibility addresses are not permitted.
//
static const int ERROR_INVALID_CLUSTER_IPV6_ADDRESS 5911L

//
// MessageId: ERROR_CLUSTER_INTERNAL_INVALID_FUNCTION
//
// MessageText:
//
// An internal cluster error occurred. A call to an invalid function was attempted.
//
static const int ERROR_CLUSTER_INTERNAL_INVALID_FUNCTION 5912L

//
// MessageId: ERROR_CLUSTER_PARAMETER_OUT_OF_BOUNDS
//
// MessageText:
//
// A parameter value is out of acceptable range.
//
static const int ERROR_CLUSTER_PARAMETER_OUT_OF_BOUNDS 5913L

//
// MessageId: ERROR_CLUSTER_PARTIAL_SEND
//
// MessageText:
//
// A network error occurred while sending data to another node in the cluster. The number of bytes transmitted was less than required.
//
static const int ERROR_CLUSTER_PARTIAL_SEND       5914L

//
// MessageId: ERROR_CLUSTER_REGISTRY_INVALID_FUNCTION
//
// MessageText:
//
// An invalid cluster registry operation was attempted.
//
static const int ERROR_CLUSTER_REGISTRY_INVALID_FUNCTION 5915L

//
// MessageId: ERROR_CLUSTER_INVALID_STRING_TERMINATION
//
// MessageText:
//
// An input string of characters is not properly terminated.
//
static const int ERROR_CLUSTER_INVALID_STRING_TERMINATION 5916L

//
// MessageId: ERROR_CLUSTER_INVALID_STRING_FORMAT
//
// MessageText:
//
// An input string of characters is not in a valid format for the data it represents.
//
static const int ERROR_CLUSTER_INVALID_STRING_FORMAT 5917L

//
// MessageId: ERROR_CLUSTER_DATABASE_TRANSACTION_IN_PROGRESS
//
// MessageText:
//
// An internal cluster error occurred. A cluster database transaction was attempted while a transaction was already in progress.
//
static const int ERROR_CLUSTER_DATABASE_TRANSACTION_IN_PROGRESS 5918L

//
// MessageId: ERROR_CLUSTER_DATABASE_TRANSACTION_NOT_IN_PROGRESS
//
// MessageText:
//
// An internal cluster error occurred. There was an attempt to commit a cluster database transaction while no transaction was in progress.
//
static const int ERROR_CLUSTER_DATABASE_TRANSACTION_NOT_IN_PROGRESS 5919L

//
// MessageId: ERROR_CLUSTER_NULL_DATA
//
// MessageText:
//
// An internal cluster error occurred. Data was not properly initialized.
//
static const int ERROR_CLUSTER_NULL_DATA          5920L

//
// MessageId: ERROR_CLUSTER_PARTIAL_READ
//
// MessageText:
//
// An error occurred while reading from a stream of data. An unexpected number of bytes was returned.
//
static const int ERROR_CLUSTER_PARTIAL_READ       5921L

//
// MessageId: ERROR_CLUSTER_PARTIAL_WRITE
//
// MessageText:
//
// An error occurred while writing to a stream of data. The required number of bytes could not be written.
//
static const int ERROR_CLUSTER_PARTIAL_WRITE      5922L

//
// MessageId: ERROR_CLUSTER_CANT_DESERIALIZE_DATA
//
// MessageText:
//
// An error occurred while deserializing a stream of cluster data.
//
static const int ERROR_CLUSTER_CANT_DESERIALIZE_DATA 5923L

//
// MessageId: ERROR_DEPENDENT_RESOURCE_PROPERTY_CONFLICT
//
// MessageText:
//
// One or more property values for this resource are in conflict with one or more property values associated with its dependent resource(s).
//
static const int ERROR_DEPENDENT_RESOURCE_PROPERTY_CONFLICT 5924L

//
// MessageId: ERROR_CLUSTER_NO_QUORUM
//
// MessageText:
//
// A quorum of cluster nodes was not present to form a cluster.
//
static const int ERROR_CLUSTER_NO_QUORUM          5925L

//
// MessageId: ERROR_CLUSTER_INVALID_IPV6_NETWORK
//
// MessageText:
//
// The cluster network is not valid for an IPv6 Address resource, or it does not match the configured address.
//
static const int ERROR_CLUSTER_INVALID_IPV6_NETWORK 5926L

//
// MessageId: ERROR_CLUSTER_INVALID_IPV6_TUNNEL_NETWORK
//
// MessageText:
//
// The cluster network is not valid for an IPv6 Tunnel resource. Check the configuration of the IP Address resource on which the IPv6 Tunnel resource depends.
//
static const int ERROR_CLUSTER_INVALID_IPV6_TUNNEL_NETWORK 5927L

//
// MessageId: ERROR_QUORUM_NOT_ALLOWED_IN_THIS_GROUP
//
// MessageText:
//
// Quorum resource cannot reside in the Available Storage group.
//
static const int ERROR_QUORUM_NOT_ALLOWED_IN_THIS_GROUP 5928L

//
// MessageId: ERROR_DEPENDENCY_TREE_TOO_COMPLEX
//
// MessageText:
//
// The dependencies for this resource are nested too deeply.
//
static const int ERROR_DEPENDENCY_TREE_TOO_COMPLEX 5929L

//
// MessageId: ERROR_EXCEPTION_IN_RESOURCE_CALL
//
// MessageText:
//
// The call into the resource DLL raised an unhandled exception.
//
static const int ERROR_EXCEPTION_IN_RESOURCE_CALL 5930L

//
// MessageId: ERROR_CLUSTER_RHS_FAILED_INITIALIZATION
//
// MessageText:
//
// The RHS process failed to initialize.
//
static const int ERROR_CLUSTER_RHS_FAILED_INITIALIZATION 5931L

//
// MessageId: ERROR_CLUSTER_NOT_INSTALLED
//
// MessageText:
//
// The Failover Clustering feature is not installed on this node.
//
static const int ERROR_CLUSTER_NOT_INSTALLED      5932L

//
// MessageId: ERROR_CLUSTER_RESOURCES_MUST_BE_ONLINE_ON_THE_SAME_NODE
//
// MessageText:
//
// The resources must be online on the same node for this operation
//
static const int ERROR_CLUSTER_RESOURCES_MUST_BE_ONLINE_ON_THE_SAME_NODE 5933L

//
// MessageId: ERROR_CLUSTER_MAX_NODES_IN_CLUSTER
//
// MessageText:
//
// A new node can not be added since this cluster is already at its maximum number of nodes.
//
static const int ERROR_CLUSTER_MAX_NODES_IN_CLUSTER 5934L

//
// MessageId: ERROR_CLUSTER_TOO_MANY_NODES
//
// MessageText:
//
// This cluster can not be created since the specified number of nodes exceeds the maximum allowed limit.
//
static const int ERROR_CLUSTER_TOO_MANY_NODES     5935L

//
// MessageId: ERROR_CLUSTER_OBJECT_ALREADY_USED
//
// MessageText:
//
// An attempt to use the specified cluster name failed because an enabled computer object with the given name already exists in the domain.
//
static const int ERROR_CLUSTER_OBJECT_ALREADY_USED 5936L

//
// MessageId: ERROR_NONCORE_GROUPS_FOUND
//
// MessageText:
//
// This cluster cannot be destroyed. It has non-core application groups which must be deleted before the cluster can be destroyed.
//
static const int ERROR_NONCORE_GROUPS_FOUND       5937L

//
// MessageId: ERROR_FILE_SHARE_RESOURCE_CONFLICT
//
// MessageText:
//
// File share associated with file share witness resource cannot be hosted by this cluster or any of its nodes.
//
static const int ERROR_FILE_SHARE_RESOURCE_CONFLICT 5938L

//
// MessageId: ERROR_CLUSTER_EVICT_INVALID_REQUEST
//
// MessageText:
//
// Eviction of this node is invalid at this time. Due to quorum requirements node eviction will result in cluster shutdown.
// If it is the last node in the cluster, destroy cluster command should be used.
//
static const int ERROR_CLUSTER_EVICT_INVALID_REQUEST 5939L

//
// MessageId: ERROR_CLUSTER_SINGLETON_RESOURCE
//
// MessageText:
//
// Only one instance of this resource type is allowed in the cluster.
//
static const int ERROR_CLUSTER_SINGLETON_RESOURCE 5940L

//
// MessageId: ERROR_CLUSTER_GROUP_SINGLETON_RESOURCE
//
// MessageText:
//
// Only one instance of this resource type is allowed per resource group.
//
static const int ERROR_CLUSTER_GROUP_SINGLETON_RESOURCE 5941L

//
// MessageId: ERROR_CLUSTER_RESOURCE_PROVIDER_FAILED
//
// MessageText:
//
// The resource failed to come online due to the failure of one or more provider resources.
//
static const int ERROR_CLUSTER_RESOURCE_PROVIDER_FAILED 5942L

//
// MessageId: ERROR_CLUSTER_RESOURCE_CONFIGURATION_ERROR
//
// MessageText:
//
// The resource has indicated that it cannot come online on any node.
//
static const int ERROR_CLUSTER_RESOURCE_CONFIGURATION_ERROR 5943L

//
// MessageId: ERROR_CLUSTER_GROUP_BUSY
//
// MessageText:
//
// The current operation cannot be performed on this group at this time.
//
static const int ERROR_CLUSTER_GROUP_BUSY         5944L

//
// MessageId: ERROR_CLUSTER_NOT_SHARED_VOLUME
//
// MessageText:
//
// The directory or file is not located on a cluster shared volume.
//
static const int ERROR_CLUSTER_NOT_SHARED_VOLUME  5945L

//
// MessageId: ERROR_CLUSTER_INVALID_SECURITY_DESCRIPTOR
//
// MessageText:
//
// The Security Descriptor does not meet the requirements for a cluster.
//
static const int ERROR_CLUSTER_INVALID_SECURITY_DESCRIPTOR 5946L

//
// MessageId: ERROR_CLUSTER_SHARED_VOLUMES_IN_USE
//
// MessageText:
//
// There is one or more shared volumes resources configured in the cluster.
// Those resources must be moved to available storage in order for operation to succeed.
//
static const int ERROR_CLUSTER_SHARED_VOLUMES_IN_USE 5947L

//
// MessageId: ERROR_CLUSTER_USE_SHARED_VOLUMES_API
//
// MessageText:
//
// This group or resource cannot be directly manipulated.
// Use shared volume APIs to perform desired operation.
//
static const int ERROR_CLUSTER_USE_SHARED_VOLUMES_API 5948L

//
// MessageId: ERROR_CLUSTER_BACKUP_IN_PROGRESS
//
// MessageText:
//
// Back up is in progress. Please wait for backup completion before trying this operation again.
//
static const int ERROR_CLUSTER_BACKUP_IN_PROGRESS 5949L

//
// MessageId: ERROR_NON_CSV_PATH
//
// MessageText:
//
// The path does not belong to a cluster shared volume.
//
static const int ERROR_NON_CSV_PATH               5950L

//
// MessageId: ERROR_CSV_VOLUME_NOT_LOCAL
//
// MessageText:
//
// The cluster shared volume is not locally mounted on this node.
//
static const int ERROR_CSV_VOLUME_NOT_LOCAL       5951L

//
// MessageId: ERROR_CLUSTER_WATCHDOG_TERMINATING
//
// MessageText:
//
// The cluster watchdog is terminating.
//
static const int ERROR_CLUSTER_WATCHDOG_TERMINATING 5952L

//
// MessageId: ERROR_CLUSTER_RESOURCE_VETOED_MOVE_INCOMPATIBLE_NODES
//
// MessageText:
//
// A resource vetoed a move between two nodes because they are incompatible.
//
static const int ERROR_CLUSTER_RESOURCE_VETOED_MOVE_INCOMPATIBLE_NODES 5953L

//
// MessageId: ERROR_CLUSTER_INVALID_NODE_WEIGHT
//
// MessageText:
//
// The request is invalid either because node weight cannot be changed while the cluster is in disk-only quorum mode, or because changing the node weight would violate the minimum cluster quorum requirements.
//
static const int ERROR_CLUSTER_INVALID_NODE_WEIGHT 5954L

//
// MessageId: ERROR_CLUSTER_RESOURCE_VETOED_CALL
//
// MessageText:
//
// The resource vetoed the call.
//
static const int ERROR_CLUSTER_RESOURCE_VETOED_CALL 5955L

//
// MessageId: ERROR_RESMON_SYSTEM_RESOURCES_LACKING
//
// MessageText:
//
// Resource could not start or run because it could not reserve sufficient system resources.
//
static const int ERROR_RESMON_SYSTEM_RESOURCES_LACKING 5956L

//
// MessageId: ERROR_CLUSTER_RESOURCE_VETOED_MOVE_NOT_ENOUGH_RESOURCES_ON_DESTINATION
//
// MessageText:
//
// A resource vetoed a move between two nodes because the destination currently does not have enough resources to complete the operation.
//
static const int ERROR_CLUSTER_RESOURCE_VETOED_MOVE_NOT_ENOUGH_RESOURCES_ON_DESTINATION 5957L

//
// MessageId: ERROR_CLUSTER_RESOURCE_VETOED_MOVE_NOT_ENOUGH_RESOURCES_ON_SOURCE
//
// MessageText:
//
//
// A resource vetoed a move between two nodes because the source currently does not have enough resources to complete the operation.
//
static const int ERROR_CLUSTER_RESOURCE_VETOED_MOVE_NOT_ENOUGH_RESOURCES_ON_SOURCE 5958L

//
// MessageId: ERROR_CLUSTER_GROUP_QUEUED
//
// MessageText:
//
//
// The requested operation can not be completed because the group is queued for an operation.
//
static const int ERROR_CLUSTER_GROUP_QUEUED       5959L

//
// MessageId: ERROR_CLUSTER_RESOURCE_LOCKED_STATUS
//
// MessageText:
//
//
// The requested operation can not be completed because a resource has locked status.
//
static const int ERROR_CLUSTER_RESOURCE_LOCKED_STATUS 5960L

//
// MessageId: ERROR_CLUSTER_SHARED_VOLUME_FAILOVER_NOT_ALLOWED
//
// MessageText:
//
//
// The resource cannot move to another node because a cluster shared volume vetoed the operation.
//
static const int ERROR_CLUSTER_SHARED_VOLUME_FAILOVER_NOT_ALLOWED 5961L

//
// MessageId: ERROR_CLUSTER_NODE_DRAIN_IN_PROGRESS
//
// MessageText:
//
//
// A node drain is already in progress.
//
static const int ERROR_CLUSTER_NODE_DRAIN_IN_PROGRESS 5962L

//
// MessageId: ERROR_CLUSTER_DISK_NOT_CONNECTED
//
// MessageText:
//
//
// Clustered storage is not connected to the node.
//
static const int ERROR_CLUSTER_DISK_NOT_CONNECTED 5963L

//
// MessageId: ERROR_DISK_NOT_CSV_CAPABLE
//
// MessageText:
//
//
// The disk is not configured in a way to be used with CSV. CSV disks must have at least one partition that is formatted with NTFS or REFS.
//
static const int ERROR_DISK_NOT_CSV_CAPABLE       5964L

//
// MessageId: ERROR_RESOURCE_NOT_IN_AVAILABLE_STORAGE
//
// MessageText:
//
//
// The resource must be part of the Available Storage group to complete this action.
//
static const int ERROR_RESOURCE_NOT_IN_AVAILABLE_STORAGE 5965L

//
// MessageId: ERROR_CLUSTER_SHARED_VOLUME_REDIRECTED
//
// MessageText:
//
//
// CSVFS failed operation as volume is in redirected mode.
//
static const int ERROR_CLUSTER_SHARED_VOLUME_REDIRECTED 5966L

//
// MessageId: ERROR_CLUSTER_SHARED_VOLUME_NOT_REDIRECTED
//
// MessageText:
//
//
// CSVFS failed operation as volume is not in redirected mode.
//
static const int ERROR_CLUSTER_SHARED_VOLUME_NOT_REDIRECTED 5967L

//
// MessageId: ERROR_CLUSTER_CANNOT_RETURN_PROPERTIES
//
// MessageText:
//
//
// Cluster properties cannot be returned at this time.
//
static const int ERROR_CLUSTER_CANNOT_RETURN_PROPERTIES 5968L

//
// MessageId: ERROR_CLUSTER_RESOURCE_CONTAINS_UNSUPPORTED_DIFF_AREA_FOR_SHARED_VOLUMES
//
// MessageText:
//
//
// The clustered disk resource contains software snapshot diff area that are not supported for Cluster Shared Volumes.
//
static const int ERROR_CLUSTER_RESOURCE_CONTAINS_UNSUPPORTED_DIFF_AREA_FOR_SHARED_VOLUMES 5969L

//
// MessageId: ERROR_CLUSTER_RESOURCE_IS_IN_MAINTENANCE_MODE
//
// MessageText:
//
//
// The operation cannot be completed because the resource is in maintenance mode.
//
static const int ERROR_CLUSTER_RESOURCE_IS_IN_MAINTENANCE_MODE 5970L

//
// MessageId: ERROR_CLUSTER_AFFINITY_CONFLICT
//
// MessageText:
//
//
// The operation cannot be completed because of cluster affinity conflicts
//
static const int ERROR_CLUSTER_AFFINITY_CONFLICT  5971L

//
// MessageId: ERROR_CLUSTER_RESOURCE_IS_REPLICA_VIRTUAL_MACHINE
//
// MessageText:
//
//
// The operation cannot be completed because the resource is a replica virtual machine.
//
static const int ERROR_CLUSTER_RESOURCE_IS_REPLICA_VIRTUAL_MACHINE 5972L

//
// MessageId: ERROR_CLUSTER_UPGRADE_INCOMPATIBLE_VERSIONS
//
// MessageText:
//
//
// The Cluster Functional Level could not be increased because not all nodes in the cluster support the updated version.
//
static const int ERROR_CLUSTER_UPGRADE_INCOMPATIBLE_VERSIONS 5973L

//
// MessageId: ERROR_CLUSTER_UPGRADE_FIX_QUORUM_NOT_SUPPORTED
//
// MessageText:
//
//
// Updating the cluster functional level failed because the cluster is running in fix quorum mode.
// Start additional nodes which are members of the cluster until the cluster reaches quorum and the cluster will automatically
// switch out of fix quorum mode, or stop and restart the cluster without the FixQuorum switch. Once the cluster is out
// of fix quorum mode retry the Update-ClusterFunctionalLevel PowerShell cmdlet to update the cluster functional level.
//
static const int ERROR_CLUSTER_UPGRADE_FIX_QUORUM_NOT_SUPPORTED 5974L

//
// MessageId: ERROR_CLUSTER_UPGRADE_RESTART_REQUIRED
//
// MessageText:
//
//
// The cluster functional level has been successfully updated but not all features are available yet. Restart the cluster by
// using the Stop-Cluster PowerShell cmdlet followed by the Start-Cluster PowerShell cmdlet and all cluster features will
// be available.
//
static const int ERROR_CLUSTER_UPGRADE_RESTART_REQUIRED 5975L

//
// MessageId: ERROR_CLUSTER_UPGRADE_IN_PROGRESS
//
// MessageText:
//
//
// The cluster is currently performing a version upgrade.
//
static const int ERROR_CLUSTER_UPGRADE_IN_PROGRESS 5976L

//
// MessageId: ERROR_CLUSTER_UPGRADE_INCOMPLETE
//
// MessageText:
//
//
// The cluster did not successfully complete the version upgrade.
//
static const int ERROR_CLUSTER_UPGRADE_INCOMPLETE 5977L

//
// MessageId: ERROR_CLUSTER_NODE_IN_GRACE_PERIOD
//
// MessageText:
//
//
// The cluster node is in grace period.
//
static const int ERROR_CLUSTER_NODE_IN_GRACE_PERIOD 5978L

//
// MessageId: ERROR_CLUSTER_CSV_IO_PAUSE_TIMEOUT
//
// MessageText:
//
//
// The operation has failed because CSV volume was not able to recover in time specified on this file object.
//
static const int ERROR_CLUSTER_CSV_IO_PAUSE_TIMEOUT 5979L

//
// MessageId: ERROR_NODE_NOT_ACTIVE_CLUSTER_MEMBER
//
// MessageText:
//
//
// The operation failed because the requested node is not currently part of active cluster membership.
//
static const int ERROR_NODE_NOT_ACTIVE_CLUSTER_MEMBER 5980L

//
// MessageId: ERROR_CLUSTER_RESOURCE_NOT_MONITORED
//
// MessageText:
//
//
// The operation failed because the requested cluster resource is currently unmonitored.
//
static const int ERROR_CLUSTER_RESOURCE_NOT_MONITORED 5981L

//
// MessageId: ERROR_CLUSTER_RESOURCE_DOES_NOT_SUPPORT_UNMONITORED
//
// MessageText:
//
//
// The operation failed because a resource does not support running in an unmonitored state.
//
static const int ERROR_CLUSTER_RESOURCE_DOES_NOT_SUPPORT_UNMONITORED 5982L

//
// MessageId: ERROR_CLUSTER_RESOURCE_IS_REPLICATED
//
// MessageText:
//
//
// The operation cannot be completed because a resource participates in replication.
//
static const int ERROR_CLUSTER_RESOURCE_IS_REPLICATED 5983L

//
// MessageId: ERROR_CLUSTER_NODE_ISOLATED
//
// MessageText:
//
//
// The operation failed because the requested cluster node has been isolated
//
static const int ERROR_CLUSTER_NODE_ISOLATED      5984L

//
// MessageId: ERROR_CLUSTER_NODE_QUARANTINED
//
// MessageText:
//
//
// The operation failed because the requested cluster node has been quarantined
//
static const int ERROR_CLUSTER_NODE_QUARANTINED   5985L

//
// MessageId: ERROR_CLUSTER_DATABASE_UPDATE_CONDITION_FAILED
//
// MessageText:
//
//
// The operation failed because the specified database update condition was not met
//
static const int ERROR_CLUSTER_DATABASE_UPDATE_CONDITION_FAILED 5986L

//
// MessageId: ERROR_CLUSTER_SPACE_DEGRADED
//
// MessageText:
//
//
// A clustered space is in a degraded condition and the requested action cannot be completed at this time.
//
static const int ERROR_CLUSTER_SPACE_DEGRADED     5987L

//
// MessageId: ERROR_CLUSTER_TOKEN_DELEGATION_NOT_SUPPORTED
//
// MessageText:
//
//
// The operation failed because token delegation for this control is not supported.
//
static const int ERROR_CLUSTER_TOKEN_DELEGATION_NOT_SUPPORTED 5988L

//
// MessageId: ERROR_CLUSTER_CSV_INVALID_HANDLE
//
// MessageText:
//
//
// The operation has failed because CSV has invalidated this file object.
//
static const int ERROR_CLUSTER_CSV_INVALID_HANDLE 5989L

//
// MessageId: ERROR_CLUSTER_CSV_SUPPORTED_ONLY_ON_COORDINATOR
//
// MessageText:
//
//
// This operation is supported only on the CSV coordinator node.
//
static const int ERROR_CLUSTER_CSV_SUPPORTED_ONLY_ON_COORDINATOR 5990L

//
// MessageId: ERROR_GROUPSET_NOT_AVAILABLE
//
// MessageText:
//
//
// The cluster group set is not available for any further requests.
//
static const int ERROR_GROUPSET_NOT_AVAILABLE     5991L

//
// MessageId: ERROR_GROUPSET_NOT_FOUND
//
// MessageText:
//
//
// The cluster group set could not be found.
//
static const int ERROR_GROUPSET_NOT_FOUND         5992L

//
// MessageId: ERROR_GROUPSET_CANT_PROVIDE
//
// MessageText:
//
//
// The action cannot be completed at this time because the cluster group set would fall below quorum and not be able to act as a provider.
//
static const int ERROR_GROUPSET_CANT_PROVIDE      5993L

//
// MessageId: ERROR_CLUSTER_FAULT_DOMAIN_PARENT_NOT_FOUND
//
// MessageText:
//
//
// The specified parent fault domain is not found.
//
static const int ERROR_CLUSTER_FAULT_DOMAIN_PARENT_NOT_FOUND 5994L

//
// MessageId: ERROR_CLUSTER_FAULT_DOMAIN_INVALID_HIERARCHY
//
// MessageText:
//
//
// The fault domain cannot be a child of the parent specified.
//
static const int ERROR_CLUSTER_FAULT_DOMAIN_INVALID_HIERARCHY 5995L

//
// MessageId: ERROR_CLUSTER_FAULT_DOMAIN_FAILED_S2D_VALIDATION
//
// MessageText:
//
//
// Storage Spaces Direct has rejected the proposed fault domain changes because it impacts the fault tolerance of the storage.
//
static const int ERROR_CLUSTER_FAULT_DOMAIN_FAILED_S2D_VALIDATION 5996L

//
// MessageId: ERROR_CLUSTER_FAULT_DOMAIN_S2D_CONNECTIVITY_LOSS
//
// MessageText:
//
//
// Storage Spaces Direct has rejected the proposed fault domain changes because it reduces the storage connected to the system.
//
static const int ERROR_CLUSTER_FAULT_DOMAIN_S2D_CONNECTIVITY_LOSS 5997L

//
// MessageId: ERROR_CLUSTER_INVALID_INFRASTRUCTURE_FILESERVER_NAME
//
// MessageText:
//
//
// Cluster infrastructure file server creation failed because a valid non-empty file server name was not provided.
//
static const int ERROR_CLUSTER_INVALID_INFRASTRUCTURE_FILESERVER_NAME 5998L

//
// MessageId: ERROR_CLUSTERSET_MANAGEMENT_CLUSTER_UNREACHABLE
//
// MessageText:
//
//
// The action cannot be completed because the cluster set managenement cluster is unreachable.
//
static const int ERROR_CLUSTERSET_MANAGEMENT_CLUSTER_UNREACHABLE 5999L


///////////////////////////////////////////////////
//                                               //
//               EFS Error codes                 //
//                                               //
//                 6000 to 6099                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_ENCRYPTION_FAILED
//
// MessageText:
//
// The specified file could not be encrypted.
//
static const int ERROR_ENCRYPTION_FAILED          6000L

//
// MessageId: ERROR_DECRYPTION_FAILED
//
// MessageText:
//
// The specified file could not be decrypted.
//
static const int ERROR_DECRYPTION_FAILED          6001L

//
// MessageId: ERROR_FILE_ENCRYPTED
//
// MessageText:
//
// The specified file is encrypted and the user does not have the ability to decrypt it.
//
static const int ERROR_FILE_ENCRYPTED             6002L

//
// MessageId: ERROR_NO_RECOVERY_POLICY
//
// MessageText:
//
// There is no valid encryption recovery policy configured for this system.
//
static const int ERROR_NO_RECOVERY_POLICY         6003L

//
// MessageId: ERROR_NO_EFS
//
// MessageText:
//
// The required encryption driver is not loaded for this system.
//
static const int ERROR_NO_EFS                     6004L

//
// MessageId: ERROR_WRONG_EFS
//
// MessageText:
//
// The file was encrypted with a different encryption driver than is currently loaded.
//
static const int ERROR_WRONG_EFS                  6005L

//
// MessageId: ERROR_NO_USER_KEYS
//
// MessageText:
//
// There are no EFS keys defined for the user.
//
static const int ERROR_NO_USER_KEYS               6006L

//
// MessageId: ERROR_FILE_NOT_ENCRYPTED
//
// MessageText:
//
// The specified file is not encrypted.
//
static const int ERROR_FILE_NOT_ENCRYPTED         6007L

//
// MessageId: ERROR_NOT_EXPORT_FORMAT
//
// MessageText:
//
// The specified file is not in the defined EFS export format.
//
static const int ERROR_NOT_EXPORT_FORMAT          6008L

//
// MessageId: ERROR_FILE_READ_ONLY
//
// MessageText:
//
// The specified file is read only.
//
static const int ERROR_FILE_READ_ONLY             6009L

//
// MessageId: ERROR_DIR_EFS_DISALLOWED
//
// MessageText:
//
// The directory has been disabled for encryption.
//
static const int ERROR_DIR_EFS_DISALLOWED         6010L

//
// MessageId: ERROR_EFS_SERVER_NOT_TRUSTED
//
// MessageText:
//
// The server is not trusted for remote encryption operation.
//
static const int ERROR_EFS_SERVER_NOT_TRUSTED     6011L

//
// MessageId: ERROR_BAD_RECOVERY_POLICY
//
// MessageText:
//
// Recovery policy configured for this system contains invalid recovery certificate.
//
static const int ERROR_BAD_RECOVERY_POLICY        6012L

//
// MessageId: ERROR_EFS_ALG_BLOB_TOO_BIG
//
// MessageText:
//
// The encryption algorithm used on the source file needs a bigger key buffer than the one on the destination file.
//
static const int ERROR_EFS_ALG_BLOB_TOO_BIG       6013L

//
// MessageId: ERROR_VOLUME_NOT_SUPPORT_EFS
//
// MessageText:
//
// The disk partition does not support file encryption.
//
static const int ERROR_VOLUME_NOT_SUPPORT_EFS     6014L

//
// MessageId: ERROR_EFS_DISABLED
//
// MessageText:
//
// This machine is disabled for file encryption.
//
static const int ERROR_EFS_DISABLED               6015L

//
// MessageId: ERROR_EFS_VERSION_NOT_SUPPORT
//
// MessageText:
//
// A newer system is required to decrypt this encrypted file.
//
static const int ERROR_EFS_VERSION_NOT_SUPPORT    6016L

//
// MessageId: ERROR_CS_ENCRYPTION_INVALID_SERVER_RESPONSE
//
// MessageText:
//
// The remote server sent an invalid response for a file being opened with Client Side Encryption.
//
static const int ERROR_CS_ENCRYPTION_INVALID_SERVER_RESPONSE 6017L

//
// MessageId: ERROR_CS_ENCRYPTION_UNSUPPORTED_SERVER
//
// MessageText:
//
// Client Side Encryption is not supported by the remote server even though it claims to support it.
//
static const int ERROR_CS_ENCRYPTION_UNSUPPORTED_SERVER 6018L

//
// MessageId: ERROR_CS_ENCRYPTION_EXISTING_ENCRYPTED_FILE
//
// MessageText:
//
// File is encrypted and should be opened in Client Side Encryption mode.
//
static const int ERROR_CS_ENCRYPTION_EXISTING_ENCRYPTED_FILE 6019L

//
// MessageId: ERROR_CS_ENCRYPTION_NEW_ENCRYPTED_FILE
//
// MessageText:
//
// A new encrypted file is being created and a $EFS needs to be provided.
//
static const int ERROR_CS_ENCRYPTION_NEW_ENCRYPTED_FILE 6020L

//
// MessageId: ERROR_CS_ENCRYPTION_FILE_NOT_CSE
//
// MessageText:
//
// The SMB client requested a CSE FSCTL on a non-CSE file.
//
static const int ERROR_CS_ENCRYPTION_FILE_NOT_CSE 6021L

//
// MessageId: ERROR_ENCRYPTION_POLICY_DENIES_OPERATION
//
// MessageText:
//
// The requested operation was blocked by policy. For more information, contact your system administrator.
//
static const int ERROR_ENCRYPTION_POLICY_DENIES_OPERATION 6022L


///////////////////////////////////////////////////
//                                               //
//              BROWSER Error codes              //
//                                               //
//                 6100 to 6199                  //
///////////////////////////////////////////////////

// This message number is for historical purposes and cannot be changed or re-used.
//
// MessageId: ERROR_NO_BROWSER_SERVERS_FOUND
//
// MessageText:
//
// The list of servers for this workgroup is not currently available
//
static const int ERROR_NO_BROWSER_SERVERS_FOUND   6118L


///////////////////////////////////////////////////
//                                               //
//            Task Scheduler Error codes         //
//            NET START must understand          //
//                                               //
//                 6200 to 6249                  //
///////////////////////////////////////////////////

//
// MessageId: SCHED_E_SERVICE_NOT_LOCALSYSTEM
//
// MessageText:
//
// The Task Scheduler service must be configured to run in the System account to function properly. Individual tasks may be configured to run in other accounts.
//
static const int SCHED_E_SERVICE_NOT_LOCALSYSTEM  6200L


///////////////////////////////////////////////////
//                                               //
//                  Available                    //
//                                               //
//                 6250 to 6599                  //
///////////////////////////////////////////////////

///////////////////////////////////////////////////
//                                               //
//         Common Log (CLFS) Error codes         //
//                                               //
//                 6600 to 6699                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_LOG_SECTOR_INVALID
//
// MessageText:
//
// Log service encountered an invalid log sector.
//
static const int ERROR_LOG_SECTOR_INVALID         6600L

//
// MessageId: ERROR_LOG_SECTOR_PARITY_INVALID
//
// MessageText:
//
// Log service encountered a log sector with invalid block parity.
//
static const int ERROR_LOG_SECTOR_PARITY_INVALID  6601L

//
// MessageId: ERROR_LOG_SECTOR_REMAPPED
//
// MessageText:
//
// Log service encountered a remapped log sector.
//
static const int ERROR_LOG_SECTOR_REMAPPED        6602L

//
// MessageId: ERROR_LOG_BLOCK_INCOMPLETE
//
// MessageText:
//
// Log service encountered a partial or incomplete log block.
//
static const int ERROR_LOG_BLOCK_INCOMPLETE       6603L

//
// MessageId: ERROR_LOG_INVALID_RANGE
//
// MessageText:
//
// Log service encountered an attempt access data outside the active log range.
//
static const int ERROR_LOG_INVALID_RANGE          6604L

//
// MessageId: ERROR_LOG_BLOCKS_EXHAUSTED
//
// MessageText:
//
// Log service user marshalling buffers are exhausted.
//
static const int ERROR_LOG_BLOCKS_EXHAUSTED       6605L

//
// MessageId: ERROR_LOG_READ_CONTEXT_INVALID
//
// MessageText:
//
// Log service encountered an attempt read from a marshalling area with an invalid read context.
//
static const int ERROR_LOG_READ_CONTEXT_INVALID   6606L

//
// MessageId: ERROR_LOG_RESTART_INVALID
//
// MessageText:
//
// Log service encountered an invalid log restart area.
//
static const int ERROR_LOG_RESTART_INVALID        6607L

//
// MessageId: ERROR_LOG_BLOCK_VERSION
//
// MessageText:
//
// Log service encountered an invalid log block version.
//
static const int ERROR_LOG_BLOCK_VERSION          6608L

//
// MessageId: ERROR_LOG_BLOCK_INVALID
//
// MessageText:
//
// Log service encountered an invalid log block.
//
static const int ERROR_LOG_BLOCK_INVALID          6609L

//
// MessageId: ERROR_LOG_READ_MODE_INVALID
//
// MessageText:
//
// Log service encountered an attempt to read the log with an invalid read mode.
//
static const int ERROR_LOG_READ_MODE_INVALID      6610L

//
// MessageId: ERROR_LOG_NO_RESTART
//
// MessageText:
//
// Log service encountered a log stream with no restart area.
//
static const int ERROR_LOG_NO_RESTART             6611L

//
// MessageId: ERROR_LOG_METADATA_CORRUPT
//
// MessageText:
//
// Log service encountered a corrupted metadata file.
//
static const int ERROR_LOG_METADATA_CORRUPT       6612L

//
// MessageId: ERROR_LOG_METADATA_INVALID
//
// MessageText:
//
// Log service encountered a metadata file that could not be created by the log file system.
//
static const int ERROR_LOG_METADATA_INVALID       6613L

//
// MessageId: ERROR_LOG_METADATA_INCONSISTENT
//
// MessageText:
//
// Log service encountered a metadata file with inconsistent data.
//
static const int ERROR_LOG_METADATA_INCONSISTENT  6614L

//
// MessageId: ERROR_LOG_RESERVATION_INVALID
//
// MessageText:
//
// Log service encountered an attempt to erroneous allocate or dispose reservation space.
//
static const int ERROR_LOG_RESERVATION_INVALID    6615L

//
// MessageId: ERROR_LOG_CANT_DELETE
//
// MessageText:
//
// Log service cannot delete log file or file system container.
//
static const int ERROR_LOG_CANT_DELETE            6616L

//
// MessageId: ERROR_LOG_CONTAINER_LIMIT_EXCEEDED
//
// MessageText:
//
// Log service has reached the maximum allowable containers allocated to a log file.
//
static const int ERROR_LOG_CONTAINER_LIMIT_EXCEEDED 6617L

//
// MessageId: ERROR_LOG_START_OF_LOG
//
// MessageText:
//
// Log service has attempted to read or write backward past the start of the log.
//
static const int ERROR_LOG_START_OF_LOG           6618L

//
// MessageId: ERROR_LOG_POLICY_ALREADY_INSTALLED
//
// MessageText:
//
// Log policy could not be installed because a policy of the same type is already present.
//
static const int ERROR_LOG_POLICY_ALREADY_INSTALLED 6619L

//
// MessageId: ERROR_LOG_POLICY_NOT_INSTALLED
//
// MessageText:
//
// Log policy in question was not installed at the time of the request.
//
static const int ERROR_LOG_POLICY_NOT_INSTALLED   6620L

//
// MessageId: ERROR_LOG_POLICY_INVALID
//
// MessageText:
//
// The installed set of policies on the log is invalid.
//
static const int ERROR_LOG_POLICY_INVALID         6621L

//
// MessageId: ERROR_LOG_POLICY_CONFLICT
//
// MessageText:
//
// A policy on the log in question prevented the operation from completing.
//
static const int ERROR_LOG_POLICY_CONFLICT        6622L

//
// MessageId: ERROR_LOG_PINNED_ARCHIVE_TAIL
//
// MessageText:
//
// Log space cannot be reclaimed because the log is pinned by the archive tail.
//
static const int ERROR_LOG_PINNED_ARCHIVE_TAIL    6623L

//
// MessageId: ERROR_LOG_RECORD_NONEXISTENT
//
// MessageText:
//
// Log record is not a record in the log file.
//
static const int ERROR_LOG_RECORD_NONEXISTENT     6624L

//
// MessageId: ERROR_LOG_RECORDS_RESERVED_INVALID
//
// MessageText:
//
// Number of reserved log records or the adjustment of the number of reserved log records is invalid.
//
static const int ERROR_LOG_RECORDS_RESERVED_INVALID 6625L

//
// MessageId: ERROR_LOG_SPACE_RESERVED_INVALID
//
// MessageText:
//
// Reserved log space or the adjustment of the log space is invalid.
//
static const int ERROR_LOG_SPACE_RESERVED_INVALID 6626L

//
// MessageId: ERROR_LOG_TAIL_INVALID
//
// MessageText:
//
// An new or existing archive tail or base of the active log is invalid.
//
static const int ERROR_LOG_TAIL_INVALID           6627L

//
// MessageId: ERROR_LOG_FULL
//
// MessageText:
//
// Log space is exhausted.
//
static const int ERROR_LOG_FULL                   6628L

//
// MessageId: ERROR_COULD_NOT_RESIZE_LOG
//
// MessageText:
//
// The log could not be set to the requested size.
//
static const int ERROR_COULD_NOT_RESIZE_LOG       6629L

//
// MessageId: ERROR_LOG_MULTIPLEXED
//
// MessageText:
//
// Log is multiplexed, no direct writes to the physical log is allowed.
//
static const int ERROR_LOG_MULTIPLEXED            6630L

//
// MessageId: ERROR_LOG_DEDICATED
//
// MessageText:
//
// The operation failed because the log is a dedicated log.
//
static const int ERROR_LOG_DEDICATED              6631L

//
// MessageId: ERROR_LOG_ARCHIVE_NOT_IN_PROGRESS
//
// MessageText:
//
// The operation requires an archive context.
//
static const int ERROR_LOG_ARCHIVE_NOT_IN_PROGRESS 6632L

//
// MessageId: ERROR_LOG_ARCHIVE_IN_PROGRESS
//
// MessageText:
//
// Log archival is in progress.
//
static const int ERROR_LOG_ARCHIVE_IN_PROGRESS    6633L

//
// MessageId: ERROR_LOG_EPHEMERAL
//
// MessageText:
//
// The operation requires a non-ephemeral log, but the log is ephemeral.
//
static const int ERROR_LOG_EPHEMERAL              6634L

//
// MessageId: ERROR_LOG_NOT_ENOUGH_CONTAINERS
//
// MessageText:
//
// The log must have at least two containers before it can be read from or written to.
//
static const int ERROR_LOG_NOT_ENOUGH_CONTAINERS  6635L

//
// MessageId: ERROR_LOG_CLIENT_ALREADY_REGISTERED
//
// MessageText:
//
// A log client has already registered on the stream.
//
static const int ERROR_LOG_CLIENT_ALREADY_REGISTERED 6636L

//
// MessageId: ERROR_LOG_CLIENT_NOT_REGISTERED
//
// MessageText:
//
// A log client has not been registered on the stream.
//
static const int ERROR_LOG_CLIENT_NOT_REGISTERED  6637L

//
// MessageId: ERROR_LOG_FULL_HANDLER_IN_PROGRESS
//
// MessageText:
//
// A request has already been made to handle the log full condition.
//
static const int ERROR_LOG_FULL_HANDLER_IN_PROGRESS 6638L

//
// MessageId: ERROR_LOG_CONTAINER_READ_FAILED
//
// MessageText:
//
// Log service encountered an error when attempting to read from a log container.
//
static const int ERROR_LOG_CONTAINER_READ_FAILED  6639L

//
// MessageId: ERROR_LOG_CONTAINER_WRITE_FAILED
//
// MessageText:
//
// Log service encountered an error when attempting to write to a log container.
//
static const int ERROR_LOG_CONTAINER_WRITE_FAILED 6640L

//
// MessageId: ERROR_LOG_CONTAINER_OPEN_FAILED
//
// MessageText:
//
// Log service encountered an error when attempting open a log container.
//
static const int ERROR_LOG_CONTAINER_OPEN_FAILED  6641L

//
// MessageId: ERROR_LOG_CONTAINER_STATE_INVALID
//
// MessageText:
//
// Log service encountered an invalid container state when attempting a requested action.
//
static const int ERROR_LOG_CONTAINER_STATE_INVALID 6642L

//
// MessageId: ERROR_LOG_STATE_INVALID
//
// MessageText:
//
// Log service is not in the correct state to perform a requested action.
//
static const int ERROR_LOG_STATE_INVALID          6643L

//
// MessageId: ERROR_LOG_PINNED
//
// MessageText:
//
// Log space cannot be reclaimed because the log is pinned.
//
static const int ERROR_LOG_PINNED                 6644L

//
// MessageId: ERROR_LOG_METADATA_FLUSH_FAILED
//
// MessageText:
//
// Log metadata flush failed.
//
static const int ERROR_LOG_METADATA_FLUSH_FAILED  6645L

//
// MessageId: ERROR_LOG_INCONSISTENT_SECURITY
//
// MessageText:
//
// Security on the log and its containers is inconsistent.
//
static const int ERROR_LOG_INCONSISTENT_SECURITY  6646L

//
// MessageId: ERROR_LOG_APPENDED_FLUSH_FAILED
//
// MessageText:
//
// Records were appended to the log or reservation changes were made, but the log could not be flushed.
//
static const int ERROR_LOG_APPENDED_FLUSH_FAILED  6647L

//
// MessageId: ERROR_LOG_PINNED_RESERVATION
//
// MessageText:
//
// The log is pinned due to reservation consuming most of the log space. Free some reserved records to make space available.
//
static const int ERROR_LOG_PINNED_RESERVATION     6648L


///////////////////////////////////////////////////
//                                               //
//           Transaction (KTM) Error codes       //
//                                               //
//                 6700 to 6799                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_INVALID_TRANSACTION
//
// MessageText:
//
// The transaction handle associated with this operation is not valid.
//
static const int ERROR_INVALID_TRANSACTION        6700L

//
// MessageId: ERROR_TRANSACTION_NOT_ACTIVE
//
// MessageText:
//
// The requested operation was made in the context of a transaction that is no longer active.
//
static const int ERROR_TRANSACTION_NOT_ACTIVE     6701L

//
// MessageId: ERROR_TRANSACTION_REQUEST_NOT_VALID
//
// MessageText:
//
// The requested operation is not valid on the Transaction object in its current state.
//
static const int ERROR_TRANSACTION_REQUEST_NOT_VALID 6702L

//
// MessageId: ERROR_TRANSACTION_NOT_REQUESTED
//
// MessageText:
//
// The caller has called a response API, but the response is not expected because the TM did not issue the corresponding request to the caller.
//
static const int ERROR_TRANSACTION_NOT_REQUESTED  6703L

//
// MessageId: ERROR_TRANSACTION_ALREADY_ABORTED
//
// MessageText:
//
// It is too late to perform the requested operation, since the Transaction has already been aborted.
//
static const int ERROR_TRANSACTION_ALREADY_ABORTED 6704L

//
// MessageId: ERROR_TRANSACTION_ALREADY_COMMITTED
//
// MessageText:
//
// It is too late to perform the requested operation, since the Transaction has already been committed.
//
static const int ERROR_TRANSACTION_ALREADY_COMMITTED 6705L

//
// MessageId: ERROR_TM_INITIALIZATION_FAILED
//
// MessageText:
//
// The Transaction Manager was unable to be successfully initialized. Transacted operations are not supported.
//
static const int ERROR_TM_INITIALIZATION_FAILED   6706L

//
// MessageId: ERROR_RESOURCEMANAGER_READ_ONLY
//
// MessageText:
//
// The specified ResourceManager made no changes or updates to the resource under this transaction.
//
static const int ERROR_RESOURCEMANAGER_READ_ONLY  6707L

//
// MessageId: ERROR_TRANSACTION_NOT_JOINED
//
// MessageText:
//
// The resource manager has attempted to prepare a transaction that it has not successfully joined.
//
static const int ERROR_TRANSACTION_NOT_JOINED     6708L

//
// MessageId: ERROR_TRANSACTION_SUPERIOR_EXISTS
//
// MessageText:
//
// The Transaction object already has a superior enlistment, and the caller attempted an operation that would have created a new superior. Only a single superior enlistment is allow.
//
static const int ERROR_TRANSACTION_SUPERIOR_EXISTS 6709L

//
// MessageId: ERROR_CRM_PROTOCOL_ALREADY_EXISTS
//
// MessageText:
//
// The RM tried to register a protocol that already exists.
//
static const int ERROR_CRM_PROTOCOL_ALREADY_EXISTS 6710L

//
// MessageId: ERROR_TRANSACTION_PROPAGATION_FAILED
//
// MessageText:
//
// The attempt to propagate the Transaction failed.
//
static const int ERROR_TRANSACTION_PROPAGATION_FAILED 6711L

//
// MessageId: ERROR_CRM_PROTOCOL_NOT_FOUND
//
// MessageText:
//
// The requested propagation protocol was not registered as a CRM.
//
static const int ERROR_CRM_PROTOCOL_NOT_FOUND     6712L

//
// MessageId: ERROR_TRANSACTION_INVALID_MARSHALL_BUFFER
//
// MessageText:
//
// The buffer passed in to PushTransaction or PullTransaction is not in a valid format.
//
static const int ERROR_TRANSACTION_INVALID_MARSHALL_BUFFER 6713L

//
// MessageId: ERROR_CURRENT_TRANSACTION_NOT_VALID
//
// MessageText:
//
// The current transaction context associated with the thread is not a valid handle to a transaction object.
//
static const int ERROR_CURRENT_TRANSACTION_NOT_VALID 6714L

//
// MessageId: ERROR_TRANSACTION_NOT_FOUND
//
// MessageText:
//
// The specified Transaction object could not be opened, because it was not found.
//
static const int ERROR_TRANSACTION_NOT_FOUND      6715L

//
// MessageId: ERROR_RESOURCEMANAGER_NOT_FOUND
//
// MessageText:
//
// The specified ResourceManager object could not be opened, because it was not found.
//
static const int ERROR_RESOURCEMANAGER_NOT_FOUND  6716L

//
// MessageId: ERROR_ENLISTMENT_NOT_FOUND
//
// MessageText:
//
// The specified Enlistment object could not be opened, because it was not found.
//
static const int ERROR_ENLISTMENT_NOT_FOUND       6717L

//
// MessageId: ERROR_TRANSACTIONMANAGER_NOT_FOUND
//
// MessageText:
//
// The specified TransactionManager object could not be opened, because it was not found.
//
static const int ERROR_TRANSACTIONMANAGER_NOT_FOUND 6718L

//
// MessageId: ERROR_TRANSACTIONMANAGER_NOT_ONLINE
//
// MessageText:
//
// The object specified could not be created or opened, because its associated TransactionManager is not online.  The TransactionManager must be brought fully Online by calling RecoverTransactionManager to recover to the end of its LogFile before objects in its Transaction or ResourceManager namespaces can be opened.  In addition, errors in writing records to its LogFile can cause a TransactionManager to go offline.
//
static const int ERROR_TRANSACTIONMANAGER_NOT_ONLINE 6719L

//
// MessageId: ERROR_TRANSACTIONMANAGER_RECOVERY_NAME_COLLISION
//
// MessageText:
//
// The specified TransactionManager was unable to create the objects contained in its logfile in the Ob namespace. Therefore, the TransactionManager was unable to recover.
//
static const int ERROR_TRANSACTIONMANAGER_RECOVERY_NAME_COLLISION 6720L

//
// MessageId: ERROR_TRANSACTION_NOT_ROOT
//
// MessageText:
//
// The call to create a superior Enlistment on this Transaction object could not be completed, because the Transaction object specified for the enlistment is a subordinate branch of the Transaction. Only the root of the Transaction can be enlisted on as a superior.
//
static const int ERROR_TRANSACTION_NOT_ROOT       6721L

//
// MessageId: ERROR_TRANSACTION_OBJECT_EXPIRED
//
// MessageText:
//
// Because the associated transaction manager or resource manager has been closed, the handle is no longer valid.
//
static const int ERROR_TRANSACTION_OBJECT_EXPIRED 6722L

//
// MessageId: ERROR_TRANSACTION_RESPONSE_NOT_ENLISTED
//
// MessageText:
//
// The specified operation could not be performed on this Superior enlistment, because the enlistment was not created with the corresponding completion response in the NotificationMask.
//
static const int ERROR_TRANSACTION_RESPONSE_NOT_ENLISTED 6723L

//
// MessageId: ERROR_TRANSACTION_RECORD_TOO_LONG
//
// MessageText:
//
// The specified operation could not be performed, because the record that would be logged was too long. This can occur because of two conditions: either there are too many Enlistments on this Transaction, or the combined RecoveryInformation being logged on behalf of those Enlistments is too long.
//
static const int ERROR_TRANSACTION_RECORD_TOO_LONG 6724L

//
// MessageId: ERROR_IMPLICIT_TRANSACTION_NOT_SUPPORTED
//
// MessageText:
//
// Implicit transaction are not supported.
//
static const int ERROR_IMPLICIT_TRANSACTION_NOT_SUPPORTED 6725L

//
// MessageId: ERROR_TRANSACTION_INTEGRITY_VIOLATED
//
// MessageText:
//
// The kernel transaction manager had to abort or forget the transaction because it blocked forward progress.
//
static const int ERROR_TRANSACTION_INTEGRITY_VIOLATED 6726L

//
// MessageId: ERROR_TRANSACTIONMANAGER_IDENTITY_MISMATCH
//
// MessageText:
//
// The TransactionManager identity that was supplied did not match the one recorded in the TransactionManager's log file.
//
static const int ERROR_TRANSACTIONMANAGER_IDENTITY_MISMATCH 6727L

//
// MessageId: ERROR_RM_CANNOT_BE_FROZEN_FOR_SNAPSHOT
//
// MessageText:
//
// This snapshot operation cannot continue because a transactional resource manager cannot be frozen in its current state.  Please try again.
//
static const int ERROR_RM_CANNOT_BE_FROZEN_FOR_SNAPSHOT 6728L

//
// MessageId: ERROR_TRANSACTION_MUST_WRITETHROUGH
//
// MessageText:
//
// The transaction cannot be enlisted on with the specified EnlistmentMask, because the transaction has already completed the PrePrepare phase.  In order to ensure correctness, the ResourceManager must switch to a write-through mode and cease caching data within this transaction.  Enlisting for only subsequent transaction phases may still succeed.
//
static const int ERROR_TRANSACTION_MUST_WRITETHROUGH 6729L

//
// MessageId: ERROR_TRANSACTION_NO_SUPERIOR
//
// MessageText:
//
// The transaction does not have a superior enlistment.
//
static const int ERROR_TRANSACTION_NO_SUPERIOR    6730L

//
// MessageId: ERROR_HEURISTIC_DAMAGE_POSSIBLE
//
// MessageText:
//
// The attempt to commit the Transaction completed, but it is possible that some portion of the transaction tree did not commit successfully due to heuristics.  Therefore it is possible that some data modified in the transaction may not have committed, resulting in transactional inconsistency.  If possible, check the consistency of the associated data.
//
static const int ERROR_HEURISTIC_DAMAGE_POSSIBLE  6731L


///////////////////////////////////////////////////
//                                               //
//        Transactional File Services (TxF)      //
//                  Error codes                  //
//                                               //
//                 6800 to 6899                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_TRANSACTIONAL_CONFLICT
//
// MessageText:
//
// The function attempted to use a name that is reserved for use by another transaction.
//
static const int ERROR_TRANSACTIONAL_CONFLICT     6800L

//
// MessageId: ERROR_RM_NOT_ACTIVE
//
// MessageText:
//
// Transaction support within the specified resource manager is not started or was shut down due to an error.
//
static const int ERROR_RM_NOT_ACTIVE              6801L

//
// MessageId: ERROR_RM_METADATA_CORRUPT
//
// MessageText:
//
// The metadata of the RM has been corrupted. The RM will not function.
//
static const int ERROR_RM_METADATA_CORRUPT        6802L

//
// MessageId: ERROR_DIRECTORY_NOT_RM
//
// MessageText:
//
// The specified directory does not contain a resource manager.
//
static const int ERROR_DIRECTORY_NOT_RM           6803L

//
// MessageId: ERROR_TRANSACTIONS_UNSUPPORTED_REMOTE
//
// MessageText:
//
// The remote server or share does not support transacted file operations.
//
static const int ERROR_TRANSACTIONS_UNSUPPORTED_REMOTE 6805L

//
// MessageId: ERROR_LOG_RESIZE_INVALID_SIZE
//
// MessageText:
//
// The requested log size is invalid.
//
static const int ERROR_LOG_RESIZE_INVALID_SIZE    6806L

//
// MessageId: ERROR_OBJECT_NO_LONGER_EXISTS
//
// MessageText:
//
// The object (file, stream, link) corresponding to the handle has been deleted by a Transaction Savepoint Rollback.
//
static const int ERROR_OBJECT_NO_LONGER_EXISTS    6807L

//
// MessageId: ERROR_STREAM_MINIVERSION_NOT_FOUND
//
// MessageText:
//
// The specified file miniversion was not found for this transacted file open.
//
static const int ERROR_STREAM_MINIVERSION_NOT_FOUND 6808L

//
// MessageId: ERROR_STREAM_MINIVERSION_NOT_VALID
//
// MessageText:
//
// The specified file miniversion was found but has been invalidated. Most likely cause is a transaction savepoint rollback.
//
static const int ERROR_STREAM_MINIVERSION_NOT_VALID 6809L

//
// MessageId: ERROR_MINIVERSION_INACCESSIBLE_FROM_SPECIFIED_TRANSACTION
//
// MessageText:
//
// A miniversion may only be opened in the context of the transaction that created it.
//
static const int ERROR_MINIVERSION_INACCESSIBLE_FROM_SPECIFIED_TRANSACTION 6810L

//
// MessageId: ERROR_CANT_OPEN_MINIVERSION_WITH_MODIFY_INTENT
//
// MessageText:
//
// It is not possible to open a miniversion with modify access.
//
static const int ERROR_CANT_OPEN_MINIVERSION_WITH_MODIFY_INTENT 6811L

//
// MessageId: ERROR_CANT_CREATE_MORE_STREAM_MINIVERSIONS
//
// MessageText:
//
// It is not possible to create any more miniversions for this stream.
//
static const int ERROR_CANT_CREATE_MORE_STREAM_MINIVERSIONS 6812L

//
// MessageId: ERROR_REMOTE_FILE_VERSION_MISMATCH
//
// MessageText:
//
// The remote server sent mismatching version number or Fid for a file opened with transactions.
//
static const int ERROR_REMOTE_FILE_VERSION_MISMATCH 6814L

//
// MessageId: ERROR_HANDLE_NO_LONGER_VALID
//
// MessageText:
//
// The handle has been invalidated by a transaction. The most likely cause is the presence of memory mapping on a file or an open handle when the transaction ended or rolled back to savepoint.
//
static const int ERROR_HANDLE_NO_LONGER_VALID     6815L

//
// MessageId: ERROR_NO_TXF_METADATA
//
// MessageText:
//
// There is no transaction metadata on the file.
//
static const int ERROR_NO_TXF_METADATA            6816L

//
// MessageId: ERROR_LOG_CORRUPTION_DETECTED
//
// MessageText:
//
// The log data is corrupt.
//
static const int ERROR_LOG_CORRUPTION_DETECTED    6817L

//
// MessageId: ERROR_CANT_RECOVER_WITH_HANDLE_OPEN
//
// MessageText:
//
// The file can't be recovered because there is a handle still open on it.
//
static const int ERROR_CANT_RECOVER_WITH_HANDLE_OPEN 6818L

//
// MessageId: ERROR_RM_DISCONNECTED
//
// MessageText:
//
// The transaction outcome is unavailable because the resource manager responsible for it has disconnected.
//
static const int ERROR_RM_DISCONNECTED            6819L

//
// MessageId: ERROR_ENLISTMENT_NOT_SUPERIOR
//
// MessageText:
//
// The request was rejected because the enlistment in question is not a superior enlistment.
//
static const int ERROR_ENLISTMENT_NOT_SUPERIOR    6820L

//
// MessageId: ERROR_RECOVERY_NOT_NEEDED
//
// MessageText:
//
// The transactional resource manager is already consistent. Recovery is not needed.
//
static const int ERROR_RECOVERY_NOT_NEEDED        6821L

//
// MessageId: ERROR_RM_ALREADY_STARTED
//
// MessageText:
//
// The transactional resource manager has already been started.
//
static const int ERROR_RM_ALREADY_STARTED         6822L

//
// MessageId: ERROR_FILE_IDENTITY_NOT_PERSISTENT
//
// MessageText:
//
// The file cannot be opened transactionally, because its identity depends on the outcome of an unresolved transaction.
//
static const int ERROR_FILE_IDENTITY_NOT_PERSISTENT 6823L

//
// MessageId: ERROR_CANT_BREAK_TRANSACTIONAL_DEPENDENCY
//
// MessageText:
//
// The operation cannot be performed because another transaction is depending on the fact that this property will not change.
//
static const int ERROR_CANT_BREAK_TRANSACTIONAL_DEPENDENCY 6824L

//
// MessageId: ERROR_CANT_CROSS_RM_BOUNDARY
//
// MessageText:
//
// The operation would involve a single file with two transactional resource managers and is therefore not allowed.
//
static const int ERROR_CANT_CROSS_RM_BOUNDARY     6825L

//
// MessageId: ERROR_TXF_DIR_NOT_EMPTY
//
// MessageText:
//
// The $Txf directory must be empty for this operation to succeed.
//
static const int ERROR_TXF_DIR_NOT_EMPTY          6826L

//
// MessageId: ERROR_INDOUBT_TRANSACTIONS_EXIST
//
// MessageText:
//
// The operation would leave a transactional resource manager in an inconsistent state and is therefore not allowed.
//
static const int ERROR_INDOUBT_TRANSACTIONS_EXIST 6827L

//
// MessageId: ERROR_TM_VOLATILE
//
// MessageText:
//
// The operation could not be completed because the transaction manager does not have a log.
//
static const int ERROR_TM_VOLATILE                6828L

//
// MessageId: ERROR_ROLLBACK_TIMER_EXPIRED
//
// MessageText:
//
// A rollback could not be scheduled because a previously scheduled rollback has already executed or been queued for execution.
//
static const int ERROR_ROLLBACK_TIMER_EXPIRED     6829L

//
// MessageId: ERROR_TXF_ATTRIBUTE_CORRUPT
//
// MessageText:
//
// The transactional metadata attribute on the file or directory is corrupt and unreadable.
//
static const int ERROR_TXF_ATTRIBUTE_CORRUPT      6830L

//
// MessageId: ERROR_EFS_NOT_ALLOWED_IN_TRANSACTION
//
// MessageText:
//
// The encryption operation could not be completed because a transaction is active.
//
static const int ERROR_EFS_NOT_ALLOWED_IN_TRANSACTION 6831L

//
// MessageId: ERROR_TRANSACTIONAL_OPEN_NOT_ALLOWED
//
// MessageText:
//
// This object is not allowed to be opened in a transaction.
//
static const int ERROR_TRANSACTIONAL_OPEN_NOT_ALLOWED 6832L

//
// MessageId: ERROR_LOG_GROWTH_FAILED
//
// MessageText:
//
// An attempt to create space in the transactional resource manager's log failed. The failure status has been recorded in the event log.
//
static const int ERROR_LOG_GROWTH_FAILED          6833L

//
// MessageId: ERROR_TRANSACTED_MAPPING_UNSUPPORTED_REMOTE
//
// MessageText:
//
// Memory mapping (creating a mapped section) a remote file under a transaction is not supported.
//
static const int ERROR_TRANSACTED_MAPPING_UNSUPPORTED_REMOTE 6834L

//
// MessageId: ERROR_TXF_METADATA_ALREADY_PRESENT
//
// MessageText:
//
// Transaction metadata is already present on this file and cannot be superseded.
//
static const int ERROR_TXF_METADATA_ALREADY_PRESENT 6835L

//
// MessageId: ERROR_TRANSACTION_SCOPE_CALLBACKS_NOT_SET
//
// MessageText:
//
// A transaction scope could not be entered because the scope handler has not been initialized.
//
static const int ERROR_TRANSACTION_SCOPE_CALLBACKS_NOT_SET 6836L

//
// MessageId: ERROR_TRANSACTION_REQUIRED_PROMOTION
//
// MessageText:
//
// Promotion was required in order to allow the resource manager to enlist, but the transaction was set to disallow it.
//
static const int ERROR_TRANSACTION_REQUIRED_PROMOTION 6837L

//
// MessageId: ERROR_CANNOT_EXECUTE_FILE_IN_TRANSACTION
//
// MessageText:
//
// This file is open for modification in an unresolved transaction and may be opened for execute only by a transacted reader.
//
static const int ERROR_CANNOT_EXECUTE_FILE_IN_TRANSACTION 6838L

//
// MessageId: ERROR_TRANSACTIONS_NOT_FROZEN
//
// MessageText:
//
// The request to thaw frozen transactions was ignored because transactions had not previously been frozen.
//
static const int ERROR_TRANSACTIONS_NOT_FROZEN    6839L

//
// MessageId: ERROR_TRANSACTION_FREEZE_IN_PROGRESS
//
// MessageText:
//
// Transactions cannot be frozen because a freeze is already in progress.
//
static const int ERROR_TRANSACTION_FREEZE_IN_PROGRESS 6840L

//
// MessageId: ERROR_NOT_SNAPSHOT_VOLUME
//
// MessageText:
//
// The target volume is not a snapshot volume. This operation is only valid on a volume mounted as a snapshot.
//
static const int ERROR_NOT_SNAPSHOT_VOLUME        6841L

//
// MessageId: ERROR_NO_SAVEPOINT_WITH_OPEN_FILES
//
// MessageText:
//
// The savepoint operation failed because files are open on the transaction. This is not permitted.
//
static const int ERROR_NO_SAVEPOINT_WITH_OPEN_FILES 6842L

//
// MessageId: ERROR_DATA_LOST_REPAIR
//
// MessageText:
//
// Windows has discovered corruption in a file, and that file has since been repaired. Data loss may have occurred.
//
static const int ERROR_DATA_LOST_REPAIR           6843L

//
// MessageId: ERROR_SPARSE_NOT_ALLOWED_IN_TRANSACTION
//
// MessageText:
//
// The sparse operation could not be completed because a transaction is active on the file.
//
static const int ERROR_SPARSE_NOT_ALLOWED_IN_TRANSACTION 6844L

//
// MessageId: ERROR_TM_IDENTITY_MISMATCH
//
// MessageText:
//
// The call to create a TransactionManager object failed because the Tm Identity stored in the logfile does not match the Tm Identity that was passed in as an argument.
//
static const int ERROR_TM_IDENTITY_MISMATCH       6845L

//
// MessageId: ERROR_FLOATED_SECTION
//
// MessageText:
//
// I/O was attempted on a section object that has been floated as a result of a transaction ending. There is no valid data.
//
static const int ERROR_FLOATED_SECTION            6846L

//
// MessageId: ERROR_CANNOT_ACCEPT_TRANSACTED_WORK
//
// MessageText:
//
// The transactional resource manager cannot currently accept transacted work due to a transient condition such as low resources.
//
static const int ERROR_CANNOT_ACCEPT_TRANSACTED_WORK 6847L

//
// MessageId: ERROR_CANNOT_ABORT_TRANSACTIONS
//
// MessageText:
//
// The transactional resource manager had too many tranactions outstanding that could not be aborted. The transactional resource manger has been shut down.
//
static const int ERROR_CANNOT_ABORT_TRANSACTIONS  6848L

//
// MessageId: ERROR_BAD_CLUSTERS
//
// MessageText:
//
// The operation could not be completed due to bad clusters on disk.
//
static const int ERROR_BAD_CLUSTERS               6849L

//
// MessageId: ERROR_COMPRESSION_NOT_ALLOWED_IN_TRANSACTION
//
// MessageText:
//
// The compression operation could not be completed because a transaction is active on the file.
//
static const int ERROR_COMPRESSION_NOT_ALLOWED_IN_TRANSACTION 6850L

//
// MessageId: ERROR_VOLUME_DIRTY
//
// MessageText:
//
// The operation could not be completed because the volume is dirty. Please run chkdsk and try again.
//
static const int ERROR_VOLUME_DIRTY               6851L

//
// MessageId: ERROR_NO_LINK_TRACKING_IN_TRANSACTION
//
// MessageText:
//
// The link tracking operation could not be completed because a transaction is active.
//
static const int ERROR_NO_LINK_TRACKING_IN_TRANSACTION 6852L

//
// MessageId: ERROR_OPERATION_NOT_SUPPORTED_IN_TRANSACTION
//
// MessageText:
//
// This operation cannot be performed in a transaction.
//
static const int ERROR_OPERATION_NOT_SUPPORTED_IN_TRANSACTION 6853L

//
// MessageId: ERROR_EXPIRED_HANDLE
//
// MessageText:
//
// The handle is no longer properly associated with its transaction.  It may have been opened in a transactional resource manager that was subsequently forced to restart.  Please close the handle and open a new one.
//
static const int ERROR_EXPIRED_HANDLE             6854L

//
// MessageId: ERROR_TRANSACTION_NOT_ENLISTED
//
// MessageText:
//
// The specified operation could not be performed because the resource manager is not enlisted in the transaction.
//
static const int ERROR_TRANSACTION_NOT_ENLISTED   6855L


///////////////////////////////////////////////////
//                                               //
//                  Available                    //
//                                               //
//                 6900 to 6999                  //
///////////////////////////////////////////////////

///////////////////////////////////////////////////
//                                               //
//          Terminal Server Error codes          //
//                                               //
//                 7000 to 7099                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_CTX_WINSTATION_NAME_INVALID
//
// MessageText:
//
// The specified session name is invalid.
//
static const int ERROR_CTX_WINSTATION_NAME_INVALID 7001L

//
// MessageId: ERROR_CTX_INVALID_PD
//
// MessageText:
//
// The specified protocol driver is invalid.
//
static const int ERROR_CTX_INVALID_PD             7002L

//
// MessageId: ERROR_CTX_PD_NOT_FOUND
//
// MessageText:
//
// The specified protocol driver was not found in the system path.
//
static const int ERROR_CTX_PD_NOT_FOUND           7003L

//
// MessageId: ERROR_CTX_WD_NOT_FOUND
//
// MessageText:
//
// The specified terminal connection driver was not found in the system path.
//
static const int ERROR_CTX_WD_NOT_FOUND           7004L

//
// MessageId: ERROR_CTX_CANNOT_MAKE_EVENTLOG_ENTRY
//
// MessageText:
//
// A registry key for event logging could not be created for this session.
//
static const int ERROR_CTX_CANNOT_MAKE_EVENTLOG_ENTRY 7005L

//
// MessageId: ERROR_CTX_SERVICE_NAME_COLLISION
//
// MessageText:
//
// A service with the same name already exists on the system.
//
static const int ERROR_CTX_SERVICE_NAME_COLLISION 7006L

//
// MessageId: ERROR_CTX_CLOSE_PENDING
//
// MessageText:
//
// A close operation is pending on the session.
//
static const int ERROR_CTX_CLOSE_PENDING          7007L

//
// MessageId: ERROR_CTX_NO_OUTBUF
//
// MessageText:
//
// There are no free output buffers available.
//
static const int ERROR_CTX_NO_OUTBUF              7008L

//
// MessageId: ERROR_CTX_MODEM_INF_NOT_FOUND
//
// MessageText:
//
// The MODEM.INF file was not found.
//
static const int ERROR_CTX_MODEM_INF_NOT_FOUND    7009L

//
// MessageId: ERROR_CTX_INVALID_MODEMNAME
//
// MessageText:
//
// The modem name was not found in MODEM.INF.
//
static const int ERROR_CTX_INVALID_MODEMNAME      7010L

//
// MessageId: ERROR_CTX_MODEM_RESPONSE_ERROR
//
// MessageText:
//
// The modem did not accept the command sent to it. Verify that the configured modem name matches the attached modem.
//
static const int ERROR_CTX_MODEM_RESPONSE_ERROR   7011L

//
// MessageId: ERROR_CTX_MODEM_RESPONSE_TIMEOUT
//
// MessageText:
//
// The modem did not respond to the command sent to it. Verify that the modem is properly cabled and powered on.
//
static const int ERROR_CTX_MODEM_RESPONSE_TIMEOUT 7012L

//
// MessageId: ERROR_CTX_MODEM_RESPONSE_NO_CARRIER
//
// MessageText:
//
// Carrier detect has failed or carrier has been dropped due to disconnect.
//
static const int ERROR_CTX_MODEM_RESPONSE_NO_CARRIER 7013L

//
// MessageId: ERROR_CTX_MODEM_RESPONSE_NO_DIALTONE
//
// MessageText:
//
// Dial tone not detected within the required time. Verify that the phone cable is properly attached and functional.
//
static const int ERROR_CTX_MODEM_RESPONSE_NO_DIALTONE 7014L

//
// MessageId: ERROR_CTX_MODEM_RESPONSE_BUSY
//
// MessageText:
//
// Busy signal detected at remote site on callback.
//
static const int ERROR_CTX_MODEM_RESPONSE_BUSY    7015L

//
// MessageId: ERROR_CTX_MODEM_RESPONSE_VOICE
//
// MessageText:
//
// Voice detected at remote site on callback.
//
static const int ERROR_CTX_MODEM_RESPONSE_VOICE   7016L

//
// MessageId: ERROR_CTX_TD_ERROR
//
// MessageText:
//
// Transport driver error
//
static const int ERROR_CTX_TD_ERROR               7017L

//
// MessageId: ERROR_CTX_WINSTATION_NOT_FOUND
//
// MessageText:
//
// The specified session cannot be found.
//
static const int ERROR_CTX_WINSTATION_NOT_FOUND   7022L

//
// MessageId: ERROR_CTX_WINSTATION_ALREADY_EXISTS
//
// MessageText:
//
// The specified session name is already in use.
//
static const int ERROR_CTX_WINSTATION_ALREADY_EXISTS 7023L

//
// MessageId: ERROR_CTX_WINSTATION_BUSY
//
// MessageText:
//
// The task you are trying to do can't be completed because Remote Desktop Services is currently busy. Please try again in a few minutes. Other users should still be able to log on.
//
static const int ERROR_CTX_WINSTATION_BUSY        7024L

//
// MessageId: ERROR_CTX_BAD_VIDEO_MODE
//
// MessageText:
//
// An attempt has been made to connect to a session whose video mode is not supported by the current client.
//
static const int ERROR_CTX_BAD_VIDEO_MODE         7025L

//
// MessageId: ERROR_CTX_GRAPHICS_INVALID
//
// MessageText:
//
// The application attempted to enable DOS graphics mode. DOS graphics mode is not supported.
//
static const int ERROR_CTX_GRAPHICS_INVALID       7035L

//
// MessageId: ERROR_CTX_LOGON_DISABLED
//
// MessageText:
//
// Your interactive logon privilege has been disabled. Please contact your administrator.
//
static const int ERROR_CTX_LOGON_DISABLED         7037L

//
// MessageId: ERROR_CTX_NOT_CONSOLE
//
// MessageText:
//
// The requested operation can be performed only on the system console. This is most often the result of a driver or system DLL requiring direct console access.
//
static const int ERROR_CTX_NOT_CONSOLE            7038L

//
// MessageId: ERROR_CTX_CLIENT_QUERY_TIMEOUT
//
// MessageText:
//
// The client failed to respond to the server connect message.
//
static const int ERROR_CTX_CLIENT_QUERY_TIMEOUT   7040L

//
// MessageId: ERROR_CTX_CONSOLE_DISCONNECT
//
// MessageText:
//
// Disconnecting the console session is not supported.
//
static const int ERROR_CTX_CONSOLE_DISCONNECT     7041L

//
// MessageId: ERROR_CTX_CONSOLE_CONNECT
//
// MessageText:
//
// Reconnecting a disconnected session to the console is not supported.
//
static const int ERROR_CTX_CONSOLE_CONNECT        7042L

//
// MessageId: ERROR_CTX_SHADOW_DENIED
//
// MessageText:
//
// The request to control another session remotely was denied.
//
static const int ERROR_CTX_SHADOW_DENIED          7044L

//
// MessageId: ERROR_CTX_WINSTATION_ACCESS_DENIED
//
// MessageText:
//
// The requested session access is denied.
//
static const int ERROR_CTX_WINSTATION_ACCESS_DENIED 7045L

//
// MessageId: ERROR_CTX_INVALID_WD
//
// MessageText:
//
// The specified terminal connection driver is invalid.
//
static const int ERROR_CTX_INVALID_WD             7049L

//
// MessageId: ERROR_CTX_SHADOW_INVALID
//
// MessageText:
//
// The requested session cannot be controlled remotely.
// This may be because the session is disconnected or does not currently have a user logged on.
//
static const int ERROR_CTX_SHADOW_INVALID         7050L

//
// MessageId: ERROR_CTX_SHADOW_DISABLED
//
// MessageText:
//
// The requested session is not configured to allow remote control.
//
static const int ERROR_CTX_SHADOW_DISABLED        7051L

//
// MessageId: ERROR_CTX_CLIENT_LICENSE_IN_USE
//
// MessageText:
//
// Your request to connect to this Terminal Server has been rejected. Your Terminal Server client license number is currently being used by another user. Please call your system administrator to obtain a unique license number.
//
static const int ERROR_CTX_CLIENT_LICENSE_IN_USE  7052L

//
// MessageId: ERROR_CTX_CLIENT_LICENSE_NOT_SET
//
// MessageText:
//
// Your request to connect to this Terminal Server has been rejected. Your Terminal Server client license number has not been entered for this copy of the Terminal Server client. Please contact your system administrator.
//
static const int ERROR_CTX_CLIENT_LICENSE_NOT_SET 7053L

//
// MessageId: ERROR_CTX_LICENSE_NOT_AVAILABLE
//
// MessageText:
//
// The number of connections to this computer is limited and all connections are in use right now. Try connecting later or contact your system administrator.
//
static const int ERROR_CTX_LICENSE_NOT_AVAILABLE  7054L

//
// MessageId: ERROR_CTX_LICENSE_CLIENT_INVALID
//
// MessageText:
//
// The client you are using is not licensed to use this system. Your logon request is denied.
//
static const int ERROR_CTX_LICENSE_CLIENT_INVALID 7055L

//
// MessageId: ERROR_CTX_LICENSE_EXPIRED
//
// MessageText:
//
// The system license has expired. Your logon request is denied.
//
static const int ERROR_CTX_LICENSE_EXPIRED        7056L

//
// MessageId: ERROR_CTX_SHADOW_NOT_RUNNING
//
// MessageText:
//
// Remote control could not be terminated because the specified session is not currently being remotely controlled.
//
static const int ERROR_CTX_SHADOW_NOT_RUNNING     7057L

//
// MessageId: ERROR_CTX_SHADOW_ENDED_BY_MODE_CHANGE
//
// MessageText:
//
// The remote control of the console was terminated because the display mode was changed. Changing the display mode in a remote control session is not supported.
//
static const int ERROR_CTX_SHADOW_ENDED_BY_MODE_CHANGE 7058L

//
// MessageId: ERROR_ACTIVATION_COUNT_EXCEEDED
//
// MessageText:
//
// Activation has already been reset the maximum number of times for this installation. Your activation timer will not be cleared.
//
static const int ERROR_ACTIVATION_COUNT_EXCEEDED  7059L

//
// MessageId: ERROR_CTX_WINSTATIONS_DISABLED
//
// MessageText:
//
// Remote logins are currently disabled.
//
static const int ERROR_CTX_WINSTATIONS_DISABLED   7060L

//
// MessageId: ERROR_CTX_ENCRYPTION_LEVEL_REQUIRED
//
// MessageText:
//
// You do not have the proper encryption level to access this Session.
//
static const int ERROR_CTX_ENCRYPTION_LEVEL_REQUIRED 7061L

//
// MessageId: ERROR_CTX_SESSION_IN_USE
//
// MessageText:
//
// The user %s\\%s is currently logged on to this computer. Only the current user or an administrator can log on to this computer.
//
static const int ERROR_CTX_SESSION_IN_USE         7062L

//
// MessageId: ERROR_CTX_NO_FORCE_LOGOFF
//
// MessageText:
//
// The user %s\\%s is already logged on to the console of this computer. You do not have permission to log in at this time. To resolve this issue, contact %s\\%s and have them log off.
//
static const int ERROR_CTX_NO_FORCE_LOGOFF        7063L

//
// MessageId: ERROR_CTX_ACCOUNT_RESTRICTION
//
// MessageText:
//
// Unable to log you on because of an account restriction.
//
static const int ERROR_CTX_ACCOUNT_RESTRICTION    7064L

//
// MessageId: ERROR_RDP_PROTOCOL_ERROR
//
// MessageText:
//
// The RDP protocol component %2 detected an error in the protocol stream and has disconnected the client.
//
static const int ERROR_RDP_PROTOCOL_ERROR         7065L

//
// MessageId: ERROR_CTX_CDM_CONNECT
//
// MessageText:
//
// The Client Drive Mapping Service Has Connected on Terminal Connection.
//
static const int ERROR_CTX_CDM_CONNECT            7066L

//
// MessageId: ERROR_CTX_CDM_DISCONNECT
//
// MessageText:
//
// The Client Drive Mapping Service Has Disconnected on Terminal Connection.
//
static const int ERROR_CTX_CDM_DISCONNECT         7067L

//
// MessageId: ERROR_CTX_SECURITY_LAYER_ERROR
//
// MessageText:
//
// The Terminal Server security layer detected an error in the protocol stream and has disconnected the client.
//
static const int ERROR_CTX_SECURITY_LAYER_ERROR   7068L

//
// MessageId: ERROR_TS_INCOMPATIBLE_SESSIONS
//
// MessageText:
//
// The target session is incompatible with the current session.
//
static const int ERROR_TS_INCOMPATIBLE_SESSIONS   7069L

//
// MessageId: ERROR_TS_VIDEO_SUBSYSTEM_ERROR
//
// MessageText:
//
// Windows can't connect to your session because a problem occurred in the Windows video subsystem. Try connecting again later, or contact the server administrator for assistance.
//
static const int ERROR_TS_VIDEO_SUBSYSTEM_ERROR   7070L

///////////////////////////////////////////////////
//                                               //
//          Windows Fabric Error Codes           //
//                                               //
//                 7100 to 7499                  //
//                                               //
//          defined in FabricCommon.idl          //
//                                               //
///////////////////////////////////////////////////


///////////////////////////////////////////////////
//                                                /
//           Traffic Control Error Codes          /
//                                                /
//                  7500 to 7999                  /
//                                                /
//            defined in: tcerror.h               /
///////////////////////////////////////////////////


///////////////////////////////////////////////////
//                                               //
//           Active Directory Error codes        //
//                                               //
//                 8000 to 8999                  //
///////////////////////////////////////////////////

// *****************
// FACILITY_FILE_REPLICATION_SERVICE
// *****************
//
// MessageId: FRS_ERR_INVALID_API_SEQUENCE
//
// MessageText:
//
// The file replication service API was called incorrectly.
//
static const int FRS_ERR_INVALID_API_SEQUENCE     8001L

//
// MessageId: FRS_ERR_STARTING_SERVICE
//
// MessageText:
//
// The file replication service cannot be started.
//
static const int FRS_ERR_STARTING_SERVICE         8002L

//
// MessageId: FRS_ERR_STOPPING_SERVICE
//
// MessageText:
//
// The file replication service cannot be stopped.
//
static const int FRS_ERR_STOPPING_SERVICE         8003L

//
// MessageId: FRS_ERR_INTERNAL_API
//
// MessageText:
//
// The file replication service API terminated the request. The event log may have more information.
//
static const int FRS_ERR_INTERNAL_API             8004L

//
// MessageId: FRS_ERR_INTERNAL
//
// MessageText:
//
// The file replication service terminated the request. The event log may have more information.
//
static const int FRS_ERR_INTERNAL                 8005L

//
// MessageId: FRS_ERR_SERVICE_COMM
//
// MessageText:
//
// The file replication service cannot be contacted. The event log may have more information.
//
static const int FRS_ERR_SERVICE_COMM             8006L

//
// MessageId: FRS_ERR_INSUFFICIENT_PRIV
//
// MessageText:
//
// The file replication service cannot satisfy the request because the user has insufficient privileges. The event log may have more information.
//
static const int FRS_ERR_INSUFFICIENT_PRIV        8007L

//
// MessageId: FRS_ERR_AUTHENTICATION
//
// MessageText:
//
// The file replication service cannot satisfy the request because authenticated RPC is not available. The event log may have more information.
//
static const int FRS_ERR_AUTHENTICATION           8008L

//
// MessageId: FRS_ERR_PARENT_INSUFFICIENT_PRIV
//
// MessageText:
//
// The file replication service cannot satisfy the request because the user has insufficient privileges on the domain controller. The event log may have more information.
//
static const int FRS_ERR_PARENT_INSUFFICIENT_PRIV 8009L

//
// MessageId: FRS_ERR_PARENT_AUTHENTICATION
//
// MessageText:
//
// The file replication service cannot satisfy the request because authenticated RPC is not available on the domain controller. The event log may have more information.
//
static const int FRS_ERR_PARENT_AUTHENTICATION    8010L

//
// MessageId: FRS_ERR_CHILD_TO_PARENT_COMM
//
// MessageText:
//
// The file replication service cannot communicate with the file replication service on the domain controller. The event log may have more information.
//
static const int FRS_ERR_CHILD_TO_PARENT_COMM     8011L

//
// MessageId: FRS_ERR_PARENT_TO_CHILD_COMM
//
// MessageText:
//
// The file replication service on the domain controller cannot communicate with the file replication service on this computer. The event log may have more information.
//
static const int FRS_ERR_PARENT_TO_CHILD_COMM     8012L

//
// MessageId: FRS_ERR_SYSVOL_POPULATE
//
// MessageText:
//
// The file replication service cannot populate the system volume because of an internal error. The event log may have more information.
//
static const int FRS_ERR_SYSVOL_POPULATE          8013L

//
// MessageId: FRS_ERR_SYSVOL_POPULATE_TIMEOUT
//
// MessageText:
//
// The file replication service cannot populate the system volume because of an internal timeout. The event log may have more information.
//
static const int FRS_ERR_SYSVOL_POPULATE_TIMEOUT  8014L

//
// MessageId: FRS_ERR_SYSVOL_IS_BUSY
//
// MessageText:
//
// The file replication service cannot process the request. The system volume is busy with a previous request.
//
static const int FRS_ERR_SYSVOL_IS_BUSY           8015L

//
// MessageId: FRS_ERR_SYSVOL_DEMOTE
//
// MessageText:
//
// The file replication service cannot stop replicating the system volume because of an internal error. The event log may have more information.
//
static const int FRS_ERR_SYSVOL_DEMOTE            8016L

//
// MessageId: FRS_ERR_INVALID_SERVICE_PARAMETER
//
// MessageText:
//
// The file replication service detected an invalid parameter.
//
static const int FRS_ERR_INVALID_SERVICE_PARAMETER 8017L

// *****************
// FACILITY DIRECTORY SERVICE
// *****************
static const int DS_S_SUCCESS NO_ERROR
//
// MessageId: ERROR_DS_NOT_INSTALLED
//
// MessageText:
//
// An error occurred while installing the directory service. For more information, see the event log.
//
static const int ERROR_DS_NOT_INSTALLED           8200L

//
// MessageId: ERROR_DS_MEMBERSHIP_EVALUATED_LOCALLY
//
// MessageText:
//
// The directory service evaluated group memberships locally.
//
static const int ERROR_DS_MEMBERSHIP_EVALUATED_LOCALLY 8201L

//
// MessageId: ERROR_DS_NO_ATTRIBUTE_OR_VALUE
//
// MessageText:
//
// The specified directory service attribute or value does not exist.
//
static const int ERROR_DS_NO_ATTRIBUTE_OR_VALUE   8202L

//
// MessageId: ERROR_DS_INVALID_ATTRIBUTE_SYNTAX
//
// MessageText:
//
// The attribute syntax specified to the directory service is invalid.
//
static const int ERROR_DS_INVALID_ATTRIBUTE_SYNTAX 8203L

//
// MessageId: ERROR_DS_ATTRIBUTE_TYPE_UNDEFINED
//
// MessageText:
//
// The attribute type specified to the directory service is not defined.
//
static const int ERROR_DS_ATTRIBUTE_TYPE_UNDEFINED 8204L

//
// MessageId: ERROR_DS_ATTRIBUTE_OR_VALUE_EXISTS
//
// MessageText:
//
// The specified directory service attribute or value already exists.
//
static const int ERROR_DS_ATTRIBUTE_OR_VALUE_EXISTS 8205L

//
// MessageId: ERROR_DS_BUSY
//
// MessageText:
//
// The directory service is busy.
//
static const int ERROR_DS_BUSY                    8206L

//
// MessageId: ERROR_DS_UNAVAILABLE
//
// MessageText:
//
// The directory service is unavailable.
//
static const int ERROR_DS_UNAVAILABLE             8207L

//
// MessageId: ERROR_DS_NO_RIDS_ALLOCATED
//
// MessageText:
//
// The directory service was unable to allocate a relative identifier.
//
static const int ERROR_DS_NO_RIDS_ALLOCATED       8208L

//
// MessageId: ERROR_DS_NO_MORE_RIDS
//
// MessageText:
//
// The directory service has exhausted the pool of relative identifiers.
//
static const int ERROR_DS_NO_MORE_RIDS            8209L

//
// MessageId: ERROR_DS_INCORRECT_ROLE_OWNER
//
// MessageText:
//
// The requested operation could not be performed because the directory service is not the master for that type of operation.
//
static const int ERROR_DS_INCORRECT_ROLE_OWNER    8210L

//
// MessageId: ERROR_DS_RIDMGR_INIT_ERROR
//
// MessageText:
//
// The directory service was unable to initialize the subsystem that allocates relative identifiers.
//
static const int ERROR_DS_RIDMGR_INIT_ERROR       8211L

//
// MessageId: ERROR_DS_OBJ_CLASS_VIOLATION
//
// MessageText:
//
// The requested operation did not satisfy one or more constraints associated with the class of the object.
//
static const int ERROR_DS_OBJ_CLASS_VIOLATION     8212L

//
// MessageId: ERROR_DS_CANT_ON_NON_LEAF
//
// MessageText:
//
// The directory service can perform the requested operation only on a leaf object.
//
static const int ERROR_DS_CANT_ON_NON_LEAF        8213L

//
// MessageId: ERROR_DS_CANT_ON_RDN
//
// MessageText:
//
// The directory service cannot perform the requested operation on the RDN attribute of an object.
//
static const int ERROR_DS_CANT_ON_RDN             8214L

//
// MessageId: ERROR_DS_CANT_MOD_OBJ_CLASS
//
// MessageText:
//
// The directory service detected an attempt to modify the object class of an object.
//
static const int ERROR_DS_CANT_MOD_OBJ_CLASS      8215L

//
// MessageId: ERROR_DS_CROSS_DOM_MOVE_ERROR
//
// MessageText:
//
// The requested cross-domain move operation could not be performed.
//
static const int ERROR_DS_CROSS_DOM_MOVE_ERROR    8216L

//
// MessageId: ERROR_DS_GC_NOT_AVAILABLE
//
// MessageText:
//
// Unable to contact the global catalog server.
//
static const int ERROR_DS_GC_NOT_AVAILABLE        8217L

//
// MessageId: ERROR_SHARED_POLICY
//
// MessageText:
//
// The policy object is shared and can only be modified at the root.
//
static const int ERROR_SHARED_POLICY              8218L

//
// MessageId: ERROR_POLICY_OBJECT_NOT_FOUND
//
// MessageText:
//
// The policy object does not exist.
//
static const int ERROR_POLICY_OBJECT_NOT_FOUND    8219L

//
// MessageId: ERROR_POLICY_ONLY_IN_DS
//
// MessageText:
//
// The requested policy information is only in the directory service.
//
static const int ERROR_POLICY_ONLY_IN_DS          8220L

//
// MessageId: ERROR_PROMOTION_ACTIVE
//
// MessageText:
//
// A domain controller promotion is currently active.
//
static const int ERROR_PROMOTION_ACTIVE           8221L

//
// MessageId: ERROR_NO_PROMOTION_ACTIVE
//
// MessageText:
//
// A domain controller promotion is not currently active
//
static const int ERROR_NO_PROMOTION_ACTIVE        8222L

// 8223 unused
//
// MessageId: ERROR_DS_OPERATIONS_ERROR
//
// MessageText:
//
// An operations error occurred.
//
static const int ERROR_DS_OPERATIONS_ERROR        8224L

//
// MessageId: ERROR_DS_PROTOCOL_ERROR
//
// MessageText:
//
// A protocol error occurred.
//
static const int ERROR_DS_PROTOCOL_ERROR          8225L

//
// MessageId: ERROR_DS_TIMELIMIT_EXCEEDED
//
// MessageText:
//
// The time limit for this request was exceeded.
//
static const int ERROR_DS_TIMELIMIT_EXCEEDED      8226L

//
// MessageId: ERROR_DS_SIZELIMIT_EXCEEDED
//
// MessageText:
//
// The size limit for this request was exceeded.
//
static const int ERROR_DS_SIZELIMIT_EXCEEDED      8227L

//
// MessageId: ERROR_DS_ADMIN_LIMIT_EXCEEDED
//
// MessageText:
//
// The administrative limit for this request was exceeded.
//
static const int ERROR_DS_ADMIN_LIMIT_EXCEEDED    8228L

//
// MessageId: ERROR_DS_COMPARE_FALSE
//
// MessageText:
//
// The compare response was false.
//
static const int ERROR_DS_COMPARE_FALSE           8229L

//
// MessageId: ERROR_DS_COMPARE_TRUE
//
// MessageText:
//
// The compare response was true.
//
static const int ERROR_DS_COMPARE_TRUE            8230L

//
// MessageId: ERROR_DS_AUTH_METHOD_NOT_SUPPORTED
//
// MessageText:
//
// The requested authentication method is not supported by the server.
//
static const int ERROR_DS_AUTH_METHOD_NOT_SUPPORTED 8231L

//
// MessageId: ERROR_DS_STRONG_AUTH_REQUIRED
//
// MessageText:
//
// A more secure authentication method is required for this server.
//
static const int ERROR_DS_STRONG_AUTH_REQUIRED    8232L

//
// MessageId: ERROR_DS_INAPPROPRIATE_AUTH
//
// MessageText:
//
// Inappropriate authentication.
//
static const int ERROR_DS_INAPPROPRIATE_AUTH      8233L

//
// MessageId: ERROR_DS_AUTH_UNKNOWN
//
// MessageText:
//
// The authentication mechanism is unknown.
//
static const int ERROR_DS_AUTH_UNKNOWN            8234L

//
// MessageId: ERROR_DS_REFERRAL
//
// MessageText:
//
// A referral was returned from the server.
//
static const int ERROR_DS_REFERRAL                8235L

//
// MessageId: ERROR_DS_UNAVAILABLE_CRIT_EXTENSION
//
// MessageText:
//
// The server does not support the requested critical extension.
//
static const int ERROR_DS_UNAVAILABLE_CRIT_EXTENSION 8236L

//
// MessageId: ERROR_DS_CONFIDENTIALITY_REQUIRED
//
// MessageText:
//
// This request requires a secure connection.
//
static const int ERROR_DS_CONFIDENTIALITY_REQUIRED 8237L

//
// MessageId: ERROR_DS_INAPPROPRIATE_MATCHING
//
// MessageText:
//
// Inappropriate matching.
//
static const int ERROR_DS_INAPPROPRIATE_MATCHING  8238L

//
// MessageId: ERROR_DS_CONSTRAINT_VIOLATION
//
// MessageText:
//
// A constraint violation occurred.
//
static const int ERROR_DS_CONSTRAINT_VIOLATION    8239L

//
// MessageId: ERROR_DS_NO_SUCH_OBJECT
//
// MessageText:
//
// There is no such object on the server.
//
static const int ERROR_DS_NO_SUCH_OBJECT          8240L

//
// MessageId: ERROR_DS_ALIAS_PROBLEM
//
// MessageText:
//
// There is an alias problem.
//
static const int ERROR_DS_ALIAS_PROBLEM           8241L

//
// MessageId: ERROR_DS_INVALID_DN_SYNTAX
//
// MessageText:
//
// An invalid dn syntax has been specified.
//
static const int ERROR_DS_INVALID_DN_SYNTAX       8242L

//
// MessageId: ERROR_DS_IS_LEAF
//
// MessageText:
//
// The object is a leaf object.
//
static const int ERROR_DS_IS_LEAF                 8243L

//
// MessageId: ERROR_DS_ALIAS_DEREF_PROBLEM
//
// MessageText:
//
// There is an alias dereferencing problem.
//
static const int ERROR_DS_ALIAS_DEREF_PROBLEM     8244L

//
// MessageId: ERROR_DS_UNWILLING_TO_PERFORM
//
// MessageText:
//
// The server is unwilling to process the request.
//
static const int ERROR_DS_UNWILLING_TO_PERFORM    8245L

//
// MessageId: ERROR_DS_LOOP_DETECT
//
// MessageText:
//
// A loop has been detected.
//
static const int ERROR_DS_LOOP_DETECT             8246L

//
// MessageId: ERROR_DS_NAMING_VIOLATION
//
// MessageText:
//
// There is a naming violation.
//
static const int ERROR_DS_NAMING_VIOLATION        8247L

//
// MessageId: ERROR_DS_OBJECT_RESULTS_TOO_LARGE
//
// MessageText:
//
// The result set is too large.
//
static const int ERROR_DS_OBJECT_RESULTS_TOO_LARGE 8248L

//
// MessageId: ERROR_DS_AFFECTS_MULTIPLE_DSAS
//
// MessageText:
//
// The operation affects multiple DSAs
//
static const int ERROR_DS_AFFECTS_MULTIPLE_DSAS   8249L

//
// MessageId: ERROR_DS_SERVER_DOWN
//
// MessageText:
//
// The server is not operational.
//
static const int ERROR_DS_SERVER_DOWN             8250L

//
// MessageId: ERROR_DS_LOCAL_ERROR
//
// MessageText:
//
// A local error has occurred.
//
static const int ERROR_DS_LOCAL_ERROR             8251L

//
// MessageId: ERROR_DS_ENCODING_ERROR
//
// MessageText:
//
// An encoding error has occurred.
//
static const int ERROR_DS_ENCODING_ERROR          8252L

//
// MessageId: ERROR_DS_DECODING_ERROR
//
// MessageText:
//
// A decoding error has occurred.
//
static const int ERROR_DS_DECODING_ERROR          8253L

//
// MessageId: ERROR_DS_FILTER_UNKNOWN
//
// MessageText:
//
// The search filter cannot be recognized.
//
static const int ERROR_DS_FILTER_UNKNOWN          8254L

//
// MessageId: ERROR_DS_PARAM_ERROR
//
// MessageText:
//
// One or more parameters are illegal.
//
static const int ERROR_DS_PARAM_ERROR             8255L

//
// MessageId: ERROR_DS_NOT_SUPPORTED
//
// MessageText:
//
// The specified method is not supported.
//
static const int ERROR_DS_NOT_SUPPORTED           8256L

//
// MessageId: ERROR_DS_NO_RESULTS_RETURNED
//
// MessageText:
//
// No results were returned.
//
static const int ERROR_DS_NO_RESULTS_RETURNED     8257L

//
// MessageId: ERROR_DS_CONTROL_NOT_FOUND
//
// MessageText:
//
// The specified control is not supported by the server.
//
static const int ERROR_DS_CONTROL_NOT_FOUND       8258L

//
// MessageId: ERROR_DS_CLIENT_LOOP
//
// MessageText:
//
// A referral loop was detected by the client.
//
static const int ERROR_DS_CLIENT_LOOP             8259L

//
// MessageId: ERROR_DS_REFERRAL_LIMIT_EXCEEDED
//
// MessageText:
//
// The preset referral limit was exceeded.
//
static const int ERROR_DS_REFERRAL_LIMIT_EXCEEDED 8260L

//
// MessageId: ERROR_DS_SORT_CONTROL_MISSING
//
// MessageText:
//
// The search requires a SORT control.
//
static const int ERROR_DS_SORT_CONTROL_MISSING    8261L

//
// MessageId: ERROR_DS_OFFSET_RANGE_ERROR
//
// MessageText:
//
// The search results exceed the offset range specified.
//
static const int ERROR_DS_OFFSET_RANGE_ERROR      8262L

//
// MessageId: ERROR_DS_RIDMGR_DISABLED
//
// MessageText:
//
// The directory service detected the subsystem that allocates relative identifiers is disabled. This can occur as a protective mechanism when the system determines a significant portion of relative identifiers (RIDs) have been exhausted. Please see http://go.microsoft.com/fwlink/?LinkId=228610 for recommended diagnostic steps and the procedure to re-enable account creation.
//
static const int ERROR_DS_RIDMGR_DISABLED         8263L

//
// MessageId: ERROR_DS_ROOT_MUST_BE_NC
//
// MessageText:
//
// The root object must be the head of a naming context. The root object cannot have an instantiated parent.
//
static const int ERROR_DS_ROOT_MUST_BE_NC         8301L

//
// MessageId: ERROR_DS_ADD_REPLICA_INHIBITED
//
// MessageText:
//
// The add replica operation cannot be performed. The naming context must be writeable in order to create the replica.
//
static const int ERROR_DS_ADD_REPLICA_INHIBITED   8302L

//
// MessageId: ERROR_DS_ATT_NOT_DEF_IN_SCHEMA
//
// MessageText:
//
// A reference to an attribute that is not defined in the schema occurred.
//
static const int ERROR_DS_ATT_NOT_DEF_IN_SCHEMA   8303L

//
// MessageId: ERROR_DS_MAX_OBJ_SIZE_EXCEEDED
//
// MessageText:
//
// The maximum size of an object has been exceeded.
//
static const int ERROR_DS_MAX_OBJ_SIZE_EXCEEDED   8304L

//
// MessageId: ERROR_DS_OBJ_STRING_NAME_EXISTS
//
// MessageText:
//
// An attempt was made to add an object to the directory with a name that is already in use.
//
static const int ERROR_DS_OBJ_STRING_NAME_EXISTS  8305L

//
// MessageId: ERROR_DS_NO_RDN_DEFINED_IN_SCHEMA
//
// MessageText:
//
// An attempt was made to add an object of a class that does not have an RDN defined in the schema.
//
static const int ERROR_DS_NO_RDN_DEFINED_IN_SCHEMA 8306L

//
// MessageId: ERROR_DS_RDN_DOESNT_MATCH_SCHEMA
//
// MessageText:
//
// An attempt was made to add an object using an RDN that is not the RDN defined in the schema.
//
static const int ERROR_DS_RDN_DOESNT_MATCH_SCHEMA 8307L

//
// MessageId: ERROR_DS_NO_REQUESTED_ATTS_FOUND
//
// MessageText:
//
// None of the requested attributes were found on the objects.
//
static const int ERROR_DS_NO_REQUESTED_ATTS_FOUND 8308L

//
// MessageId: ERROR_DS_USER_BUFFER_TO_SMALL
//
// MessageText:
//
// The user buffer is too small.
//
static const int ERROR_DS_USER_BUFFER_TO_SMALL    8309L

//
// MessageId: ERROR_DS_ATT_IS_NOT_ON_OBJ
//
// MessageText:
//
// The attribute specified in the operation is not present on the object.
//
static const int ERROR_DS_ATT_IS_NOT_ON_OBJ       8310L

//
// MessageId: ERROR_DS_ILLEGAL_MOD_OPERATION
//
// MessageText:
//
// Illegal modify operation. Some aspect of the modification is not permitted.
//
static const int ERROR_DS_ILLEGAL_MOD_OPERATION   8311L

//
// MessageId: ERROR_DS_OBJ_TOO_LARGE
//
// MessageText:
//
// The specified object is too large.
//
static const int ERROR_DS_OBJ_TOO_LARGE           8312L

//
// MessageId: ERROR_DS_BAD_INSTANCE_TYPE
//
// MessageText:
//
// The specified instance type is not valid.
//
static const int ERROR_DS_BAD_INSTANCE_TYPE       8313L

//
// MessageId: ERROR_DS_MASTERDSA_REQUIRED
//
// MessageText:
//
// The operation must be performed at a master DSA.
//
static const int ERROR_DS_MASTERDSA_REQUIRED      8314L

//
// MessageId: ERROR_DS_OBJECT_CLASS_REQUIRED
//
// MessageText:
//
// The object class attribute must be specified.
//
static const int ERROR_DS_OBJECT_CLASS_REQUIRED   8315L

//
// MessageId: ERROR_DS_MISSING_REQUIRED_ATT
//
// MessageText:
//
// A required attribute is missing.
//
static const int ERROR_DS_MISSING_REQUIRED_ATT    8316L

//
// MessageId: ERROR_DS_ATT_NOT_DEF_FOR_CLASS
//
// MessageText:
//
// An attempt was made to modify an object to include an attribute that is not legal for its class.
//
static const int ERROR_DS_ATT_NOT_DEF_FOR_CLASS   8317L

//
// MessageId: ERROR_DS_ATT_ALREADY_EXISTS
//
// MessageText:
//
// The specified attribute is already present on the object.
//
static const int ERROR_DS_ATT_ALREADY_EXISTS      8318L

// 8319 unused
//
// MessageId: ERROR_DS_CANT_ADD_ATT_VALUES
//
// MessageText:
//
// The specified attribute is not present, or has no values.
//
static const int ERROR_DS_CANT_ADD_ATT_VALUES     8320L

//
// MessageId: ERROR_DS_SINGLE_VALUE_CONSTRAINT
//
// MessageText:
//
// Multiple values were specified for an attribute that can have only one value.
//
static const int ERROR_DS_SINGLE_VALUE_CONSTRAINT 8321L

//
// MessageId: ERROR_DS_RANGE_CONSTRAINT
//
// MessageText:
//
// A value for the attribute was not in the acceptable range of values.
//
static const int ERROR_DS_RANGE_CONSTRAINT        8322L

//
// MessageId: ERROR_DS_ATT_VAL_ALREADY_EXISTS
//
// MessageText:
//
// The specified value already exists.
//
static const int ERROR_DS_ATT_VAL_ALREADY_EXISTS  8323L

//
// MessageId: ERROR_DS_CANT_REM_MISSING_ATT
//
// MessageText:
//
// The attribute cannot be removed because it is not present on the object.
//
static const int ERROR_DS_CANT_REM_MISSING_ATT    8324L

//
// MessageId: ERROR_DS_CANT_REM_MISSING_ATT_VAL
//
// MessageText:
//
// The attribute value cannot be removed because it is not present on the object.
//
static const int ERROR_DS_CANT_REM_MISSING_ATT_VAL 8325L

//
// MessageId: ERROR_DS_ROOT_CANT_BE_SUBREF
//
// MessageText:
//
// The specified root object cannot be a subref.
//
static const int ERROR_DS_ROOT_CANT_BE_SUBREF     8326L

//
// MessageId: ERROR_DS_NO_CHAINING
//
// MessageText:
//
// Chaining is not permitted.
//
static const int ERROR_DS_NO_CHAINING             8327L

//
// MessageId: ERROR_DS_NO_CHAINED_EVAL
//
// MessageText:
//
// Chained evaluation is not permitted.
//
static const int ERROR_DS_NO_CHAINED_EVAL         8328L

//
// MessageId: ERROR_DS_NO_PARENT_OBJECT
//
// MessageText:
//
// The operation could not be performed because the object's parent is either uninstantiated or deleted.
//
static const int ERROR_DS_NO_PARENT_OBJECT        8329L

//
// MessageId: ERROR_DS_PARENT_IS_AN_ALIAS
//
// MessageText:
//
// Having a parent that is an alias is not permitted. Aliases are leaf objects.
//
static const int ERROR_DS_PARENT_IS_AN_ALIAS      8330L

//
// MessageId: ERROR_DS_CANT_MIX_MASTER_AND_REPS
//
// MessageText:
//
// The object and parent must be of the same type, either both masters or both replicas.
//
static const int ERROR_DS_CANT_MIX_MASTER_AND_REPS 8331L

//
// MessageId: ERROR_DS_CHILDREN_EXIST
//
// MessageText:
//
// The operation cannot be performed because child objects exist. This operation can only be performed on a leaf object.
//
static const int ERROR_DS_CHILDREN_EXIST          8332L

//
// MessageId: ERROR_DS_OBJ_NOT_FOUND
//
// MessageText:
//
// Directory object not found.
//
static const int ERROR_DS_OBJ_NOT_FOUND           8333L

//
// MessageId: ERROR_DS_ALIASED_OBJ_MISSING
//
// MessageText:
//
// The aliased object is missing.
//
static const int ERROR_DS_ALIASED_OBJ_MISSING     8334L

//
// MessageId: ERROR_DS_BAD_NAME_SYNTAX
//
// MessageText:
//
// The object name has bad syntax.
//
static const int ERROR_DS_BAD_NAME_SYNTAX         8335L

//
// MessageId: ERROR_DS_ALIAS_POINTS_TO_ALIAS
//
// MessageText:
//
// It is not permitted for an alias to refer to another alias.
//
static const int ERROR_DS_ALIAS_POINTS_TO_ALIAS   8336L

//
// MessageId: ERROR_DS_CANT_DEREF_ALIAS
//
// MessageText:
//
// The alias cannot be dereferenced.
//
static const int ERROR_DS_CANT_DEREF_ALIAS        8337L

//
// MessageId: ERROR_DS_OUT_OF_SCOPE
//
// MessageText:
//
// The operation is out of scope.
//
static const int ERROR_DS_OUT_OF_SCOPE            8338L

//
// MessageId: ERROR_DS_OBJECT_BEING_REMOVED
//
// MessageText:
//
// The operation cannot continue because the object is in the process of being removed.
//
static const int ERROR_DS_OBJECT_BEING_REMOVED    8339L

//
// MessageId: ERROR_DS_CANT_DELETE_DSA_OBJ
//
// MessageText:
//
// The DSA object cannot be deleted.
//
static const int ERROR_DS_CANT_DELETE_DSA_OBJ     8340L

//
// MessageId: ERROR_DS_GENERIC_ERROR
//
// MessageText:
//
// A directory service error has occurred.
//
static const int ERROR_DS_GENERIC_ERROR           8341L

//
// MessageId: ERROR_DS_DSA_MUST_BE_INT_MASTER
//
// MessageText:
//
// The operation can only be performed on an internal master DSA object.
//
static const int ERROR_DS_DSA_MUST_BE_INT_MASTER  8342L

//
// MessageId: ERROR_DS_CLASS_NOT_DSA
//
// MessageText:
//
// The object must be of class DSA.
//
static const int ERROR_DS_CLASS_NOT_DSA           8343L

//
// MessageId: ERROR_DS_INSUFF_ACCESS_RIGHTS
//
// MessageText:
//
// Insufficient access rights to perform the operation.
//
static const int ERROR_DS_INSUFF_ACCESS_RIGHTS    8344L

//
// MessageId: ERROR_DS_ILLEGAL_SUPERIOR
//
// MessageText:
//
// The object cannot be added because the parent is not on the list of possible superiors.
//
static const int ERROR_DS_ILLEGAL_SUPERIOR        8345L

//
// MessageId: ERROR_DS_ATTRIBUTE_OWNED_BY_SAM
//
// MessageText:
//
// Access to the attribute is not permitted because the attribute is owned by the Security Accounts Manager (SAM).
//
static const int ERROR_DS_ATTRIBUTE_OWNED_BY_SAM  8346L

//
// MessageId: ERROR_DS_NAME_TOO_MANY_PARTS
//
// MessageText:
//
// The name has too many parts.
//
static const int ERROR_DS_NAME_TOO_MANY_PARTS     8347L

//
// MessageId: ERROR_DS_NAME_TOO_LONG
//
// MessageText:
//
// The name is too long.
//
static const int ERROR_DS_NAME_TOO_LONG           8348L

//
// MessageId: ERROR_DS_NAME_VALUE_TOO_LONG
//
// MessageText:
//
// The name value is too long.
//
static const int ERROR_DS_NAME_VALUE_TOO_LONG     8349L

//
// MessageId: ERROR_DS_NAME_UNPARSEABLE
//
// MessageText:
//
// The directory service encountered an error parsing a name.
//
static const int ERROR_DS_NAME_UNPARSEABLE        8350L

//
// MessageId: ERROR_DS_NAME_TYPE_UNKNOWN
//
// MessageText:
//
// The directory service cannot get the attribute type for a name.
//
static const int ERROR_DS_NAME_TYPE_UNKNOWN       8351L

//
// MessageId: ERROR_DS_NOT_AN_OBJECT
//
// MessageText:
//
// The name does not identify an object; the name identifies a phantom.
//
static const int ERROR_DS_NOT_AN_OBJECT           8352L

//
// MessageId: ERROR_DS_SEC_DESC_TOO_SHORT
//
// MessageText:
//
// The security descriptor is too short.
//
static const int ERROR_DS_SEC_DESC_TOO_SHORT      8353L

//
// MessageId: ERROR_DS_SEC_DESC_INVALID
//
// MessageText:
//
// The security descriptor is invalid.
//
static const int ERROR_DS_SEC_DESC_INVALID        8354L

//
// MessageId: ERROR_DS_NO_DELETED_NAME
//
// MessageText:
//
// Failed to create name for deleted object.
//
static const int ERROR_DS_NO_DELETED_NAME         8355L

//
// MessageId: ERROR_DS_SUBREF_MUST_HAVE_PARENT
//
// MessageText:
//
// The parent of a new subref must exist.
//
static const int ERROR_DS_SUBREF_MUST_HAVE_PARENT 8356L

//
// MessageId: ERROR_DS_NCNAME_MUST_BE_NC
//
// MessageText:
//
// The object must be a naming context.
//
static const int ERROR_DS_NCNAME_MUST_BE_NC       8357L

//
// MessageId: ERROR_DS_CANT_ADD_SYSTEM_ONLY
//
// MessageText:
//
// It is not permitted to add an attribute which is owned by the system.
//
static const int ERROR_DS_CANT_ADD_SYSTEM_ONLY    8358L

//
// MessageId: ERROR_DS_CLASS_MUST_BE_CONCRETE
//
// MessageText:
//
// The class of the object must be structural; you cannot instantiate an abstract class.
//
static const int ERROR_DS_CLASS_MUST_BE_CONCRETE  8359L

//
// MessageId: ERROR_DS_INVALID_DMD
//
// MessageText:
//
// The schema object could not be found.
//
static const int ERROR_DS_INVALID_DMD             8360L

//
// MessageId: ERROR_DS_OBJ_GUID_EXISTS
//
// MessageText:
//
// A local object with this GUID (dead or alive) already exists.
//
static const int ERROR_DS_OBJ_GUID_EXISTS         8361L

//
// MessageId: ERROR_DS_NOT_ON_BACKLINK
//
// MessageText:
//
// The operation cannot be performed on a back link.
//
static const int ERROR_DS_NOT_ON_BACKLINK         8362L

//
// MessageId: ERROR_DS_NO_CROSSREF_FOR_NC
//
// MessageText:
//
// The cross reference for the specified naming context could not be found.
//
static const int ERROR_DS_NO_CROSSREF_FOR_NC      8363L

//
// MessageId: ERROR_DS_SHUTTING_DOWN
//
// MessageText:
//
// The operation could not be performed because the directory service is shutting down.
//
static const int ERROR_DS_SHUTTING_DOWN           8364L

//
// MessageId: ERROR_DS_UNKNOWN_OPERATION
//
// MessageText:
//
// The directory service request is invalid.
//
static const int ERROR_DS_UNKNOWN_OPERATION       8365L

//
// MessageId: ERROR_DS_INVALID_ROLE_OWNER
//
// MessageText:
//
// The role owner attribute could not be read.
//
static const int ERROR_DS_INVALID_ROLE_OWNER      8366L

//
// MessageId: ERROR_DS_COULDNT_CONTACT_FSMO
//
// MessageText:
//
// The requested FSMO operation failed. The current FSMO holder could not be contacted.
//
static const int ERROR_DS_COULDNT_CONTACT_FSMO    8367L

//
// MessageId: ERROR_DS_CROSS_NC_DN_RENAME
//
// MessageText:
//
// Modification of a DN across a naming context is not permitted.
//
static const int ERROR_DS_CROSS_NC_DN_RENAME      8368L

//
// MessageId: ERROR_DS_CANT_MOD_SYSTEM_ONLY
//
// MessageText:
//
// The attribute cannot be modified because it is owned by the system.
//
static const int ERROR_DS_CANT_MOD_SYSTEM_ONLY    8369L

//
// MessageId: ERROR_DS_REPLICATOR_ONLY
//
// MessageText:
//
// Only the replicator can perform this function.
//
static const int ERROR_DS_REPLICATOR_ONLY         8370L

//
// MessageId: ERROR_DS_OBJ_CLASS_NOT_DEFINED
//
// MessageText:
//
// The specified class is not defined.
//
static const int ERROR_DS_OBJ_CLASS_NOT_DEFINED   8371L

//
// MessageId: ERROR_DS_OBJ_CLASS_NOT_SUBCLASS
//
// MessageText:
//
// The specified class is not a subclass.
//
static const int ERROR_DS_OBJ_CLASS_NOT_SUBCLASS  8372L

//
// MessageId: ERROR_DS_NAME_REFERENCE_INVALID
//
// MessageText:
//
// The name reference is invalid.
//
static const int ERROR_DS_NAME_REFERENCE_INVALID  8373L

//
// MessageId: ERROR_DS_CROSS_REF_EXISTS
//
// MessageText:
//
// A cross reference already exists.
//
static const int ERROR_DS_CROSS_REF_EXISTS        8374L

//
// MessageId: ERROR_DS_CANT_DEL_MASTER_CROSSREF
//
// MessageText:
//
// It is not permitted to delete a master cross reference.
//
static const int ERROR_DS_CANT_DEL_MASTER_CROSSREF 8375L

//
// MessageId: ERROR_DS_SUBTREE_NOTIFY_NOT_NC_HEAD
//
// MessageText:
//
// Subtree notifications are only supported on NC heads.
//
static const int ERROR_DS_SUBTREE_NOTIFY_NOT_NC_HEAD 8376L

//
// MessageId: ERROR_DS_NOTIFY_FILTER_TOO_COMPLEX
//
// MessageText:
//
// Notification filter is too complex.
//
static const int ERROR_DS_NOTIFY_FILTER_TOO_COMPLEX 8377L

//
// MessageId: ERROR_DS_DUP_RDN
//
// MessageText:
//
// Schema update failed: duplicate RDN.
//
static const int ERROR_DS_DUP_RDN                 8378L

//
// MessageId: ERROR_DS_DUP_OID
//
// MessageText:
//
// Schema update failed: duplicate OID.
//
static const int ERROR_DS_DUP_OID                 8379L

//
// MessageId: ERROR_DS_DUP_MAPI_ID
//
// MessageText:
//
// Schema update failed: duplicate MAPI identifier.
//
static const int ERROR_DS_DUP_MAPI_ID             8380L

//
// MessageId: ERROR_DS_DUP_SCHEMA_ID_GUID
//
// MessageText:
//
// Schema update failed: duplicate schema-id GUID.
//
static const int ERROR_DS_DUP_SCHEMA_ID_GUID      8381L

//
// MessageId: ERROR_DS_DUP_LDAP_DISPLAY_NAME
//
// MessageText:
//
// Schema update failed: duplicate LDAP display name.
//
static const int ERROR_DS_DUP_LDAP_DISPLAY_NAME   8382L

//
// MessageId: ERROR_DS_SEMANTIC_ATT_TEST
//
// MessageText:
//
// Schema update failed: range-lower less than range upper.
//
static const int ERROR_DS_SEMANTIC_ATT_TEST       8383L

//
// MessageId: ERROR_DS_SYNTAX_MISMATCH
//
// MessageText:
//
// Schema update failed: syntax mismatch.
//
static const int ERROR_DS_SYNTAX_MISMATCH         8384L

//
// MessageId: ERROR_DS_EXISTS_IN_MUST_HAVE
//
// MessageText:
//
// Schema deletion failed: attribute is used in must-contain.
//
static const int ERROR_DS_EXISTS_IN_MUST_HAVE     8385L

//
// MessageId: ERROR_DS_EXISTS_IN_MAY_HAVE
//
// MessageText:
//
// Schema deletion failed: attribute is used in may-contain.
//
static const int ERROR_DS_EXISTS_IN_MAY_HAVE      8386L

//
// MessageId: ERROR_DS_NONEXISTENT_MAY_HAVE
//
// MessageText:
//
// Schema update failed: attribute in may-contain does not exist.
//
static const int ERROR_DS_NONEXISTENT_MAY_HAVE    8387L

//
// MessageId: ERROR_DS_NONEXISTENT_MUST_HAVE
//
// MessageText:
//
// Schema update failed: attribute in must-contain does not exist.
//
static const int ERROR_DS_NONEXISTENT_MUST_HAVE   8388L

//
// MessageId: ERROR_DS_AUX_CLS_TEST_FAIL
//
// MessageText:
//
// Schema update failed: class in aux-class list does not exist or is not an auxiliary class.
//
static const int ERROR_DS_AUX_CLS_TEST_FAIL       8389L

//
// MessageId: ERROR_DS_NONEXISTENT_POSS_SUP
//
// MessageText:
//
// Schema update failed: class in poss-superiors does not exist.
//
static const int ERROR_DS_NONEXISTENT_POSS_SUP    8390L

//
// MessageId: ERROR_DS_SUB_CLS_TEST_FAIL
//
// MessageText:
//
// Schema update failed: class in subclassof list does not exist or does not satisfy hierarchy rules.
//
static const int ERROR_DS_SUB_CLS_TEST_FAIL       8391L

//
// MessageId: ERROR_DS_BAD_RDN_ATT_ID_SYNTAX
//
// MessageText:
//
// Schema update failed: Rdn-Att-Id has wrong syntax.
//
static const int ERROR_DS_BAD_RDN_ATT_ID_SYNTAX   8392L

//
// MessageId: ERROR_DS_EXISTS_IN_AUX_CLS
//
// MessageText:
//
// Schema deletion failed: class is used as auxiliary class.
//
static const int ERROR_DS_EXISTS_IN_AUX_CLS       8393L

//
// MessageId: ERROR_DS_EXISTS_IN_SUB_CLS
//
// MessageText:
//
// Schema deletion failed: class is used as sub class.
//
static const int ERROR_DS_EXISTS_IN_SUB_CLS       8394L

//
// MessageId: ERROR_DS_EXISTS_IN_POSS_SUP
//
// MessageText:
//
// Schema deletion failed: class is used as poss superior.
//
static const int ERROR_DS_EXISTS_IN_POSS_SUP      8395L

//
// MessageId: ERROR_DS_RECALCSCHEMA_FAILED
//
// MessageText:
//
// Schema update failed in recalculating validation cache.
//
static const int ERROR_DS_RECALCSCHEMA_FAILED     8396L

//
// MessageId: ERROR_DS_TREE_DELETE_NOT_FINISHED
//
// MessageText:
//
// The tree deletion is not finished. The request must be made again to continue deleting the tree.
//
static const int ERROR_DS_TREE_DELETE_NOT_FINISHED 8397L

//
// MessageId: ERROR_DS_CANT_DELETE
//
// MessageText:
//
// The requested delete operation could not be performed.
//
static const int ERROR_DS_CANT_DELETE             8398L

//
// MessageId: ERROR_DS_ATT_SCHEMA_REQ_ID
//
// MessageText:
//
// Cannot read the governs class identifier for the schema record.
//
static const int ERROR_DS_ATT_SCHEMA_REQ_ID       8399L

//
// MessageId: ERROR_DS_BAD_ATT_SCHEMA_SYNTAX
//
// MessageText:
//
// The attribute schema has bad syntax.
//
static const int ERROR_DS_BAD_ATT_SCHEMA_SYNTAX   8400L

//
// MessageId: ERROR_DS_CANT_CACHE_ATT
//
// MessageText:
//
// The attribute could not be cached.
//
static const int ERROR_DS_CANT_CACHE_ATT          8401L

//
// MessageId: ERROR_DS_CANT_CACHE_CLASS
//
// MessageText:
//
// The class could not be cached.
//
static const int ERROR_DS_CANT_CACHE_CLASS        8402L

//
// MessageId: ERROR_DS_CANT_REMOVE_ATT_CACHE
//
// MessageText:
//
// The attribute could not be removed from the cache.
//
static const int ERROR_DS_CANT_REMOVE_ATT_CACHE   8403L

//
// MessageId: ERROR_DS_CANT_REMOVE_CLASS_CACHE
//
// MessageText:
//
// The class could not be removed from the cache.
//
static const int ERROR_DS_CANT_REMOVE_CLASS_CACHE 8404L

//
// MessageId: ERROR_DS_CANT_RETRIEVE_DN
//
// MessageText:
//
// The distinguished name attribute could not be read.
//
static const int ERROR_DS_CANT_RETRIEVE_DN        8405L

//
// MessageId: ERROR_DS_MISSING_SUPREF
//
// MessageText:
//
// No superior reference has been configured for the directory service. The directory service is therefore unable to issue referrals to objects outside this forest.
//
static const int ERROR_DS_MISSING_SUPREF          8406L

//
// MessageId: ERROR_DS_CANT_RETRIEVE_INSTANCE
//
// MessageText:
//
// The instance type attribute could not be retrieved.
//
static const int ERROR_DS_CANT_RETRIEVE_INSTANCE  8407L

//
// MessageId: ERROR_DS_CODE_INCONSISTENCY
//
// MessageText:
//
// An internal error has occurred.
//
static const int ERROR_DS_CODE_INCONSISTENCY      8408L

//
// MessageId: ERROR_DS_DATABASE_ERROR
//
// MessageText:
//
// A database error has occurred.
//
static const int ERROR_DS_DATABASE_ERROR          8409L

//
// MessageId: ERROR_DS_GOVERNSID_MISSING
//
// MessageText:
//
// The attribute GOVERNSID is missing.
//
static const int ERROR_DS_GOVERNSID_MISSING       8410L

//
// MessageId: ERROR_DS_MISSING_EXPECTED_ATT
//
// MessageText:
//
// An expected attribute is missing.
//
static const int ERROR_DS_MISSING_EXPECTED_ATT    8411L

//
// MessageId: ERROR_DS_NCNAME_MISSING_CR_REF
//
// MessageText:
//
// The specified naming context is missing a cross reference.
//
static const int ERROR_DS_NCNAME_MISSING_CR_REF   8412L

//
// MessageId: ERROR_DS_SECURITY_CHECKING_ERROR
//
// MessageText:
//
// A security checking error has occurred.
//
static const int ERROR_DS_SECURITY_CHECKING_ERROR 8413L

//
// MessageId: ERROR_DS_SCHEMA_NOT_LOADED
//
// MessageText:
//
// The schema is not loaded.
//
static const int ERROR_DS_SCHEMA_NOT_LOADED       8414L

//
// MessageId: ERROR_DS_SCHEMA_ALLOC_FAILED
//
// MessageText:
//
// Schema allocation failed. Please check if the machine is running low on memory.
//
static const int ERROR_DS_SCHEMA_ALLOC_FAILED     8415L

//
// MessageId: ERROR_DS_ATT_SCHEMA_REQ_SYNTAX
//
// MessageText:
//
// Failed to obtain the required syntax for the attribute schema.
//
static const int ERROR_DS_ATT_SCHEMA_REQ_SYNTAX   8416L

//
// MessageId: ERROR_DS_GCVERIFY_ERROR
//
// MessageText:
//
// The global catalog verification failed. The global catalog is not available or does not support the operation. Some part of the directory is currently not available.
//
static const int ERROR_DS_GCVERIFY_ERROR          8417L

//
// MessageId: ERROR_DS_DRA_SCHEMA_MISMATCH
//
// MessageText:
//
// The replication operation failed because of a schema mismatch between the servers involved.
//
static const int ERROR_DS_DRA_SCHEMA_MISMATCH     8418L

//
// MessageId: ERROR_DS_CANT_FIND_DSA_OBJ
//
// MessageText:
//
// The DSA object could not be found.
//
static const int ERROR_DS_CANT_FIND_DSA_OBJ       8419L

//
// MessageId: ERROR_DS_CANT_FIND_EXPECTED_NC
//
// MessageText:
//
// The naming context could not be found.
//
static const int ERROR_DS_CANT_FIND_EXPECTED_NC   8420L

//
// MessageId: ERROR_DS_CANT_FIND_NC_IN_CACHE
//
// MessageText:
//
// The naming context could not be found in the cache.
//
static const int ERROR_DS_CANT_FIND_NC_IN_CACHE   8421L

//
// MessageId: ERROR_DS_CANT_RETRIEVE_CHILD
//
// MessageText:
//
// The child object could not be retrieved.
//
static const int ERROR_DS_CANT_RETRIEVE_CHILD     8422L

//
// MessageId: ERROR_DS_SECURITY_ILLEGAL_MODIFY
//
// MessageText:
//
// The modification was not permitted for security reasons.
//
static const int ERROR_DS_SECURITY_ILLEGAL_MODIFY 8423L

//
// MessageId: ERROR_DS_CANT_REPLACE_HIDDEN_REC
//
// MessageText:
//
// The operation cannot replace the hidden record.
//
static const int ERROR_DS_CANT_REPLACE_HIDDEN_REC 8424L

//
// MessageId: ERROR_DS_BAD_HIERARCHY_FILE
//
// MessageText:
//
// The hierarchy file is invalid.
//
static const int ERROR_DS_BAD_HIERARCHY_FILE      8425L

//
// MessageId: ERROR_DS_BUILD_HIERARCHY_TABLE_FAILED
//
// MessageText:
//
// The attempt to build the hierarchy table failed.
//
static const int ERROR_DS_BUILD_HIERARCHY_TABLE_FAILED 8426L

//
// MessageId: ERROR_DS_CONFIG_PARAM_MISSING
//
// MessageText:
//
// The directory configuration parameter is missing from the registry.
//
static const int ERROR_DS_CONFIG_PARAM_MISSING    8427L

//
// MessageId: ERROR_DS_COUNTING_AB_INDICES_FAILED
//
// MessageText:
//
// The attempt to count the address book indices failed.
//
static const int ERROR_DS_COUNTING_AB_INDICES_FAILED 8428L

//
// MessageId: ERROR_DS_HIERARCHY_TABLE_MALLOC_FAILED
//
// MessageText:
//
// The allocation of the hierarchy table failed.
//
static const int ERROR_DS_HIERARCHY_TABLE_MALLOC_FAILED 8429L

//
// MessageId: ERROR_DS_INTERNAL_FAILURE
//
// MessageText:
//
// The directory service encountered an internal failure.
//
static const int ERROR_DS_INTERNAL_FAILURE        8430L

//
// MessageId: ERROR_DS_UNKNOWN_ERROR
//
// MessageText:
//
// The directory service encountered an unknown failure.
//
static const int ERROR_DS_UNKNOWN_ERROR           8431L

//
// MessageId: ERROR_DS_ROOT_REQUIRES_CLASS_TOP
//
// MessageText:
//
// A root object requires a class of 'top'.
//
static const int ERROR_DS_ROOT_REQUIRES_CLASS_TOP 8432L

//
// MessageId: ERROR_DS_REFUSING_FSMO_ROLES
//
// MessageText:
//
// This directory server is shutting down, and cannot take ownership of new floating single-master operation roles.
//
static const int ERROR_DS_REFUSING_FSMO_ROLES     8433L

//
// MessageId: ERROR_DS_MISSING_FSMO_SETTINGS
//
// MessageText:
//
// The directory service is missing mandatory configuration information, and is unable to determine the ownership of floating single-master operation roles.
//
static const int ERROR_DS_MISSING_FSMO_SETTINGS   8434L

//
// MessageId: ERROR_DS_UNABLE_TO_SURRENDER_ROLES
//
// MessageText:
//
// The directory service was unable to transfer ownership of one or more floating single-master operation roles to other servers.
//
static const int ERROR_DS_UNABLE_TO_SURRENDER_ROLES 8435L

//
// MessageId: ERROR_DS_DRA_GENERIC
//
// MessageText:
//
// The replication operation failed.
//
static const int ERROR_DS_DRA_GENERIC             8436L

//
// MessageId: ERROR_DS_DRA_INVALID_PARAMETER
//
// MessageText:
//
// An invalid parameter was specified for this replication operation.
//
static const int ERROR_DS_DRA_INVALID_PARAMETER   8437L

//
// MessageId: ERROR_DS_DRA_BUSY
//
// MessageText:
//
// The directory service is too busy to complete the replication operation at this time.
//
static const int ERROR_DS_DRA_BUSY                8438L

//
// MessageId: ERROR_DS_DRA_BAD_DN
//
// MessageText:
//
// The distinguished name specified for this replication operation is invalid.
//
static const int ERROR_DS_DRA_BAD_DN              8439L

//
// MessageId: ERROR_DS_DRA_BAD_NC
//
// MessageText:
//
// The naming context specified for this replication operation is invalid.
//
static const int ERROR_DS_DRA_BAD_NC              8440L

//
// MessageId: ERROR_DS_DRA_DN_EXISTS
//
// MessageText:
//
// The distinguished name specified for this replication operation already exists.
//
static const int ERROR_DS_DRA_DN_EXISTS           8441L

//
// MessageId: ERROR_DS_DRA_INTERNAL_ERROR
//
// MessageText:
//
// The replication system encountered an internal error.
//
static const int ERROR_DS_DRA_INTERNAL_ERROR      8442L

//
// MessageId: ERROR_DS_DRA_INCONSISTENT_DIT
//
// MessageText:
//
// The replication operation encountered a database inconsistency.
//
static const int ERROR_DS_DRA_INCONSISTENT_DIT    8443L

//
// MessageId: ERROR_DS_DRA_CONNECTION_FAILED
//
// MessageText:
//
// The server specified for this replication operation could not be contacted.
//
static const int ERROR_DS_DRA_CONNECTION_FAILED   8444L

//
// MessageId: ERROR_DS_DRA_BAD_INSTANCE_TYPE
//
// MessageText:
//
// The replication operation encountered an object with an invalid instance type.
//
static const int ERROR_DS_DRA_BAD_INSTANCE_TYPE   8445L

//
// MessageId: ERROR_DS_DRA_OUT_OF_MEM
//
// MessageText:
//
// The replication operation failed to allocate memory.
//
static const int ERROR_DS_DRA_OUT_OF_MEM          8446L

//
// MessageId: ERROR_DS_DRA_MAIL_PROBLEM
//
// MessageText:
//
// The replication operation encountered an error with the mail system.
//
static const int ERROR_DS_DRA_MAIL_PROBLEM        8447L

//
// MessageId: ERROR_DS_DRA_REF_ALREADY_EXISTS
//
// MessageText:
//
// The replication reference information for the target server already exists.
//
static const int ERROR_DS_DRA_REF_ALREADY_EXISTS  8448L

//
// MessageId: ERROR_DS_DRA_REF_NOT_FOUND
//
// MessageText:
//
// The replication reference information for the target server does not exist.
//
static const int ERROR_DS_DRA_REF_NOT_FOUND       8449L

//
// MessageId: ERROR_DS_DRA_OBJ_IS_REP_SOURCE
//
// MessageText:
//
// The naming context cannot be removed because it is replicated to another server.
//
static const int ERROR_DS_DRA_OBJ_IS_REP_SOURCE   8450L

//
// MessageId: ERROR_DS_DRA_DB_ERROR
//
// MessageText:
//
// The replication operation encountered a database error.
//
static const int ERROR_DS_DRA_DB_ERROR            8451L

//
// MessageId: ERROR_DS_DRA_NO_REPLICA
//
// MessageText:
//
// The naming context is in the process of being removed or is not replicated from the specified server.
//
static const int ERROR_DS_DRA_NO_REPLICA          8452L

//
// MessageId: ERROR_DS_DRA_ACCESS_DENIED
//
// MessageText:
//
// Replication access was denied.
//
static const int ERROR_DS_DRA_ACCESS_DENIED       8453L

//
// MessageId: ERROR_DS_DRA_NOT_SUPPORTED
//
// MessageText:
//
// The requested operation is not supported by this version of the directory service.
//
static const int ERROR_DS_DRA_NOT_SUPPORTED       8454L

//
// MessageId: ERROR_DS_DRA_RPC_CANCELLED
//
// MessageText:
//
// The replication remote procedure call was cancelled.
//
static const int ERROR_DS_DRA_RPC_CANCELLED       8455L

//
// MessageId: ERROR_DS_DRA_SOURCE_DISABLED
//
// MessageText:
//
// The source server is currently rejecting replication requests.
//
static const int ERROR_DS_DRA_SOURCE_DISABLED     8456L

//
// MessageId: ERROR_DS_DRA_SINK_DISABLED
//
// MessageText:
//
// The destination server is currently rejecting replication requests.
//
static const int ERROR_DS_DRA_SINK_DISABLED       8457L

//
// MessageId: ERROR_DS_DRA_NAME_COLLISION
//
// MessageText:
//
// The replication operation failed due to a collision of object names.
//
static const int ERROR_DS_DRA_NAME_COLLISION      8458L

//
// MessageId: ERROR_DS_DRA_SOURCE_REINSTALLED
//
// MessageText:
//
// The replication source has been reinstalled.
//
static const int ERROR_DS_DRA_SOURCE_REINSTALLED  8459L

//
// MessageId: ERROR_DS_DRA_MISSING_PARENT
//
// MessageText:
//
// The replication operation failed because a required parent object is missing.
//
static const int ERROR_DS_DRA_MISSING_PARENT      8460L

//
// MessageId: ERROR_DS_DRA_PREEMPTED
//
// MessageText:
//
// The replication operation was preempted.
//
static const int ERROR_DS_DRA_PREEMPTED           8461L

//
// MessageId: ERROR_DS_DRA_ABANDON_SYNC
//
// MessageText:
//
// The replication synchronization attempt was abandoned because of a lack of updates.
//
static const int ERROR_DS_DRA_ABANDON_SYNC        8462L

//
// MessageId: ERROR_DS_DRA_SHUTDOWN
//
// MessageText:
//
// The replication operation was terminated because the system is shutting down.
//
static const int ERROR_DS_DRA_SHUTDOWN            8463L

//
// MessageId: ERROR_DS_DRA_INCOMPATIBLE_PARTIAL_SET
//
// MessageText:
//
// Synchronization attempt failed because the destination DC is currently waiting to synchronize new partial attributes from source. This condition is normal if a recent schema change modified the partial attribute set. The destination partial attribute set is not a subset of source partial attribute set.
//
static const int ERROR_DS_DRA_INCOMPATIBLE_PARTIAL_SET 8464L

//
// MessageId: ERROR_DS_DRA_SOURCE_IS_PARTIAL_REPLICA
//
// MessageText:
//
// The replication synchronization attempt failed because a master replica attempted to sync from a partial replica.
//
static const int ERROR_DS_DRA_SOURCE_IS_PARTIAL_REPLICA 8465L

//
// MessageId: ERROR_DS_DRA_EXTN_CONNECTION_FAILED
//
// MessageText:
//
// The server specified for this replication operation was contacted, but that server was unable to contact an additional server needed to complete the operation.
//
static const int ERROR_DS_DRA_EXTN_CONNECTION_FAILED 8466L

//
// MessageId: ERROR_DS_INSTALL_SCHEMA_MISMATCH
//
// MessageText:
//
// The version of the directory service schema of the source forest is not compatible with the version of directory service on this computer.
//
static const int ERROR_DS_INSTALL_SCHEMA_MISMATCH 8467L

//
// MessageId: ERROR_DS_DUP_LINK_ID
//
// MessageText:
//
// Schema update failed: An attribute with the same link identifier already exists.
//
static const int ERROR_DS_DUP_LINK_ID             8468L

//
// MessageId: ERROR_DS_NAME_ERROR_RESOLVING
//
// MessageText:
//
// Name translation: Generic processing error.
//
static const int ERROR_DS_NAME_ERROR_RESOLVING    8469L

//
// MessageId: ERROR_DS_NAME_ERROR_NOT_FOUND
//
// MessageText:
//
// Name translation: Could not find the name or insufficient right to see name.
//
static const int ERROR_DS_NAME_ERROR_NOT_FOUND    8470L

//
// MessageId: ERROR_DS_NAME_ERROR_NOT_UNIQUE
//
// MessageText:
//
// Name translation: Input name mapped to more than one output name.
//
static const int ERROR_DS_NAME_ERROR_NOT_UNIQUE   8471L

//
// MessageId: ERROR_DS_NAME_ERROR_NO_MAPPING
//
// MessageText:
//
// Name translation: Input name found, but not the associated output format.
//
static const int ERROR_DS_NAME_ERROR_NO_MAPPING   8472L

//
// MessageId: ERROR_DS_NAME_ERROR_DOMAIN_ONLY
//
// MessageText:
//
// Name translation: Unable to resolve completely, only the domain was found.
//
static const int ERROR_DS_NAME_ERROR_DOMAIN_ONLY  8473L

//
// MessageId: ERROR_DS_NAME_ERROR_NO_SYNTACTICAL_MAPPING
//
// MessageText:
//
// Name translation: Unable to perform purely syntactical mapping at the client without going out to the wire.
//
static const int ERROR_DS_NAME_ERROR_NO_SYNTACTICAL_MAPPING 8474L

//
// MessageId: ERROR_DS_CONSTRUCTED_ATT_MOD
//
// MessageText:
//
// Modification of a constructed attribute is not allowed.
//
static const int ERROR_DS_CONSTRUCTED_ATT_MOD     8475L

//
// MessageId: ERROR_DS_WRONG_OM_OBJ_CLASS
//
// MessageText:
//
// The OM-Object-Class specified is incorrect for an attribute with the specified syntax.
//
static const int ERROR_DS_WRONG_OM_OBJ_CLASS      8476L

//
// MessageId: ERROR_DS_DRA_REPL_PENDING
//
// MessageText:
//
// The replication request has been posted; waiting for reply.
//
static const int ERROR_DS_DRA_REPL_PENDING        8477L

//
// MessageId: ERROR_DS_DS_REQUIRED
//
// MessageText:
//
// The requested operation requires a directory service, and none was available.
//
static const int ERROR_DS_DS_REQUIRED             8478L

//
// MessageId: ERROR_DS_INVALID_LDAP_DISPLAY_NAME
//
// MessageText:
//
// The LDAP display name of the class or attribute contains non-ASCII characters.
//
static const int ERROR_DS_INVALID_LDAP_DISPLAY_NAME 8479L

//
// MessageId: ERROR_DS_NON_BASE_SEARCH
//
// MessageText:
//
// The requested search operation is only supported for base searches.
//
static const int ERROR_DS_NON_BASE_SEARCH         8480L

//
// MessageId: ERROR_DS_CANT_RETRIEVE_ATTS
//
// MessageText:
//
// The search failed to retrieve attributes from the database.
//
static const int ERROR_DS_CANT_RETRIEVE_ATTS      8481L

//
// MessageId: ERROR_DS_BACKLINK_WITHOUT_LINK
//
// MessageText:
//
// The schema update operation tried to add a backward link attribute that has no corresponding forward link.
//
static const int ERROR_DS_BACKLINK_WITHOUT_LINK   8482L

//
// MessageId: ERROR_DS_EPOCH_MISMATCH
//
// MessageText:
//
// Source and destination of a cross-domain move do not agree on the object's epoch number. Either source or destination does not have the latest version of the object.
//
static const int ERROR_DS_EPOCH_MISMATCH          8483L

//
// MessageId: ERROR_DS_SRC_NAME_MISMATCH
//
// MessageText:
//
// Source and destination of a cross-domain move do not agree on the object's current name. Either source or destination does not have the latest version of the object.
//
static const int ERROR_DS_SRC_NAME_MISMATCH       8484L

//
// MessageId: ERROR_DS_SRC_AND_DST_NC_IDENTICAL
//
// MessageText:
//
// Source and destination for the cross-domain move operation are identical. Caller should use local move operation instead of cross-domain move operation.
//
static const int ERROR_DS_SRC_AND_DST_NC_IDENTICAL 8485L

//
// MessageId: ERROR_DS_DST_NC_MISMATCH
//
// MessageText:
//
// Source and destination for a cross-domain move are not in agreement on the naming contexts in the forest. Either source or destination does not have the latest version of the Partitions container.
//
static const int ERROR_DS_DST_NC_MISMATCH         8486L

//
// MessageId: ERROR_DS_NOT_AUTHORITIVE_FOR_DST_NC
//
// MessageText:
//
// Destination of a cross-domain move is not authoritative for the destination naming context.
//
static const int ERROR_DS_NOT_AUTHORITIVE_FOR_DST_NC 8487L

//
// MessageId: ERROR_DS_SRC_GUID_MISMATCH
//
// MessageText:
//
// Source and destination of a cross-domain move do not agree on the identity of the source object. Either source or destination does not have the latest version of the source object.
//
static const int ERROR_DS_SRC_GUID_MISMATCH       8488L

//
// MessageId: ERROR_DS_CANT_MOVE_DELETED_OBJECT
//
// MessageText:
//
// Object being moved across-domains is already known to be deleted by the destination server. The source server does not have the latest version of the source object.
//
static const int ERROR_DS_CANT_MOVE_DELETED_OBJECT 8489L

//
// MessageId: ERROR_DS_PDC_OPERATION_IN_PROGRESS
//
// MessageText:
//
// Another operation which requires exclusive access to the PDC FSMO is already in progress.
//
static const int ERROR_DS_PDC_OPERATION_IN_PROGRESS 8490L

//
// MessageId: ERROR_DS_CROSS_DOMAIN_CLEANUP_REQD
//
// MessageText:
//
// A cross-domain move operation failed such that two versions of the moved object exist - one each in the source and destination domains. The destination object needs to be removed to restore the system to a consistent state.
//
static const int ERROR_DS_CROSS_DOMAIN_CLEANUP_REQD 8491L

//
// MessageId: ERROR_DS_ILLEGAL_XDOM_MOVE_OPERATION
//
// MessageText:
//
// This object may not be moved across domain boundaries either because cross-domain moves for this class are disallowed, or the object has some special characteristics, e.g.: trust account or restricted RID, which prevent its move.
//
static const int ERROR_DS_ILLEGAL_XDOM_MOVE_OPERATION 8492L

//
// MessageId: ERROR_DS_CANT_WITH_ACCT_GROUP_MEMBERSHPS
//
// MessageText:
//
// Can't move objects with memberships across domain boundaries as once moved, this would violate the membership conditions of the account group. Remove the object from any account group memberships and retry.
//
static const int ERROR_DS_CANT_WITH_ACCT_GROUP_MEMBERSHPS 8493L

//
// MessageId: ERROR_DS_NC_MUST_HAVE_NC_PARENT
//
// MessageText:
//
// A naming context head must be the immediate child of another naming context head, not of an interior node.
//
static const int ERROR_DS_NC_MUST_HAVE_NC_PARENT  8494L

//
// MessageId: ERROR_DS_CR_IMPOSSIBLE_TO_VALIDATE
//
// MessageText:
//
// The directory cannot validate the proposed naming context name because it does not hold a replica of the naming context above the proposed naming context. Please ensure that the domain naming master role is held by a server that is configured as a global catalog server, and that the server is up to date with its replication partners. (Applies only to Windows 2000 Domain Naming masters)
//
static const int ERROR_DS_CR_IMPOSSIBLE_TO_VALIDATE 8495L

//
// MessageId: ERROR_DS_DST_DOMAIN_NOT_NATIVE
//
// MessageText:
//
// Destination domain must be in native mode.
//
static const int ERROR_DS_DST_DOMAIN_NOT_NATIVE   8496L

//
// MessageId: ERROR_DS_MISSING_INFRASTRUCTURE_CONTAINER
//
// MessageText:
//
// The operation cannot be performed because the server does not have an infrastructure container in the domain of interest.
//
static const int ERROR_DS_MISSING_INFRASTRUCTURE_CONTAINER 8497L

//
// MessageId: ERROR_DS_CANT_MOVE_ACCOUNT_GROUP
//
// MessageText:
//
// Cross-domain move of non-empty account groups is not allowed.
//
static const int ERROR_DS_CANT_MOVE_ACCOUNT_GROUP 8498L

//
// MessageId: ERROR_DS_CANT_MOVE_RESOURCE_GROUP
//
// MessageText:
//
// Cross-domain move of non-empty resource groups is not allowed.
//
static const int ERROR_DS_CANT_MOVE_RESOURCE_GROUP 8499L

//
// MessageId: ERROR_DS_INVALID_SEARCH_FLAG
//
// MessageText:
//
// The search flags for the attribute are invalid. The ANR bit is valid only on attributes of Unicode or Teletex strings.
//
static const int ERROR_DS_INVALID_SEARCH_FLAG     8500L

//
// MessageId: ERROR_DS_NO_TREE_DELETE_ABOVE_NC
//
// MessageText:
//
// Tree deletions starting at an object which has an NC head as a descendant are not allowed.
//
static const int ERROR_DS_NO_TREE_DELETE_ABOVE_NC 8501L

//
// MessageId: ERROR_DS_COULDNT_LOCK_TREE_FOR_DELETE
//
// MessageText:
//
// The directory service failed to lock a tree in preparation for a tree deletion because the tree was in use.
//
static const int ERROR_DS_COULDNT_LOCK_TREE_FOR_DELETE 8502L

//
// MessageId: ERROR_DS_COULDNT_IDENTIFY_OBJECTS_FOR_TREE_DELETE
//
// MessageText:
//
// The directory service failed to identify the list of objects to delete while attempting a tree deletion.
//
static const int ERROR_DS_COULDNT_IDENTIFY_OBJECTS_FOR_TREE_DELETE 8503L

//
// MessageId: ERROR_DS_SAM_INIT_FAILURE
//
// MessageText:
//
// Security Accounts Manager initialization failed because of the following error: %1.
// Error Status: 0x%2. Please shutdown this system and reboot into Directory Services Restore Mode, check the event log for more detailed information.
//
static const int ERROR_DS_SAM_INIT_FAILURE        8504L

//
// MessageId: ERROR_DS_SENSITIVE_GROUP_VIOLATION
//
// MessageText:
//
// Only an administrator can modify the membership list of an administrative group.
//
static const int ERROR_DS_SENSITIVE_GROUP_VIOLATION 8505L

//
// MessageId: ERROR_DS_CANT_MOD_PRIMARYGROUPID
//
// MessageText:
//
// Cannot change the primary group ID of a domain controller account.
//
static const int ERROR_DS_CANT_MOD_PRIMARYGROUPID 8506L

//
// MessageId: ERROR_DS_ILLEGAL_BASE_SCHEMA_MOD
//
// MessageText:
//
// An attempt is made to modify the base schema.
//
static const int ERROR_DS_ILLEGAL_BASE_SCHEMA_MOD 8507L

//
// MessageId: ERROR_DS_NONSAFE_SCHEMA_CHANGE
//
// MessageText:
//
// Adding a new mandatory attribute to an existing class, deleting a mandatory attribute from an existing class, or adding an optional attribute to the special class Top that is not a backlink attribute (directly or through inheritance, for example, by adding or deleting an auxiliary class) is not allowed.
//
static const int ERROR_DS_NONSAFE_SCHEMA_CHANGE   8508L

//
// MessageId: ERROR_DS_SCHEMA_UPDATE_DISALLOWED
//
// MessageText:
//
// Schema update is not allowed on this DC because the DC is not the schema FSMO Role Owner.
//
static const int ERROR_DS_SCHEMA_UPDATE_DISALLOWED 8509L

//
// MessageId: ERROR_DS_CANT_CREATE_UNDER_SCHEMA
//
// MessageText:
//
// An object of this class cannot be created under the schema container. You can only create attribute-schema and class-schema objects under the schema container.
//
static const int ERROR_DS_CANT_CREATE_UNDER_SCHEMA 8510L

//
// MessageId: ERROR_DS_INSTALL_NO_SRC_SCH_VERSION
//
// MessageText:
//
// The replica/child install failed to get the objectVersion attribute on the schema container on the source DC. Either the attribute is missing on the schema container or the credentials supplied do not have permission to read it.
//
static const int ERROR_DS_INSTALL_NO_SRC_SCH_VERSION 8511L

//
// MessageId: ERROR_DS_INSTALL_NO_SCH_VERSION_IN_INIFILE
//
// MessageText:
//
// The replica/child install failed to read the objectVersion attribute in the SCHEMA section of the file schema.ini in the system32 directory.
//
static const int ERROR_DS_INSTALL_NO_SCH_VERSION_IN_INIFILE 8512L

//
// MessageId: ERROR_DS_INVALID_GROUP_TYPE
//
// MessageText:
//
// The specified group type is invalid.
//
static const int ERROR_DS_INVALID_GROUP_TYPE      8513L

//
// MessageId: ERROR_DS_NO_NEST_GLOBALGROUP_IN_MIXEDDOMAIN
//
// MessageText:
//
// You cannot nest global groups in a mixed domain if the group is security-enabled.
//
static const int ERROR_DS_NO_NEST_GLOBALGROUP_IN_MIXEDDOMAIN 8514L

//
// MessageId: ERROR_DS_NO_NEST_LOCALGROUP_IN_MIXEDDOMAIN
//
// MessageText:
//
// You cannot nest local groups in a mixed domain if the group is security-enabled.
//
static const int ERROR_DS_NO_NEST_LOCALGROUP_IN_MIXEDDOMAIN 8515L

//
// MessageId: ERROR_DS_GLOBAL_CANT_HAVE_LOCAL_MEMBER
//
// MessageText:
//
// A global group cannot have a local group as a member.
//
static const int ERROR_DS_GLOBAL_CANT_HAVE_LOCAL_MEMBER 8516L

//
// MessageId: ERROR_DS_GLOBAL_CANT_HAVE_UNIVERSAL_MEMBER
//
// MessageText:
//
// A global group cannot have a universal group as a member.
//
static const int ERROR_DS_GLOBAL_CANT_HAVE_UNIVERSAL_MEMBER 8517L

//
// MessageId: ERROR_DS_UNIVERSAL_CANT_HAVE_LOCAL_MEMBER
//
// MessageText:
//
// A universal group cannot have a local group as a member.
//
static const int ERROR_DS_UNIVERSAL_CANT_HAVE_LOCAL_MEMBER 8518L

//
// MessageId: ERROR_DS_GLOBAL_CANT_HAVE_CROSSDOMAIN_MEMBER
//
// MessageText:
//
// A global group cannot have a cross-domain member.
//
static const int ERROR_DS_GLOBAL_CANT_HAVE_CROSSDOMAIN_MEMBER 8519L

//
// MessageId: ERROR_DS_LOCAL_CANT_HAVE_CROSSDOMAIN_LOCAL_MEMBER
//
// MessageText:
//
// A local group cannot have another cross domain local group as a member.
//
static const int ERROR_DS_LOCAL_CANT_HAVE_CROSSDOMAIN_LOCAL_MEMBER 8520L

//
// MessageId: ERROR_DS_HAVE_PRIMARY_MEMBERS
//
// MessageText:
//
// A group with primary members cannot change to a security-disabled group.
//
static const int ERROR_DS_HAVE_PRIMARY_MEMBERS    8521L

//
// MessageId: ERROR_DS_STRING_SD_CONVERSION_FAILED
//
// MessageText:
//
// The schema cache load failed to convert the string default SD on a class-schema object.
//
static const int ERROR_DS_STRING_SD_CONVERSION_FAILED 8522L

//
// MessageId: ERROR_DS_NAMING_MASTER_GC
//
// MessageText:
//
// Only DSAs configured to be Global Catalog servers should be allowed to hold the Domain Naming Master FSMO role. (Applies only to Windows 2000 servers)
//
static const int ERROR_DS_NAMING_MASTER_GC        8523L

//
// MessageId: ERROR_DS_DNS_LOOKUP_FAILURE
//
// MessageText:
//
// The DSA operation is unable to proceed because of a DNS lookup failure.
//
static const int ERROR_DS_DNS_LOOKUP_FAILURE      8524L

//
// MessageId: ERROR_DS_COULDNT_UPDATE_SPNS
//
// MessageText:
//
// While processing a change to the DNS Host Name for an object, the Service Principal Name values could not be kept in sync.
//
static const int ERROR_DS_COULDNT_UPDATE_SPNS     8525L

//
// MessageId: ERROR_DS_CANT_RETRIEVE_SD
//
// MessageText:
//
// The Security Descriptor attribute could not be read.
//
static const int ERROR_DS_CANT_RETRIEVE_SD        8526L

//
// MessageId: ERROR_DS_KEY_NOT_UNIQUE
//
// MessageText:
//
// The object requested was not found, but an object with that key was found.
//
static const int ERROR_DS_KEY_NOT_UNIQUE          8527L

//
// MessageId: ERROR_DS_WRONG_LINKED_ATT_SYNTAX
//
// MessageText:
//
// The syntax of the linked attribute being added is incorrect. Forward links can only have syntax 2.5.5.1, 2.5.5.7, and 2.5.5.14, and backlinks can only have syntax 2.5.5.1
//
static const int ERROR_DS_WRONG_LINKED_ATT_SYNTAX 8528L

//
// MessageId: ERROR_DS_SAM_NEED_BOOTKEY_PASSWORD
//
// MessageText:
//
// Security Account Manager needs to get the boot password.
//
static const int ERROR_DS_SAM_NEED_BOOTKEY_PASSWORD 8529L

//
// MessageId: ERROR_DS_SAM_NEED_BOOTKEY_FLOPPY
//
// MessageText:
//
// Security Account Manager needs to get the boot key from floppy disk.
//
static const int ERROR_DS_SAM_NEED_BOOTKEY_FLOPPY 8530L

//
// MessageId: ERROR_DS_CANT_START
//
// MessageText:
//
// Directory Service cannot start.
//
static const int ERROR_DS_CANT_START              8531L

//
// MessageId: ERROR_DS_INIT_FAILURE
//
// MessageText:
//
// Directory Services could not start.
//
static const int ERROR_DS_INIT_FAILURE            8532L

//
// MessageId: ERROR_DS_NO_PKT_PRIVACY_ON_CONNECTION
//
// MessageText:
//
// The connection between client and server requires packet privacy or better.
//
static const int ERROR_DS_NO_PKT_PRIVACY_ON_CONNECTION 8533L

//
// MessageId: ERROR_DS_SOURCE_DOMAIN_IN_FOREST
//
// MessageText:
//
// The source domain may not be in the same forest as destination.
//
static const int ERROR_DS_SOURCE_DOMAIN_IN_FOREST 8534L

//
// MessageId: ERROR_DS_DESTINATION_DOMAIN_NOT_IN_FOREST
//
// MessageText:
//
// The destination domain must be in the forest.
//
static const int ERROR_DS_DESTINATION_DOMAIN_NOT_IN_FOREST 8535L

//
// MessageId: ERROR_DS_DESTINATION_AUDITING_NOT_ENABLED
//
// MessageText:
//
// The operation requires that destination domain auditing be enabled.
//
static const int ERROR_DS_DESTINATION_AUDITING_NOT_ENABLED 8536L

//
// MessageId: ERROR_DS_CANT_FIND_DC_FOR_SRC_DOMAIN
//
// MessageText:
//
// The operation couldn't locate a DC for the source domain.
//
static const int ERROR_DS_CANT_FIND_DC_FOR_SRC_DOMAIN 8537L

//
// MessageId: ERROR_DS_SRC_OBJ_NOT_GROUP_OR_USER
//
// MessageText:
//
// The source object must be a group or user.
//
static const int ERROR_DS_SRC_OBJ_NOT_GROUP_OR_USER 8538L

//
// MessageId: ERROR_DS_SRC_SID_EXISTS_IN_FOREST
//
// MessageText:
//
// The source object's SID already exists in destination forest.
//
static const int ERROR_DS_SRC_SID_EXISTS_IN_FOREST 8539L

//
// MessageId: ERROR_DS_SRC_AND_DST_OBJECT_CLASS_MISMATCH
//
// MessageText:
//
// The source and destination object must be of the same type.
//
static const int ERROR_DS_SRC_AND_DST_OBJECT_CLASS_MISMATCH 8540L

//
// MessageId: ERROR_SAM_INIT_FAILURE
//
// MessageText:
//
// Security Accounts Manager initialization failed because of the following error: %1.
// Error Status: 0x%2. Click OK to shut down the system and reboot into Safe Mode. Check the event log for detailed information.
//
static const int ERROR_SAM_INIT_FAILURE           8541L

//
// MessageId: ERROR_DS_DRA_SCHEMA_INFO_SHIP
//
// MessageText:
//
// Schema information could not be included in the replication request.
//
static const int ERROR_DS_DRA_SCHEMA_INFO_SHIP    8542L

//
// MessageId: ERROR_DS_DRA_SCHEMA_CONFLICT
//
// MessageText:
//
// The replication operation could not be completed due to a schema incompatibility.
//
static const int ERROR_DS_DRA_SCHEMA_CONFLICT     8543L

//
// MessageId: ERROR_DS_DRA_EARLIER_SCHEMA_CONFLICT
//
// MessageText:
//
// The replication operation could not be completed due to a previous schema incompatibility.
//
static const int ERROR_DS_DRA_EARLIER_SCHEMA_CONFLICT 8544L

//
// MessageId: ERROR_DS_DRA_OBJ_NC_MISMATCH
//
// MessageText:
//
// The replication update could not be applied because either the source or the destination has not yet received information regarding a recent cross-domain move operation.
//
static const int ERROR_DS_DRA_OBJ_NC_MISMATCH     8545L

//
// MessageId: ERROR_DS_NC_STILL_HAS_DSAS
//
// MessageText:
//
// The requested domain could not be deleted because there exist domain controllers that still host this domain.
//
static const int ERROR_DS_NC_STILL_HAS_DSAS       8546L

//
// MessageId: ERROR_DS_GC_REQUIRED
//
// MessageText:
//
// The requested operation can be performed only on a global catalog server.
//
static const int ERROR_DS_GC_REQUIRED             8547L

//
// MessageId: ERROR_DS_LOCAL_MEMBER_OF_LOCAL_ONLY
//
// MessageText:
//
// A local group can only be a member of other local groups in the same domain.
//
static const int ERROR_DS_LOCAL_MEMBER_OF_LOCAL_ONLY 8548L

//
// MessageId: ERROR_DS_NO_FPO_IN_UNIVERSAL_GROUPS
//
// MessageText:
//
// Foreign security principals cannot be members of universal groups.
//
static const int ERROR_DS_NO_FPO_IN_UNIVERSAL_GROUPS 8549L

//
// MessageId: ERROR_DS_CANT_ADD_TO_GC
//
// MessageText:
//
// The attribute is not allowed to be replicated to the GC because of security reasons.
//
static const int ERROR_DS_CANT_ADD_TO_GC          8550L

//
// MessageId: ERROR_DS_NO_CHECKPOINT_WITH_PDC
//
// MessageText:
//
// The checkpoint with the PDC could not be taken because there too many modifications being processed currently.
//
static const int ERROR_DS_NO_CHECKPOINT_WITH_PDC  8551L

//
// MessageId: ERROR_DS_SOURCE_AUDITING_NOT_ENABLED
//
// MessageText:
//
// The operation requires that source domain auditing be enabled.
//
static const int ERROR_DS_SOURCE_AUDITING_NOT_ENABLED 8552L

//
// MessageId: ERROR_DS_CANT_CREATE_IN_NONDOMAIN_NC
//
// MessageText:
//
// Security principal objects can only be created inside domain naming contexts.
//
static const int ERROR_DS_CANT_CREATE_IN_NONDOMAIN_NC 8553L

//
// MessageId: ERROR_DS_INVALID_NAME_FOR_SPN
//
// MessageText:
//
// A Service Principal Name (SPN) could not be constructed because the provided hostname is not in the necessary format.
//
static const int ERROR_DS_INVALID_NAME_FOR_SPN    8554L

//
// MessageId: ERROR_DS_FILTER_USES_CONTRUCTED_ATTRS
//
// MessageText:
//
// A Filter was passed that uses constructed attributes.
//
static const int ERROR_DS_FILTER_USES_CONTRUCTED_ATTRS 8555L

//
// MessageId: ERROR_DS_UNICODEPWD_NOT_IN_QUOTES
//
// MessageText:
//
// The unicodePwd attribute value must be enclosed in double quotes.
//
static const int ERROR_DS_UNICODEPWD_NOT_IN_QUOTES 8556L

//
// MessageId: ERROR_DS_MACHINE_ACCOUNT_QUOTA_EXCEEDED
//
// MessageText:
//
// Your computer could not be joined to the domain. You have exceeded the maximum number of computer accounts you are allowed to create in this domain. Contact your system administrator to have this limit reset or increased.
//
static const int ERROR_DS_MACHINE_ACCOUNT_QUOTA_EXCEEDED 8557L

//
// MessageId: ERROR_DS_MUST_BE_RUN_ON_DST_DC
//
// MessageText:
//
// For security reasons, the operation must be run on the destination DC.
//
static const int ERROR_DS_MUST_BE_RUN_ON_DST_DC   8558L

//
// MessageId: ERROR_DS_SRC_DC_MUST_BE_SP4_OR_GREATER
//
// MessageText:
//
// For security reasons, the source DC must be NT4SP4 or greater.
//
static const int ERROR_DS_SRC_DC_MUST_BE_SP4_OR_GREATER 8559L

//
// MessageId: ERROR_DS_CANT_TREE_DELETE_CRITICAL_OBJ
//
// MessageText:
//
// Critical Directory Service System objects cannot be deleted during tree delete operations. The tree delete may have been partially performed.
//
static const int ERROR_DS_CANT_TREE_DELETE_CRITICAL_OBJ 8560L

//
// MessageId: ERROR_DS_INIT_FAILURE_CONSOLE
//
// MessageText:
//
// Directory Services could not start because of the following error: %1.
// Error Status: 0x%2. Please click OK to shutdown the system. You can use the recovery console to diagnose the system further.
//
static const int ERROR_DS_INIT_FAILURE_CONSOLE    8561L

//
// MessageId: ERROR_DS_SAM_INIT_FAILURE_CONSOLE
//
// MessageText:
//
// Security Accounts Manager initialization failed because of the following error: %1.
// Error Status: 0x%2. Please click OK to shutdown the system. You can use the recovery console to diagnose the system further.
//
static const int ERROR_DS_SAM_INIT_FAILURE_CONSOLE 8562L

//
// MessageId: ERROR_DS_FOREST_VERSION_TOO_HIGH
//
// MessageText:
//
// The version of the operating system is incompatible with the current AD DS forest functional level or AD LDS Configuration Set functional level. You must upgrade to a new version of the operating system before this server can become an AD DS Domain Controller or add an AD LDS Instance in this AD DS Forest or AD LDS Configuration Set.
//
static const int ERROR_DS_FOREST_VERSION_TOO_HIGH 8563L

//
// MessageId: ERROR_DS_DOMAIN_VERSION_TOO_HIGH
//
// MessageText:
//
// The version of the operating system installed is incompatible with the current domain functional level. You must upgrade to a new version of the operating system before this server can become a domain controller in this domain.
//
static const int ERROR_DS_DOMAIN_VERSION_TOO_HIGH 8564L

//
// MessageId: ERROR_DS_FOREST_VERSION_TOO_LOW
//
// MessageText:
//
// The version of the operating system installed on this server no longer supports the current AD DS Forest functional level or AD LDS Configuration Set functional level. You must raise the AD DS Forest functional level or AD LDS Configuration Set functional level before this server can become an AD DS Domain Controller or an AD LDS Instance in this Forest or Configuration Set.
//
static const int ERROR_DS_FOREST_VERSION_TOO_LOW  8565L

//
// MessageId: ERROR_DS_DOMAIN_VERSION_TOO_LOW
//
// MessageText:
//
// The version of the operating system installed on this server no longer supports the current domain functional level. You must raise the domain functional level before this server can become a domain controller in this domain.
//
static const int ERROR_DS_DOMAIN_VERSION_TOO_LOW  8566L

//
// MessageId: ERROR_DS_INCOMPATIBLE_VERSION
//
// MessageText:
//
// The version of the operating system installed on this server is incompatible with the functional level of the domain or forest.
//
static const int ERROR_DS_INCOMPATIBLE_VERSION    8567L

//
// MessageId: ERROR_DS_LOW_DSA_VERSION
//
// MessageText:
//
// The functional level of the domain (or forest) cannot be raised to the requested value, because there exist one or more domain controllers in the domain (or forest) that are at a lower incompatible functional level.
//
static const int ERROR_DS_LOW_DSA_VERSION         8568L

//
// MessageId: ERROR_DS_NO_BEHAVIOR_VERSION_IN_MIXEDDOMAIN
//
// MessageText:
//
// The forest functional level cannot be raised to the requested value since one or more domains are still in mixed domain mode. All domains in the forest must be in native mode, for you to raise the forest functional level.
//
static const int ERROR_DS_NO_BEHAVIOR_VERSION_IN_MIXEDDOMAIN 8569L

//
// MessageId: ERROR_DS_NOT_SUPPORTED_SORT_ORDER
//
// MessageText:
//
// The sort order requested is not supported.
//
static const int ERROR_DS_NOT_SUPPORTED_SORT_ORDER 8570L

//
// MessageId: ERROR_DS_NAME_NOT_UNIQUE
//
// MessageText:
//
// The requested name already exists as a unique identifier.
//
static const int ERROR_DS_NAME_NOT_UNIQUE         8571L

//
// MessageId: ERROR_DS_MACHINE_ACCOUNT_CREATED_PRENT4
//
// MessageText:
//
// The machine account was created pre-NT4. The account needs to be recreated.
//
static const int ERROR_DS_MACHINE_ACCOUNT_CREATED_PRENT4 8572L

//
// MessageId: ERROR_DS_OUT_OF_VERSION_STORE
//
// MessageText:
//
// The database is out of version store.
//
static const int ERROR_DS_OUT_OF_VERSION_STORE    8573L

//
// MessageId: ERROR_DS_INCOMPATIBLE_CONTROLS_USED
//
// MessageText:
//
// Unable to continue operation because multiple conflicting controls were used.
//
static const int ERROR_DS_INCOMPATIBLE_CONTROLS_USED 8574L

//
// MessageId: ERROR_DS_NO_REF_DOMAIN
//
// MessageText:
//
// Unable to find a valid security descriptor reference domain for this partition.
//
static const int ERROR_DS_NO_REF_DOMAIN           8575L

//
// MessageId: ERROR_DS_RESERVED_LINK_ID
//
// MessageText:
//
// Schema update failed: The link identifier is reserved.
//
static const int ERROR_DS_RESERVED_LINK_ID        8576L

//
// MessageId: ERROR_DS_LINK_ID_NOT_AVAILABLE
//
// MessageText:
//
// Schema update failed: There are no link identifiers available.
//
static const int ERROR_DS_LINK_ID_NOT_AVAILABLE   8577L

//
// MessageId: ERROR_DS_AG_CANT_HAVE_UNIVERSAL_MEMBER
//
// MessageText:
//
// An account group cannot have a universal group as a member.
//
static const int ERROR_DS_AG_CANT_HAVE_UNIVERSAL_MEMBER 8578L

//
// MessageId: ERROR_DS_MODIFYDN_DISALLOWED_BY_INSTANCE_TYPE
//
// MessageText:
//
// Rename or move operations on naming context heads or read-only objects are not allowed.
//
static const int ERROR_DS_MODIFYDN_DISALLOWED_BY_INSTANCE_TYPE 8579L

//
// MessageId: ERROR_DS_NO_OBJECT_MOVE_IN_SCHEMA_NC
//
// MessageText:
//
// Move operations on objects in the schema naming context are not allowed.
//
static const int ERROR_DS_NO_OBJECT_MOVE_IN_SCHEMA_NC 8580L

//
// MessageId: ERROR_DS_MODIFYDN_DISALLOWED_BY_FLAG
//
// MessageText:
//
// A system flag has been set on the object and does not allow the object to be moved or renamed.
//
static const int ERROR_DS_MODIFYDN_DISALLOWED_BY_FLAG 8581L

//
// MessageId: ERROR_DS_MODIFYDN_WRONG_GRANDPARENT
//
// MessageText:
//
// This object is not allowed to change its grandparent container. Moves are not forbidden on this object, but are restricted to sibling containers.
//
static const int ERROR_DS_MODIFYDN_WRONG_GRANDPARENT 8582L

//
// MessageId: ERROR_DS_NAME_ERROR_TRUST_REFERRAL
//
// MessageText:
//
// Unable to resolve completely, a referral to another forest is generated.
//
static const int ERROR_DS_NAME_ERROR_TRUST_REFERRAL 8583L

//
// MessageId: ERROR_NOT_SUPPORTED_ON_STANDARD_SERVER
//
// MessageText:
//
// The requested action is not supported on standard server.
//
static const int ERROR_NOT_SUPPORTED_ON_STANDARD_SERVER 8584L

//
// MessageId: ERROR_DS_CANT_ACCESS_REMOTE_PART_OF_AD
//
// MessageText:
//
// Could not access a partition of the directory service located on a remote server. Make sure at least one server is running for the partition in question.
//
static const int ERROR_DS_CANT_ACCESS_REMOTE_PART_OF_AD 8585L

//
// MessageId: ERROR_DS_CR_IMPOSSIBLE_TO_VALIDATE_V2
//
// MessageText:
//
// The directory cannot validate the proposed naming context (or partition) name because it does not hold a replica nor can it contact a replica of the naming context above the proposed naming context. Please ensure that the parent naming context is properly registered in DNS, and at least one replica of this naming context is reachable by the Domain Naming master.
//
static const int ERROR_DS_CR_IMPOSSIBLE_TO_VALIDATE_V2 8586L

//
// MessageId: ERROR_DS_THREAD_LIMIT_EXCEEDED
//
// MessageText:
//
// The thread limit for this request was exceeded.
//
static const int ERROR_DS_THREAD_LIMIT_EXCEEDED   8587L

//
// MessageId: ERROR_DS_NOT_CLOSEST
//
// MessageText:
//
// The Global catalog server is not in the closest site.
//
static const int ERROR_DS_NOT_CLOSEST             8588L

//
// MessageId: ERROR_DS_CANT_DERIVE_SPN_WITHOUT_SERVER_REF
//
// MessageText:
//
// The DS cannot derive a service principal name (SPN) with which to mutually authenticate the target server because the corresponding server object in the local DS database has no serverReference attribute.
//
static const int ERROR_DS_CANT_DERIVE_SPN_WITHOUT_SERVER_REF 8589L

//
// MessageId: ERROR_DS_SINGLE_USER_MODE_FAILED
//
// MessageText:
//
// The Directory Service failed to enter single user mode.
//
static const int ERROR_DS_SINGLE_USER_MODE_FAILED 8590L

//
// MessageId: ERROR_DS_NTDSCRIPT_SYNTAX_ERROR
//
// MessageText:
//
// The Directory Service cannot parse the script because of a syntax error.
//
static const int ERROR_DS_NTDSCRIPT_SYNTAX_ERROR  8591L

//
// MessageId: ERROR_DS_NTDSCRIPT_PROCESS_ERROR
//
// MessageText:
//
// The Directory Service cannot process the script because of an error.
//
static const int ERROR_DS_NTDSCRIPT_PROCESS_ERROR 8592L

//
// MessageId: ERROR_DS_DIFFERENT_REPL_EPOCHS
//
// MessageText:
//
// The directory service cannot perform the requested operation because the servers involved are of different replication epochs (which is usually related to a domain rename that is in progress).
//
static const int ERROR_DS_DIFFERENT_REPL_EPOCHS   8593L

//
// MessageId: ERROR_DS_DRS_EXTENSIONS_CHANGED
//
// MessageText:
//
// The directory service binding must be renegotiated due to a change in the server extensions information.
//
static const int ERROR_DS_DRS_EXTENSIONS_CHANGED  8594L

//
// MessageId: ERROR_DS_REPLICA_SET_CHANGE_NOT_ALLOWED_ON_DISABLED_CR
//
// MessageText:
//
// Operation not allowed on a disabled cross ref.
//
static const int ERROR_DS_REPLICA_SET_CHANGE_NOT_ALLOWED_ON_DISABLED_CR 8595L

//
// MessageId: ERROR_DS_NO_MSDS_INTID
//
// MessageText:
//
// Schema update failed: No values for msDS-IntId are available.
//
static const int ERROR_DS_NO_MSDS_INTID           8596L

//
// MessageId: ERROR_DS_DUP_MSDS_INTID
//
// MessageText:
//
// Schema update failed: Duplicate msDS-INtId. Retry the operation.
//
static const int ERROR_DS_DUP_MSDS_INTID          8597L

//
// MessageId: ERROR_DS_EXISTS_IN_RDNATTID
//
// MessageText:
//
// Schema deletion failed: attribute is used in rDNAttID.
//
static const int ERROR_DS_EXISTS_IN_RDNATTID      8598L

//
// MessageId: ERROR_DS_AUTHORIZATION_FAILED
//
// MessageText:
//
// The directory service failed to authorize the request.
//
static const int ERROR_DS_AUTHORIZATION_FAILED    8599L

//
// MessageId: ERROR_DS_INVALID_SCRIPT
//
// MessageText:
//
// The Directory Service cannot process the script because it is invalid.
//
static const int ERROR_DS_INVALID_SCRIPT          8600L

//
// MessageId: ERROR_DS_REMOTE_CROSSREF_OP_FAILED
//
// MessageText:
//
// The remote create cross reference operation failed on the Domain Naming Master FSMO. The operation's error is in the extended data.
//
static const int ERROR_DS_REMOTE_CROSSREF_OP_FAILED 8601L

//
// MessageId: ERROR_DS_CROSS_REF_BUSY
//
// MessageText:
//
// A cross reference is in use locally with the same name.
//
static const int ERROR_DS_CROSS_REF_BUSY          8602L

//
// MessageId: ERROR_DS_CANT_DERIVE_SPN_FOR_DELETED_DOMAIN
//
// MessageText:
//
// The DS cannot derive a service principal name (SPN) with which to mutually authenticate the target server because the server's domain has been deleted from the forest.
//
static const int ERROR_DS_CANT_DERIVE_SPN_FOR_DELETED_DOMAIN 8603L

//
// MessageId: ERROR_DS_CANT_DEMOTE_WITH_WRITEABLE_NC
//
// MessageText:
//
// Writeable NCs prevent this DC from demoting.
//
static const int ERROR_DS_CANT_DEMOTE_WITH_WRITEABLE_NC 8604L

//
// MessageId: ERROR_DS_DUPLICATE_ID_FOUND
//
// MessageText:
//
// The requested object has a non-unique identifier and cannot be retrieved.
//
static const int ERROR_DS_DUPLICATE_ID_FOUND      8605L

//
// MessageId: ERROR_DS_INSUFFICIENT_ATTR_TO_CREATE_OBJECT
//
// MessageText:
//
// Insufficient attributes were given to create an object. This object may not exist because it may have been deleted and already garbage collected.
//
static const int ERROR_DS_INSUFFICIENT_ATTR_TO_CREATE_OBJECT 8606L

//
// MessageId: ERROR_DS_GROUP_CONVERSION_ERROR
//
// MessageText:
//
// The group cannot be converted due to attribute restrictions on the requested group type.
//
static const int ERROR_DS_GROUP_CONVERSION_ERROR  8607L

//
// MessageId: ERROR_DS_CANT_MOVE_APP_BASIC_GROUP
//
// MessageText:
//
// Cross-domain move of non-empty basic application groups is not allowed.
//
static const int ERROR_DS_CANT_MOVE_APP_BASIC_GROUP 8608L

//
// MessageId: ERROR_DS_CANT_MOVE_APP_QUERY_GROUP
//
// MessageText:
//
// Cross-domain move of non-empty query based application groups is not allowed.
//
static const int ERROR_DS_CANT_MOVE_APP_QUERY_GROUP 8609L

//
// MessageId: ERROR_DS_ROLE_NOT_VERIFIED
//
// MessageText:
//
// The FSMO role ownership could not be verified because its directory partition has not replicated successfully with at least one replication partner.
//
static const int ERROR_DS_ROLE_NOT_VERIFIED       8610L

//
// MessageId: ERROR_DS_WKO_CONTAINER_CANNOT_BE_SPECIAL
//
// MessageText:
//
// The target container for a redirection of a well known object container cannot already be a special container.
//
static const int ERROR_DS_WKO_CONTAINER_CANNOT_BE_SPECIAL 8611L

//
// MessageId: ERROR_DS_DOMAIN_RENAME_IN_PROGRESS
//
// MessageText:
//
// The Directory Service cannot perform the requested operation because a domain rename operation is in progress.
//
static const int ERROR_DS_DOMAIN_RENAME_IN_PROGRESS 8612L

//
// MessageId: ERROR_DS_EXISTING_AD_CHILD_NC
//
// MessageText:
//
// The directory service detected a child partition below the requested partition name. The partition hierarchy must be created in a top down method.
//
static const int ERROR_DS_EXISTING_AD_CHILD_NC    8613L

//
// MessageId: ERROR_DS_REPL_LIFETIME_EXCEEDED
//
// MessageText:
//
// The directory service cannot replicate with this server because the time since the last replication with this server has exceeded the tombstone lifetime.
//
static const int ERROR_DS_REPL_LIFETIME_EXCEEDED  8614L

//
// MessageId: ERROR_DS_DISALLOWED_IN_SYSTEM_CONTAINER
//
// MessageText:
//
// The requested operation is not allowed on an object under the system container.
//
static const int ERROR_DS_DISALLOWED_IN_SYSTEM_CONTAINER 8615L

//
// MessageId: ERROR_DS_LDAP_SEND_QUEUE_FULL
//
// MessageText:
//
// The LDAP servers network send queue has filled up because the client is not processing the results of its requests fast enough. No more requests will be processed until the client catches up. If the client does not catch up then it will be disconnected.
//
static const int ERROR_DS_LDAP_SEND_QUEUE_FULL    8616L

//
// MessageId: ERROR_DS_DRA_OUT_SCHEDULE_WINDOW
//
// MessageText:
//
// The scheduled replication did not take place because the system was too busy to execute the request within the schedule window. The replication queue is overloaded. Consider reducing the number of partners or decreasing the scheduled replication frequency.
//
static const int ERROR_DS_DRA_OUT_SCHEDULE_WINDOW 8617L

//
// MessageId: ERROR_DS_POLICY_NOT_KNOWN
//
// MessageText:
//
// At this time, it cannot be determined if the branch replication policy is available on the hub domain controller. Please retry at a later time to account for replication latencies.
//
static const int ERROR_DS_POLICY_NOT_KNOWN        8618L

//
// MessageId: ERROR_NO_SITE_SETTINGS_OBJECT
//
// MessageText:
//
// The site settings object for the specified site does not exist.
//
static const int ERROR_NO_SITE_SETTINGS_OBJECT    8619L

//
// MessageId: ERROR_NO_SECRETS
//
// MessageText:
//
// The local account store does not contain secret material for the specified account.
//
static const int ERROR_NO_SECRETS                 8620L

//
// MessageId: ERROR_NO_WRITABLE_DC_FOUND
//
// MessageText:
//
// Could not find a writable domain controller in the domain.
//
static const int ERROR_NO_WRITABLE_DC_FOUND       8621L

//
// MessageId: ERROR_DS_NO_SERVER_OBJECT
//
// MessageText:
//
// The server object for the domain controller does not exist.
//
static const int ERROR_DS_NO_SERVER_OBJECT        8622L

//
// MessageId: ERROR_DS_NO_NTDSA_OBJECT
//
// MessageText:
//
// The NTDS Settings object for the domain controller does not exist.
//
static const int ERROR_DS_NO_NTDSA_OBJECT         8623L

//
// MessageId: ERROR_DS_NON_ASQ_SEARCH
//
// MessageText:
//
// The requested search operation is not supported for ASQ searches.
//
static const int ERROR_DS_NON_ASQ_SEARCH          8624L

//
// MessageId: ERROR_DS_AUDIT_FAILURE
//
// MessageText:
//
// A required audit event could not be generated for the operation.
//
static const int ERROR_DS_AUDIT_FAILURE           8625L

//
// MessageId: ERROR_DS_INVALID_SEARCH_FLAG_SUBTREE
//
// MessageText:
//
// The search flags for the attribute are invalid. The subtree index bit is valid only on single valued attributes.
//
static const int ERROR_DS_INVALID_SEARCH_FLAG_SUBTREE 8626L

//
// MessageId: ERROR_DS_INVALID_SEARCH_FLAG_TUPLE
//
// MessageText:
//
// The search flags for the attribute are invalid. The tuple index bit is valid only on attributes of Unicode strings.
//
static const int ERROR_DS_INVALID_SEARCH_FLAG_TUPLE 8627L

//
// MessageId: ERROR_DS_HIERARCHY_TABLE_TOO_DEEP
//
// MessageText:
//
// The address books are nested too deeply. Failed to build the hierarchy table.
//
static const int ERROR_DS_HIERARCHY_TABLE_TOO_DEEP 8628L

//
// MessageId: ERROR_DS_DRA_CORRUPT_UTD_VECTOR
//
// MessageText:
//
// The specified up-to-date-ness vector is corrupt.
//
static const int ERROR_DS_DRA_CORRUPT_UTD_VECTOR  8629L

//
// MessageId: ERROR_DS_DRA_SECRETS_DENIED
//
// MessageText:
//
// The request to replicate secrets is denied.
//
static const int ERROR_DS_DRA_SECRETS_DENIED      8630L

//
// MessageId: ERROR_DS_RESERVED_MAPI_ID
//
// MessageText:
//
// Schema update failed: The MAPI identifier is reserved.
//
static const int ERROR_DS_RESERVED_MAPI_ID        8631L

//
// MessageId: ERROR_DS_MAPI_ID_NOT_AVAILABLE
//
// MessageText:
//
// Schema update failed: There are no MAPI identifiers available.
//
static const int ERROR_DS_MAPI_ID_NOT_AVAILABLE   8632L

//
// MessageId: ERROR_DS_DRA_MISSING_KRBTGT_SECRET
//
// MessageText:
//
// The replication operation failed because the required attributes of the local krbtgt object are missing.
//
static const int ERROR_DS_DRA_MISSING_KRBTGT_SECRET 8633L

//
// MessageId: ERROR_DS_DOMAIN_NAME_EXISTS_IN_FOREST
//
// MessageText:
//
// The domain name of the trusted domain already exists in the forest.
//
static const int ERROR_DS_DOMAIN_NAME_EXISTS_IN_FOREST 8634L

//
// MessageId: ERROR_DS_FLAT_NAME_EXISTS_IN_FOREST
//
// MessageText:
//
// The flat name of the trusted domain already exists in the forest.
//
static const int ERROR_DS_FLAT_NAME_EXISTS_IN_FOREST 8635L

//
// MessageId: ERROR_INVALID_USER_PRINCIPAL_NAME
//
// MessageText:
//
// The User Principal Name (UPN) is invalid.
//
static const int ERROR_INVALID_USER_PRINCIPAL_NAME 8636L

//
// MessageId: ERROR_DS_OID_MAPPED_GROUP_CANT_HAVE_MEMBERS
//
// MessageText:
//
// OID mapped groups cannot have members.
//
static const int ERROR_DS_OID_MAPPED_GROUP_CANT_HAVE_MEMBERS 8637L

//
// MessageId: ERROR_DS_OID_NOT_FOUND
//
// MessageText:
//
// The specified OID cannot be found.
//
static const int ERROR_DS_OID_NOT_FOUND           8638L

//
// MessageId: ERROR_DS_DRA_RECYCLED_TARGET
//
// MessageText:
//
// The replication operation failed because the target object referred by a link value is recycled.
//
static const int ERROR_DS_DRA_RECYCLED_TARGET     8639L

//
// MessageId: ERROR_DS_DISALLOWED_NC_REDIRECT
//
// MessageText:
//
// The redirect operation failed because the target object is in a NC different from the domain NC of the current domain controller.
//
static const int ERROR_DS_DISALLOWED_NC_REDIRECT  8640L

//
// MessageId: ERROR_DS_HIGH_ADLDS_FFL
//
// MessageText:
//
// The functional level of the AD LDS configuration set cannot be lowered to the requested value.
//
static const int ERROR_DS_HIGH_ADLDS_FFL          8641L

//
// MessageId: ERROR_DS_HIGH_DSA_VERSION
//
// MessageText:
//
// The functional level of the domain (or forest) cannot be lowered to the requested value.
//
static const int ERROR_DS_HIGH_DSA_VERSION        8642L

//
// MessageId: ERROR_DS_LOW_ADLDS_FFL
//
// MessageText:
//
// The functional level of the AD LDS configuration set cannot be raised to the requested value, because there exist one or more ADLDS instances that are at a lower incompatible functional level.
//
static const int ERROR_DS_LOW_ADLDS_FFL           8643L

//
// MessageId: ERROR_DOMAIN_SID_SAME_AS_LOCAL_WORKSTATION
//
// MessageText:
//
// The domain join cannot be completed because the SID of the domain you attempted to join was identical to the SID of this machine. This is a symptom of an improperly cloned operating system install.  You should run sysprep on this machine in order to generate a new machine SID. Please see http://go.microsoft.com/fwlink/?LinkId=168895 for more information.
//
static const int ERROR_DOMAIN_SID_SAME_AS_LOCAL_WORKSTATION 8644L

//
// MessageId: ERROR_DS_UNDELETE_SAM_VALIDATION_FAILED
//
// MessageText:
//
// The undelete operation failed because the Sam Account Name or Additional Sam Account Name of the object being undeleted conflicts with an existing live object.
//
static const int ERROR_DS_UNDELETE_SAM_VALIDATION_FAILED 8645L

//
// MessageId: ERROR_INCORRECT_ACCOUNT_TYPE
//
// MessageText:
//
// The system is not authoritative for the specified account and therefore cannot complete the operation. Please retry the operation using the provider associated with this account. If this is an online provider please use the provider's online site.
//
static const int ERROR_INCORRECT_ACCOUNT_TYPE     8646L

//
// MessageId: ERROR_DS_SPN_VALUE_NOT_UNIQUE_IN_FOREST
//
// MessageText:
//
// The operation failed because SPN value provided for addition/modification is not unique forest-wide.
//
static const int ERROR_DS_SPN_VALUE_NOT_UNIQUE_IN_FOREST 8647L

//
// MessageId: ERROR_DS_UPN_VALUE_NOT_UNIQUE_IN_FOREST
//
// MessageText:
//
// The operation failed because UPN value provided for addition/modification is not unique forest-wide.
//
static const int ERROR_DS_UPN_VALUE_NOT_UNIQUE_IN_FOREST 8648L

//
// MessageId: ERROR_DS_MISSING_FOREST_TRUST
//
// MessageText:
//
// The operation failed because the addition/modification referenced an inbound forest-wide trust that is not present.
//
static const int ERROR_DS_MISSING_FOREST_TRUST    8649L

//
// MessageId: ERROR_DS_VALUE_KEY_NOT_UNIQUE
//
// MessageText:
//
// The link value specified was not found, but a link value with that key was found.
//
static const int ERROR_DS_VALUE_KEY_NOT_UNIQUE    8650L


///////////////////////////////////////////////////
//                                                /
//        End of Active Directory Error Codes     /
//                                                /
//                  8000 to  8999                 /
///////////////////////////////////////////////////


///////////////////////////////////////////////////
//                                               //
//               DNS Error codes                 //
//                                               //
//                 9000 to 9999                  //
///////////////////////////////////////////////////

// =============================
// Facility DNS Error Messages
// =============================

//
//  DNS response codes.
//

static const int DNS_ERROR_RESPONSE_CODES_BASE 9000

static const int DNS_ERROR_RCODE_NO_ERROR NO_ERROR

static const int DNS_ERROR_MASK 0x00002328 // 9000 or DNS_ERROR_RESPONSE_CODES_BASE

// DNS_ERROR_RCODE_FORMAT_ERROR          0x00002329
//
// MessageId: DNS_ERROR_RCODE_FORMAT_ERROR
//
// MessageText:
//
// DNS server unable to interpret format.
//
static const int DNS_ERROR_RCODE_FORMAT_ERROR     9001L

// DNS_ERROR_RCODE_SERVER_FAILURE        0x0000232a
//
// MessageId: DNS_ERROR_RCODE_SERVER_FAILURE
//
// MessageText:
//
// DNS server failure.
//
static const int DNS_ERROR_RCODE_SERVER_FAILURE   9002L

// DNS_ERROR_RCODE_NAME_ERROR            0x0000232b
//
// MessageId: DNS_ERROR_RCODE_NAME_ERROR
//
// MessageText:
//
// DNS name does not exist.
//
static const int DNS_ERROR_RCODE_NAME_ERROR       9003L

// DNS_ERROR_RCODE_NOT_IMPLEMENTED       0x0000232c
//
// MessageId: DNS_ERROR_RCODE_NOT_IMPLEMENTED
//
// MessageText:
//
// DNS request not supported by name server.
//
static const int DNS_ERROR_RCODE_NOT_IMPLEMENTED  9004L

// DNS_ERROR_RCODE_REFUSED               0x0000232d
//
// MessageId: DNS_ERROR_RCODE_REFUSED
//
// MessageText:
//
// DNS operation refused.
//
static const int DNS_ERROR_RCODE_REFUSED          9005L

// DNS_ERROR_RCODE_YXDOMAIN              0x0000232e
//
// MessageId: DNS_ERROR_RCODE_YXDOMAIN
//
// MessageText:
//
// DNS name that ought not exist, does exist.
//
static const int DNS_ERROR_RCODE_YXDOMAIN         9006L

// DNS_ERROR_RCODE_YXRRSET               0x0000232f
//
// MessageId: DNS_ERROR_RCODE_YXRRSET
//
// MessageText:
//
// DNS RR set that ought not exist, does exist.
//
static const int DNS_ERROR_RCODE_YXRRSET          9007L

// DNS_ERROR_RCODE_NXRRSET               0x00002330
//
// MessageId: DNS_ERROR_RCODE_NXRRSET
//
// MessageText:
//
// DNS RR set that ought to exist, does not exist.
//
static const int DNS_ERROR_RCODE_NXRRSET          9008L

// DNS_ERROR_RCODE_NOTAUTH               0x00002331
//
// MessageId: DNS_ERROR_RCODE_NOTAUTH
//
// MessageText:
//
// DNS server not authoritative for zone.
//
static const int DNS_ERROR_RCODE_NOTAUTH          9009L

// DNS_ERROR_RCODE_NOTZONE               0x00002332
//
// MessageId: DNS_ERROR_RCODE_NOTZONE
//
// MessageText:
//
// DNS name in update or prereq is not in zone.
//
static const int DNS_ERROR_RCODE_NOTZONE          9010L

// DNS_ERROR_RCODE_BADSIG                0x00002338
//
// MessageId: DNS_ERROR_RCODE_BADSIG
//
// MessageText:
//
// DNS signature failed to verify.
//
static const int DNS_ERROR_RCODE_BADSIG           9016L

// DNS_ERROR_RCODE_BADKEY                0x00002339
//
// MessageId: DNS_ERROR_RCODE_BADKEY
//
// MessageText:
//
// DNS bad key.
//
static const int DNS_ERROR_RCODE_BADKEY           9017L

// DNS_ERROR_RCODE_BADTIME               0x0000233a
//
// MessageId: DNS_ERROR_RCODE_BADTIME
//
// MessageText:
//
// DNS signature validity expired.
//
static const int DNS_ERROR_RCODE_BADTIME          9018L

static const int DNS_ERROR_RCODE_LAST DNS_ERROR_RCODE_BADTIME


//
// DNSSEC errors
//

static const int DNS_ERROR_DNSSEC_BASE 9100

//
// MessageId: DNS_ERROR_KEYMASTER_REQUIRED
//
// MessageText:
//
// Only the DNS server acting as the key master for the zone may perform this operation.
//
static const int DNS_ERROR_KEYMASTER_REQUIRED     9101L

//
// MessageId: DNS_ERROR_NOT_ALLOWED_ON_SIGNED_ZONE
//
// MessageText:
//
// This operation is not allowed on a zone that is signed or has signing keys.
//
static const int DNS_ERROR_NOT_ALLOWED_ON_SIGNED_ZONE 9102L

//
// MessageId: DNS_ERROR_NSEC3_INCOMPATIBLE_WITH_RSA_SHA1
//
// MessageText:
//
// NSEC3 is not compatible with the RSA-SHA-1 algorithm. Choose a different algorithm or use NSEC.
//
static const int DNS_ERROR_NSEC3_INCOMPATIBLE_WITH_RSA_SHA1 9103L

//
// MessageId: DNS_ERROR_NOT_ENOUGH_SIGNING_KEY_DESCRIPTORS
//
// MessageText:
//
// The zone does not have enough signing keys. There must be at least one key signing key (KSK) and at least one zone signing key (ZSK).
//
static const int DNS_ERROR_NOT_ENOUGH_SIGNING_KEY_DESCRIPTORS 9104L

//
// MessageId: DNS_ERROR_UNSUPPORTED_ALGORITHM
//
// MessageText:
//
// The specified algorithm is not supported.
//
static const int DNS_ERROR_UNSUPPORTED_ALGORITHM  9105L

//
// MessageId: DNS_ERROR_INVALID_KEY_SIZE
//
// MessageText:
//
// The specified key size is not supported.
//
static const int DNS_ERROR_INVALID_KEY_SIZE       9106L

//
// MessageId: DNS_ERROR_SIGNING_KEY_NOT_ACCESSIBLE
//
// MessageText:
//
// One or more of the signing keys for a zone are not accessible to the DNS server. Zone signing will not be operational until this error is resolved.
//
static const int DNS_ERROR_SIGNING_KEY_NOT_ACCESSIBLE 9107L

//
// MessageId: DNS_ERROR_KSP_DOES_NOT_SUPPORT_PROTECTION
//
// MessageText:
//
// The specified key storage provider does not support DPAPI++ data protection. Zone signing will not be operational until this error is resolved.
//
static const int DNS_ERROR_KSP_DOES_NOT_SUPPORT_PROTECTION 9108L

//
// MessageId: DNS_ERROR_UNEXPECTED_DATA_PROTECTION_ERROR
//
// MessageText:
//
// An unexpected DPAPI++ error was encountered. Zone signing will not be operational until this error is resolved.
//
static const int DNS_ERROR_UNEXPECTED_DATA_PROTECTION_ERROR 9109L

//
// MessageId: DNS_ERROR_UNEXPECTED_CNG_ERROR
//
// MessageText:
//
// An unexpected crypto error was encountered. Zone signing may not be operational until this error is resolved.
//
static const int DNS_ERROR_UNEXPECTED_CNG_ERROR   9110L

//
// MessageId: DNS_ERROR_UNKNOWN_SIGNING_PARAMETER_VERSION
//
// MessageText:
//
// The DNS server encountered a signing key with an unknown version. Zone signing will not be operational until this error is resolved.
//
static const int DNS_ERROR_UNKNOWN_SIGNING_PARAMETER_VERSION 9111L

//
// MessageId: DNS_ERROR_KSP_NOT_ACCESSIBLE
//
// MessageText:
//
// The specified key service provider cannot be opened by the DNS server.
//
static const int DNS_ERROR_KSP_NOT_ACCESSIBLE     9112L

//
// MessageId: DNS_ERROR_TOO_MANY_SKDS
//
// MessageText:
//
// The DNS server cannot accept any more signing keys with the specified algorithm and KSK flag value for this zone.
//
static const int DNS_ERROR_TOO_MANY_SKDS          9113L

//
// MessageId: DNS_ERROR_INVALID_ROLLOVER_PERIOD
//
// MessageText:
//
// The specified rollover period is invalid.
//
static const int DNS_ERROR_INVALID_ROLLOVER_PERIOD 9114L

//
// MessageId: DNS_ERROR_INVALID_INITIAL_ROLLOVER_OFFSET
//
// MessageText:
//
// The specified initial rollover offset is invalid.
//
static const int DNS_ERROR_INVALID_INITIAL_ROLLOVER_OFFSET 9115L

//
// MessageId: DNS_ERROR_ROLLOVER_IN_PROGRESS
//
// MessageText:
//
// The specified signing key is already in process of rolling over keys.
//
static const int DNS_ERROR_ROLLOVER_IN_PROGRESS   9116L

//
// MessageId: DNS_ERROR_STANDBY_KEY_NOT_PRESENT
//
// MessageText:
//
// The specified signing key does not have a standby key to revoke.
//
static const int DNS_ERROR_STANDBY_KEY_NOT_PRESENT 9117L

//
// MessageId: DNS_ERROR_NOT_ALLOWED_ON_ZSK
//
// MessageText:
//
// This operation is not allowed on a zone signing key (ZSK).
//
static const int DNS_ERROR_NOT_ALLOWED_ON_ZSK     9118L

//
// MessageId: DNS_ERROR_NOT_ALLOWED_ON_ACTIVE_SKD
//
// MessageText:
//
// This operation is not allowed on an active signing key.
//
static const int DNS_ERROR_NOT_ALLOWED_ON_ACTIVE_SKD 9119L

//
// MessageId: DNS_ERROR_ROLLOVER_ALREADY_QUEUED
//
// MessageText:
//
// The specified signing key is already queued for rollover.
//
static const int DNS_ERROR_ROLLOVER_ALREADY_QUEUED 9120L

//
// MessageId: DNS_ERROR_NOT_ALLOWED_ON_UNSIGNED_ZONE
//
// MessageText:
//
// This operation is not allowed on an unsigned zone.
//
static const int DNS_ERROR_NOT_ALLOWED_ON_UNSIGNED_ZONE 9121L

//
// MessageId: DNS_ERROR_BAD_KEYMASTER
//
// MessageText:
//
// This operation could not be completed because the DNS server listed as the current key master for this zone is down or misconfigured. Resolve the problem on the current key master for this zone or use another DNS server to seize the key master role.
//
static const int DNS_ERROR_BAD_KEYMASTER          9122L

//
// MessageId: DNS_ERROR_INVALID_SIGNATURE_VALIDITY_PERIOD
//
// MessageText:
//
// The specified signature validity period is invalid.
//
static const int DNS_ERROR_INVALID_SIGNATURE_VALIDITY_PERIOD 9123L

//
// MessageId: DNS_ERROR_INVALID_NSEC3_ITERATION_COUNT
//
// MessageText:
//
// The specified NSEC3 iteration count is higher than allowed by the minimum key length used in the zone.
//
static const int DNS_ERROR_INVALID_NSEC3_ITERATION_COUNT 9124L

//
// MessageId: DNS_ERROR_DNSSEC_IS_DISABLED
//
// MessageText:
//
// This operation could not be completed because the DNS server has been configured with DNSSEC features disabled. Enable DNSSEC on the DNS server.
//
static const int DNS_ERROR_DNSSEC_IS_DISABLED     9125L

//
// MessageId: DNS_ERROR_INVALID_XML
//
// MessageText:
//
// This operation could not be completed because the XML stream received is empty or syntactically invalid.
//
static const int DNS_ERROR_INVALID_XML            9126L

//
// MessageId: DNS_ERROR_NO_VALID_TRUST_ANCHORS
//
// MessageText:
//
// This operation completed, but no trust anchors were added because all of the trust anchors received were either invalid, unsupported, expired, or would not become valid in less than 30 days.
//
static const int DNS_ERROR_NO_VALID_TRUST_ANCHORS 9127L

//
// MessageId: DNS_ERROR_ROLLOVER_NOT_POKEABLE
//
// MessageText:
//
// The specified signing key is not waiting for parental DS update.
//
static const int DNS_ERROR_ROLLOVER_NOT_POKEABLE  9128L

//
// MessageId: DNS_ERROR_NSEC3_NAME_COLLISION
//
// MessageText:
//
// Hash collision detected during NSEC3 signing. Specify a different user-provided salt, or use a randomly generated salt, and attempt to sign the zone again.
//
static const int DNS_ERROR_NSEC3_NAME_COLLISION   9129L

//
// MessageId: DNS_ERROR_NSEC_INCOMPATIBLE_WITH_NSEC3_RSA_SHA1
//
// MessageText:
//
// NSEC is not compatible with the NSEC3-RSA-SHA-1 algorithm. Choose a different algorithm or use NSEC3.
//
static const int DNS_ERROR_NSEC_INCOMPATIBLE_WITH_NSEC3_RSA_SHA1 9130L


//
// Packet format
//

static const int DNS_ERROR_PACKET_FMT_BASE 9500

// DNS_INFO_NO_RECORDS                   0x0000251d
//
// MessageId: DNS_INFO_NO_RECORDS
//
// MessageText:
//
// No records found for given DNS query.
//
static const int DNS_INFO_NO_RECORDS              9501L

// DNS_ERROR_BAD_PACKET                  0x0000251e
//
// MessageId: DNS_ERROR_BAD_PACKET
//
// MessageText:
//
// Bad DNS packet.
//
static const int DNS_ERROR_BAD_PACKET             9502L

// DNS_ERROR_NO_PACKET                   0x0000251f
//
// MessageId: DNS_ERROR_NO_PACKET
//
// MessageText:
//
// No DNS packet.
//
static const int DNS_ERROR_NO_PACKET              9503L

// DNS_ERROR_RCODE                       0x00002520
//
// MessageId: DNS_ERROR_RCODE
//
// MessageText:
//
// DNS error, check rcode.
//
static const int DNS_ERROR_RCODE                  9504L

// DNS_ERROR_UNSECURE_PACKET             0x00002521
//
// MessageId: DNS_ERROR_UNSECURE_PACKET
//
// MessageText:
//
// Unsecured DNS packet.
//
static const int DNS_ERROR_UNSECURE_PACKET        9505L

static const int DNS_STATUS_PACKET_UNSECURE DNS_ERROR_UNSECURE_PACKET

// DNS_REQUEST_PENDING                     0x00002522
//
// MessageId: DNS_REQUEST_PENDING
//
// MessageText:
//
// DNS query request is pending.
//
static const int DNS_REQUEST_PENDING              9506L


//
// General API errors
//

static const int DNS_ERROR_NO_MEMORY            ERROR_OUTOFMEMORY
static const int DNS_ERROR_INVALID_NAME         ERROR_INVALID_NAME
static const int DNS_ERROR_INVALID_DATA         ERROR_INVALID_DATA

static const int DNS_ERROR_GENERAL_API_BASE 9550

// DNS_ERROR_INVALID_TYPE                0x0000254f
//
// MessageId: DNS_ERROR_INVALID_TYPE
//
// MessageText:
//
// Invalid DNS type.
//
static const int DNS_ERROR_INVALID_TYPE           9551L

// DNS_ERROR_INVALID_IP_ADDRESS          0x00002550
//
// MessageId: DNS_ERROR_INVALID_IP_ADDRESS
//
// MessageText:
//
// Invalid IP address.
//
static const int DNS_ERROR_INVALID_IP_ADDRESS     9552L

// DNS_ERROR_INVALID_PROPERTY            0x00002551
//
// MessageId: DNS_ERROR_INVALID_PROPERTY
//
// MessageText:
//
// Invalid property.
//
static const int DNS_ERROR_INVALID_PROPERTY       9553L

// DNS_ERROR_TRY_AGAIN_LATER             0x00002552
//
// MessageId: DNS_ERROR_TRY_AGAIN_LATER
//
// MessageText:
//
// Try DNS operation again later.
//
static const int DNS_ERROR_TRY_AGAIN_LATER        9554L

// DNS_ERROR_NOT_UNIQUE                  0x00002553
//
// MessageId: DNS_ERROR_NOT_UNIQUE
//
// MessageText:
//
// Record for given name and type is not unique.
//
static const int DNS_ERROR_NOT_UNIQUE             9555L

// DNS_ERROR_NON_RFC_NAME                0x00002554
//
// MessageId: DNS_ERROR_NON_RFC_NAME
//
// MessageText:
//
// DNS name does not comply with RFC specifications.
//
static const int DNS_ERROR_NON_RFC_NAME           9556L

// DNS_STATUS_FQDN                       0x00002555
//
// MessageId: DNS_STATUS_FQDN
//
// MessageText:
//
// DNS name is a fully-qualified DNS name.
//
static const int DNS_STATUS_FQDN                  9557L

// DNS_STATUS_DOTTED_NAME                0x00002556
//
// MessageId: DNS_STATUS_DOTTED_NAME
//
// MessageText:
//
// DNS name is dotted (multi-label).
//
static const int DNS_STATUS_DOTTED_NAME           9558L

// DNS_STATUS_SINGLE_PART_NAME           0x00002557
//
// MessageId: DNS_STATUS_SINGLE_PART_NAME
//
// MessageText:
//
// DNS name is a single-part name.
//
static const int DNS_STATUS_SINGLE_PART_NAME      9559L

// DNS_ERROR_INVALID_NAME_CHAR           0x00002558
//
// MessageId: DNS_ERROR_INVALID_NAME_CHAR
//
// MessageText:
//
// DNS name contains an invalid character.
//
static const int DNS_ERROR_INVALID_NAME_CHAR      9560L

// DNS_ERROR_NUMERIC_NAME                0x00002559
//
// MessageId: DNS_ERROR_NUMERIC_NAME
//
// MessageText:
//
// DNS name is entirely numeric.
//
static const int DNS_ERROR_NUMERIC_NAME           9561L

// DNS_ERROR_NOT_ALLOWED_ON_ROOT_SERVER  0x0000255A
//
// MessageId: DNS_ERROR_NOT_ALLOWED_ON_ROOT_SERVER
//
// MessageText:
//
// The operation requested is not permitted on a DNS root server.
//
static const int DNS_ERROR_NOT_ALLOWED_ON_ROOT_SERVER 9562L

// DNS_ERROR_NOT_ALLOWED_UNDER_DELEGATION  0x0000255B
//
// MessageId: DNS_ERROR_NOT_ALLOWED_UNDER_DELEGATION
//
// MessageText:
//
// The record could not be created because this part of the DNS namespace has been delegated to another server.
//
static const int DNS_ERROR_NOT_ALLOWED_UNDER_DELEGATION 9563L

// DNS_ERROR_CANNOT_FIND_ROOT_HINTS  0x0000255C
//
// MessageId: DNS_ERROR_CANNOT_FIND_ROOT_HINTS
//
// MessageText:
//
// The DNS server could not find a set of root hints.
//
static const int DNS_ERROR_CANNOT_FIND_ROOT_HINTS 9564L

// DNS_ERROR_INCONSISTENT_ROOT_HINTS  0x0000255D
//
// MessageId: DNS_ERROR_INCONSISTENT_ROOT_HINTS
//
// MessageText:
//
// The DNS server found root hints but they were not consistent across all adapters.
//
static const int DNS_ERROR_INCONSISTENT_ROOT_HINTS 9565L

// DNS_ERROR_DWORD_VALUE_TOO_SMALL    0x0000255E
//
// MessageId: DNS_ERROR_DWORD_VALUE_TOO_SMALL
//
// MessageText:
//
// The specified value is too small for this parameter.
//
static const int DNS_ERROR_DWORD_VALUE_TOO_SMALL  9566L

// DNS_ERROR_DWORD_VALUE_TOO_LARGE    0x0000255F
//
// MessageId: DNS_ERROR_DWORD_VALUE_TOO_LARGE
//
// MessageText:
//
// The specified value is too large for this parameter.
//
static const int DNS_ERROR_DWORD_VALUE_TOO_LARGE  9567L

// DNS_ERROR_BACKGROUND_LOADING       0x00002560
//
// MessageId: DNS_ERROR_BACKGROUND_LOADING
//
// MessageText:
//
// This operation is not allowed while the DNS server is loading zones in the background. Please try again later.
//
static const int DNS_ERROR_BACKGROUND_LOADING     9568L

// DNS_ERROR_NOT_ALLOWED_ON_RODC      0x00002561
//
// MessageId: DNS_ERROR_NOT_ALLOWED_ON_RODC
//
// MessageText:
//
// The operation requested is not permitted on against a DNS server running on a read-only DC.
//
static const int DNS_ERROR_NOT_ALLOWED_ON_RODC    9569L

// DNS_ERROR_NOT_ALLOWED_UNDER_DNAME   0x00002562
//
// MessageId: DNS_ERROR_NOT_ALLOWED_UNDER_DNAME
//
// MessageText:
//
// No data is allowed to exist underneath a DNAME record.
//
static const int DNS_ERROR_NOT_ALLOWED_UNDER_DNAME 9570L

// DNS_ERROR_DELEGATION_REQUIRED       0x00002563
//
// MessageId: DNS_ERROR_DELEGATION_REQUIRED
//
// MessageText:
//
// This operation requires credentials delegation.
//
static const int DNS_ERROR_DELEGATION_REQUIRED    9571L

// DNS_ERROR_INVALID_POLICY_TABLE        0x00002564
//
// MessageId: DNS_ERROR_INVALID_POLICY_TABLE
//
// MessageText:
//
// Name resolution policy table has been corrupted. DNS resolution will fail until it is fixed. Contact your network administrator.
//
static const int DNS_ERROR_INVALID_POLICY_TABLE   9572L

// DNS_ERROR_ADDRESS_REQUIRED        0x00002565
//
// MessageId: DNS_ERROR_ADDRESS_REQUIRED
//
// MessageText:
//
// Not allowed to remove all addresses.
//
static const int DNS_ERROR_ADDRESS_REQUIRED       9573L


//
// Zone errors
//

static const int DNS_ERROR_ZONE_BASE 9600

// DNS_ERROR_ZONE_DOES_NOT_EXIST         0x00002581
//
// MessageId: DNS_ERROR_ZONE_DOES_NOT_EXIST
//
// MessageText:
//
// DNS zone does not exist.
//
static const int DNS_ERROR_ZONE_DOES_NOT_EXIST    9601L

// DNS_ERROR_NO_ZONE_INFO                0x00002582
//
// MessageId: DNS_ERROR_NO_ZONE_INFO
//
// MessageText:
//
// DNS zone information not available.
//
static const int DNS_ERROR_NO_ZONE_INFO           9602L

// DNS_ERROR_INVALID_ZONE_OPERATION      0x00002583
//
// MessageId: DNS_ERROR_INVALID_ZONE_OPERATION
//
// MessageText:
//
// Invalid operation for DNS zone.
//
static const int DNS_ERROR_INVALID_ZONE_OPERATION 9603L

// DNS_ERROR_ZONE_CONFIGURATION_ERROR    0x00002584
//
// MessageId: DNS_ERROR_ZONE_CONFIGURATION_ERROR
//
// MessageText:
//
// Invalid DNS zone configuration.
//
static const int DNS_ERROR_ZONE_CONFIGURATION_ERROR 9604L

// DNS_ERROR_ZONE_HAS_NO_SOA_RECORD      0x00002585
//
// MessageId: DNS_ERROR_ZONE_HAS_NO_SOA_RECORD
//
// MessageText:
//
// DNS zone has no start of authority (SOA) record.
//
static const int DNS_ERROR_ZONE_HAS_NO_SOA_RECORD 9605L

// DNS_ERROR_ZONE_HAS_NO_NS_RECORDS      0x00002586
//
// MessageId: DNS_ERROR_ZONE_HAS_NO_NS_RECORDS
//
// MessageText:
//
// DNS zone has no Name Server (NS) record.
//
static const int DNS_ERROR_ZONE_HAS_NO_NS_RECORDS 9606L

// DNS_ERROR_ZONE_LOCKED                 0x00002587
//
// MessageId: DNS_ERROR_ZONE_LOCKED
//
// MessageText:
//
// DNS zone is locked.
//
static const int DNS_ERROR_ZONE_LOCKED            9607L

// DNS_ERROR_ZONE_CREATION_FAILED        0x00002588
//
// MessageId: DNS_ERROR_ZONE_CREATION_FAILED
//
// MessageText:
//
// DNS zone creation failed.
//
static const int DNS_ERROR_ZONE_CREATION_FAILED   9608L

// DNS_ERROR_ZONE_ALREADY_EXISTS         0x00002589
//
// MessageId: DNS_ERROR_ZONE_ALREADY_EXISTS
//
// MessageText:
//
// DNS zone already exists.
//
static const int DNS_ERROR_ZONE_ALREADY_EXISTS    9609L

// DNS_ERROR_AUTOZONE_ALREADY_EXISTS     0x0000258a
//
// MessageId: DNS_ERROR_AUTOZONE_ALREADY_EXISTS
//
// MessageText:
//
// DNS automatic zone already exists.
//
static const int DNS_ERROR_AUTOZONE_ALREADY_EXISTS 9610L

// DNS_ERROR_INVALID_ZONE_TYPE           0x0000258b
//
// MessageId: DNS_ERROR_INVALID_ZONE_TYPE
//
// MessageText:
//
// Invalid DNS zone type.
//
static const int DNS_ERROR_INVALID_ZONE_TYPE      9611L

// DNS_ERROR_SECONDARY_REQUIRES_MASTER_IP 0x0000258c
//
// MessageId: DNS_ERROR_SECONDARY_REQUIRES_MASTER_IP
//
// MessageText:
//
// Secondary DNS zone requires master IP address.
//
static const int DNS_ERROR_SECONDARY_REQUIRES_MASTER_IP 9612L

// DNS_ERROR_ZONE_NOT_SECONDARY          0x0000258d
//
// MessageId: DNS_ERROR_ZONE_NOT_SECONDARY
//
// MessageText:
//
// DNS zone not secondary.
//
static const int DNS_ERROR_ZONE_NOT_SECONDARY     9613L

// DNS_ERROR_NEED_SECONDARY_ADDRESSES    0x0000258e
//
// MessageId: DNS_ERROR_NEED_SECONDARY_ADDRESSES
//
// MessageText:
//
// Need secondary IP address.
//
static const int DNS_ERROR_NEED_SECONDARY_ADDRESSES 9614L

// DNS_ERROR_WINS_INIT_FAILED            0x0000258f
//
// MessageId: DNS_ERROR_WINS_INIT_FAILED
//
// MessageText:
//
// WINS initialization failed.
//
static const int DNS_ERROR_WINS_INIT_FAILED       9615L

// DNS_ERROR_NEED_WINS_SERVERS           0x00002590
//
// MessageId: DNS_ERROR_NEED_WINS_SERVERS
//
// MessageText:
//
// Need WINS servers.
//
static const int DNS_ERROR_NEED_WINS_SERVERS      9616L

// DNS_ERROR_NBSTAT_INIT_FAILED          0x00002591
//
// MessageId: DNS_ERROR_NBSTAT_INIT_FAILED
//
// MessageText:
//
// NBTSTAT initialization call failed.
//
static const int DNS_ERROR_NBSTAT_INIT_FAILED     9617L

// DNS_ERROR_SOA_DELETE_INVALID          0x00002592
//
// MessageId: DNS_ERROR_SOA_DELETE_INVALID
//
// MessageText:
//
// Invalid delete of start of authority (SOA)
//
static const int DNS_ERROR_SOA_DELETE_INVALID     9618L

// DNS_ERROR_FORWARDER_ALREADY_EXISTS    0x00002593
//
// MessageId: DNS_ERROR_FORWARDER_ALREADY_EXISTS
//
// MessageText:
//
// A conditional forwarding zone already exists for that name.
//
static const int DNS_ERROR_FORWARDER_ALREADY_EXISTS 9619L

// DNS_ERROR_ZONE_REQUIRES_MASTER_IP     0x00002594
//
// MessageId: DNS_ERROR_ZONE_REQUIRES_MASTER_IP
//
// MessageText:
//
// This zone must be configured with one or more master DNS server IP addresses.
//
static const int DNS_ERROR_ZONE_REQUIRES_MASTER_IP 9620L

// DNS_ERROR_ZONE_IS_SHUTDOWN            0x00002595
//
// MessageId: DNS_ERROR_ZONE_IS_SHUTDOWN
//
// MessageText:
//
// The operation cannot be performed because this zone is shut down.
//
static const int DNS_ERROR_ZONE_IS_SHUTDOWN       9621L

// DNS_ERROR_ZONE_LOCKED_FOR_SIGNING     0x00002596
//
// MessageId: DNS_ERROR_ZONE_LOCKED_FOR_SIGNING
//
// MessageText:
//
// This operation cannot be performed because the zone is currently being signed. Please try again later.
//
static const int DNS_ERROR_ZONE_LOCKED_FOR_SIGNING 9622L


//
// Datafile errors
//

static const int DNS_ERROR_DATAFILE_BASE 9650

// DNS                                   0x000025b3
//
// MessageId: DNS_ERROR_PRIMARY_REQUIRES_DATAFILE
//
// MessageText:
//
// Primary DNS zone requires datafile.
//
static const int DNS_ERROR_PRIMARY_REQUIRES_DATAFILE 9651L

// DNS                                   0x000025b4
//
// MessageId: DNS_ERROR_INVALID_DATAFILE_NAME
//
// MessageText:
//
// Invalid datafile name for DNS zone.
//
static const int DNS_ERROR_INVALID_DATAFILE_NAME  9652L

// DNS                                   0x000025b5
//
// MessageId: DNS_ERROR_DATAFILE_OPEN_FAILURE
//
// MessageText:
//
// Failed to open datafile for DNS zone.
//
static const int DNS_ERROR_DATAFILE_OPEN_FAILURE  9653L

// DNS                                   0x000025b6
//
// MessageId: DNS_ERROR_FILE_WRITEBACK_FAILED
//
// MessageText:
//
// Failed to write datafile for DNS zone.
//
static const int DNS_ERROR_FILE_WRITEBACK_FAILED  9654L

// DNS                                   0x000025b7
//
// MessageId: DNS_ERROR_DATAFILE_PARSING
//
// MessageText:
//
// Failure while reading datafile for DNS zone.
//
static const int DNS_ERROR_DATAFILE_PARSING       9655L


//
// Database errors
//

static const int DNS_ERROR_DATABASE_BASE 9700

// DNS_ERROR_RECORD_DOES_NOT_EXIST       0x000025e5
//
// MessageId: DNS_ERROR_RECORD_DOES_NOT_EXIST
//
// MessageText:
//
// DNS record does not exist.
//
static const int DNS_ERROR_RECORD_DOES_NOT_EXIST  9701L

// DNS_ERROR_RECORD_FORMAT               0x000025e6
//
// MessageId: DNS_ERROR_RECORD_FORMAT
//
// MessageText:
//
// DNS record format error.
//
static const int DNS_ERROR_RECORD_FORMAT          9702L

// DNS_ERROR_NODE_CREATION_FAILED        0x000025e7
//
// MessageId: DNS_ERROR_NODE_CREATION_FAILED
//
// MessageText:
//
// Node creation failure in DNS.
//
static const int DNS_ERROR_NODE_CREATION_FAILED   9703L

// DNS_ERROR_UNKNOWN_RECORD_TYPE         0x000025e8
//
// MessageId: DNS_ERROR_UNKNOWN_RECORD_TYPE
//
// MessageText:
//
// Unknown DNS record type.
//
static const int DNS_ERROR_UNKNOWN_RECORD_TYPE    9704L

// DNS_ERROR_RECORD_TIMED_OUT            0x000025e9
//
// MessageId: DNS_ERROR_RECORD_TIMED_OUT
//
// MessageText:
//
// DNS record timed out.
//
static const int DNS_ERROR_RECORD_TIMED_OUT       9705L

// DNS_ERROR_NAME_NOT_IN_ZONE            0x000025ea
//
// MessageId: DNS_ERROR_NAME_NOT_IN_ZONE
//
// MessageText:
//
// Name not in DNS zone.
//
static const int DNS_ERROR_NAME_NOT_IN_ZONE       9706L

// DNS_ERROR_CNAME_LOOP                  0x000025eb
//
// MessageId: DNS_ERROR_CNAME_LOOP
//
// MessageText:
//
// CNAME loop detected.
//
static const int DNS_ERROR_CNAME_LOOP             9707L

// DNS_ERROR_NODE_IS_CNAME               0x000025ec
//
// MessageId: DNS_ERROR_NODE_IS_CNAME
//
// MessageText:
//
// Node is a CNAME DNS record.
//
static const int DNS_ERROR_NODE_IS_CNAME          9708L

// DNS_ERROR_CNAME_COLLISION             0x000025ed
//
// MessageId: DNS_ERROR_CNAME_COLLISION
//
// MessageText:
//
// A CNAME record already exists for given name.
//
static const int DNS_ERROR_CNAME_COLLISION        9709L

// DNS_ERROR_RECORD_ONLY_AT_ZONE_ROOT    0x000025ee
//
// MessageId: DNS_ERROR_RECORD_ONLY_AT_ZONE_ROOT
//
// MessageText:
//
// Record only at DNS zone root.
//
static const int DNS_ERROR_RECORD_ONLY_AT_ZONE_ROOT 9710L

// DNS_ERROR_RECORD_ALREADY_EXISTS       0x000025ef
//
// MessageId: DNS_ERROR_RECORD_ALREADY_EXISTS
//
// MessageText:
//
// DNS record already exists.
//
static const int DNS_ERROR_RECORD_ALREADY_EXISTS  9711L

// DNS_ERROR_SECONDARY_DATA              0x000025f0
//
// MessageId: DNS_ERROR_SECONDARY_DATA
//
// MessageText:
//
// Secondary DNS zone data error.
//
static const int DNS_ERROR_SECONDARY_DATA         9712L

// DNS_ERROR_NO_CREATE_CACHE_DATA        0x000025f1
//
// MessageId: DNS_ERROR_NO_CREATE_CACHE_DATA
//
// MessageText:
//
// Could not create DNS cache data.
//
static const int DNS_ERROR_NO_CREATE_CACHE_DATA   9713L

// DNS_ERROR_NAME_DOES_NOT_EXIST         0x000025f2
//
// MessageId: DNS_ERROR_NAME_DOES_NOT_EXIST
//
// MessageText:
//
// DNS name does not exist.
//
static const int DNS_ERROR_NAME_DOES_NOT_EXIST    9714L

// DNS_WARNING_PTR_CREATE_FAILED         0x000025f3
//
// MessageId: DNS_WARNING_PTR_CREATE_FAILED
//
// MessageText:
//
// Could not create pointer (PTR) record.
//
static const int DNS_WARNING_PTR_CREATE_FAILED    9715L

// DNS_WARNING_DOMAIN_UNDELETED          0x000025f4
//
// MessageId: DNS_WARNING_DOMAIN_UNDELETED
//
// MessageText:
//
// DNS domain was undeleted.
//
static const int DNS_WARNING_DOMAIN_UNDELETED     9716L

// DNS_ERROR_DS_UNAVAILABLE              0x000025f5
//
// MessageId: DNS_ERROR_DS_UNAVAILABLE
//
// MessageText:
//
// The directory service is unavailable.
//
static const int DNS_ERROR_DS_UNAVAILABLE         9717L

// DNS_ERROR_DS_ZONE_ALREADY_EXISTS      0x000025f6
//
// MessageId: DNS_ERROR_DS_ZONE_ALREADY_EXISTS
//
// MessageText:
//
// DNS zone already exists in the directory service.
//
static const int DNS_ERROR_DS_ZONE_ALREADY_EXISTS 9718L

// DNS_ERROR_NO_BOOTFILE_IF_DS_ZONE      0x000025f7
//
// MessageId: DNS_ERROR_NO_BOOTFILE_IF_DS_ZONE
//
// MessageText:
//
// DNS server not creating or reading the boot file for the directory service integrated DNS zone.
//
static const int DNS_ERROR_NO_BOOTFILE_IF_DS_ZONE 9719L

// DNS_ERROR_NODE_IS_DNAME               0x000025f8
//
// MessageId: DNS_ERROR_NODE_IS_DNAME
//
// MessageText:
//
// Node is a DNAME DNS record.
//
static const int DNS_ERROR_NODE_IS_DNAME          9720L

// DNS_ERROR_DNAME_COLLISION             0x000025f9
//
// MessageId: DNS_ERROR_DNAME_COLLISION
//
// MessageText:
//
// A DNAME record already exists for given name.
//
static const int DNS_ERROR_DNAME_COLLISION        9721L

// DNS_ERROR_ALIAS_LOOP                  0x000025fa
//
// MessageId: DNS_ERROR_ALIAS_LOOP
//
// MessageText:
//
// An alias loop has been detected with either CNAME or DNAME records.
//
static const int DNS_ERROR_ALIAS_LOOP             9722L


//
// Operation errors
//

static const int DNS_ERROR_OPERATION_BASE 9750

// DNS_INFO_AXFR_COMPLETE                0x00002617
//
// MessageId: DNS_INFO_AXFR_COMPLETE
//
// MessageText:
//
// DNS AXFR (zone transfer) complete.
//
static const int DNS_INFO_AXFR_COMPLETE           9751L

// DNS_ERROR_AXFR                        0x00002618
//
// MessageId: DNS_ERROR_AXFR
//
// MessageText:
//
// DNS zone transfer failed.
//
static const int DNS_ERROR_AXFR                   9752L

// DNS_INFO_ADDED_LOCAL_WINS             0x00002619
//
// MessageId: DNS_INFO_ADDED_LOCAL_WINS
//
// MessageText:
//
// Added local WINS server.
//
static const int DNS_INFO_ADDED_LOCAL_WINS        9753L


//
// Secure update
//

static const int DNS_ERROR_SECURE_BASE 9800

// DNS_STATUS_CONTINUE_NEEDED            0x00002649
//
// MessageId: DNS_STATUS_CONTINUE_NEEDED
//
// MessageText:
//
// Secure update call needs to continue update request.
//
static const int DNS_STATUS_CONTINUE_NEEDED       9801L


//
// Setup errors
//

static const int DNS_ERROR_SETUP_BASE 9850

// DNS_ERROR_NO_TCPIP                    0x0000267b
//
// MessageId: DNS_ERROR_NO_TCPIP
//
// MessageText:
//
// TCP/IP network protocol not installed.
//
static const int DNS_ERROR_NO_TCPIP               9851L

// DNS_ERROR_NO_DNS_SERVERS              0x0000267c
//
// MessageId: DNS_ERROR_NO_DNS_SERVERS
//
// MessageText:
//
// No DNS servers configured for local system.
//
static const int DNS_ERROR_NO_DNS_SERVERS         9852L


//
// Directory partition (DP) errors
//

static const int DNS_ERROR_DP_BASE 9900

// DNS_ERROR_DP_DOES_NOT_EXIST           0x000026ad
//
// MessageId: DNS_ERROR_DP_DOES_NOT_EXIST
//
// MessageText:
//
// The specified directory partition does not exist.
//
static const int DNS_ERROR_DP_DOES_NOT_EXIST      9901L

// DNS_ERROR_DP_ALREADY_EXISTS           0x000026ae
//
// MessageId: DNS_ERROR_DP_ALREADY_EXISTS
//
// MessageText:
//
// The specified directory partition already exists.
//
static const int DNS_ERROR_DP_ALREADY_EXISTS      9902L

// DNS_ERROR_DP_NOT_ENLISTED             0x000026af
//
// MessageId: DNS_ERROR_DP_NOT_ENLISTED
//
// MessageText:
//
// This DNS server is not enlisted in the specified directory partition.
//
static const int DNS_ERROR_DP_NOT_ENLISTED        9903L

// DNS_ERROR_DP_ALREADY_ENLISTED         0x000026b0
//
// MessageId: DNS_ERROR_DP_ALREADY_ENLISTED
//
// MessageText:
//
// This DNS server is already enlisted in the specified directory partition.
//
static const int DNS_ERROR_DP_ALREADY_ENLISTED    9904L

// DNS_ERROR_DP_NOT_AVAILABLE            0x000026b1
//
// MessageId: DNS_ERROR_DP_NOT_AVAILABLE
//
// MessageText:
//
// The directory partition is not available at this time. Please wait a few minutes and try again.
//
static const int DNS_ERROR_DP_NOT_AVAILABLE       9905L

// DNS_ERROR_DP_FSMO_ERROR               0x000026b2
//
// MessageId: DNS_ERROR_DP_FSMO_ERROR
//
// MessageText:
//
// The operation failed because the domain naming master FSMO role could not be reached. The domain controller holding the domain naming master FSMO role is down or unable to service the request or is not running Windows Server 2003 or later.
//
static const int DNS_ERROR_DP_FSMO_ERROR          9906L

//
// DNS RRL errors from 9911 to 9920
//
// DNS_ERROR_RRL_NOT_ENABLED 0x000026B7
//
// MessageId: DNS_ERROR_RRL_NOT_ENABLED
//
// MessageText:
//
// The RRL is not enabled.
//
static const int DNS_ERROR_RRL_NOT_ENABLED        9911L

// DNS_ERROR_RRL_INVALID_WINDOW_SIZE 0x000026B8
//
// MessageId: DNS_ERROR_RRL_INVALID_WINDOW_SIZE
//
// MessageText:
//
// The window size parameter is invalid. It should be greater than or equal to 1.
//
static const int DNS_ERROR_RRL_INVALID_WINDOW_SIZE 9912L

// DNS_ERROR_RRL_INVALID_IPV4_PREFIX 0x000026B9
//
// MessageId: DNS_ERROR_RRL_INVALID_IPV4_PREFIX
//
// MessageText:
//
// The IPv4 prefix length parameter is invalid. It should be less than or equal to 32.
//
static const int DNS_ERROR_RRL_INVALID_IPV4_PREFIX 9913L

// DNS_ERROR_RRL_INVALID_IPV6_PREFIX 0x000026BA
//
// MessageId: DNS_ERROR_RRL_INVALID_IPV6_PREFIX
//
// MessageText:
//
// The IPv6 prefix length parameter is invalid. It should be less than or equal to 128.
//
static const int DNS_ERROR_RRL_INVALID_IPV6_PREFIX 9914L

// DNS_ERROR_RRL_INVALID_TC_RATE 0x000026BB
//
// MessageId: DNS_ERROR_RRL_INVALID_TC_RATE
//
// MessageText:
//
// The TC Rate parameter is invalid. It should be less than 10.
//
static const int DNS_ERROR_RRL_INVALID_TC_RATE    9915L

// DNS_ERROR_RRL_INVALID_LEAK_RATE 0x000026BC
//
// MessageId: DNS_ERROR_RRL_INVALID_LEAK_RATE
//
// MessageText:
//
// The Leak Rate parameter is invalid. It should be either 0, or between 2 and 10.
//
static const int DNS_ERROR_RRL_INVALID_LEAK_RATE  9916L

// DNS_ERROR_RRL_LEAK_RATE_LESSTHAN_TC_RATE 0x000026BD
//
// MessageId: DNS_ERROR_RRL_LEAK_RATE_LESSTHAN_TC_RATE
//
// MessageText:
//
// The Leak Rate or TC Rate parameter is invalid. Leak Rate should be greater than TC Rate.
//
static const int DNS_ERROR_RRL_LEAK_RATE_LESSTHAN_TC_RATE 9917L


//
// DNS Virtualization errors from 9921 to 9950
//
// DNS_ERROR_VIRTUALIZATION_INSTANCE_ALREADY_EXISTS    0x000026c1
//
// MessageId: DNS_ERROR_VIRTUALIZATION_INSTANCE_ALREADY_EXISTS
//
// MessageText:
//
// The virtualization instance already exists.
//
static const int DNS_ERROR_VIRTUALIZATION_INSTANCE_ALREADY_EXISTS 9921L

// DNS_ERROR_VIRTUALIZATION_INSTANCE_DOES_NOT_EXIST    0x000026c2
//
// MessageId: DNS_ERROR_VIRTUALIZATION_INSTANCE_DOES_NOT_EXIST
//
// MessageText:
//
// The virtualization instance does not exist.
//
static const int DNS_ERROR_VIRTUALIZATION_INSTANCE_DOES_NOT_EXIST 9922L

// DNS_ERROR_VIRTUALIZATION_TREE_LOCKED        0x000026c3
//
// MessageId: DNS_ERROR_VIRTUALIZATION_TREE_LOCKED
//
// MessageText:
//
// The virtualization tree is locked.
//
static const int DNS_ERROR_VIRTUALIZATION_TREE_LOCKED 9923L

// DNS_ERROR_INVAILD_VIRTUALIZATION_INSTANCE_NAME      0x000026c4
//
// MessageId: DNS_ERROR_INVAILD_VIRTUALIZATION_INSTANCE_NAME
//
// MessageText:
//
// Invalid virtualization instance name.
//
static const int DNS_ERROR_INVAILD_VIRTUALIZATION_INSTANCE_NAME 9924L

// DNS_ERROR_DEFAULT_VIRTUALIZATION_INSTANCE   0x000026c5
//
// MessageId: DNS_ERROR_DEFAULT_VIRTUALIZATION_INSTANCE
//
// MessageText:
//
// The default virtualization instance cannot be added, removed or modified.
//
static const int DNS_ERROR_DEFAULT_VIRTUALIZATION_INSTANCE 9925L


//
// DNS ZoneScope errors from 9951 to 9970
//
// DNS_ERROR_ZONESCOPE_ALREADY_EXISTS               0x000026df
//
// MessageId: DNS_ERROR_ZONESCOPE_ALREADY_EXISTS
//
// MessageText:
//
// The scope already exists for the zone.
//
static const int DNS_ERROR_ZONESCOPE_ALREADY_EXISTS 9951L

// DNS_ERROR_ZONESCOPE_DOES_NOT_EXIST       0x000026e0
//
// MessageId: DNS_ERROR_ZONESCOPE_DOES_NOT_EXIST
//
// MessageText:
//
// The scope does not exist for the zone.
//
static const int DNS_ERROR_ZONESCOPE_DOES_NOT_EXIST 9952L

// DNS_ERROR_DEFAULT_ZONESCOPE 0x000026e1
//
// MessageId: DNS_ERROR_DEFAULT_ZONESCOPE
//
// MessageText:
//
// The scope is the same as the default zone scope.
//
static const int DNS_ERROR_DEFAULT_ZONESCOPE      9953L

// DNS_ERROR_INVALID_ZONESCOPE_NAME 0x000026e2
//
// MessageId: DNS_ERROR_INVALID_ZONESCOPE_NAME
//
// MessageText:
//
// The scope name contains invalid characters.
//
static const int DNS_ERROR_INVALID_ZONESCOPE_NAME 9954L

// DNS_ERROR_NOT_ALLOWED_WITH_ZONESCOPES 0x000026e3
//
// MessageId: DNS_ERROR_NOT_ALLOWED_WITH_ZONESCOPES
//
// MessageText:
//
// Operation not allowed when the zone has scopes.
//
static const int DNS_ERROR_NOT_ALLOWED_WITH_ZONESCOPES 9955L

// DNS_ERROR_LOAD_ZONESCOPE_FAILED 0x000026e4
//
// MessageId: DNS_ERROR_LOAD_ZONESCOPE_FAILED
//
// MessageText:
//
// Failed to load zone scope.
//
static const int DNS_ERROR_LOAD_ZONESCOPE_FAILED  9956L

// DNS_ERROR_ZONESCOPE_FILE_WRITEBACK_FAILED 0x000026e5
//
// MessageId: DNS_ERROR_ZONESCOPE_FILE_WRITEBACK_FAILED
//
// MessageText:
//
// Failed to write data file for DNS zone scope. Please verify the file exists and is writable.
//
static const int DNS_ERROR_ZONESCOPE_FILE_WRITEBACK_FAILED 9957L

// DNS_ERROR_INVALID_SCOPE_NAME 0x000026e6
//
// MessageId: DNS_ERROR_INVALID_SCOPE_NAME
//
// MessageText:
//
// The scope name contains invalid characters.
//
static const int DNS_ERROR_INVALID_SCOPE_NAME     9958L

// DNS_ERROR_SCOPE_DOES_NOT_EXIST       0x000026e7
//
// MessageId: DNS_ERROR_SCOPE_DOES_NOT_EXIST
//
// MessageText:
//
// The scope does not exist.
//
static const int DNS_ERROR_SCOPE_DOES_NOT_EXIST   9959L

// DNS_ERROR_DEFAULT_SCOPE 0x000026e8
//
// MessageId: DNS_ERROR_DEFAULT_SCOPE
//
// MessageText:
//
// The scope is the same as the default scope.
//
static const int DNS_ERROR_DEFAULT_SCOPE          9960L

// DNS_ERROR_INVALID_SCOPE_OPERATION 0x000026e9
//
// MessageId: DNS_ERROR_INVALID_SCOPE_OPERATION
//
// MessageText:
//
// The operation is invalid on the scope.
//
static const int DNS_ERROR_INVALID_SCOPE_OPERATION 9961L

// DNS_ERROR_SCOPE_LOCKED 0x000026ea
//
// MessageId: DNS_ERROR_SCOPE_LOCKED
//
// MessageText:
//
// The scope is locked.
//
static const int DNS_ERROR_SCOPE_LOCKED           9962L

// DNS_ERROR_SCOPE_ALREADY_EXISTS 0x000026eb
//
// MessageId: DNS_ERROR_SCOPE_ALREADY_EXISTS
//
// MessageText:
//
// The scope already exists.
//
static const int DNS_ERROR_SCOPE_ALREADY_EXISTS   9963L


//
// DNS Policy errors from 9971 to 9999
//
// DNS_ERROR_POLICY_ALREADY_EXISTS 0x000026f3
//
// MessageId: DNS_ERROR_POLICY_ALREADY_EXISTS
//
// MessageText:
//
// A policy with the same name already exists on this level (server level or zone level) on the DNS server.
//
static const int DNS_ERROR_POLICY_ALREADY_EXISTS  9971L

// DNS_ERROR_POLICY_DOES_NOT_EXIST 0x000026f4
//
// MessageId: DNS_ERROR_POLICY_DOES_NOT_EXIST
//
// MessageText:
//
// No policy with this name exists on this level (server level or zone level) on the DNS server.
//
static const int DNS_ERROR_POLICY_DOES_NOT_EXIST  9972L

// DNS_ERROR_POLICY_INVALID_CRITERIA 0x000026f5
//
// MessageId: DNS_ERROR_POLICY_INVALID_CRITERIA
//
// MessageText:
//
// The criteria provided in the policy are invalid.
//
static const int DNS_ERROR_POLICY_INVALID_CRITERIA 9973L

// DNS_ERROR_POLICY_INVALID_SETTINGS 0x000026f6
//
// MessageId: DNS_ERROR_POLICY_INVALID_SETTINGS
//
// MessageText:
//
// At least one of the settings of this policy is invalid.
//
static const int DNS_ERROR_POLICY_INVALID_SETTINGS 9974L

// DNS_ERROR_CLIENT_SUBNET_IS_ACCESSED 0x000026f7
//
// MessageId: DNS_ERROR_CLIENT_SUBNET_IS_ACCESSED
//
// MessageText:
//
// The client subnet cannot be deleted while it is being accessed by a policy.
//
static const int DNS_ERROR_CLIENT_SUBNET_IS_ACCESSED 9975L

// DNS_ERROR_CLIENT_SUBNET_DOES_NOT_EXIST 0x000026f8
//
// MessageId: DNS_ERROR_CLIENT_SUBNET_DOES_NOT_EXIST
//
// MessageText:
//
// The client subnet does not exist on the DNS server.
//
static const int DNS_ERROR_CLIENT_SUBNET_DOES_NOT_EXIST 9976L

// DNS_ERROR_CLIENT_SUBNET_ALREADY_EXISTS 0x000026f9
//
// MessageId: DNS_ERROR_CLIENT_SUBNET_ALREADY_EXISTS
//
// MessageText:
//
// A client subnet with this name already exists on the DNS server.
//
static const int DNS_ERROR_CLIENT_SUBNET_ALREADY_EXISTS 9977L

// DNS_ERROR_SUBNET_DOES_NOT_EXIST 0x000026fa
//
// MessageId: DNS_ERROR_SUBNET_DOES_NOT_EXIST
//
// MessageText:
//
// The IP subnet specified does not exist in the client subnet.
//
static const int DNS_ERROR_SUBNET_DOES_NOT_EXIST  9978L

// DNS_ERROR_SUBNET_ALREADY_EXISTS 0x000026fb
//
// MessageId: DNS_ERROR_SUBNET_ALREADY_EXISTS
//
// MessageText:
//
// The IP subnet that is being added, already exists in the client subnet.
//
static const int DNS_ERROR_SUBNET_ALREADY_EXISTS  9979L

// DNS_ERROR_POLICY_LOCKED 0x000026fc
//
// MessageId: DNS_ERROR_POLICY_LOCKED
//
// MessageText:
//
// The policy is locked.
//
static const int DNS_ERROR_POLICY_LOCKED          9980L

// DNS_ERROR_POLICY_INVALID_WEIGHT 0x000026fd
//
// MessageId: DNS_ERROR_POLICY_INVALID_WEIGHT
//
// MessageText:
//
// The weight of the scope in the policy is invalid.
//
static const int DNS_ERROR_POLICY_INVALID_WEIGHT  9981L

// DNS_ERROR_POLICY_INVALID_NAME 0x000026fe
//
// MessageId: DNS_ERROR_POLICY_INVALID_NAME
//
// MessageText:
//
// The DNS policy name is invalid.
//
static const int DNS_ERROR_POLICY_INVALID_NAME    9982L

// DNS_ERROR_POLICY_MISSING_CRITERIA 0x000026ff
//
// MessageId: DNS_ERROR_POLICY_MISSING_CRITERIA
//
// MessageText:
//
// The policy is missing criteria.
//
static const int DNS_ERROR_POLICY_MISSING_CRITERIA 9983L

// DNS_ERROR_INVALID_CLIENT_SUBNET_NAME 0x00002700
//
// MessageId: DNS_ERROR_INVALID_CLIENT_SUBNET_NAME
//
// MessageText:
//
// The name of the the client subnet record is invalid.
//
static const int DNS_ERROR_INVALID_CLIENT_SUBNET_NAME 9984L

// DNS_ERROR_POLICY_PROCESSING_ORDER_INVALID 0x00002701
//
// MessageId: DNS_ERROR_POLICY_PROCESSING_ORDER_INVALID
//
// MessageText:
//
// Invalid policy processing order.
//
static const int DNS_ERROR_POLICY_PROCESSING_ORDER_INVALID 9985L

// DNS_ERROR_POLICY_SCOPE_MISSING 0x00002702
//
// MessageId: DNS_ERROR_POLICY_SCOPE_MISSING
//
// MessageText:
//
// The scope information has not been provided for a policy that requires it.
//
static const int DNS_ERROR_POLICY_SCOPE_MISSING   9986L

// DNS_ERROR_POLICY_SCOPE_NOT_ALLOWED 0x00002703
//
// MessageId: DNS_ERROR_POLICY_SCOPE_NOT_ALLOWED
//
// MessageText:
//
// The scope information has been provided for a policy that does not require it.
//
static const int DNS_ERROR_POLICY_SCOPE_NOT_ALLOWED 9987L

// DNS_ERROR_SERVERSCOPE_IS_REFERENCED 0x00002704
//
// MessageId: DNS_ERROR_SERVERSCOPE_IS_REFERENCED
//
// MessageText:
//
// The server scope cannot be deleted because it is referenced by a DNS Policy.
//
static const int DNS_ERROR_SERVERSCOPE_IS_REFERENCED 9988L

// DNS_ERROR_ZONESCOPE_IS_REFERENCED 0x00002705
//
// MessageId: DNS_ERROR_ZONESCOPE_IS_REFERENCED
//
// MessageText:
//
// The zone scope cannot be deleted because it is referenced by a DNS Policy.
//
static const int DNS_ERROR_ZONESCOPE_IS_REFERENCED 9989L

// DNS_ERROR_POLICY_INVALID_CRITERIA_CLIENT_SUBNET 0x00002706
//
// MessageId: DNS_ERROR_POLICY_INVALID_CRITERIA_CLIENT_SUBNET
//
// MessageText:
//
// The criterion client subnet provided in the policy is invalid.
//
static const int DNS_ERROR_POLICY_INVALID_CRITERIA_CLIENT_SUBNET 9990L

// DNS_ERROR_POLICY_INVALID_CRITERIA_TRANSPORT_PROTOCOL 0x00002707
//
// MessageId: DNS_ERROR_POLICY_INVALID_CRITERIA_TRANSPORT_PROTOCOL
//
// MessageText:
//
// The criterion transport protocol provided in the policy is invalid.
//
static const int DNS_ERROR_POLICY_INVALID_CRITERIA_TRANSPORT_PROTOCOL 9991L

// DNS_ERROR_POLICY_INVALID_CRITERIA_NETWORK_PROTOCOL 0x00002708
//
// MessageId: DNS_ERROR_POLICY_INVALID_CRITERIA_NETWORK_PROTOCOL
//
// MessageText:
//
// The criterion network protocol provided in the policy is invalid.
//
static const int DNS_ERROR_POLICY_INVALID_CRITERIA_NETWORK_PROTOCOL 9992L

// DNS_ERROR_POLICY_INVALID_CRITERIA_INTERFACE 0x00002709
//
// MessageId: DNS_ERROR_POLICY_INVALID_CRITERIA_INTERFACE
//
// MessageText:
//
// The criterion interface provided in the policy is invalid.
//
static const int DNS_ERROR_POLICY_INVALID_CRITERIA_INTERFACE 9993L

// DNS_ERROR_POLICY_INVALID_CRITERIA_FQDN 0x0000270A
//
// MessageId: DNS_ERROR_POLICY_INVALID_CRITERIA_FQDN
//
// MessageText:
//
// The criterion FQDN provided in the policy is invalid.
//
static const int DNS_ERROR_POLICY_INVALID_CRITERIA_FQDN 9994L

// DNS_ERROR_POLICY_INVALID_CRITERIA_QUERY_TYPE 0x0000270B
//
// MessageId: DNS_ERROR_POLICY_INVALID_CRITERIA_QUERY_TYPE
//
// MessageText:
//
// The criterion query type provided in the policy is invalid.
//
static const int DNS_ERROR_POLICY_INVALID_CRITERIA_QUERY_TYPE 9995L

// DNS_ERROR_POLICY_INVALID_CRITERIA_TIME_OF_DAY 0x0000270C
//
// MessageId: DNS_ERROR_POLICY_INVALID_CRITERIA_TIME_OF_DAY
//
// MessageText:
//
// The criterion time of day provided in the policy is invalid.
//
static const int DNS_ERROR_POLICY_INVALID_CRITERIA_TIME_OF_DAY 9996L




///////////////////////////////////////////////////
//                                               //
//             End of DNS Error Codes            //
//                                               //
//                  9000 to 9999                 //
///////////////////////////////////////////////////
--]]

--[[
///////////////////////////////////////////////////
//                                               //
//               WinSock Error Codes             //
//                                               //
//                 10000 to 11999                //
///////////////////////////////////////////////////

//
// WinSock error codes are also defined in WinSock.h
// and WinSock2.h, hence the IFDEF
//
--]]

if not WSABASEERR_DEFINED then
WSABASEERR_DEFINED = true
ffi.cdef[[
static const int WSABASEERR = 10000;


static const int WSAEINTR                        = 10004;
static const int WSAEBADF                        = 10009;
static const int WSAEACCES                       = 10013;
static const int WSAEFAULT                       = 10014;
static const int WSAEINVAL                       = 10022;
static const int WSAEMFILE                       = 10024;
static const int WSAEWOULDBLOCK                  = 10035;
static const int WSAEINPROGRESS                  = 10036;
static const int WSAEALREADY                     = 10037;
static const int WSAENOTSOCK                     = 10038;
static const int WSAEDESTADDRREQ                 = 10039;
static const int WSAEMSGSIZE                     = 10040;
static const int WSAEPROTOTYPE                   = 10041;
static const int WSAENOPROTOOPT                  = 10042;
static const int WSAEPROTONOSUPPORT              = 10043;
static const int WSAESOCKTNOSUPPORT              = 10044;
static const int WSAEOPNOTSUPP                   = 10045;
static const int WSAEPFNOSUPPORT                 = 10046;
static const int WSAEAFNOSUPPORT                 = 10047;
static const int WSAEADDRINUSE                   = 10048;
static const int WSAEADDRNOTAVAIL                = 10049;
static const int WSAENETDOWN                     = 10050;
static const int WSAENETUNREACH                  = 10051;
static const int WSAENETRESET                    = 10052;
static const int WSAECONNABORTED                 = 10053;
static const int WSAECONNRESET                   = 10054;
static const int WSAENOBUFS                      = 10055;
static const int WSAEISCONN                      = 10056;
static const int WSAENOTCONN                     = 10057;
static const int WSAESHUTDOWN                    = 10058;
static const int WSAETOOMANYREFS                 = 10059;
static const int WSAETIMEDOUT                    = 10060;
static const int WSAECONNREFUSED                 = 10061;
static const int WSAELOOP                        = 10062;
static const int WSAENAMETOOLONG                 = 10063;
static const int WSAEHOSTDOWN                    = 10064;
static const int WSAEHOSTUNREACH                 = 10065;
static const int WSAENOTEMPTY                    = 10066;
static const int WSAEPROCLIM                     = 10067;
static const int WSAEUSERS                       = 10068;
static const int WSAEDQUOT                       = 10069;
static const int WSAESTALE                       = 10070;
static const int WSAEREMOTE                      = 10071;
static const int WSASYSNOTREADY                  = 10091;
static const int WSAVERNOTSUPPORTED              = 10092;
static const int WSANOTINITIALISED               = 10093;
static const int WSAEDISCON                      = 10101;
static const int WSAENOMORE                      = 10102;
static const int WSAECANCELLED                   = 10103;
static const int WSAEINVALIDPROCTABLE            = 10104;
static const int WSAEINVALIDPROVIDER             = 10105;
static const int WSAEPROVIDERFAILEDINIT          = 10106;
static const int WSASYSCALLFAILURE               = 10107;
static const int WSASERVICE_NOT_FOUND            = 10108;
static const int WSATYPE_NOT_FOUND               = 10109;
static const int WSA_E_NO_MORE                   = 10110;
static const int WSA_E_CANCELLED                 = 10111;
static const int WSAEREFUSED                     = 10112;
static const int WSAHOST_NOT_FOUND               = 11001;
static const int WSATRY_AGAIN                    = 11002;
static const int WSANO_RECOVERY                  = 11003;
static const int WSANO_DATA                      = 11004;
static const int WSA_QOS_RECEIVERS               = 11005;
static const int WSA_QOS_SENDERS                 = 11006;
static const int WSA_QOS_NO_SENDERS              = 11007;
static const int WSA_QOS_NO_RECEIVERS            = 11008;
static const int WSA_QOS_REQUEST_CONFIRMED       = 11009;
static const int WSA_QOS_ADMISSION_FAILURE       = 11010;
static const int WSA_QOS_POLICY_FAILURE          = 11011;
static const int WSA_QOS_BAD_STYLE               = 11012;
static const int WSA_QOS_BAD_OBJECT              = 11013;
static const int WSA_QOS_TRAFFIC_CTRL_ERROR      = 11014;
static const int WSA_QOS_GENERIC_ERROR           = 11015;
static const int WSA_QOS_ESERVICETYPE            = 11016;
static const int WSA_QOS_EFLOWSPEC               = 11017;
static const int WSA_QOS_EPROVSPECBUF            = 11018;
static const int WSA_QOS_EFILTERSTYLE            = 11019;
static const int WSA_QOS_EFILTERTYPE             = 11020;
static const int WSA_QOS_EFILTERCOUNT            = 11021;
static const int WSA_QOS_EOBJLENGTH              = 11022;
static const int WSA_QOS_EFLOWCOUNT              = 11023;
static const int WSA_QOS_EUNKOWNPSOBJ            = 11024;
static const int WSA_QOS_EPOLICYOBJ              = 11025;
static const int WSA_QOS_EFLOWDESC               = 11026;
static const int WSA_QOS_EPSFLOWSPEC             = 11027;
static const int WSA_QOS_EPSFILTERSPEC           = 11028;
static const int WSA_QOS_ESDMODEOBJ              = 11029;
static const int WSA_QOS_ESHAPERATEOBJ           = 11030;
static const int WSA_QOS_RESERVED_PETYPE         = 11031;
static const int WSA_SECURE_HOST_NOT_FOUND       = 11032;
static const int WSA_IPSEC_NAME_POLICY_ERROR     = 11033L;
]]

--[[
///////////////////////////////////////////////////
//                                               //
//           End of WinSock Error Codes          //
//                                               //
//                 10000 to 11999                //
///////////////////////////////////////////////////
--]]
end -- defined(WSABASEERR_DEFINED)



--[[
///////////////////////////////////////////////////
//                                               //
//                  Available                    //
//                                               //
//                 12000 to 12999                //
///////////////////////////////////////////////////


///////////////////////////////////////////////////
//                                               //
//           Start of IPSec Error codes          //
//                                               //
//                 13000 to 13999                //
///////////////////////////////////////////////////

//
// MessageId: ERROR_IPSEC_QM_POLICY_EXISTS
//
// MessageText:
//
// The specified quick mode policy already exists.
//
static const int ERROR_IPSEC_QM_POLICY_EXISTS     13000L

//
// MessageId: ERROR_IPSEC_QM_POLICY_NOT_FOUND
//
// MessageText:
//
// The specified quick mode policy was not found.
//
static const int ERROR_IPSEC_QM_POLICY_NOT_FOUND  13001L

//
// MessageId: ERROR_IPSEC_QM_POLICY_IN_USE
//
// MessageText:
//
// The specified quick mode policy is being used.
//
static const int ERROR_IPSEC_QM_POLICY_IN_USE     13002L

//
// MessageId: ERROR_IPSEC_MM_POLICY_EXISTS
//
// MessageText:
//
// The specified main mode policy already exists.
//
static const int ERROR_IPSEC_MM_POLICY_EXISTS     13003L

//
// MessageId: ERROR_IPSEC_MM_POLICY_NOT_FOUND
//
// MessageText:
//
// The specified main mode policy was not found
//
static const int ERROR_IPSEC_MM_POLICY_NOT_FOUND  13004L

//
// MessageId: ERROR_IPSEC_MM_POLICY_IN_USE
//
// MessageText:
//
// The specified main mode policy is being used.
//
static const int ERROR_IPSEC_MM_POLICY_IN_USE     13005L

//
// MessageId: ERROR_IPSEC_MM_FILTER_EXISTS
//
// MessageText:
//
// The specified main mode filter already exists.
//
static const int ERROR_IPSEC_MM_FILTER_EXISTS     13006L

//
// MessageId: ERROR_IPSEC_MM_FILTER_NOT_FOUND
//
// MessageText:
//
// The specified main mode filter was not found.
//
static const int ERROR_IPSEC_MM_FILTER_NOT_FOUND  13007L

//
// MessageId: ERROR_IPSEC_TRANSPORT_FILTER_EXISTS
//
// MessageText:
//
// The specified transport mode filter already exists.
//
static const int ERROR_IPSEC_TRANSPORT_FILTER_EXISTS 13008L

//
// MessageId: ERROR_IPSEC_TRANSPORT_FILTER_NOT_FOUND
//
// MessageText:
//
// The specified transport mode filter does not exist.
//
static const int ERROR_IPSEC_TRANSPORT_FILTER_NOT_FOUND 13009L

//
// MessageId: ERROR_IPSEC_MM_AUTH_EXISTS
//
// MessageText:
//
// The specified main mode authentication list exists.
//
static const int ERROR_IPSEC_MM_AUTH_EXISTS       13010L

//
// MessageId: ERROR_IPSEC_MM_AUTH_NOT_FOUND
//
// MessageText:
//
// The specified main mode authentication list was not found.
//
static const int ERROR_IPSEC_MM_AUTH_NOT_FOUND    13011L

//
// MessageId: ERROR_IPSEC_MM_AUTH_IN_USE
//
// MessageText:
//
// The specified main mode authentication list is being used.
//
static const int ERROR_IPSEC_MM_AUTH_IN_USE       13012L

//
// MessageId: ERROR_IPSEC_DEFAULT_MM_POLICY_NOT_FOUND
//
// MessageText:
//
// The specified default main mode policy was not found.
//
static const int ERROR_IPSEC_DEFAULT_MM_POLICY_NOT_FOUND 13013L

//
// MessageId: ERROR_IPSEC_DEFAULT_MM_AUTH_NOT_FOUND
//
// MessageText:
//
// The specified default main mode authentication list was not found.
//
static const int ERROR_IPSEC_DEFAULT_MM_AUTH_NOT_FOUND 13014L

//
// MessageId: ERROR_IPSEC_DEFAULT_QM_POLICY_NOT_FOUND
//
// MessageText:
//
// The specified default quick mode policy was not found.
//
static const int ERROR_IPSEC_DEFAULT_QM_POLICY_NOT_FOUND 13015L

//
// MessageId: ERROR_IPSEC_TUNNEL_FILTER_EXISTS
//
// MessageText:
//
// The specified tunnel mode filter exists.
//
static const int ERROR_IPSEC_TUNNEL_FILTER_EXISTS 13016L

//
// MessageId: ERROR_IPSEC_TUNNEL_FILTER_NOT_FOUND
//
// MessageText:
//
// The specified tunnel mode filter was not found.
//
static const int ERROR_IPSEC_TUNNEL_FILTER_NOT_FOUND 13017L

//
// MessageId: ERROR_IPSEC_MM_FILTER_PENDING_DELETION
//
// MessageText:
//
// The Main Mode filter is pending deletion.
//
static const int ERROR_IPSEC_MM_FILTER_PENDING_DELETION 13018L

//
// MessageId: ERROR_IPSEC_TRANSPORT_FILTER_PENDING_DELETION
//
// MessageText:
//
// The transport filter is pending deletion.
//
static const int ERROR_IPSEC_TRANSPORT_FILTER_PENDING_DELETION 13019L

//
// MessageId: ERROR_IPSEC_TUNNEL_FILTER_PENDING_DELETION
//
// MessageText:
//
// The tunnel filter is pending deletion.
//
static const int ERROR_IPSEC_TUNNEL_FILTER_PENDING_DELETION 13020L

//
// MessageId: ERROR_IPSEC_MM_POLICY_PENDING_DELETION
//
// MessageText:
//
// The Main Mode policy is pending deletion.
//
static const int ERROR_IPSEC_MM_POLICY_PENDING_DELETION 13021L

//
// MessageId: ERROR_IPSEC_MM_AUTH_PENDING_DELETION
//
// MessageText:
//
// The Main Mode authentication bundle is pending deletion.
//
static const int ERROR_IPSEC_MM_AUTH_PENDING_DELETION 13022L

//
// MessageId: ERROR_IPSEC_QM_POLICY_PENDING_DELETION
//
// MessageText:
//
// The Quick Mode policy is pending deletion.
//
static const int ERROR_IPSEC_QM_POLICY_PENDING_DELETION 13023L

//
// MessageId: WARNING_IPSEC_MM_POLICY_PRUNED
//
// MessageText:
//
// The Main Mode policy was successfully added, but some of the requested offers are not supported.
//
static const int WARNING_IPSEC_MM_POLICY_PRUNED   13024L

//
// MessageId: WARNING_IPSEC_QM_POLICY_PRUNED
//
// MessageText:
//
// The Quick Mode policy was successfully added, but some of the requested offers are not supported.
//
static const int WARNING_IPSEC_QM_POLICY_PRUNED   13025L

//
// MessageId: ERROR_IPSEC_IKE_NEG_STATUS_BEGIN
//
// MessageText:
//
//  ERROR_IPSEC_IKE_NEG_STATUS_BEGIN
//
static const int ERROR_IPSEC_IKE_NEG_STATUS_BEGIN 13800L

//
// MessageId: ERROR_IPSEC_IKE_AUTH_FAIL
//
// MessageText:
//
// IKE authentication credentials are unacceptable
//
static const int ERROR_IPSEC_IKE_AUTH_FAIL        13801L

//
// MessageId: ERROR_IPSEC_IKE_ATTRIB_FAIL
//
// MessageText:
//
// IKE security attributes are unacceptable
//
static const int ERROR_IPSEC_IKE_ATTRIB_FAIL      13802L

//
// MessageId: ERROR_IPSEC_IKE_NEGOTIATION_PENDING
//
// MessageText:
//
// IKE Negotiation in progress
//
static const int ERROR_IPSEC_IKE_NEGOTIATION_PENDING 13803L

//
// MessageId: ERROR_IPSEC_IKE_GENERAL_PROCESSING_ERROR
//
// MessageText:
//
// General processing error
//
static const int ERROR_IPSEC_IKE_GENERAL_PROCESSING_ERROR 13804L

//
// MessageId: ERROR_IPSEC_IKE_TIMED_OUT
//
// MessageText:
//
// Negotiation timed out
//
static const int ERROR_IPSEC_IKE_TIMED_OUT        13805L

//
// MessageId: ERROR_IPSEC_IKE_NO_CERT
//
// MessageText:
//
// IKE failed to find valid machine certificate. Contact your Network Security Administrator about installing a valid certificate in the appropriate Certificate Store.
//
static const int ERROR_IPSEC_IKE_NO_CERT          13806L

//
// MessageId: ERROR_IPSEC_IKE_SA_DELETED
//
// MessageText:
//
// IKE SA deleted by peer before establishment completed
//
static const int ERROR_IPSEC_IKE_SA_DELETED       13807L

//
// MessageId: ERROR_IPSEC_IKE_SA_REAPED
//
// MessageText:
//
// IKE SA deleted before establishment completed
//
static const int ERROR_IPSEC_IKE_SA_REAPED        13808L

//
// MessageId: ERROR_IPSEC_IKE_MM_ACQUIRE_DROP
//
// MessageText:
//
// Negotiation request sat in Queue too long
//
static const int ERROR_IPSEC_IKE_MM_ACQUIRE_DROP  13809L

//
// MessageId: ERROR_IPSEC_IKE_QM_ACQUIRE_DROP
//
// MessageText:
//
// Negotiation request sat in Queue too long
//
static const int ERROR_IPSEC_IKE_QM_ACQUIRE_DROP  13810L

//
// MessageId: ERROR_IPSEC_IKE_QUEUE_DROP_MM
//
// MessageText:
//
// Negotiation request sat in Queue too long
//
static const int ERROR_IPSEC_IKE_QUEUE_DROP_MM    13811L

//
// MessageId: ERROR_IPSEC_IKE_QUEUE_DROP_NO_MM
//
// MessageText:
//
// Negotiation request sat in Queue too long
//
static const int ERROR_IPSEC_IKE_QUEUE_DROP_NO_MM 13812L

//
// MessageId: ERROR_IPSEC_IKE_DROP_NO_RESPONSE
//
// MessageText:
//
// No response from peer
//
static const int ERROR_IPSEC_IKE_DROP_NO_RESPONSE 13813L

//
// MessageId: ERROR_IPSEC_IKE_MM_DELAY_DROP
//
// MessageText:
//
// Negotiation took too long
//
static const int ERROR_IPSEC_IKE_MM_DELAY_DROP    13814L

//
// MessageId: ERROR_IPSEC_IKE_QM_DELAY_DROP
//
// MessageText:
//
// Negotiation took too long
//
static const int ERROR_IPSEC_IKE_QM_DELAY_DROP    13815L

//
// MessageId: ERROR_IPSEC_IKE_ERROR
//
// MessageText:
//
// Unknown error occurred
//
static const int ERROR_IPSEC_IKE_ERROR            13816L

//
// MessageId: ERROR_IPSEC_IKE_CRL_FAILED
//
// MessageText:
//
// Certificate Revocation Check failed
//
static const int ERROR_IPSEC_IKE_CRL_FAILED       13817L

//
// MessageId: ERROR_IPSEC_IKE_INVALID_KEY_USAGE
//
// MessageText:
//
// Invalid certificate key usage
//
static const int ERROR_IPSEC_IKE_INVALID_KEY_USAGE 13818L

//
// MessageId: ERROR_IPSEC_IKE_INVALID_CERT_TYPE
//
// MessageText:
//
// Invalid certificate type
//
static const int ERROR_IPSEC_IKE_INVALID_CERT_TYPE 13819L

//
// MessageId: ERROR_IPSEC_IKE_NO_PRIVATE_KEY
//
// MessageText:
//
// IKE negotiation failed because the machine certificate used does not have a private key. IPsec certificates require a private key. Contact your Network Security administrator about replacing with a certificate that has a private key.
//
static const int ERROR_IPSEC_IKE_NO_PRIVATE_KEY   13820L

//
// MessageId: ERROR_IPSEC_IKE_SIMULTANEOUS_REKEY
//
// MessageText:
//
// Simultaneous rekeys were detected.
//
static const int ERROR_IPSEC_IKE_SIMULTANEOUS_REKEY 13821L

//
// MessageId: ERROR_IPSEC_IKE_DH_FAIL
//
// MessageText:
//
// Failure in Diffie-Hellman computation
//
static const int ERROR_IPSEC_IKE_DH_FAIL          13822L

//
// MessageId: ERROR_IPSEC_IKE_CRITICAL_PAYLOAD_NOT_RECOGNIZED
//
// MessageText:
//
// Don't know how to process critical payload
//
static const int ERROR_IPSEC_IKE_CRITICAL_PAYLOAD_NOT_RECOGNIZED 13823L

//
// MessageId: ERROR_IPSEC_IKE_INVALID_HEADER
//
// MessageText:
//
// Invalid header
//
static const int ERROR_IPSEC_IKE_INVALID_HEADER   13824L

//
// MessageId: ERROR_IPSEC_IKE_NO_POLICY
//
// MessageText:
//
// No policy configured
//
static const int ERROR_IPSEC_IKE_NO_POLICY        13825L

//
// MessageId: ERROR_IPSEC_IKE_INVALID_SIGNATURE
//
// MessageText:
//
// Failed to verify signature
//
static const int ERROR_IPSEC_IKE_INVALID_SIGNATURE 13826L

//
// MessageId: ERROR_IPSEC_IKE_KERBEROS_ERROR
//
// MessageText:
//
// Failed to authenticate using Kerberos
//
static const int ERROR_IPSEC_IKE_KERBEROS_ERROR   13827L

//
// MessageId: ERROR_IPSEC_IKE_NO_PUBLIC_KEY
//
// MessageText:
//
// Peer's certificate did not have a public key
//
static const int ERROR_IPSEC_IKE_NO_PUBLIC_KEY    13828L

// These must stay as a unit.
//
// MessageId: ERROR_IPSEC_IKE_PROCESS_ERR
//
// MessageText:
//
// Error processing error payload
//
static const int ERROR_IPSEC_IKE_PROCESS_ERR      13829L

//
// MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_SA
//
// MessageText:
//
// Error processing SA payload
//
static const int ERROR_IPSEC_IKE_PROCESS_ERR_SA   13830L

//
// MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_PROP
//
// MessageText:
//
// Error processing Proposal payload
//
static const int ERROR_IPSEC_IKE_PROCESS_ERR_PROP 13831L

//
// MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_TRANS
//
// MessageText:
//
// Error processing Transform payload
//
static const int ERROR_IPSEC_IKE_PROCESS_ERR_TRANS 13832L

//
// MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_KE
//
// MessageText:
//
// Error processing KE payload
//
static const int ERROR_IPSEC_IKE_PROCESS_ERR_KE   13833L

//
// MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_ID
//
// MessageText:
//
// Error processing ID payload
//
static const int ERROR_IPSEC_IKE_PROCESS_ERR_ID   13834L

//
// MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_CERT
//
// MessageText:
//
// Error processing Cert payload
//
static const int ERROR_IPSEC_IKE_PROCESS_ERR_CERT 13835L

//
// MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_CERT_REQ
//
// MessageText:
//
// Error processing Certificate Request payload
//
static const int ERROR_IPSEC_IKE_PROCESS_ERR_CERT_REQ 13836L

//
// MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_HASH
//
// MessageText:
//
// Error processing Hash payload
//
static const int ERROR_IPSEC_IKE_PROCESS_ERR_HASH 13837L

//
// MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_SIG
//
// MessageText:
//
// Error processing Signature payload
//
static const int ERROR_IPSEC_IKE_PROCESS_ERR_SIG  13838L

//
// MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_NONCE
//
// MessageText:
//
// Error processing Nonce payload
//
static const int ERROR_IPSEC_IKE_PROCESS_ERR_NONCE 13839L

//
// MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_NOTIFY
//
// MessageText:
//
// Error processing Notify payload
//
static const int ERROR_IPSEC_IKE_PROCESS_ERR_NOTIFY 13840L

//
// MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_DELETE
//
// MessageText:
//
// Error processing Delete Payload
//
static const int ERROR_IPSEC_IKE_PROCESS_ERR_DELETE 13841L

//
// MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_VENDOR
//
// MessageText:
//
// Error processing VendorId payload
//
static const int ERROR_IPSEC_IKE_PROCESS_ERR_VENDOR 13842L

//
// MessageId: ERROR_IPSEC_IKE_INVALID_PAYLOAD
//
// MessageText:
//
// Invalid payload received
//
static const int ERROR_IPSEC_IKE_INVALID_PAYLOAD  13843L

//
// MessageId: ERROR_IPSEC_IKE_LOAD_SOFT_SA
//
// MessageText:
//
// Soft SA loaded
//
static const int ERROR_IPSEC_IKE_LOAD_SOFT_SA     13844L

//
// MessageId: ERROR_IPSEC_IKE_SOFT_SA_TORN_DOWN
//
// MessageText:
//
// Soft SA torn down
//
static const int ERROR_IPSEC_IKE_SOFT_SA_TORN_DOWN 13845L

//
// MessageId: ERROR_IPSEC_IKE_INVALID_COOKIE
//
// MessageText:
//
// Invalid cookie received.
//
static const int ERROR_IPSEC_IKE_INVALID_COOKIE   13846L

//
// MessageId: ERROR_IPSEC_IKE_NO_PEER_CERT
//
// MessageText:
//
// Peer failed to send valid machine certificate
//
static const int ERROR_IPSEC_IKE_NO_PEER_CERT     13847L

//
// MessageId: ERROR_IPSEC_IKE_PEER_CRL_FAILED
//
// MessageText:
//
// Certification Revocation check of peer's certificate failed
//
static const int ERROR_IPSEC_IKE_PEER_CRL_FAILED  13848L

//
// MessageId: ERROR_IPSEC_IKE_POLICY_CHANGE
//
// MessageText:
//
// New policy invalidated SAs formed with old policy
//
static const int ERROR_IPSEC_IKE_POLICY_CHANGE    13849L

//
// MessageId: ERROR_IPSEC_IKE_NO_MM_POLICY
//
// MessageText:
//
// There is no available Main Mode IKE policy.
//
static const int ERROR_IPSEC_IKE_NO_MM_POLICY     13850L

//
// MessageId: ERROR_IPSEC_IKE_NOTCBPRIV
//
// MessageText:
//
// Failed to enabled TCB privilege.
//
static const int ERROR_IPSEC_IKE_NOTCBPRIV        13851L

//
// MessageId: ERROR_IPSEC_IKE_SECLOADFAIL
//
// MessageText:
//
// Failed to load SECURITY.DLL.
//
static const int ERROR_IPSEC_IKE_SECLOADFAIL      13852L

//
// MessageId: ERROR_IPSEC_IKE_FAILSSPINIT
//
// MessageText:
//
// Failed to obtain security function table dispatch address from SSPI.
//
static const int ERROR_IPSEC_IKE_FAILSSPINIT      13853L

//
// MessageId: ERROR_IPSEC_IKE_FAILQUERYSSP
//
// MessageText:
//
// Failed to query Kerberos package to obtain max token size.
//
static const int ERROR_IPSEC_IKE_FAILQUERYSSP     13854L

//
// MessageId: ERROR_IPSEC_IKE_SRVACQFAIL
//
// MessageText:
//
// Failed to obtain Kerberos server credentials for ISAKMP/ERROR_IPSEC_IKE service. Kerberos authentication will not function. The most likely reason for this is lack of domain membership. This is normal if your computer is a member of a workgroup.
//
static const int ERROR_IPSEC_IKE_SRVACQFAIL       13855L

//
// MessageId: ERROR_IPSEC_IKE_SRVQUERYCRED
//
// MessageText:
//
// Failed to determine SSPI principal name for ISAKMP/ERROR_IPSEC_IKE service (QueryCredentialsAttributes).
//
static const int ERROR_IPSEC_IKE_SRVQUERYCRED     13856L

//
// MessageId: ERROR_IPSEC_IKE_GETSPIFAIL
//
// MessageText:
//
// Failed to obtain new SPI for the inbound SA from IPsec driver. The most common cause for this is that the driver does not have the correct filter. Check your policy to verify the filters.
//
static const int ERROR_IPSEC_IKE_GETSPIFAIL       13857L

//
// MessageId: ERROR_IPSEC_IKE_INVALID_FILTER
//
// MessageText:
//
// Given filter is invalid
//
static const int ERROR_IPSEC_IKE_INVALID_FILTER   13858L

//
// MessageId: ERROR_IPSEC_IKE_OUT_OF_MEMORY
//
// MessageText:
//
// Memory allocation failed.
//
static const int ERROR_IPSEC_IKE_OUT_OF_MEMORY    13859L

//
// MessageId: ERROR_IPSEC_IKE_ADD_UPDATE_KEY_FAILED
//
// MessageText:
//
// Failed to add Security Association to IPsec Driver. The most common cause for this is if the IKE negotiation took too long to complete. If the problem persists, reduce the load on the faulting machine.
//
static const int ERROR_IPSEC_IKE_ADD_UPDATE_KEY_FAILED 13860L

//
// MessageId: ERROR_IPSEC_IKE_INVALID_POLICY
//
// MessageText:
//
// Invalid policy
//
static const int ERROR_IPSEC_IKE_INVALID_POLICY   13861L

//
// MessageId: ERROR_IPSEC_IKE_UNKNOWN_DOI
//
// MessageText:
//
// Invalid DOI
//
static const int ERROR_IPSEC_IKE_UNKNOWN_DOI      13862L

//
// MessageId: ERROR_IPSEC_IKE_INVALID_SITUATION
//
// MessageText:
//
// Invalid situation
//
static const int ERROR_IPSEC_IKE_INVALID_SITUATION 13863L

//
// MessageId: ERROR_IPSEC_IKE_DH_FAILURE
//
// MessageText:
//
// Diffie-Hellman failure
//
static const int ERROR_IPSEC_IKE_DH_FAILURE       13864L

//
// MessageId: ERROR_IPSEC_IKE_INVALID_GROUP
//
// MessageText:
//
// Invalid Diffie-Hellman group
//
static const int ERROR_IPSEC_IKE_INVALID_GROUP    13865L

//
// MessageId: ERROR_IPSEC_IKE_ENCRYPT
//
// MessageText:
//
// Error encrypting payload
//
static const int ERROR_IPSEC_IKE_ENCRYPT          13866L

//
// MessageId: ERROR_IPSEC_IKE_DECRYPT
//
// MessageText:
//
// Error decrypting payload
//
static const int ERROR_IPSEC_IKE_DECRYPT          13867L

//
// MessageId: ERROR_IPSEC_IKE_POLICY_MATCH
//
// MessageText:
//
// Policy match error
//
static const int ERROR_IPSEC_IKE_POLICY_MATCH     13868L

//
// MessageId: ERROR_IPSEC_IKE_UNSUPPORTED_ID
//
// MessageText:
//
// Unsupported ID
//
static const int ERROR_IPSEC_IKE_UNSUPPORTED_ID   13869L

//
// MessageId: ERROR_IPSEC_IKE_INVALID_HASH
//
// MessageText:
//
// Hash verification failed
//
static const int ERROR_IPSEC_IKE_INVALID_HASH     13870L

//
// MessageId: ERROR_IPSEC_IKE_INVALID_HASH_ALG
//
// MessageText:
//
// Invalid hash algorithm
//
static const int ERROR_IPSEC_IKE_INVALID_HASH_ALG 13871L

//
// MessageId: ERROR_IPSEC_IKE_INVALID_HASH_SIZE
//
// MessageText:
//
// Invalid hash size
//
static const int ERROR_IPSEC_IKE_INVALID_HASH_SIZE 13872L

//
// MessageId: ERROR_IPSEC_IKE_INVALID_ENCRYPT_ALG
//
// MessageText:
//
// Invalid encryption algorithm
//
static const int ERROR_IPSEC_IKE_INVALID_ENCRYPT_ALG 13873L

//
// MessageId: ERROR_IPSEC_IKE_INVALID_AUTH_ALG
//
// MessageText:
//
// Invalid authentication algorithm
//
static const int ERROR_IPSEC_IKE_INVALID_AUTH_ALG 13874L

//
// MessageId: ERROR_IPSEC_IKE_INVALID_SIG
//
// MessageText:
//
// Invalid certificate signature
//
static const int ERROR_IPSEC_IKE_INVALID_SIG      13875L

//
// MessageId: ERROR_IPSEC_IKE_LOAD_FAILED
//
// MessageText:
//
// Load failed
//
static const int ERROR_IPSEC_IKE_LOAD_FAILED      13876L

//
// MessageId: ERROR_IPSEC_IKE_RPC_DELETE
//
// MessageText:
//
// Deleted via RPC call
//
static const int ERROR_IPSEC_IKE_RPC_DELETE       13877L

//
// MessageId: ERROR_IPSEC_IKE_BENIGN_REINIT
//
// MessageText:
//
// Temporary state created to perform reinitialization. This is not a real failure.
//
static const int ERROR_IPSEC_IKE_BENIGN_REINIT    13878L

//
// MessageId: ERROR_IPSEC_IKE_INVALID_RESPONDER_LIFETIME_NOTIFY
//
// MessageText:
//
// The lifetime value received in the Responder Lifetime Notify is below the Windows 2000 configured minimum value. Please fix the policy on the peer machine.
//
static const int ERROR_IPSEC_IKE_INVALID_RESPONDER_LIFETIME_NOTIFY 13879L

//
// MessageId: ERROR_IPSEC_IKE_INVALID_MAJOR_VERSION
//
// MessageText:
//
// The recipient cannot handle version of IKE specified in the header.
//
static const int ERROR_IPSEC_IKE_INVALID_MAJOR_VERSION 13880L

//
// MessageId: ERROR_IPSEC_IKE_INVALID_CERT_KEYLEN
//
// MessageText:
//
// Key length in certificate is too small for configured security requirements.
//
static const int ERROR_IPSEC_IKE_INVALID_CERT_KEYLEN 13881L

//
// MessageId: ERROR_IPSEC_IKE_MM_LIMIT
//
// MessageText:
//
// Max number of established MM SAs to peer exceeded.
//
static const int ERROR_IPSEC_IKE_MM_LIMIT         13882L

//
// MessageId: ERROR_IPSEC_IKE_NEGOTIATION_DISABLED
//
// MessageText:
//
// IKE received a policy that disables negotiation.
//
static const int ERROR_IPSEC_IKE_NEGOTIATION_DISABLED 13883L

//
// MessageId: ERROR_IPSEC_IKE_QM_LIMIT
//
// MessageText:
//
// Reached maximum quick mode limit for the main mode. New main mode will be started.
//
static const int ERROR_IPSEC_IKE_QM_LIMIT         13884L

//
// MessageId: ERROR_IPSEC_IKE_MM_EXPIRED
//
// MessageText:
//
// Main mode SA lifetime expired or peer sent a main mode delete.
//
static const int ERROR_IPSEC_IKE_MM_EXPIRED       13885L

//
// MessageId: ERROR_IPSEC_IKE_PEER_MM_ASSUMED_INVALID
//
// MessageText:
//
// Main mode SA assumed to be invalid because peer stopped responding.
//
static const int ERROR_IPSEC_IKE_PEER_MM_ASSUMED_INVALID 13886L

//
// MessageId: ERROR_IPSEC_IKE_CERT_CHAIN_POLICY_MISMATCH
//
// MessageText:
//
// Certificate doesn't chain to a trusted root in IPsec policy.
//
static const int ERROR_IPSEC_IKE_CERT_CHAIN_POLICY_MISMATCH 13887L

//
// MessageId: ERROR_IPSEC_IKE_UNEXPECTED_MESSAGE_ID
//
// MessageText:
//
// Received unexpected message ID.
//
static const int ERROR_IPSEC_IKE_UNEXPECTED_MESSAGE_ID 13888L

//
// MessageId: ERROR_IPSEC_IKE_INVALID_AUTH_PAYLOAD
//
// MessageText:
//
// Received invalid authentication offers.
//
static const int ERROR_IPSEC_IKE_INVALID_AUTH_PAYLOAD 13889L

//
// MessageId: ERROR_IPSEC_IKE_DOS_COOKIE_SENT
//
// MessageText:
//
// Sent DoS cookie notify to initiator.
//
static const int ERROR_IPSEC_IKE_DOS_COOKIE_SENT  13890L

//
// MessageId: ERROR_IPSEC_IKE_SHUTTING_DOWN
//
// MessageText:
//
// IKE service is shutting down.
//
static const int ERROR_IPSEC_IKE_SHUTTING_DOWN    13891L

//
// MessageId: ERROR_IPSEC_IKE_CGA_AUTH_FAILED
//
// MessageText:
//
// Could not verify binding between CGA address and certificate.
//
static const int ERROR_IPSEC_IKE_CGA_AUTH_FAILED  13892L

//
// MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_NATOA
//
// MessageText:
//
// Error processing NatOA payload.
//
static const int ERROR_IPSEC_IKE_PROCESS_ERR_NATOA 13893L

//
// MessageId: ERROR_IPSEC_IKE_INVALID_MM_FOR_QM
//
// MessageText:
//
// Parameters of the main mode are invalid for this quick mode.
//
static const int ERROR_IPSEC_IKE_INVALID_MM_FOR_QM 13894L

//
// MessageId: ERROR_IPSEC_IKE_QM_EXPIRED
//
// MessageText:
//
// Quick mode SA was expired by IPsec driver.
//
static const int ERROR_IPSEC_IKE_QM_EXPIRED       13895L

//
// MessageId: ERROR_IPSEC_IKE_TOO_MANY_FILTERS
//
// MessageText:
//
// Too many dynamically added IKEEXT filters were detected.
//
static const int ERROR_IPSEC_IKE_TOO_MANY_FILTERS 13896L

// Do NOT change this final value.  It is used in a public API structure
//
// MessageId: ERROR_IPSEC_IKE_NEG_STATUS_END
//
// MessageText:
//
//  ERROR_IPSEC_IKE_NEG_STATUS_END
//
static const int ERROR_IPSEC_IKE_NEG_STATUS_END   13897L

//
// MessageId: ERROR_IPSEC_IKE_KILL_DUMMY_NAP_TUNNEL
//
// MessageText:
//
// NAP reauth succeeded and must delete the dummy NAP IKEv2 tunnel.
//
static const int ERROR_IPSEC_IKE_KILL_DUMMY_NAP_TUNNEL 13898L

//
// MessageId: ERROR_IPSEC_IKE_INNER_IP_ASSIGNMENT_FAILURE
//
// MessageText:
//
// Error in assigning inner IP address to initiator in tunnel mode.
//
static const int ERROR_IPSEC_IKE_INNER_IP_ASSIGNMENT_FAILURE 13899L

//
// MessageId: ERROR_IPSEC_IKE_REQUIRE_CP_PAYLOAD_MISSING
//
// MessageText:
//
// Require configuration payload missing.
//
static const int ERROR_IPSEC_IKE_REQUIRE_CP_PAYLOAD_MISSING 13900L

//
// MessageId: ERROR_IPSEC_KEY_MODULE_IMPERSONATION_NEGOTIATION_PENDING
//
// MessageText:
//
// A negotiation running as the security principle who issued the connection is in progress
//
static const int ERROR_IPSEC_KEY_MODULE_IMPERSONATION_NEGOTIATION_PENDING 13901L

//
// MessageId: ERROR_IPSEC_IKE_COEXISTENCE_SUPPRESS
//
// MessageText:
//
// SA was deleted due to IKEv1/AuthIP co-existence suppress check.
//
static const int ERROR_IPSEC_IKE_COEXISTENCE_SUPPRESS 13902L

//
// MessageId: ERROR_IPSEC_IKE_RATELIMIT_DROP
//
// MessageText:
//
// Incoming SA request was dropped due to peer IP address rate limiting.
//
static const int ERROR_IPSEC_IKE_RATELIMIT_DROP   13903L

//
// MessageId: ERROR_IPSEC_IKE_PEER_DOESNT_SUPPORT_MOBIKE
//
// MessageText:
//
// Peer does not support MOBIKE.
//
static const int ERROR_IPSEC_IKE_PEER_DOESNT_SUPPORT_MOBIKE 13904L

//
// MessageId: ERROR_IPSEC_IKE_AUTHORIZATION_FAILURE
//
// MessageText:
//
// SA establishment is not authorized.
//
static const int ERROR_IPSEC_IKE_AUTHORIZATION_FAILURE 13905L

//
// MessageId: ERROR_IPSEC_IKE_STRONG_CRED_AUTHORIZATION_FAILURE
//
// MessageText:
//
// SA establishment is not authorized because there is not a sufficiently strong PKINIT-based credential.
//
static const int ERROR_IPSEC_IKE_STRONG_CRED_AUTHORIZATION_FAILURE 13906L

//
// MessageId: ERROR_IPSEC_IKE_AUTHORIZATION_FAILURE_WITH_OPTIONAL_RETRY
//
// MessageText:
//
// SA establishment is not authorized.  You may need to enter updated or different credentials such as a smartcard.
//
static const int ERROR_IPSEC_IKE_AUTHORIZATION_FAILURE_WITH_OPTIONAL_RETRY 13907L

//
// MessageId: ERROR_IPSEC_IKE_STRONG_CRED_AUTHORIZATION_AND_CERTMAP_FAILURE
//
// MessageText:
//
// SA establishment is not authorized because there is not a sufficiently strong PKINIT-based credential. This might be related to certificate-to-account mapping failure for the SA.
//
static const int ERROR_IPSEC_IKE_STRONG_CRED_AUTHORIZATION_AND_CERTMAP_FAILURE 13908L

// Extended upper bound for IKE errors to accomodate new errors
//
// MessageId: ERROR_IPSEC_IKE_NEG_STATUS_EXTENDED_END
//
// MessageText:
//
//  ERROR_IPSEC_IKE_NEG_STATUS_EXTENDED_END
//
static const int ERROR_IPSEC_IKE_NEG_STATUS_EXTENDED_END 13909L

//
// Following error codes are returned by IPsec kernel.
//
//
// MessageId: ERROR_IPSEC_BAD_SPI
//
// MessageText:
//
// The SPI in the packet does not match a valid IPsec SA.
//
static const int ERROR_IPSEC_BAD_SPI              13910L

//
// MessageId: ERROR_IPSEC_SA_LIFETIME_EXPIRED
//
// MessageText:
//
// Packet was received on an IPsec SA whose lifetime has expired.
//
static const int ERROR_IPSEC_SA_LIFETIME_EXPIRED  13911L

//
// MessageId: ERROR_IPSEC_WRONG_SA
//
// MessageText:
//
// Packet was received on an IPsec SA that does not match the packet characteristics.
//
static const int ERROR_IPSEC_WRONG_SA             13912L

//
// MessageId: ERROR_IPSEC_REPLAY_CHECK_FAILED
//
// MessageText:
//
// Packet sequence number replay check failed.
//
static const int ERROR_IPSEC_REPLAY_CHECK_FAILED  13913L

//
// MessageId: ERROR_IPSEC_INVALID_PACKET
//
// MessageText:
//
// IPsec header and/or trailer in the packet is invalid.
//
static const int ERROR_IPSEC_INVALID_PACKET       13914L

//
// MessageId: ERROR_IPSEC_INTEGRITY_CHECK_FAILED
//
// MessageText:
//
// IPsec integrity check failed.
//
static const int ERROR_IPSEC_INTEGRITY_CHECK_FAILED 13915L

//
// MessageId: ERROR_IPSEC_CLEAR_TEXT_DROP
//
// MessageText:
//
// IPsec dropped a clear text packet.
//
static const int ERROR_IPSEC_CLEAR_TEXT_DROP      13916L

//
// MessageId: ERROR_IPSEC_AUTH_FIREWALL_DROP
//
// MessageText:
//
// IPsec dropped an incoming ESP packet in authenticated firewall mode. This drop is benign.
//
static const int ERROR_IPSEC_AUTH_FIREWALL_DROP   13917L

//
// MessageId: ERROR_IPSEC_THROTTLE_DROP
//
// MessageText:
//
// IPsec dropped a packet due to DoS throttling.
//
static const int ERROR_IPSEC_THROTTLE_DROP        13918L

//
// MessageId: ERROR_IPSEC_DOSP_BLOCK
//
// MessageText:
//
// IPsec DoS Protection matched an explicit block rule.
//
static const int ERROR_IPSEC_DOSP_BLOCK           13925L

//
// MessageId: ERROR_IPSEC_DOSP_RECEIVED_MULTICAST
//
// MessageText:
//
// IPsec DoS Protection received an IPsec specific multicast packet which is not allowed.
//
static const int ERROR_IPSEC_DOSP_RECEIVED_MULTICAST 13926L

//
// MessageId: ERROR_IPSEC_DOSP_INVALID_PACKET
//
// MessageText:
//
// IPsec DoS Protection received an incorrectly formatted packet.
//
static const int ERROR_IPSEC_DOSP_INVALID_PACKET  13927L

//
// MessageId: ERROR_IPSEC_DOSP_STATE_LOOKUP_FAILED
//
// MessageText:
//
// IPsec DoS Protection failed to look up state.
//
static const int ERROR_IPSEC_DOSP_STATE_LOOKUP_FAILED 13928L

//
// MessageId: ERROR_IPSEC_DOSP_MAX_ENTRIES
//
// MessageText:
//
// IPsec DoS Protection failed to create state because the maximum number of entries allowed by policy has been reached.
//
static const int ERROR_IPSEC_DOSP_MAX_ENTRIES     13929L

//
// MessageId: ERROR_IPSEC_DOSP_KEYMOD_NOT_ALLOWED
//
// MessageText:
//
// IPsec DoS Protection received an IPsec negotiation packet for a keying module which is not allowed by policy.
//
static const int ERROR_IPSEC_DOSP_KEYMOD_NOT_ALLOWED 13930L

//
// MessageId: ERROR_IPSEC_DOSP_NOT_INSTALLED
//
// MessageText:
//
// IPsec DoS Protection has not been enabled.
//
static const int ERROR_IPSEC_DOSP_NOT_INSTALLED   13931L

//
// MessageId: ERROR_IPSEC_DOSP_MAX_PER_IP_RATELIMIT_QUEUES
//
// MessageText:
//
// IPsec DoS Protection failed to create a per internal IP rate limit queue because the maximum number of queues allowed by policy has been reached.
//
static const int ERROR_IPSEC_DOSP_MAX_PER_IP_RATELIMIT_QUEUES 13932L


///////////////////////////////////////////////////
//                                               //
//           End of IPSec Error codes            //
//                                               //
//                 13000 to 13999                //
///////////////////////////////////////////////////


///////////////////////////////////////////////////
//                                               //
//         Start of Side By Side Error Codes     //
//                                               //
//                 14000 to 14999                //
///////////////////////////////////////////////////

//
// MessageId: ERROR_SXS_SECTION_NOT_FOUND
//
// MessageText:
//
// The requested section was not present in the activation context.
//
static const int ERROR_SXS_SECTION_NOT_FOUND      14000L

//
// MessageId: ERROR_SXS_CANT_GEN_ACTCTX
//
// MessageText:
//
// The application has failed to start because its side-by-side configuration is incorrect. Please see the application event log or use the command-line sxstrace.exe tool for more detail.
//
static const int ERROR_SXS_CANT_GEN_ACTCTX        14001L

//
// MessageId: ERROR_SXS_INVALID_ACTCTXDATA_FORMAT
//
// MessageText:
//
// The application binding data format is invalid.
//
static const int ERROR_SXS_INVALID_ACTCTXDATA_FORMAT 14002L

//
// MessageId: ERROR_SXS_ASSEMBLY_NOT_FOUND
//
// MessageText:
//
// The referenced assembly is not installed on your system.
//
static const int ERROR_SXS_ASSEMBLY_NOT_FOUND     14003L

//
// MessageId: ERROR_SXS_MANIFEST_FORMAT_ERROR
//
// MessageText:
//
// The manifest file does not begin with the required tag and format information.
//
static const int ERROR_SXS_MANIFEST_FORMAT_ERROR  14004L

//
// MessageId: ERROR_SXS_MANIFEST_PARSE_ERROR
//
// MessageText:
//
// The manifest file contains one or more syntax errors.
//
static const int ERROR_SXS_MANIFEST_PARSE_ERROR   14005L

//
// MessageId: ERROR_SXS_ACTIVATION_CONTEXT_DISABLED
//
// MessageText:
//
// The application attempted to activate a disabled activation context.
//
static const int ERROR_SXS_ACTIVATION_CONTEXT_DISABLED 14006L

//
// MessageId: ERROR_SXS_KEY_NOT_FOUND
//
// MessageText:
//
// The requested lookup key was not found in any active activation context.
//
static const int ERROR_SXS_KEY_NOT_FOUND          14007L

//
// MessageId: ERROR_SXS_VERSION_CONFLICT
//
// MessageText:
//
// A component version required by the application conflicts with another component version already active.
//
static const int ERROR_SXS_VERSION_CONFLICT       14008L

//
// MessageId: ERROR_SXS_WRONG_SECTION_TYPE
//
// MessageText:
//
// The type requested activation context section does not match the query API used.
//
static const int ERROR_SXS_WRONG_SECTION_TYPE     14009L

//
// MessageId: ERROR_SXS_THREAD_QUERIES_DISABLED
//
// MessageText:
//
// Lack of system resources has required isolated activation to be disabled for the current thread of execution.
//
static const int ERROR_SXS_THREAD_QUERIES_DISABLED 14010L

//
// MessageId: ERROR_SXS_PROCESS_DEFAULT_ALREADY_SET
//
// MessageText:
//
// An attempt to set the process default activation context failed because the process default activation context was already set.
//
static const int ERROR_SXS_PROCESS_DEFAULT_ALREADY_SET 14011L

//
// MessageId: ERROR_SXS_UNKNOWN_ENCODING_GROUP
//
// MessageText:
//
// The encoding group identifier specified is not recognized.
//
static const int ERROR_SXS_UNKNOWN_ENCODING_GROUP 14012L

//
// MessageId: ERROR_SXS_UNKNOWN_ENCODING
//
// MessageText:
//
// The encoding requested is not recognized.
//
static const int ERROR_SXS_UNKNOWN_ENCODING       14013L

//
// MessageId: ERROR_SXS_INVALID_XML_NAMESPACE_URI
//
// MessageText:
//
// The manifest contains a reference to an invalid URI.
//
static const int ERROR_SXS_INVALID_XML_NAMESPACE_URI 14014L

//
// MessageId: ERROR_SXS_ROOT_MANIFEST_DEPENDENCY_NOT_INSTALLED
//
// MessageText:
//
// The application manifest contains a reference to a dependent assembly which is not installed
//
static const int ERROR_SXS_ROOT_MANIFEST_DEPENDENCY_NOT_INSTALLED 14015L

//
// MessageId: ERROR_SXS_LEAF_MANIFEST_DEPENDENCY_NOT_INSTALLED
//
// MessageText:
//
// The manifest for an assembly used by the application has a reference to a dependent assembly which is not installed
//
static const int ERROR_SXS_LEAF_MANIFEST_DEPENDENCY_NOT_INSTALLED 14016L

//
// MessageId: ERROR_SXS_INVALID_ASSEMBLY_IDENTITY_ATTRIBUTE
//
// MessageText:
//
// The manifest contains an attribute for the assembly identity which is not valid.
//
static const int ERROR_SXS_INVALID_ASSEMBLY_IDENTITY_ATTRIBUTE 14017L

//
// MessageId: ERROR_SXS_MANIFEST_MISSING_REQUIRED_DEFAULT_NAMESPACE
//
// MessageText:
//
// The manifest is missing the required default namespace specification on the assembly element.
//
static const int ERROR_SXS_MANIFEST_MISSING_REQUIRED_DEFAULT_NAMESPACE 14018L

//
// MessageId: ERROR_SXS_MANIFEST_INVALID_REQUIRED_DEFAULT_NAMESPACE
//
// MessageText:
//
// The manifest has a default namespace specified on the assembly element but its value is not "urn:schemas-microsoft-com:asm.v1".
//
static const int ERROR_SXS_MANIFEST_INVALID_REQUIRED_DEFAULT_NAMESPACE 14019L

//
// MessageId: ERROR_SXS_PRIVATE_MANIFEST_CROSS_PATH_WITH_REPARSE_POINT
//
// MessageText:
//
// The private manifest probed has crossed a path with an unsupported reparse point.
//
static const int ERROR_SXS_PRIVATE_MANIFEST_CROSS_PATH_WITH_REPARSE_POINT 14020L

//
// MessageId: ERROR_SXS_DUPLICATE_DLL_NAME
//
// MessageText:
//
// Two or more components referenced directly or indirectly by the application manifest have files by the same name.
//
static const int ERROR_SXS_DUPLICATE_DLL_NAME     14021L

//
// MessageId: ERROR_SXS_DUPLICATE_WINDOWCLASS_NAME
//
// MessageText:
//
// Two or more components referenced directly or indirectly by the application manifest have window classes with the same name.
//
static const int ERROR_SXS_DUPLICATE_WINDOWCLASS_NAME 14022L

//
// MessageId: ERROR_SXS_DUPLICATE_CLSID
//
// MessageText:
//
// Two or more components referenced directly or indirectly by the application manifest have the same COM server CLSIDs.
//
static const int ERROR_SXS_DUPLICATE_CLSID        14023L

//
// MessageId: ERROR_SXS_DUPLICATE_IID
//
// MessageText:
//
// Two or more components referenced directly or indirectly by the application manifest have proxies for the same COM interface IIDs.
//
static const int ERROR_SXS_DUPLICATE_IID          14024L

//
// MessageId: ERROR_SXS_DUPLICATE_TLBID
//
// MessageText:
//
// Two or more components referenced directly or indirectly by the application manifest have the same COM type library TLBIDs.
//
static const int ERROR_SXS_DUPLICATE_TLBID        14025L

//
// MessageId: ERROR_SXS_DUPLICATE_PROGID
//
// MessageText:
//
// Two or more components referenced directly or indirectly by the application manifest have the same COM ProgIDs.
//
static const int ERROR_SXS_DUPLICATE_PROGID       14026L

//
// MessageId: ERROR_SXS_DUPLICATE_ASSEMBLY_NAME
//
// MessageText:
//
// Two or more components referenced directly or indirectly by the application manifest are different versions of the same component which is not permitted.
//
static const int ERROR_SXS_DUPLICATE_ASSEMBLY_NAME 14027L

//
// MessageId: ERROR_SXS_FILE_HASH_MISMATCH
//
// MessageText:
//
// A component's file does not match the verification information present in the component manifest.
//
static const int ERROR_SXS_FILE_HASH_MISMATCH     14028L

//
// MessageId: ERROR_SXS_POLICY_PARSE_ERROR
//
// MessageText:
//
// The policy manifest contains one or more syntax errors.
//
static const int ERROR_SXS_POLICY_PARSE_ERROR     14029L

//
// MessageId: ERROR_SXS_XML_E_MISSINGQUOTE
//
// MessageText:
//
// Manifest Parse Error : A string literal was expected, but no opening quote character was found.
//
static const int ERROR_SXS_XML_E_MISSINGQUOTE     14030L

//
// MessageId: ERROR_SXS_XML_E_COMMENTSYNTAX
//
// MessageText:
//
// Manifest Parse Error : Incorrect syntax was used in a comment.
//
static const int ERROR_SXS_XML_E_COMMENTSYNTAX    14031L

//
// MessageId: ERROR_SXS_XML_E_BADSTARTNAMECHAR
//
// MessageText:
//
// Manifest Parse Error : A name was started with an invalid character.
//
static const int ERROR_SXS_XML_E_BADSTARTNAMECHAR 14032L

//
// MessageId: ERROR_SXS_XML_E_BADNAMECHAR
//
// MessageText:
//
// Manifest Parse Error : A name contained an invalid character.
//
static const int ERROR_SXS_XML_E_BADNAMECHAR      14033L

//
// MessageId: ERROR_SXS_XML_E_BADCHARINSTRING
//
// MessageText:
//
// Manifest Parse Error : A string literal contained an invalid character.
//
static const int ERROR_SXS_XML_E_BADCHARINSTRING  14034L

//
// MessageId: ERROR_SXS_XML_E_XMLDECLSYNTAX
//
// MessageText:
//
// Manifest Parse Error : Invalid syntax for an xml declaration.
//
static const int ERROR_SXS_XML_E_XMLDECLSYNTAX    14035L

//
// MessageId: ERROR_SXS_XML_E_BADCHARDATA
//
// MessageText:
//
// Manifest Parse Error : An Invalid character was found in text content.
//
static const int ERROR_SXS_XML_E_BADCHARDATA      14036L

//
// MessageId: ERROR_SXS_XML_E_MISSINGWHITESPACE
//
// MessageText:
//
// Manifest Parse Error : Required white space was missing.
//
static const int ERROR_SXS_XML_E_MISSINGWHITESPACE 14037L

//
// MessageId: ERROR_SXS_XML_E_EXPECTINGTAGEND
//
// MessageText:
//
// Manifest Parse Error : The character '>' was expected.
//
static const int ERROR_SXS_XML_E_EXPECTINGTAGEND  14038L

//
// MessageId: ERROR_SXS_XML_E_MISSINGSEMICOLON
//
// MessageText:
//
// Manifest Parse Error : A semi colon character was expected.
//
static const int ERROR_SXS_XML_E_MISSINGSEMICOLON 14039L

//
// MessageId: ERROR_SXS_XML_E_UNBALANCEDPAREN
//
// MessageText:
//
// Manifest Parse Error : Unbalanced parentheses.
//
static const int ERROR_SXS_XML_E_UNBALANCEDPAREN  14040L

//
// MessageId: ERROR_SXS_XML_E_INTERNALERROR
//
// MessageText:
//
// Manifest Parse Error : Internal error.
//
static const int ERROR_SXS_XML_E_INTERNALERROR    14041L

//
// MessageId: ERROR_SXS_XML_E_UNEXPECTED_WHITESPACE
//
// MessageText:
//
// Manifest Parse Error : Whitespace is not allowed at this location.
//
static const int ERROR_SXS_XML_E_UNEXPECTED_WHITESPACE 14042L

//
// MessageId: ERROR_SXS_XML_E_INCOMPLETE_ENCODING
//
// MessageText:
//
// Manifest Parse Error : End of file reached in invalid state for current encoding.
//
static const int ERROR_SXS_XML_E_INCOMPLETE_ENCODING 14043L

//
// MessageId: ERROR_SXS_XML_E_MISSING_PAREN
//
// MessageText:
//
// Manifest Parse Error : Missing parenthesis.
//
static const int ERROR_SXS_XML_E_MISSING_PAREN    14044L

//
// MessageId: ERROR_SXS_XML_E_EXPECTINGCLOSEQUOTE
//
// MessageText:
//
// Manifest Parse Error : A single or double closing quote character (\' or \") is missing.
//
static const int ERROR_SXS_XML_E_EXPECTINGCLOSEQUOTE 14045L

//
// MessageId: ERROR_SXS_XML_E_MULTIPLE_COLONS
//
// MessageText:
//
// Manifest Parse Error : Multiple colons are not allowed in a name.
//
static const int ERROR_SXS_XML_E_MULTIPLE_COLONS  14046L

//
// MessageId: ERROR_SXS_XML_E_INVALID_DECIMAL
//
// MessageText:
//
// Manifest Parse Error : Invalid character for decimal digit.
//
static const int ERROR_SXS_XML_E_INVALID_DECIMAL  14047L

//
// MessageId: ERROR_SXS_XML_E_INVALID_HEXIDECIMAL
//
// MessageText:
//
// Manifest Parse Error : Invalid character for hexadecimal digit.
//
static const int ERROR_SXS_XML_E_INVALID_HEXIDECIMAL 14048L

//
// MessageId: ERROR_SXS_XML_E_INVALID_UNICODE
//
// MessageText:
//
// Manifest Parse Error : Invalid unicode character value for this platform.
//
static const int ERROR_SXS_XML_E_INVALID_UNICODE  14049L

//
// MessageId: ERROR_SXS_XML_E_WHITESPACEORQUESTIONMARK
//
// MessageText:
//
// Manifest Parse Error : Expecting whitespace or '?'.
//
static const int ERROR_SXS_XML_E_WHITESPACEORQUESTIONMARK 14050L

//
// MessageId: ERROR_SXS_XML_E_UNEXPECTEDENDTAG
//
// MessageText:
//
// Manifest Parse Error : End tag was not expected at this location.
//
static const int ERROR_SXS_XML_E_UNEXPECTEDENDTAG 14051L

//
// MessageId: ERROR_SXS_XML_E_UNCLOSEDTAG
//
// MessageText:
//
// Manifest Parse Error : The following tags were not closed: %1.
//
static const int ERROR_SXS_XML_E_UNCLOSEDTAG      14052L

//
// MessageId: ERROR_SXS_XML_E_DUPLICATEATTRIBUTE
//
// MessageText:
//
// Manifest Parse Error : Duplicate attribute.
//
static const int ERROR_SXS_XML_E_DUPLICATEATTRIBUTE 14053L

//
// MessageId: ERROR_SXS_XML_E_MULTIPLEROOTS
//
// MessageText:
//
// Manifest Parse Error : Only one top level element is allowed in an XML document.
//
static const int ERROR_SXS_XML_E_MULTIPLEROOTS    14054L

//
// MessageId: ERROR_SXS_XML_E_INVALIDATROOTLEVEL
//
// MessageText:
//
// Manifest Parse Error : Invalid at the top level of the document.
//
static const int ERROR_SXS_XML_E_INVALIDATROOTLEVEL 14055L

//
// MessageId: ERROR_SXS_XML_E_BADXMLDECL
//
// MessageText:
//
// Manifest Parse Error : Invalid xml declaration.
//
static const int ERROR_SXS_XML_E_BADXMLDECL       14056L

//
// MessageId: ERROR_SXS_XML_E_MISSINGROOT
//
// MessageText:
//
// Manifest Parse Error : XML document must have a top level element.
//
static const int ERROR_SXS_XML_E_MISSINGROOT      14057L

//
// MessageId: ERROR_SXS_XML_E_UNEXPECTEDEOF
//
// MessageText:
//
// Manifest Parse Error : Unexpected end of file.
//
static const int ERROR_SXS_XML_E_UNEXPECTEDEOF    14058L

//
// MessageId: ERROR_SXS_XML_E_BADPEREFINSUBSET
//
// MessageText:
//
// Manifest Parse Error : Parameter entities cannot be used inside markup declarations in an internal subset.
//
static const int ERROR_SXS_XML_E_BADPEREFINSUBSET 14059L

//
// MessageId: ERROR_SXS_XML_E_UNCLOSEDSTARTTAG
//
// MessageText:
//
// Manifest Parse Error : Element was not closed.
//
static const int ERROR_SXS_XML_E_UNCLOSEDSTARTTAG 14060L

//
// MessageId: ERROR_SXS_XML_E_UNCLOSEDENDTAG
//
// MessageText:
//
// Manifest Parse Error : End element was missing the character '>'.
//
static const int ERROR_SXS_XML_E_UNCLOSEDENDTAG   14061L

//
// MessageId: ERROR_SXS_XML_E_UNCLOSEDSTRING
//
// MessageText:
//
// Manifest Parse Error : A string literal was not closed.
//
static const int ERROR_SXS_XML_E_UNCLOSEDSTRING   14062L

//
// MessageId: ERROR_SXS_XML_E_UNCLOSEDCOMMENT
//
// MessageText:
//
// Manifest Parse Error : A comment was not closed.
//
static const int ERROR_SXS_XML_E_UNCLOSEDCOMMENT  14063L

//
// MessageId: ERROR_SXS_XML_E_UNCLOSEDDECL
//
// MessageText:
//
// Manifest Parse Error : A declaration was not closed.
//
static const int ERROR_SXS_XML_E_UNCLOSEDDECL     14064L

//
// MessageId: ERROR_SXS_XML_E_UNCLOSEDCDATA
//
// MessageText:
//
// Manifest Parse Error : A CDATA section was not closed.
//
static const int ERROR_SXS_XML_E_UNCLOSEDCDATA    14065L

//
// MessageId: ERROR_SXS_XML_E_RESERVEDNAMESPACE
//
// MessageText:
//
// Manifest Parse Error : The namespace prefix is not allowed to start with the reserved string "xml".
//
static const int ERROR_SXS_XML_E_RESERVEDNAMESPACE 14066L

//
// MessageId: ERROR_SXS_XML_E_INVALIDENCODING
//
// MessageText:
//
// Manifest Parse Error : System does not support the specified encoding.
//
static const int ERROR_SXS_XML_E_INVALIDENCODING  14067L

//
// MessageId: ERROR_SXS_XML_E_INVALIDSWITCH
//
// MessageText:
//
// Manifest Parse Error : Switch from current encoding to specified encoding not supported.
//
static const int ERROR_SXS_XML_E_INVALIDSWITCH    14068L

//
// MessageId: ERROR_SXS_XML_E_BADXMLCASE
//
// MessageText:
//
// Manifest Parse Error : The name 'xml' is reserved and must be lower case.
//
static const int ERROR_SXS_XML_E_BADXMLCASE       14069L

//
// MessageId: ERROR_SXS_XML_E_INVALID_STANDALONE
//
// MessageText:
//
// Manifest Parse Error : The standalone attribute must have the value 'yes' or 'no'.
//
static const int ERROR_SXS_XML_E_INVALID_STANDALONE 14070L

//
// MessageId: ERROR_SXS_XML_E_UNEXPECTED_STANDALONE
//
// MessageText:
//
// Manifest Parse Error : The standalone attribute cannot be used in external entities.
//
static const int ERROR_SXS_XML_E_UNEXPECTED_STANDALONE 14071L

//
// MessageId: ERROR_SXS_XML_E_INVALID_VERSION
//
// MessageText:
//
// Manifest Parse Error : Invalid version number.
//
static const int ERROR_SXS_XML_E_INVALID_VERSION  14072L

//
// MessageId: ERROR_SXS_XML_E_MISSINGEQUALS
//
// MessageText:
//
// Manifest Parse Error : Missing equals sign between attribute and attribute value.
//
static const int ERROR_SXS_XML_E_MISSINGEQUALS    14073L

//
// MessageId: ERROR_SXS_PROTECTION_RECOVERY_FAILED
//
// MessageText:
//
// Assembly Protection Error : Unable to recover the specified assembly.
//
static const int ERROR_SXS_PROTECTION_RECOVERY_FAILED 14074L

//
// MessageId: ERROR_SXS_PROTECTION_PUBLIC_KEY_TOO_SHORT
//
// MessageText:
//
// Assembly Protection Error : The public key for an assembly was too short to be allowed.
//
static const int ERROR_SXS_PROTECTION_PUBLIC_KEY_TOO_SHORT 14075L

//
// MessageId: ERROR_SXS_PROTECTION_CATALOG_NOT_VALID
//
// MessageText:
//
// Assembly Protection Error : The catalog for an assembly is not valid, or does not match the assembly's manifest.
//
static const int ERROR_SXS_PROTECTION_CATALOG_NOT_VALID 14076L

//
// MessageId: ERROR_SXS_UNTRANSLATABLE_HRESULT
//
// MessageText:
//
// An HRESULT could not be translated to a corresponding Win32 error code.
//
static const int ERROR_SXS_UNTRANSLATABLE_HRESULT 14077L

//
// MessageId: ERROR_SXS_PROTECTION_CATALOG_FILE_MISSING
//
// MessageText:
//
// Assembly Protection Error : The catalog for an assembly is missing.
//
static const int ERROR_SXS_PROTECTION_CATALOG_FILE_MISSING 14078L

//
// MessageId: ERROR_SXS_MISSING_ASSEMBLY_IDENTITY_ATTRIBUTE
//
// MessageText:
//
// The supplied assembly identity is missing one or more attributes which must be present in this context.
//
static const int ERROR_SXS_MISSING_ASSEMBLY_IDENTITY_ATTRIBUTE 14079L

//
// MessageId: ERROR_SXS_INVALID_ASSEMBLY_IDENTITY_ATTRIBUTE_NAME
//
// MessageText:
//
// The supplied assembly identity has one or more attribute names that contain characters not permitted in XML names.
//
static const int ERROR_SXS_INVALID_ASSEMBLY_IDENTITY_ATTRIBUTE_NAME 14080L

//
// MessageId: ERROR_SXS_ASSEMBLY_MISSING
//
// MessageText:
//
// The referenced assembly could not be found.
//
static const int ERROR_SXS_ASSEMBLY_MISSING       14081L

//
// MessageId: ERROR_SXS_CORRUPT_ACTIVATION_STACK
//
// MessageText:
//
// The activation context activation stack for the running thread of execution is corrupt.
//
static const int ERROR_SXS_CORRUPT_ACTIVATION_STACK 14082L

//
// MessageId: ERROR_SXS_CORRUPTION
//
// MessageText:
//
// The application isolation metadata for this process or thread has become corrupt.
//
static const int ERROR_SXS_CORRUPTION             14083L

//
// MessageId: ERROR_SXS_EARLY_DEACTIVATION
//
// MessageText:
//
// The activation context being deactivated is not the most recently activated one.
//
static const int ERROR_SXS_EARLY_DEACTIVATION     14084L

//
// MessageId: ERROR_SXS_INVALID_DEACTIVATION
//
// MessageText:
//
// The activation context being deactivated is not active for the current thread of execution.
//
static const int ERROR_SXS_INVALID_DEACTIVATION   14085L

//
// MessageId: ERROR_SXS_MULTIPLE_DEACTIVATION
//
// MessageText:
//
// The activation context being deactivated has already been deactivated.
//
static const int ERROR_SXS_MULTIPLE_DEACTIVATION  14086L

//
// MessageId: ERROR_SXS_PROCESS_TERMINATION_REQUESTED
//
// MessageText:
//
// A component used by the isolation facility has requested to terminate the process.
//
static const int ERROR_SXS_PROCESS_TERMINATION_REQUESTED 14087L

//
// MessageId: ERROR_SXS_RELEASE_ACTIVATION_CONTEXT
//
// MessageText:
//
// A kernel mode component is releasing a reference on an activation context.
//
static const int ERROR_SXS_RELEASE_ACTIVATION_CONTEXT 14088L

//
// MessageId: ERROR_SXS_SYSTEM_DEFAULT_ACTIVATION_CONTEXT_EMPTY
//
// MessageText:
//
// The activation context of system default assembly could not be generated.
//
static const int ERROR_SXS_SYSTEM_DEFAULT_ACTIVATION_CONTEXT_EMPTY 14089L

//
// MessageId: ERROR_SXS_INVALID_IDENTITY_ATTRIBUTE_VALUE
//
// MessageText:
//
// The value of an attribute in an identity is not within the legal range.
//
static const int ERROR_SXS_INVALID_IDENTITY_ATTRIBUTE_VALUE 14090L

//
// MessageId: ERROR_SXS_INVALID_IDENTITY_ATTRIBUTE_NAME
//
// MessageText:
//
// The name of an attribute in an identity is not within the legal range.
//
static const int ERROR_SXS_INVALID_IDENTITY_ATTRIBUTE_NAME 14091L

//
// MessageId: ERROR_SXS_IDENTITY_DUPLICATE_ATTRIBUTE
//
// MessageText:
//
// An identity contains two definitions for the same attribute.
//
static const int ERROR_SXS_IDENTITY_DUPLICATE_ATTRIBUTE 14092L

//
// MessageId: ERROR_SXS_IDENTITY_PARSE_ERROR
//
// MessageText:
//
// The identity string is malformed. This may be due to a trailing comma, more than two unnamed attributes, missing attribute name or missing attribute value.
//
static const int ERROR_SXS_IDENTITY_PARSE_ERROR   14093L

//
// MessageId: ERROR_MALFORMED_SUBSTITUTION_STRING
//
// MessageText:
//
// A string containing localized substitutable content was malformed. Either a dollar sign ($) was followed by something other than a left parenthesis or another dollar sign or an substitution's right parenthesis was not found.
//
static const int ERROR_MALFORMED_SUBSTITUTION_STRING 14094L

//
// MessageId: ERROR_SXS_INCORRECT_PUBLIC_KEY_TOKEN
//
// MessageText:
//
// The public key token does not correspond to the public key specified.
//
static const int ERROR_SXS_INCORRECT_PUBLIC_KEY_TOKEN 14095L

//
// MessageId: ERROR_UNMAPPED_SUBSTITUTION_STRING
//
// MessageText:
//
// A substitution string had no mapping.
//
static const int ERROR_UNMAPPED_SUBSTITUTION_STRING 14096L

//
// MessageId: ERROR_SXS_ASSEMBLY_NOT_LOCKED
//
// MessageText:
//
// The component must be locked before making the request.
//
static const int ERROR_SXS_ASSEMBLY_NOT_LOCKED    14097L

//
// MessageId: ERROR_SXS_COMPONENT_STORE_CORRUPT
//
// MessageText:
//
// The component store has been corrupted.
//
static const int ERROR_SXS_COMPONENT_STORE_CORRUPT 14098L

//
// MessageId: ERROR_ADVANCED_INSTALLER_FAILED
//
// MessageText:
//
// An advanced installer failed during setup or servicing.
//
static const int ERROR_ADVANCED_INSTALLER_FAILED  14099L

//
// MessageId: ERROR_XML_ENCODING_MISMATCH
//
// MessageText:
//
// The character encoding in the XML declaration did not match the encoding used in the document.
//
static const int ERROR_XML_ENCODING_MISMATCH      14100L

//
// MessageId: ERROR_SXS_MANIFEST_IDENTITY_SAME_BUT_CONTENTS_DIFFERENT
//
// MessageText:
//
// The identities of the manifests are identical but their contents are different.
//
static const int ERROR_SXS_MANIFEST_IDENTITY_SAME_BUT_CONTENTS_DIFFERENT 14101L

//
// MessageId: ERROR_SXS_IDENTITIES_DIFFERENT
//
// MessageText:
//
// The component identities are different.
//
static const int ERROR_SXS_IDENTITIES_DIFFERENT   14102L

//
// MessageId: ERROR_SXS_ASSEMBLY_IS_NOT_A_DEPLOYMENT
//
// MessageText:
//
// The assembly is not a deployment.
//
static const int ERROR_SXS_ASSEMBLY_IS_NOT_A_DEPLOYMENT 14103L

//
// MessageId: ERROR_SXS_FILE_NOT_PART_OF_ASSEMBLY
//
// MessageText:
//
// The file is not a part of the assembly.
//
static const int ERROR_SXS_FILE_NOT_PART_OF_ASSEMBLY 14104L

//
// MessageId: ERROR_SXS_MANIFEST_TOO_BIG
//
// MessageText:
//
// The size of the manifest exceeds the maximum allowed.
//
static const int ERROR_SXS_MANIFEST_TOO_BIG       14105L

//
// MessageId: ERROR_SXS_SETTING_NOT_REGISTERED
//
// MessageText:
//
// The setting is not registered.
//
static const int ERROR_SXS_SETTING_NOT_REGISTERED 14106L

//
// MessageId: ERROR_SXS_TRANSACTION_CLOSURE_INCOMPLETE
//
// MessageText:
//
// One or more required members of the transaction are not present.
//
static const int ERROR_SXS_TRANSACTION_CLOSURE_INCOMPLETE 14107L

//
// MessageId: ERROR_SMI_PRIMITIVE_INSTALLER_FAILED
//
// MessageText:
//
// The SMI primitive installer failed during setup or servicing.
//
static const int ERROR_SMI_PRIMITIVE_INSTALLER_FAILED 14108L

//
// MessageId: ERROR_GENERIC_COMMAND_FAILED
//
// MessageText:
//
// A generic command executable returned a result that indicates failure.
//
static const int ERROR_GENERIC_COMMAND_FAILED     14109L

//
// MessageId: ERROR_SXS_FILE_HASH_MISSING
//
// MessageText:
//
// A component is missing file verification information in its manifest.
//
static const int ERROR_SXS_FILE_HASH_MISSING      14110L


///////////////////////////////////////////////////
//                                               //
//           End of Side By Side Error Codes     //
//                                               //
//                 14000 to 14999                //
///////////////////////////////////////////////////


///////////////////////////////////////////////////
//                                               //
//           Start of WinEvt Error codes         //
//                                               //
//                 15000 to 15079                //
///////////////////////////////////////////////////

//
// MessageId: ERROR_EVT_INVALID_CHANNEL_PATH
//
// MessageText:
//
// The specified channel path is invalid.
//
static const int ERROR_EVT_INVALID_CHANNEL_PATH   15000L

//
// MessageId: ERROR_EVT_INVALID_QUERY
//
// MessageText:
//
// The specified query is invalid.
//
static const int ERROR_EVT_INVALID_QUERY          15001L

//
// MessageId: ERROR_EVT_PUBLISHER_METADATA_NOT_FOUND
//
// MessageText:
//
// The publisher metadata cannot be found in the resource.
//
static const int ERROR_EVT_PUBLISHER_METADATA_NOT_FOUND 15002L

//
// MessageId: ERROR_EVT_EVENT_TEMPLATE_NOT_FOUND
//
// MessageText:
//
// The template for an event definition cannot be found in the resource (error = %1).
//
static const int ERROR_EVT_EVENT_TEMPLATE_NOT_FOUND 15003L

//
// MessageId: ERROR_EVT_INVALID_PUBLISHER_NAME
//
// MessageText:
//
// The specified publisher name is invalid.
//
static const int ERROR_EVT_INVALID_PUBLISHER_NAME 15004L

//
// MessageId: ERROR_EVT_INVALID_EVENT_DATA
//
// MessageText:
//
// The event data raised by the publisher is not compatible with the event template definition in the publisher's manifest.
//
static const int ERROR_EVT_INVALID_EVENT_DATA     15005L

//
// MessageId: ERROR_EVT_CHANNEL_NOT_FOUND
//
// MessageText:
//
// The specified channel could not be found.
//
static const int ERROR_EVT_CHANNEL_NOT_FOUND      15007L

//
// MessageId: ERROR_EVT_MALFORMED_XML_TEXT
//
// MessageText:
//
// The specified XML text was not well-formed. See Extended Error for more details.
//
static const int ERROR_EVT_MALFORMED_XML_TEXT     15008L

//
// MessageId: ERROR_EVT_SUBSCRIPTION_TO_DIRECT_CHANNEL
//
// MessageText:
//
// The events for a direct channel go directly to a log file and cannot be subscribed to.
//
static const int ERROR_EVT_SUBSCRIPTION_TO_DIRECT_CHANNEL 15009L

//
// MessageId: ERROR_EVT_CONFIGURATION_ERROR
//
// MessageText:
//
// Configuration error.
//
static const int ERROR_EVT_CONFIGURATION_ERROR    15010L

//
// MessageId: ERROR_EVT_QUERY_RESULT_STALE
//
// MessageText:
//
// The query result is stale or invalid and must be recreated. This may be due to the log being cleared or rolling over after the query result was created.
//
static const int ERROR_EVT_QUERY_RESULT_STALE     15011L

//
// MessageId: ERROR_EVT_QUERY_RESULT_INVALID_POSITION
//
// MessageText:
//
// The query result is currently at an invalid position.
//
static const int ERROR_EVT_QUERY_RESULT_INVALID_POSITION 15012L

//
// MessageId: ERROR_EVT_NON_VALIDATING_MSXML
//
// MessageText:
//
// Registered MSXML doesn't support validation.
//
static const int ERROR_EVT_NON_VALIDATING_MSXML   15013L

//
// MessageId: ERROR_EVT_FILTER_ALREADYSCOPED
//
// MessageText:
//
// An expression can only be followed by a change-of-scope operation if the expression evaluates to a node set and is not already part of another change-of-scope operation.
//
static const int ERROR_EVT_FILTER_ALREADYSCOPED   15014L

//
// MessageId: ERROR_EVT_FILTER_NOTELTSET
//
// MessageText:
//
// Cannot perform a step operation from a term that does not represent an element set.
//
static const int ERROR_EVT_FILTER_NOTELTSET       15015L

//
// MessageId: ERROR_EVT_FILTER_INVARG
//
// MessageText:
//
// Left-hand side arguments to binary operators must be either attributes, nodes or variables. Right-hand side arguments must be constants.
//
static const int ERROR_EVT_FILTER_INVARG          15016L

//
// MessageId: ERROR_EVT_FILTER_INVTEST
//
// MessageText:
//
// A step operation must involve a node test or, in the case of a predicate, an algebraic expression against which to test each node in the preceeding node set.
//
static const int ERROR_EVT_FILTER_INVTEST         15017L

//
// MessageId: ERROR_EVT_FILTER_INVTYPE
//
// MessageText:
//
// This data type is currently unsupported.
//
static const int ERROR_EVT_FILTER_INVTYPE         15018L

//
// MessageId: ERROR_EVT_FILTER_PARSEERR
//
// MessageText:
//
// A syntax error occurred at position %1!d!
//
static const int ERROR_EVT_FILTER_PARSEERR        15019L

//
// MessageId: ERROR_EVT_FILTER_UNSUPPORTEDOP
//
// MessageText:
//
// This operator is unsupported by this implementation of the filter.
//
static const int ERROR_EVT_FILTER_UNSUPPORTEDOP   15020L

//
// MessageId: ERROR_EVT_FILTER_UNEXPECTEDTOKEN
//
// MessageText:
//
// An unexpected token was encountered.
//
static const int ERROR_EVT_FILTER_UNEXPECTEDTOKEN 15021L

//
// MessageId: ERROR_EVT_INVALID_OPERATION_OVER_ENABLED_DIRECT_CHANNEL
//
// MessageText:
//
// The requested operation cannot be performed over an enabled direct channel. The channel must first be disabled.
//
static const int ERROR_EVT_INVALID_OPERATION_OVER_ENABLED_DIRECT_CHANNEL 15022L

//
// MessageId: ERROR_EVT_INVALID_CHANNEL_PROPERTY_VALUE
//
// MessageText:
//
// Channel property %1!s! contains an invalid value. The value has an invalid type, is outside of its valid range, cannot be changed, or is not supported by this type of channel.
//
static const int ERROR_EVT_INVALID_CHANNEL_PROPERTY_VALUE 15023L

//
// MessageId: ERROR_EVT_INVALID_PUBLISHER_PROPERTY_VALUE
//
// MessageText:
//
// Publisher property %1!s! contains an invalid value. The value has an invalid type, is outside of its valid range, cannot be changed, or is not supported by this type of publisher.
//
static const int ERROR_EVT_INVALID_PUBLISHER_PROPERTY_VALUE 15024L

//
// MessageId: ERROR_EVT_CHANNEL_CANNOT_ACTIVATE
//
// MessageText:
//
// The channel failed to activate.
//
static const int ERROR_EVT_CHANNEL_CANNOT_ACTIVATE 15025L

//
// MessageId: ERROR_EVT_FILTER_TOO_COMPLEX
//
// MessageText:
//
// The XPath expression exceeded the supported complexity. Simplify the expression or split it into multiple expressions.
//
static const int ERROR_EVT_FILTER_TOO_COMPLEX     15026L

//
// MessageId: ERROR_EVT_MESSAGE_NOT_FOUND
//
// MessageText:
//
// The message resource is present but the message was not found in the message table.
//
static const int ERROR_EVT_MESSAGE_NOT_FOUND      15027L

//
// MessageId: ERROR_EVT_MESSAGE_ID_NOT_FOUND
//
// MessageText:
//
// The message ID for the desired message could not be found.
//
static const int ERROR_EVT_MESSAGE_ID_NOT_FOUND   15028L

//
// MessageId: ERROR_EVT_UNRESOLVED_VALUE_INSERT
//
// MessageText:
//
// The substitution string for insert index (%1) could not be found.
//
static const int ERROR_EVT_UNRESOLVED_VALUE_INSERT 15029L

//
// MessageId: ERROR_EVT_UNRESOLVED_PARAMETER_INSERT
//
// MessageText:
//
// The description string for parameter reference (%1) could not be found.
//
static const int ERROR_EVT_UNRESOLVED_PARAMETER_INSERT 15030L

//
// MessageId: ERROR_EVT_MAX_INSERTS_REACHED
//
// MessageText:
//
// The maximum number of replacements has been reached.
//
static const int ERROR_EVT_MAX_INSERTS_REACHED    15031L

//
// MessageId: ERROR_EVT_EVENT_DEFINITION_NOT_FOUND
//
// MessageText:
//
// The event definition could not be found for event ID (%1).
//
static const int ERROR_EVT_EVENT_DEFINITION_NOT_FOUND 15032L

//
// MessageId: ERROR_EVT_MESSAGE_LOCALE_NOT_FOUND
//
// MessageText:
//
// The locale specific resource for the desired message is not present.
//
static const int ERROR_EVT_MESSAGE_LOCALE_NOT_FOUND 15033L

//
// MessageId: ERROR_EVT_VERSION_TOO_OLD
//
// MessageText:
//
// The resource is too old and is not supported.
//
static const int ERROR_EVT_VERSION_TOO_OLD        15034L

//
// MessageId: ERROR_EVT_VERSION_TOO_NEW
//
// MessageText:
//
// The resource is too new and is not supported.
//
static const int ERROR_EVT_VERSION_TOO_NEW        15035L

//
// MessageId: ERROR_EVT_CANNOT_OPEN_CHANNEL_OF_QUERY
//
// MessageText:
//
// The channel at index %1!d! of the query can't be opened.
//
static const int ERROR_EVT_CANNOT_OPEN_CHANNEL_OF_QUERY 15036L

//
// MessageId: ERROR_EVT_PUBLISHER_DISABLED
//
// MessageText:
//
// The publisher has been disabled and its resource is not available. This usually occurs when the publisher is in the process of being uninstalled or upgraded.
//
static const int ERROR_EVT_PUBLISHER_DISABLED     15037L

//
// MessageId: ERROR_EVT_FILTER_OUT_OF_RANGE
//
// MessageText:
//
// Attempted to create a numeric type that is outside of its valid range.
//
static const int ERROR_EVT_FILTER_OUT_OF_RANGE    15038L


///////////////////////////////////////////////////
//                                               //
//           Start of Wecsvc Error codes         //
//                                               //
//                 15080 to 15099                //
///////////////////////////////////////////////////

//
// MessageId: ERROR_EC_SUBSCRIPTION_CANNOT_ACTIVATE
//
// MessageText:
//
// The subscription fails to activate.
//
static const int ERROR_EC_SUBSCRIPTION_CANNOT_ACTIVATE 15080L

//
// MessageId: ERROR_EC_LOG_DISABLED
//
// MessageText:
//
// The log of the subscription is in disabled state, and can not be used to forward events to. The log must first be enabled before the subscription can be activated.
//
static const int ERROR_EC_LOG_DISABLED            15081L

//
// MessageId: ERROR_EC_CIRCULAR_FORWARDING
//
// MessageText:
//
// When forwarding events from local machine to itself, the query of the subscription can't contain target log of the subscription.
//
static const int ERROR_EC_CIRCULAR_FORWARDING     15082L

//
// MessageId: ERROR_EC_CREDSTORE_FULL
//
// MessageText:
//
// The credential store that is used to save credentials is full.
//
static const int ERROR_EC_CREDSTORE_FULL          15083L

//
// MessageId: ERROR_EC_CRED_NOT_FOUND
//
// MessageText:
//
// The credential used by this subscription can't be found in credential store.
//
static const int ERROR_EC_CRED_NOT_FOUND          15084L

//
// MessageId: ERROR_EC_NO_ACTIVE_CHANNEL
//
// MessageText:
//
// No active channel is found for the query.
//
static const int ERROR_EC_NO_ACTIVE_CHANNEL       15085L


///////////////////////////////////////////////////
//                                               //
//           Start of MUI Error codes            //
//                                               //
//                 15100 to 15199                //
///////////////////////////////////////////////////

//
// MessageId: ERROR_MUI_FILE_NOT_FOUND
//
// MessageText:
//
// The resource loader failed to find MUI file.
//
static const int ERROR_MUI_FILE_NOT_FOUND         15100L

//
// MessageId: ERROR_MUI_INVALID_FILE
//
// MessageText:
//
// The resource loader failed to load MUI file because the file fail to pass validation.
//
static const int ERROR_MUI_INVALID_FILE           15101L

//
// MessageId: ERROR_MUI_INVALID_RC_CONFIG
//
// MessageText:
//
// The RC Manifest is corrupted with garbage data or unsupported version or missing required item.
//
static const int ERROR_MUI_INVALID_RC_CONFIG      15102L

//
// MessageId: ERROR_MUI_INVALID_LOCALE_NAME
//
// MessageText:
//
// The RC Manifest has invalid culture name.
//
static const int ERROR_MUI_INVALID_LOCALE_NAME    15103L

//
// MessageId: ERROR_MUI_INVALID_ULTIMATEFALLBACK_NAME
//
// MessageText:
//
// The RC Manifest has invalid ultimatefallback name.
//
static const int ERROR_MUI_INVALID_ULTIMATEFALLBACK_NAME 15104L

//
// MessageId: ERROR_MUI_FILE_NOT_LOADED
//
// MessageText:
//
// The resource loader cache doesn't have loaded MUI entry.
//
static const int ERROR_MUI_FILE_NOT_LOADED        15105L

//
// MessageId: ERROR_RESOURCE_ENUM_USER_STOP
//
// MessageText:
//
// User stopped resource enumeration.
//
static const int ERROR_RESOURCE_ENUM_USER_STOP    15106L

//
// MessageId: ERROR_MUI_INTLSETTINGS_UILANG_NOT_INSTALLED
//
// MessageText:
//
// UI language installation failed.
//
static const int ERROR_MUI_INTLSETTINGS_UILANG_NOT_INSTALLED 15107L

//
// MessageId: ERROR_MUI_INTLSETTINGS_INVALID_LOCALE_NAME
//
// MessageText:
//
// Locale installation failed.
//
static const int ERROR_MUI_INTLSETTINGS_INVALID_LOCALE_NAME 15108L

//
// MessageId: ERROR_MRM_RUNTIME_NO_DEFAULT_OR_NEUTRAL_RESOURCE
//
// MessageText:
//
// A resource does not have default or neutral value.
//
static const int ERROR_MRM_RUNTIME_NO_DEFAULT_OR_NEUTRAL_RESOURCE 15110L

//
// MessageId: ERROR_MRM_INVALID_PRICONFIG
//
// MessageText:
//
// Invalid PRI config file.
//
static const int ERROR_MRM_INVALID_PRICONFIG      15111L

//
// MessageId: ERROR_MRM_INVALID_FILE_TYPE
//
// MessageText:
//
// Invalid file type.
//
static const int ERROR_MRM_INVALID_FILE_TYPE      15112L

//
// MessageId: ERROR_MRM_UNKNOWN_QUALIFIER
//
// MessageText:
//
// Unknown qualifier.
//
static const int ERROR_MRM_UNKNOWN_QUALIFIER      15113L

//
// MessageId: ERROR_MRM_INVALID_QUALIFIER_VALUE
//
// MessageText:
//
// Invalid qualifier value.
//
static const int ERROR_MRM_INVALID_QUALIFIER_VALUE 15114L

//
// MessageId: ERROR_MRM_NO_CANDIDATE
//
// MessageText:
//
// No Candidate found.
//
static const int ERROR_MRM_NO_CANDIDATE           15115L

//
// MessageId: ERROR_MRM_NO_MATCH_OR_DEFAULT_CANDIDATE
//
// MessageText:
//
// The ResourceMap or NamedResource has an item that does not have default or neutral resource..
//
static const int ERROR_MRM_NO_MATCH_OR_DEFAULT_CANDIDATE 15116L

//
// MessageId: ERROR_MRM_RESOURCE_TYPE_MISMATCH
//
// MessageText:
//
// Invalid ResourceCandidate type.
//
static const int ERROR_MRM_RESOURCE_TYPE_MISMATCH 15117L

//
// MessageId: ERROR_MRM_DUPLICATE_MAP_NAME
//
// MessageText:
//
// Duplicate Resource Map.
//
static const int ERROR_MRM_DUPLICATE_MAP_NAME     15118L

//
// MessageId: ERROR_MRM_DUPLICATE_ENTRY
//
// MessageText:
//
// Duplicate Entry.
//
static const int ERROR_MRM_DUPLICATE_ENTRY        15119L

//
// MessageId: ERROR_MRM_INVALID_RESOURCE_IDENTIFIER
//
// MessageText:
//
// Invalid Resource Identifier.
//
static const int ERROR_MRM_INVALID_RESOURCE_IDENTIFIER 15120L

//
// MessageId: ERROR_MRM_FILEPATH_TOO_LONG
//
// MessageText:
//
// Filepath too long.
//
static const int ERROR_MRM_FILEPATH_TOO_LONG      15121L

//
// MessageId: ERROR_MRM_UNSUPPORTED_DIRECTORY_TYPE
//
// MessageText:
//
// Unsupported directory type.
//
static const int ERROR_MRM_UNSUPPORTED_DIRECTORY_TYPE 15122L

//
// MessageId: ERROR_MRM_INVALID_PRI_FILE
//
// MessageText:
//
// Invalid PRI File.
//
static const int ERROR_MRM_INVALID_PRI_FILE       15126L

//
// MessageId: ERROR_MRM_NAMED_RESOURCE_NOT_FOUND
//
// MessageText:
//
// NamedResource Not Found.
//
static const int ERROR_MRM_NAMED_RESOURCE_NOT_FOUND 15127L

//
// MessageId: ERROR_MRM_MAP_NOT_FOUND
//
// MessageText:
//
// ResourceMap Not Found.
//
static const int ERROR_MRM_MAP_NOT_FOUND          15135L

//
// MessageId: ERROR_MRM_UNSUPPORTED_PROFILE_TYPE
//
// MessageText:
//
// Unsupported MRT profile type.
//
static const int ERROR_MRM_UNSUPPORTED_PROFILE_TYPE 15136L

//
// MessageId: ERROR_MRM_INVALID_QUALIFIER_OPERATOR
//
// MessageText:
//
// Invalid qualifier operator.
//
static const int ERROR_MRM_INVALID_QUALIFIER_OPERATOR 15137L

//
// MessageId: ERROR_MRM_INDETERMINATE_QUALIFIER_VALUE
//
// MessageText:
//
// Unable to determine qualifier value or qualifier value has not been set.
//
static const int ERROR_MRM_INDETERMINATE_QUALIFIER_VALUE 15138L

//
// MessageId: ERROR_MRM_AUTOMERGE_ENABLED
//
// MessageText:
//
// Automerge is enabled in the PRI file.
//
static const int ERROR_MRM_AUTOMERGE_ENABLED      15139L

//
// MessageId: ERROR_MRM_TOO_MANY_RESOURCES
//
// MessageText:
//
// Too many resources defined for package.
//
static const int ERROR_MRM_TOO_MANY_RESOURCES     15140L

//
// MessageId: ERROR_MRM_UNSUPPORTED_FILE_TYPE_FOR_MERGE
//
// MessageText:
//
// Resource File can not be used for merge operation.
//
static const int ERROR_MRM_UNSUPPORTED_FILE_TYPE_FOR_MERGE 15141L

//
// MessageId: ERROR_MRM_UNSUPPORTED_FILE_TYPE_FOR_LOAD_UNLOAD_PRI_FILE
//
// MessageText:
//
// Load/UnloadPriFiles cannot be used with resource packages.
//
static const int ERROR_MRM_UNSUPPORTED_FILE_TYPE_FOR_LOAD_UNLOAD_PRI_FILE 15142L

//
// MessageId: ERROR_MRM_NO_CURRENT_VIEW_ON_THREAD
//
// MessageText:
//
// Resource Contexts may not be created on threads that do not have a CoreWindow.
//
static const int ERROR_MRM_NO_CURRENT_VIEW_ON_THREAD 15143L

//
// MessageId: ERROR_DIFFERENT_PROFILE_RESOURCE_MANAGER_EXIST
//
// MessageText:
//
// The singleton Resource Manager with different profile is already created.
//
static const int ERROR_DIFFERENT_PROFILE_RESOURCE_MANAGER_EXIST 15144L

//
// MessageId: ERROR_OPERATION_NOT_ALLOWED_FROM_SYSTEM_COMPONENT
//
// MessageText:
//
// The system component cannot operate given API operation
//
static const int ERROR_OPERATION_NOT_ALLOWED_FROM_SYSTEM_COMPONENT 15145L

//
// MessageId: ERROR_MRM_DIRECT_REF_TO_NON_DEFAULT_RESOURCE
//
// MessageText:
//
// The resource is a direct reference to a non-default resource candidate.
//
static const int ERROR_MRM_DIRECT_REF_TO_NON_DEFAULT_RESOURCE 15146L

//
// MessageId: ERROR_MRM_GENERATION_COUNT_MISMATCH
//
// MessageText:
//
// Resource Map has been re-generated and the query string is not valid anymore.
//
static const int ERROR_MRM_GENERATION_COUNT_MISMATCH 15147L

//
// MessageId: ERROR_PRI_MERGE_VERSION_MISMATCH
//
// MessageText:
//
// The PRI files to be merged have incompatible versions.
//
static const int ERROR_PRI_MERGE_VERSION_MISMATCH 15148L

//
// MessageId: ERROR_PRI_MERGE_MISSING_SCHEMA
//
// MessageText:
//
// The primary PRI files to be merged does not contain a schema.
//
static const int ERROR_PRI_MERGE_MISSING_SCHEMA   15149L

//
// MessageId: ERROR_PRI_MERGE_LOAD_FILE_FAILED
//
// MessageText:
//
// Unable to load one of the PRI files to be merged.
//
static const int ERROR_PRI_MERGE_LOAD_FILE_FAILED 15150L

//
// MessageId: ERROR_PRI_MERGE_ADD_FILE_FAILED
//
// MessageText:
//
// Unable to add one of the PRI files to the merged file.
//
static const int ERROR_PRI_MERGE_ADD_FILE_FAILED  15151L

//
// MessageId: ERROR_PRI_MERGE_WRITE_FILE_FAILED
//
// MessageText:
//
// Unable to create the merged PRI file.
//
static const int ERROR_PRI_MERGE_WRITE_FILE_FAILED 15152L

//
// MessageId: ERROR_PRI_MERGE_MULTIPLE_PACKAGE_FAMILIES_NOT_ALLOWED
//
// MessageText:
//
// Packages for a PRI file merge must all be from the same package family.
//
static const int ERROR_PRI_MERGE_MULTIPLE_PACKAGE_FAMILIES_NOT_ALLOWED 15153L

//
// MessageId: ERROR_PRI_MERGE_MULTIPLE_MAIN_PACKAGES_NOT_ALLOWED
//
// MessageText:
//
// Packages for a PRI file merge must not include multiple main packages.
//
static const int ERROR_PRI_MERGE_MULTIPLE_MAIN_PACKAGES_NOT_ALLOWED 15154L

//
// MessageId: ERROR_PRI_MERGE_BUNDLE_PACKAGES_NOT_ALLOWED
//
// MessageText:
//
// Packages for a PRI file merge must not include bundle packages.
//
static const int ERROR_PRI_MERGE_BUNDLE_PACKAGES_NOT_ALLOWED 15155L

//
// MessageId: ERROR_PRI_MERGE_MAIN_PACKAGE_REQUIRED
//
// MessageText:
//
// Packages for a PRI file merge must include one main package.
//
static const int ERROR_PRI_MERGE_MAIN_PACKAGE_REQUIRED 15156L

//
// MessageId: ERROR_PRI_MERGE_RESOURCE_PACKAGE_REQUIRED
//
// MessageText:
//
// Packages for a PRI file merge must include at least one resource package.
//
static const int ERROR_PRI_MERGE_RESOURCE_PACKAGE_REQUIRED 15157L

//
// MessageId: ERROR_PRI_MERGE_INVALID_FILE_NAME
//
// MessageText:
//
// Invalid name supplied for a canonical merged PRI file.
//
static const int ERROR_PRI_MERGE_INVALID_FILE_NAME 15158L


///////////////////////////////////////////////////
//                                               //
// Start of Monitor Configuration API error codes//
//                                               //
//                 15200 to 15249                //
///////////////////////////////////////////////////

//
// MessageId: ERROR_MCA_INVALID_CAPABILITIES_STRING
//
// MessageText:
//
// The monitor returned a DDC/CI capabilities string that did not comply with the ACCESS.bus 3.0, DDC/CI 1.1 or MCCS 2 Revision 1 specification.
//
static const int ERROR_MCA_INVALID_CAPABILITIES_STRING 15200L

//
// MessageId: ERROR_MCA_INVALID_VCP_VERSION
//
// MessageText:
//
// The monitor's VCP Version (0xDF) VCP code returned an invalid version value.
//
static const int ERROR_MCA_INVALID_VCP_VERSION    15201L

//
// MessageId: ERROR_MCA_MONITOR_VIOLATES_MCCS_SPECIFICATION
//
// MessageText:
//
// The monitor does not comply with the MCCS specification it claims to support.
//
static const int ERROR_MCA_MONITOR_VIOLATES_MCCS_SPECIFICATION 15202L

//
// MessageId: ERROR_MCA_MCCS_VERSION_MISMATCH
//
// MessageText:
//
// The MCCS version in a monitor's mccs_ver capability does not match the MCCS version the monitor reports when the VCP Version (0xDF) VCP code is used.
//
static const int ERROR_MCA_MCCS_VERSION_MISMATCH  15203L

//
// MessageId: ERROR_MCA_UNSUPPORTED_MCCS_VERSION
//
// MessageText:
//
// The Monitor Configuration API only works with monitors that support the MCCS 1.0 specification, MCCS 2.0 specification or the MCCS 2.0 Revision 1 specification.
//
static const int ERROR_MCA_UNSUPPORTED_MCCS_VERSION 15204L

//
// MessageId: ERROR_MCA_INTERNAL_ERROR
//
// MessageText:
//
// An internal Monitor Configuration API error occurred.
//
static const int ERROR_MCA_INTERNAL_ERROR         15205L

//
// MessageId: ERROR_MCA_INVALID_TECHNOLOGY_TYPE_RETURNED
//
// MessageText:
//
// The monitor returned an invalid monitor technology type. CRT, Plasma and LCD (TFT) are examples of monitor technology types. This error implies that the monitor violated the MCCS 2.0 or MCCS 2.0 Revision 1 specification.
//
static const int ERROR_MCA_INVALID_TECHNOLOGY_TYPE_RETURNED 15206L

//
// MessageId: ERROR_MCA_UNSUPPORTED_COLOR_TEMPERATURE
//
// MessageText:
//
// The caller of SetMonitorColorTemperature specified a color temperature that the current monitor did not support. This error implies that the monitor violated the MCCS 2.0 or MCCS 2.0 Revision 1 specification.
//
static const int ERROR_MCA_UNSUPPORTED_COLOR_TEMPERATURE 15207L


//////////////////////////////////////////////////
//                                              //
// End of Monitor Configuration API error codes //
//                                              //
//                15200 to 15249                //
//                                              //
//////////////////////////////////////////////////
//////////////////////////////////////////////////
//                                              //
//         Start of Syspart error codes         //
//                15250 - 15299                 //
//                                              //
//////////////////////////////////////////////////

//
// MessageId: ERROR_AMBIGUOUS_SYSTEM_DEVICE
//
// MessageText:
//
// The requested system device cannot be identified due to multiple indistinguishable devices potentially matching the identification criteria.
//
static const int ERROR_AMBIGUOUS_SYSTEM_DEVICE    15250L

//
// MessageId: ERROR_SYSTEM_DEVICE_NOT_FOUND
//
// MessageText:
//
// The requested system device cannot be found.
//
static const int ERROR_SYSTEM_DEVICE_NOT_FOUND    15299L

//////////////////////////////////////////////////
//                                              //
//         Start of Vortex error codes          //
//                15300 - 15320                 //
//                                              //
//////////////////////////////////////////////////

//
// MessageId: ERROR_HASH_NOT_SUPPORTED
//
// MessageText:
//
// Hash generation for the specified hash version and hash type is not enabled on the server.
//
static const int ERROR_HASH_NOT_SUPPORTED         15300L

//
// MessageId: ERROR_HASH_NOT_PRESENT
//
// MessageText:
//
// The hash requested from the server is not available or no longer valid.
//
static const int ERROR_HASH_NOT_PRESENT           15301L

//////////////////////////////////////////////////
//                                              //
//         Start of GPIO error codes            //
//                15321 - 15340                 //
//                                              //
//////////////////////////////////////////////////

//
// MessageId: ERROR_SECONDARY_IC_PROVIDER_NOT_REGISTERED
//
// MessageText:
//
// The secondary interrupt controller instance that manages the specified interrupt is not registered.
//
static const int ERROR_SECONDARY_IC_PROVIDER_NOT_REGISTERED 15321L

//
// MessageId: ERROR_GPIO_CLIENT_INFORMATION_INVALID
//
// MessageText:
//
// The information supplied by the GPIO client driver is invalid.
//
static const int ERROR_GPIO_CLIENT_INFORMATION_INVALID 15322L

//
// MessageId: ERROR_GPIO_VERSION_NOT_SUPPORTED
//
// MessageText:
//
// The version specified by the GPIO client driver is not supported.
//
static const int ERROR_GPIO_VERSION_NOT_SUPPORTED 15323L

//
// MessageId: ERROR_GPIO_INVALID_REGISTRATION_PACKET
//
// MessageText:
//
// The registration packet supplied by the GPIO client driver is not valid.
//
static const int ERROR_GPIO_INVALID_REGISTRATION_PACKET 15324L

//
// MessageId: ERROR_GPIO_OPERATION_DENIED
//
// MessageText:
//
// The requested operation is not suppported for the specified handle.
//
static const int ERROR_GPIO_OPERATION_DENIED      15325L

//
// MessageId: ERROR_GPIO_INCOMPATIBLE_CONNECT_MODE
//
// MessageText:
//
// The requested connect mode conflicts with an existing mode on one or more of the specified pins.
//
static const int ERROR_GPIO_INCOMPATIBLE_CONNECT_MODE 15326L

//
// MessageId: ERROR_GPIO_INTERRUPT_ALREADY_UNMASKED
//
// MessageText:
//
// The interrupt requested to be unmasked is not masked.
//
static const int ERROR_GPIO_INTERRUPT_ALREADY_UNMASKED 15327L

//////////////////////////////////////////////////
//                                              //
//         Start of Run Level error codes       //
//                15400 - 15500                 //
//                                              //
//////////////////////////////////////////////////

//
// MessageId: ERROR_CANNOT_SWITCH_RUNLEVEL
//
// MessageText:
//
// The requested run level switch cannot be completed successfully.
//
static const int ERROR_CANNOT_SWITCH_RUNLEVEL     15400L

//
// MessageId: ERROR_INVALID_RUNLEVEL_SETTING
//
// MessageText:
//
// The service has an invalid run level setting. The run level for a service
// must not be higher than the run level of its dependent services.
//
static const int ERROR_INVALID_RUNLEVEL_SETTING   15401L

//
// MessageId: ERROR_RUNLEVEL_SWITCH_TIMEOUT
//
// MessageText:
//
// The requested run level switch cannot be completed successfully since
// one or more services will not stop or restart within the specified timeout.
//
static const int ERROR_RUNLEVEL_SWITCH_TIMEOUT    15402L

//
// MessageId: ERROR_RUNLEVEL_SWITCH_AGENT_TIMEOUT
//
// MessageText:
//
// A run level switch agent did not respond within the specified timeout.
//
static const int ERROR_RUNLEVEL_SWITCH_AGENT_TIMEOUT 15403L

//
// MessageId: ERROR_RUNLEVEL_SWITCH_IN_PROGRESS
//
// MessageText:
//
// A run level switch is currently in progress.
//
static const int ERROR_RUNLEVEL_SWITCH_IN_PROGRESS 15404L

//
// MessageId: ERROR_SERVICES_FAILED_AUTOSTART
//
// MessageText:
//
// One or more services failed to start during the service startup phase of a run level switch.
//
static const int ERROR_SERVICES_FAILED_AUTOSTART  15405L

//////////////////////////////////////////////////
//                                              //
//         Start of Com Task error codes        //
//                15501 - 15510                 //
//                                              //
//////////////////////////////////////////////////

//
// MessageId: ERROR_COM_TASK_STOP_PENDING
//
// MessageText:
//
// The task stop request cannot be completed immediately since
// task needs more time to shutdown.
//
static const int ERROR_COM_TASK_STOP_PENDING      15501L

////////////////////////////////////////
//                                    //
// APPX Caller Visible Error Codes    //
//          15600-15699               //
////////////////////////////////////////
//
// MessageId: ERROR_INSTALL_OPEN_PACKAGE_FAILED
//
// MessageText:
//
// Package could not be opened.
//
static const int ERROR_INSTALL_OPEN_PACKAGE_FAILED 15600L

//
// MessageId: ERROR_INSTALL_PACKAGE_NOT_FOUND
//
// MessageText:
//
// Package was not found.
//
static const int ERROR_INSTALL_PACKAGE_NOT_FOUND  15601L

//
// MessageId: ERROR_INSTALL_INVALID_PACKAGE
//
// MessageText:
//
// Package data is invalid.
//
static const int ERROR_INSTALL_INVALID_PACKAGE    15602L

//
// MessageId: ERROR_INSTALL_RESOLVE_DEPENDENCY_FAILED
//
// MessageText:
//
// Package failed updates, dependency or conflict validation.
//
static const int ERROR_INSTALL_RESOLVE_DEPENDENCY_FAILED 15603L

//
// MessageId: ERROR_INSTALL_OUT_OF_DISK_SPACE
//
// MessageText:
//
// There is not enough disk space on your computer. Please free up some space and try again.
//
static const int ERROR_INSTALL_OUT_OF_DISK_SPACE  15604L

//
// MessageId: ERROR_INSTALL_NETWORK_FAILURE
//
// MessageText:
//
// There was a problem downloading your product.
//
static const int ERROR_INSTALL_NETWORK_FAILURE    15605L

//
// MessageId: ERROR_INSTALL_REGISTRATION_FAILURE
//
// MessageText:
//
// Package could not be registered.
//
static const int ERROR_INSTALL_REGISTRATION_FAILURE 15606L

//
// MessageId: ERROR_INSTALL_DEREGISTRATION_FAILURE
//
// MessageText:
//
// Package could not be unregistered.
//
static const int ERROR_INSTALL_DEREGISTRATION_FAILURE 15607L

//
// MessageId: ERROR_INSTALL_CANCEL
//
// MessageText:
//
// User cancelled the install request.
//
static const int ERROR_INSTALL_CANCEL             15608L

//
// MessageId: ERROR_INSTALL_FAILED
//
// MessageText:
//
// Install failed. Please contact your software vendor.
//
static const int ERROR_INSTALL_FAILED             15609L

//
// MessageId: ERROR_REMOVE_FAILED
//
// MessageText:
//
// Removal failed. Please contact your software vendor.
//
static const int ERROR_REMOVE_FAILED              15610L

//
// MessageId: ERROR_PACKAGE_ALREADY_EXISTS
//
// MessageText:
//
// The provided package is already installed, and reinstallation of the package was blocked. Check the AppXDeployment-Server event log for details.
//
static const int ERROR_PACKAGE_ALREADY_EXISTS     15611L

//
// MessageId: ERROR_NEEDS_REMEDIATION
//
// MessageText:
//
// The application cannot be started. Try reinstalling the application to fix the problem.
//
static const int ERROR_NEEDS_REMEDIATION          15612L

//
// MessageId: ERROR_INSTALL_PREREQUISITE_FAILED
//
// MessageText:
//
// A Prerequisite for an install could not be satisfied.
//
static const int ERROR_INSTALL_PREREQUISITE_FAILED 15613L

//
// MessageId: ERROR_PACKAGE_REPOSITORY_CORRUPTED
//
// MessageText:
//
// The package repository is corrupted.
//
static const int ERROR_PACKAGE_REPOSITORY_CORRUPTED 15614L

//
// MessageId: ERROR_INSTALL_POLICY_FAILURE
//
// MessageText:
//
// To install this application you need either a Windows developer license or a sideloading-enabled system.
//
static const int ERROR_INSTALL_POLICY_FAILURE     15615L

//
// MessageId: ERROR_PACKAGE_UPDATING
//
// MessageText:
//
// The application cannot be started because it is currently updating.
//
static const int ERROR_PACKAGE_UPDATING           15616L

//
// MessageId: ERROR_DEPLOYMENT_BLOCKED_BY_POLICY
//
// MessageText:
//
// The package deployment operation is blocked by policy. Please contact your system administrator.
//
static const int ERROR_DEPLOYMENT_BLOCKED_BY_POLICY 15617L

//
// MessageId: ERROR_PACKAGES_IN_USE
//
// MessageText:
//
// The package could not be installed because resources it modifies are currently in use.
//
static const int ERROR_PACKAGES_IN_USE            15618L

//
// MessageId: ERROR_RECOVERY_FILE_CORRUPT
//
// MessageText:
//
// The package could not be recovered because necessary data for recovery have been corrupted.
//
static const int ERROR_RECOVERY_FILE_CORRUPT      15619L

//
// MessageId: ERROR_INVALID_STAGED_SIGNATURE
//
// MessageText:
//
// The signature is invalid. To register in developer mode, AppxSignature.p7x and AppxBlockMap.xml must be valid or should not be present.
//
static const int ERROR_INVALID_STAGED_SIGNATURE   15620L

//
// MessageId: ERROR_DELETING_EXISTING_APPLICATIONDATA_STORE_FAILED
//
// MessageText:
//
// An error occurred while deleting the package's previously existing application data.
//
static const int ERROR_DELETING_EXISTING_APPLICATIONDATA_STORE_FAILED 15621L

//
// MessageId: ERROR_INSTALL_PACKAGE_DOWNGRADE
//
// MessageText:
//
// The package could not be installed because a higher version of this package is already installed.
//
static const int ERROR_INSTALL_PACKAGE_DOWNGRADE  15622L

//
// MessageId: ERROR_SYSTEM_NEEDS_REMEDIATION
//
// MessageText:
//
// An error in a system binary was detected. Try refreshing the PC to fix the problem.
//
static const int ERROR_SYSTEM_NEEDS_REMEDIATION   15623L

//
// MessageId: ERROR_APPX_INTEGRITY_FAILURE_CLR_NGEN
//
// MessageText:
//
// A corrupted CLR NGEN binary was detected on the system.
//
static const int ERROR_APPX_INTEGRITY_FAILURE_CLR_NGEN 15624L

//
// MessageId: ERROR_RESILIENCY_FILE_CORRUPT
//
// MessageText:
//
// The operation could not be resumed because necessary data for recovery have been corrupted.
//
static const int ERROR_RESILIENCY_FILE_CORRUPT    15625L

//
// MessageId: ERROR_INSTALL_FIREWALL_SERVICE_NOT_RUNNING
//
// MessageText:
//
// The package could not be installed because the Windows Firewall service is not running. Enable the Windows Firewall service and try again.
//
static const int ERROR_INSTALL_FIREWALL_SERVICE_NOT_RUNNING 15626L

//
// MessageId: ERROR_PACKAGE_MOVE_FAILED
//
// MessageText:
//
// Package move failed.
//
static const int ERROR_PACKAGE_MOVE_FAILED        15627L

//
// MessageId: ERROR_INSTALL_VOLUME_NOT_EMPTY
//
// MessageText:
//
// The deployment operation failed because the volume is not empty.
//
static const int ERROR_INSTALL_VOLUME_NOT_EMPTY   15628L

//
// MessageId: ERROR_INSTALL_VOLUME_OFFLINE
//
// MessageText:
//
// The deployment operation failed because the volume is offline.
//
static const int ERROR_INSTALL_VOLUME_OFFLINE     15629L

//
// MessageId: ERROR_INSTALL_VOLUME_CORRUPT
//
// MessageText:
//
// The deployment operation failed because the specified volume is corrupt.
//
static const int ERROR_INSTALL_VOLUME_CORRUPT     15630L

//
// MessageId: ERROR_NEEDS_REGISTRATION
//
// MessageText:
//
// The deployment operation failed because the specified application needs to be registered first.
//
static const int ERROR_NEEDS_REGISTRATION         15631L

//
// MessageId: ERROR_INSTALL_WRONG_PROCESSOR_ARCHITECTURE
//
// MessageText:
//
// The deployment operation failed because the package targets the wrong processor architecture.
//
static const int ERROR_INSTALL_WRONG_PROCESSOR_ARCHITECTURE 15632L

//
// MessageId: ERROR_DEV_SIDELOAD_LIMIT_EXCEEDED
//
// MessageText:
//
// You have reached the maximum number of developer sideloaded packages allowed on this device. Please uninstall a sideloaded package and try again.
//
static const int ERROR_DEV_SIDELOAD_LIMIT_EXCEEDED 15633L

//
// MessageId: ERROR_INSTALL_OPTIONAL_PACKAGE_REQUIRES_MAIN_PACKAGE
//
// MessageText:
//
// A main app package is required to install this optional package.  Install the main package first and try again.
//
static const int ERROR_INSTALL_OPTIONAL_PACKAGE_REQUIRES_MAIN_PACKAGE 15634L

//
// MessageId: ERROR_PACKAGE_NOT_SUPPORTED_ON_FILESYSTEM
//
// MessageText:
//
// This app package type is not supported on this filesystem
//
static const int ERROR_PACKAGE_NOT_SUPPORTED_ON_FILESYSTEM 15635L

//
// MessageId: ERROR_PACKAGE_MOVE_BLOCKED_BY_STREAMING
//
// MessageText:
//
// Package move operation is blocked until the application has finished streaming
//
static const int ERROR_PACKAGE_MOVE_BLOCKED_BY_STREAMING 15636L

//
// MessageId: ERROR_INSTALL_OPTIONAL_PACKAGE_APPLICATIONID_NOT_UNIQUE
//
// MessageText:
//
// A main or another optional app package has the same application ID as this optional package.  Change the application ID for the optional package to avoid conflicts.
//
static const int ERROR_INSTALL_OPTIONAL_PACKAGE_APPLICATIONID_NOT_UNIQUE 15637L

//
// MessageId: ERROR_PACKAGE_STAGING_ONHOLD
//
// MessageText:
//
// This staging session has been held to allow another staging operation to be prioritized.
//
static const int ERROR_PACKAGE_STAGING_ONHOLD     15638L

//
// MessageId: ERROR_INSTALL_INVALID_RELATED_SET_UPDATE
//
// MessageText:
//
// A related set cannot be updated because the updated set is invalid. All packages in the related set must be updated at the same time.
//
static const int ERROR_INSTALL_INVALID_RELATED_SET_UPDATE 15639L

//
// MessageId: ERROR_INSTALL_OPTIONAL_PACKAGE_REQUIRES_MAIN_PACKAGE_FULLTRUST_CAPABILITY
//
// MessageText:
//
// An optional package with a FullTrust entry point requires the main package to have the runFullTrust capability.
//
static const int ERROR_INSTALL_OPTIONAL_PACKAGE_REQUIRES_MAIN_PACKAGE_FULLTRUST_CAPABILITY 15640L

//
// MessageId: ERROR_DEPLOYMENT_BLOCKED_BY_USER_LOG_OFF
//
// MessageText:
//
// An error occurred because a user was logged off.
//
static const int ERROR_DEPLOYMENT_BLOCKED_BY_USER_LOG_OFF 15641L

//
// MessageId: ERROR_PROVISION_OPTIONAL_PACKAGE_REQUIRES_MAIN_PACKAGE_PROVISIONED
//
// MessageText:
//
// An optional package provision requires the dependency main package to also be provisioned.
//
static const int ERROR_PROVISION_OPTIONAL_PACKAGE_REQUIRES_MAIN_PACKAGE_PROVISIONED 15642L

//
// MessageId: ERROR_PACKAGES_REPUTATION_CHECK_FAILED
//
// MessageText:
//
// The packages failed the SmartScreen reputation check.
//
static const int ERROR_PACKAGES_REPUTATION_CHECK_FAILED 15643L

//
// MessageId: ERROR_PACKAGES_REPUTATION_CHECK_TIMEDOUT
//
// MessageText:
//
// The SmartScreen reputation check operation timed out.
//
static const int ERROR_PACKAGES_REPUTATION_CHECK_TIMEDOUT 15644L

//////////////////////////
//                      //
// AppModel Error Codes //
//     15700-15720      //
//                      //
//////////////////////////
//
// MessageId: APPMODEL_ERROR_NO_PACKAGE
//
// MessageText:
//
// The process has no package identity.
//
static const int APPMODEL_ERROR_NO_PACKAGE        15700L

//
// MessageId: APPMODEL_ERROR_PACKAGE_RUNTIME_CORRUPT
//
// MessageText:
//
// The package runtime information is corrupted.
//
static const int APPMODEL_ERROR_PACKAGE_RUNTIME_CORRUPT 15701L

//
// MessageId: APPMODEL_ERROR_PACKAGE_IDENTITY_CORRUPT
//
// MessageText:
//
// The package identity is corrupted.
//
static const int APPMODEL_ERROR_PACKAGE_IDENTITY_CORRUPT 15702L

//
// MessageId: APPMODEL_ERROR_NO_APPLICATION
//
// MessageText:
//
// The process has no application identity.
//
static const int APPMODEL_ERROR_NO_APPLICATION    15703L

//
// MessageId: APPMODEL_ERROR_DYNAMIC_PROPERTY_READ_FAILED
//
// MessageText:
//
// One or more AppModel Runtime group policy values could not be read. Please contact your system administrator with the contents of your AppModel Runtime event log.
//
static const int APPMODEL_ERROR_DYNAMIC_PROPERTY_READ_FAILED 15704L

//
// MessageId: APPMODEL_ERROR_DYNAMIC_PROPERTY_INVALID
//
// MessageText:
//
// One or more AppModel Runtime group policy values are invalid. Please contact your system administrator with the contents of your AppModel Runtime event log.
//
static const int APPMODEL_ERROR_DYNAMIC_PROPERTY_INVALID 15705L

//
// MessageId: APPMODEL_ERROR_PACKAGE_NOT_AVAILABLE
//
// MessageText:
//
// The package is currently not available.
//
static const int APPMODEL_ERROR_PACKAGE_NOT_AVAILABLE 15706L

/////////////////////////////
//                         //
// Appx StateManager Codes //
//     15800-15840         //
//                         //
/////////////////////////////
//
// MessageId: ERROR_STATE_LOAD_STORE_FAILED
//
// MessageText:
//
// Loading the state store failed.
//
static const int ERROR_STATE_LOAD_STORE_FAILED    15800L

//
// MessageId: ERROR_STATE_GET_VERSION_FAILED
//
// MessageText:
//
// Retrieving the state version for the application failed.
//
static const int ERROR_STATE_GET_VERSION_FAILED   15801L

//
// MessageId: ERROR_STATE_SET_VERSION_FAILED
//
// MessageText:
//
// Setting the state version for the application failed.
//
static const int ERROR_STATE_SET_VERSION_FAILED   15802L

//
// MessageId: ERROR_STATE_STRUCTURED_RESET_FAILED
//
// MessageText:
//
// Resetting the structured state of the application failed.
//
static const int ERROR_STATE_STRUCTURED_RESET_FAILED 15803L

//
// MessageId: ERROR_STATE_OPEN_CONTAINER_FAILED
//
// MessageText:
//
// State Manager failed to open the container.
//
static const int ERROR_STATE_OPEN_CONTAINER_FAILED 15804L

//
// MessageId: ERROR_STATE_CREATE_CONTAINER_FAILED
//
// MessageText:
//
// State Manager failed to create the container.
//
static const int ERROR_STATE_CREATE_CONTAINER_FAILED 15805L

//
// MessageId: ERROR_STATE_DELETE_CONTAINER_FAILED
//
// MessageText:
//
// State Manager failed to delete the container.
//
static const int ERROR_STATE_DELETE_CONTAINER_FAILED 15806L

//
// MessageId: ERROR_STATE_READ_SETTING_FAILED
//
// MessageText:
//
// State Manager failed to read the setting.
//
static const int ERROR_STATE_READ_SETTING_FAILED  15807L

//
// MessageId: ERROR_STATE_WRITE_SETTING_FAILED
//
// MessageText:
//
// State Manager failed to write the setting.
//
static const int ERROR_STATE_WRITE_SETTING_FAILED 15808L

//
// MessageId: ERROR_STATE_DELETE_SETTING_FAILED
//
// MessageText:
//
// State Manager failed to delete the setting.
//
static const int ERROR_STATE_DELETE_SETTING_FAILED 15809L

//
// MessageId: ERROR_STATE_QUERY_SETTING_FAILED
//
// MessageText:
//
// State Manager failed to query the setting.
//
static const int ERROR_STATE_QUERY_SETTING_FAILED 15810L

//
// MessageId: ERROR_STATE_READ_COMPOSITE_SETTING_FAILED
//
// MessageText:
//
// State Manager failed to read the composite setting.
//
static const int ERROR_STATE_READ_COMPOSITE_SETTING_FAILED 15811L

//
// MessageId: ERROR_STATE_WRITE_COMPOSITE_SETTING_FAILED
//
// MessageText:
//
// State Manager failed to write the composite setting.
//
static const int ERROR_STATE_WRITE_COMPOSITE_SETTING_FAILED 15812L

//
// MessageId: ERROR_STATE_ENUMERATE_CONTAINER_FAILED
//
// MessageText:
//
// State Manager failed to enumerate the containers.
//
static const int ERROR_STATE_ENUMERATE_CONTAINER_FAILED 15813L

//
// MessageId: ERROR_STATE_ENUMERATE_SETTINGS_FAILED
//
// MessageText:
//
// State Manager failed to enumerate the settings.
//
static const int ERROR_STATE_ENUMERATE_SETTINGS_FAILED 15814L

//
// MessageId: ERROR_STATE_COMPOSITE_SETTING_VALUE_SIZE_LIMIT_EXCEEDED
//
// MessageText:
//
// The size of the state manager composite setting value has exceeded the limit.
//
static const int ERROR_STATE_COMPOSITE_SETTING_VALUE_SIZE_LIMIT_EXCEEDED 15815L

//
// MessageId: ERROR_STATE_SETTING_VALUE_SIZE_LIMIT_EXCEEDED
//
// MessageText:
//
// The size of the state manager setting value has exceeded the limit.
//
static const int ERROR_STATE_SETTING_VALUE_SIZE_LIMIT_EXCEEDED 15816L

//
// MessageId: ERROR_STATE_SETTING_NAME_SIZE_LIMIT_EXCEEDED
//
// MessageText:
//
// The length of the state manager setting name has exceeded the limit.
//
static const int ERROR_STATE_SETTING_NAME_SIZE_LIMIT_EXCEEDED 15817L

//
// MessageId: ERROR_STATE_CONTAINER_NAME_SIZE_LIMIT_EXCEEDED
//
// MessageText:
//
// The length of the state manager container name has exceeded the limit.
//
static const int ERROR_STATE_CONTAINER_NAME_SIZE_LIMIT_EXCEEDED 15818L

/////////////////////////////////
//                             //
// Application Partition Codes //
//     15841-15860             //
//                             //
/////////////////////////////////
//
// MessageId: ERROR_API_UNAVAILABLE
//
// MessageText:
//
// This API cannot be used in the context of the caller's application type.
//
static const int ERROR_API_UNAVAILABLE            15841L
-]]


ffi.cdef[[
//
// MessageId: E_NOTIMPL
//
// MessageText:
//
// Not implemented
//
static const int  E_NOTIMPL                       = 0x80004001;

//
// MessageId: E_OUTOFMEMORY
//
// MessageText:
//
// Ran out of memory
//
static const int  E_OUTOFMEMORY                   = 0x8007000E;

//
// MessageId: E_INVALIDARG
//
// MessageText:
//
// One or more arguments are invalid
//
static const int  E_INVALIDARG                    = 0x80070057;

//
// MessageId: E_NOINTERFACE
//
// MessageText:
//
// No such interface supported
//
static const int  E_NOINTERFACE                   = 0x80004002;

//
// MessageId: E_POINTER
//
// MessageText:
//
// Invalid pointer
//
static const int  E_POINTER                       = 0x80004003;

//
// MessageId: E_HANDLE
//
// MessageText:
//
// Invalid handle
//
static const int  E_HANDLE                        = 0x80070006;

//
// MessageId: E_ABORT
//
// MessageText:
//
// Operation aborted
//
static const int  E_ABORT                         = 0x80004004;



//
// MessageId: E_FAIL
//
// MessageText:
//
// Unspecified error
//
static const int E_FAIL                         =  0x80004005;




//
// MessageId: E_ACCESSDENIED
//
// MessageText:
//
// General access denied error
//
static const int  E_ACCESSDENIED                  = 0x80070005;

static const int CO_E_FIRST      =  0x800401F0;
static const int CO_E_LAST       =  0x800401FF;
static const int CO_S_FIRST      =  0x000401F0;
static const int CO_S_LAST       =  0x000401FF;

//
// MessageId: CO_E_NOTINITIALIZED
//
// MessageText:
//
// CoInitialize has not been called.
//
static const int CO_E_NOTINITIALIZED              = 0x800401F0;
]]
