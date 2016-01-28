//
//  AppDelegate.m
//  testWorldpayLibrary
//
//  Copyright (c) 2015 Worldpay. All rights reserved.
//

#import "AppDelegate.h"
#import "NavigationViewController.h"
#import "SplashScreenViewController.h"
#import "AFNetworkActivityLogger.h"
#import "AFNetworking.h"
#import "Worldpay.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    _screenRect = [[UIScreen mainScreen]bounds];
    
    SplashScreenViewController *splashScreen = [[SplashScreenViewController alloc]init];
    self.window.rootViewController = splashScreen;
    
    //self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [[AFNetworkActivityLogger sharedLogger] startLogging];
    
    _debugMode = YES;
    
    [[Worldpay sharedInstance] setReusable:YES];
    
    [self setKeys];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark -

- (void)setKeys {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *clientKey = [userDefaults valueForKey:@"clientKey"];
    NSString *serviceKey = [userDefaults valueForKey:@"serviceKey"];
    if (!clientKey) {
        clientKey = @"T_C_e51c8f3f-b038-453a-9b0c-904f489e5c3a";
        [userDefaults setValue:clientKey forKey:@"clientKey"];
    }
    if (!serviceKey) {
        serviceKey = @"T_S_9eafef79-bc9a-42d6-a0a8-53f9035ff1dc";
        [userDefaults setValue:serviceKey forKey:@"serviceKey"];
    }
    
    [userDefaults synchronize];
    
    [[Worldpay sharedInstance] setClientKey:clientKey];
    [[Worldpay sharedInstance] setServiceKey:serviceKey];
}

@end
