#import <Foundation/Foundation.h>
#import <CocoaHTTPServer/HTTPResponse.h>


@interface HTTPDataResponse : NSObject <HTTPResponse>
{
	NSUInteger offset;
	NSData *data;
}

- (id)initWithData:(NSData *)data;

@end
