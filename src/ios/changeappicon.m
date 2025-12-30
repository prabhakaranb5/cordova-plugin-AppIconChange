
#import "changeappicon.h"
#import <UIKit/UIKit.h>

@implementation changeappicon

- (void)ChanageToIcon:(CDVInvokedUrlCommand*)command
{
    NSString *iconName = nil;
    if (command.arguments.count > 0 && 
        [[command.arguments objectAtIndex:0] isKindOfClass:[NSString class]]) {
        iconName = [command.arguments objectAtIndex:0];
        // Treat empty string as invalid; use nil to revert to primary
        if (iconName.length == 0) {
            iconName = nil;
        }
    }

    // Verify runtime support
    if (![[UIApplication sharedApplication] supportsAlternateIcons]) {
        CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR
                                                   messageAsString:@"Alternate icons not supported on this device/app."];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
        return;
    }

    // Change the icon asynchronously and respond from the completion handler
    [[UIApplication sharedApplication] setAlternateIconName:iconName
                                          completionHandler:^(NSError * _Nullable error) {
        CDVPluginResult *pluginResult = nil;

        if (error) {
            // Helpful diagnostics
            NSString *msg = [NSString stringWithFormat:@"Failed to change icon: %@ (domain=%@ code=%ld)",
                             error.localizedDescription ?: @"Unknown",
                             error.domain ?: @"",
                             (long)error.code];

            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR
                                             messageAsString:msg];
        } else {
            NSString *targetName = iconName ?: @"(primary)";
            NSString *msg = [NSString stringWithFormat:@"Icon changed successfully to %@", targetName];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK
                                             messageAsString:msg];
        }

        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

@end
