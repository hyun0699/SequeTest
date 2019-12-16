//
//  StackViewController.h
//  SequeTest
//
//  Created by hyun0699 on 16/12/2019.
//  Copyright © 2019 hyun0699. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface StackViewController : UIViewController
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *stackBottom;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottom;
- (IBAction)buttonClick:(id)sender;

@end

NS_ASSUME_NONNULL_END
