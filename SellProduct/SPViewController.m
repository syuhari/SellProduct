//
//  SPViewController.m
//  SellProduct
//
//  Created by 松浦 晃洋 on 12/07/26.
//  Copyright (c) 2012年 Syuhari. All rights reserved.
//

#import "SPViewController.h"
#import "UIAlertView+Helper.h"

#define RHYTHM_EHON 469322728
#define RHYTHM_PLUS 479469056

@interface SPViewController ()

@end

@implementation SPViewController

- (void)viewSellProduct:(NSInteger)appId {
    if (!NSClassFromString(@"SKStoreProductViewController")) {
        UIAlertViewQuick(@"エラー", @"お使いの端末は本機能がサポートされていません", @"OK");
        return;
    }
    
    SKStoreProductViewController *viewController = [[SKStoreProductViewController alloc] init];
    viewController.delegate = self;
    
    NSDictionary *parameters = @{SKStoreProductParameterITunesItemIdentifier: [NSNumber numberWithInteger:appId]};
    
    [viewController loadProductWithParameters:parameters completionBlock: ^(BOOL result, NSError *error) {
        if (result) {
            [self presentViewController:viewController animated:YES completion:nil];
        } else {
            NSLog(@"description: %@", [error localizedDescription]);
            NSLog(@"failure reason: %@", [error localizedFailureReason]);
            NSLog(@"code: %d", [error code]);
            UIAlertViewQuick(@"エラー", [error localizedDescription], @"OK");
        }
    }];
    
    [viewController release];
}

- (IBAction)tapButton:(id)sender {
    [self viewSellProduct:RHYTHM_EHON];
}

- (IBAction)tapPlus:(id)sender {
    [self viewSellProduct:RHYTHM_PLUS];
}

- (void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController {
    [viewController dismissViewControllerAnimated:YES completion:^{
        NSLog(@"closed");
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
