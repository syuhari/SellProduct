//
//  SPViewController.h
//  SellProduct
//
//  Created by 松浦 晃洋 on 12/07/26.
//  Copyright (c) 2012年 Syuhari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>

@interface SPViewController : UIViewController <SKStoreProductViewControllerDelegate>

- (IBAction)tapButton:(id)sender;
- (IBAction)tapPlus:(id)sender;

@end
