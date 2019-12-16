//
//  StackViewController.m
//  SequeTest
//
//  Created by hyun0699 on 16/12/2019.
//  Copyright © 2019 hyun0699. All rights reserved.
//

#import "StackViewController.h"

@interface StackViewController ()

@end

@implementation StackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [UIView animateWithDuration:2.0 animations:^{
//        self.bottom.constant = 100.0f;
//        [self.view layoutIfNeeded];
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)buttonClick:(id)sender {
        [UIView animateWithDuration:2.0 animations:^{
            self.bottom.constant = 100.0f;
            [self.view layoutIfNeeded];
//            [self.view setNeedsLayout];
        }];
}
@end
