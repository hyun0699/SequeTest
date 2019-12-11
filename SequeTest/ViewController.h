//
//  ViewController.h
//  SequeTest
//
//  Created by hyun0699 on 29/11/2019.
//  Copyright © 2019 hyun0699. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking/AFNetworking.h>

typedef void(^returnBlock)(NSString *a, NSString *b);

@interface ViewController : UIViewController

@property(nonatomic, strong)returnBlock block;


- (void)startBolck:(NSString *)star block:(returnBlock)block;

@end

