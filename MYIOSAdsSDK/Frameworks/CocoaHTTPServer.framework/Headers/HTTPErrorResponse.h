#import <CocoaHTTPServer/HTTPResponse.h>

@interface HTTPErrorResponse : NSObject <HTTPResponse> {
    NSInteger _status;
}

- (id)initWithErrorCode:(int)httpErrorCode;

@end
