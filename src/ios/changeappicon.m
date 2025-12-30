#import "changeappicon.h"
#import <Foundation/Foundation.h>

@interface changeappicon () 

@property (nonatomic) CDVInvokedUrlCommand* command;

@end
BOOL IsErr;
@implementation changeappicon
- (void)ChanageToIcon:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
	NSString* IconName = [command.arguments objectAtIndex:0];
	IsErr = false;
	NSLog(@"Error... %@", IconName);
	[[UIApplication sharedApplication] setAlternateIconName:IconName completionHandler:^(NSError * _Nullable error) {
                NSLog(@"Error... %@", error);
				IsErr = true;
        }];
		if(IsErr){
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
		}else{
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Plugin Success"];
		}
        //pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
  

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	
}
@end
