
//  https://github.com/robbiehanson/CocoaAsyncSocket
//
#import <Foundation/Foundation.h>
#import <Security/Security.h>
#import <Security/SecureTransport.h>
#import <dispatch/dispatch.h>
#import <Availability.h>

#include <sys/socket.h> // AF_INET, AF_INET6

#define EAccountAsyncSocketSSLPeerName (NSString *)kCFStreamSSLPeerName

@class EAGCDAsyncReadPacket;
@class EAGCDAsyncWritePacket;
@class EAGCDAsyncSocketPreBuffer;
@protocol GCDAsyncSocketDelegate;

NS_ASSUME_NONNULL_BEGIN

extern NSString *const EAGCDAsyncSocketException;
extern NSString *const EAGCDAsyncSocketErrorDomain;

extern NSString *const EAGCDAsyncSocketQueueName;
extern NSString *const EAGCDAsyncSocketThreadName;

extern NSString *const EAGCDAsyncSocketManuallyEvaluateTrust;
extern NSString *const EAGCDAsyncSocketUseCFStreamForTLS;

#define GCDAsyncSocketSSLPeerName     (NSString *)kCFStreamSSLPeerName

extern NSString *const EAGCDAsyncSocketSSLPeerID;
extern NSString *const EAGCDAsyncSocketSSLProtocolVersionMin;
extern NSString *const EAGCDAsyncSocketSSLProtocolVersionMax;
extern NSString *const EAGCDAsyncSocketSSLSessionOptionFalseStart;
extern NSString *const EAGCDAsyncSocketSSLSessionOptionSendOneByteRecord;
extern NSString *const EAGCDAsyncSocketSSLCipherSuites;

#define GCDAsyncSocketLoggingContext 65535

typedef NS_ENUM(NSInteger, GCDAsyncSocketError) {
	GCDAsyncSocketNoError = 0,           // Never used
	GCDAsyncSocketBadConfigError,        // Invalid configuration
	GCDAsyncSocketBadParamError,         // Invalid parameter was passed
	GCDAsyncSocketConnectTimeoutError,   // A connect operation timed out
	GCDAsyncSocketReadTimeoutError,      // A read operation timed out
	GCDAsyncSocketWriteTimeoutError,     // A write operation timed out
	GCDAsyncSocketReadMaxedOutError,     // Reached set maxLength without completing
	GCDAsyncSocketClosedError,           // The remote peer closed the connection
	GCDAsyncSocketOtherError,            // Description provided in userInfo
};

#pragma mark -

@interface EAccountGCDAsyncSocket : NSObject

- (instancetype)initWithDelegate:(nullable id<GCDAsyncSocketDelegate>)aDelegate delegateQueue:(nullable dispatch_queue_t)dq;
- (instancetype)initWithDelegate:(nullable id<GCDAsyncSocketDelegate>)aDelegate delegateQueue:(nullable dispatch_queue_t)dq socketQueue:(nullable dispatch_queue_t)sq;

#pragma mark Configuration

@property (atomic, weak, readwrite, nullable) id<GCDAsyncSocketDelegate> delegate;
@property (atomic, strong, readwrite, nullable) dispatch_queue_t delegateQueue;

- (void)setDelegate:(nullable id<GCDAsyncSocketDelegate>)delegate delegateQueue:(nullable dispatch_queue_t)delegateQueue;


@property (atomic, assign, readwrite, getter=isIPv4Enabled) BOOL IPv4Enabled;
@property (atomic, assign, readwrite, getter=isIPv6Enabled) BOOL IPv6Enabled;

@property (atomic, assign, readwrite, getter=isIPv4PreferredOverIPv6) BOOL IPv4PreferredOverIPv6;

#pragma mark Connecting

- (BOOL)connectToHost:(NSString *)host
               onPort:(uint16_t)port
          withTimeout:(NSTimeInterval)timeout
                error:(NSError **)errPtr;

