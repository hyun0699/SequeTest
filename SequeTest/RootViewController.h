//
//  RootViewController.h
//  SequeTest
//
//  Created by hyun0699 on 29/11/2019.
//  Copyright © 2019 hyun0699. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface RootViewController : UITableViewController {
    
}

@property(nonatomic, strong)NSDictionary *inSData;
@property(nonatomic, strong)ViewController *preViewController;
- (IBAction)test:(id)sender;

@end

NS_ASSUME_NONNULL_END
