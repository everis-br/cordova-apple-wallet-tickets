/********* AppleWalletTickets.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import <PassKit/PassKit.h>

@interface AppleWalletTickets : CDVPlugin {
  // Member variables go here.
}

- (void)sendTicketToWallet:(CDVInvokedUrlCommand*)command;
@end

@implementation AppleWalletTickets

- (void)sendTicketToWallet:(CDVInvokedUrlCommand*)command
{
    NSString* base64String = [command.arguments objectAtIndex:0];
    
    @try {
        NSData *data = [[NSData alloc] initWithBase64EncodedString:base64String options:0];

        PKPass *pass = [[PKPass alloc] initWithData:data error:nil];

        PKAddPassesViewController *vc = [[PKAddPassesViewController alloc] initWithPass:pass];
        [vc setDelegate:(id)self];

        UIViewController * rootController = [[[[UIApplication sharedApplication] delegate] window] rootViewController];

        [rootController presentViewController:vc animated:YES completion:nil];
    } @catch (NSException *exception) {
        NSLog(@"Error on include base64 to wallet");
    }
}

@end