- (BOOL)connectToHost:(NSString *)host
               onPort:(uint16_t)port
         viaInterface:(nullable NSString *)interface
          withTimeout:(NSTimeInterval)timeout
                error:(NSError **)errPtr;

- (void)readDataToLength:(NSUInteger)length withTimeout:(NSTimeInterval)timeout tag:(long)tag;

#pragma mark Disconnecting

- (void)disconnect;

#pragma mark Diagnostics

@property (atomic, readonly) BOOL isDisconnected;
@property (atomic, readonly) BOOL isConnected;

@property (atomic, readonly, nullable) NSString *connectedHost;
@property (atomic, readonly) uint16_t  connectedPort;


@property (atomic, readonly) BOOL isIPv4;
@property (atomic, readonly) BOOL isIPv6;

@property (atomic, readonly) BOOL isSecure;

#pragma mark Reading
- (void)readDataToData:(NSData *)data withTimeout:(NSTimeInterval)timeout tag:(long)tag;

- (void)readDataToData:(NSData *)data
           withTimeout:(NSTimeInterval)timeout
                buffer:(nullable NSMutableData *)buffer
          bufferOffset:(NSUInteger)offset
             maxLength:(NSUInteger)length
                   tag:(long)tag;

#pragma mark Writing

- (void)writeData:(NSData *)data withTimeout:(NSTimeInterval)timeout tag:(long)tag;

#pragma mark Security

- (void)startTLS:(nullable NSDictionary <NSString*,NSObject*>*)tlsSettings;

#pragma mark Advanced
- (int)socketFD;
- (int)socket4FD;
- (int)socket6FD;
- (nullable CFReadStreamRef)readStream;
- (nullable CFWriteStreamRef)writeStream;

- (nullable SSLContextRef)sslContext;

#pragma mark Utilities

+ (nullable NSMutableArray *)lookupHost:(NSString *)host port:(uint16_t)port error:(NSError **)errPtr;
+ (uint16_t)portFromAddress:(NSData *)address;

+ (BOOL)isIPv4Address:(NSData *)address;
+ (BOOL)isIPv6Address:(NSData *)address;

@end

#pragma mark -

@protocol GCDAsyncSocketDelegate <NSObject>
@optional

- (void)socket:(EAccountGCDAsyncSocket *)sock didAcceptNewSocket:(EAccountGCDAsyncSocket *)newSocket;
- (void)socket:(EAccountGCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port;
- (void)socket:(EAccountGCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag;
- (void)socket:(EAccountGCDAsyncSocket *)sock didReadPartialDataOfLength:(NSUInteger)partialLength tag:(long)tag;
- (void)socket:(EAccountGCDAsyncSocket *)sock didWriteDataWithTag:(long)tag;
- (void)socket:(EAccountGCDAsyncSocket *)sock didWritePartialDataOfLength:(NSUInteger)partialLength tag:(long)tag;

- (NSTimeInterval)socket:(EAccountGCDAsyncSocket *)sock shouldTimeoutReadWithTag:(long)tag
                                                                 elapsed:(NSTimeInterval)elapsed
                                                               bytesDone:(NSUInteger)length;

- (NSTimeInterval)socket:(EAccountGCDAsyncSocket *)sock shouldTimeoutWriteWithTag:(long)tag
                                                                  elapsed:(NSTimeInterval)elapsed
                                                                bytesDone:(NSUInteger)length;
- (void)socketDidCloseReadStream:(EAccountGCDAsyncSocket *)sock;

- (void)socketDidDisconnect:(EAccountGCDAsyncSocket *)sock withError:(nullable NSError *)err;

- (void)socketDidSecure:(EAccountGCDAsyncSocket *)sock;

- (void)socket:(EAccountGCDAsyncSocket *)sock didReceiveTrust:(SecTrustRef)trust
                                    completionHandler:(void (^)(BOOL shouldTrustPeer))completionHandler;

@end
NS_ASSUME_NONNULL_END
