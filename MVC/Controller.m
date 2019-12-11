//
//  Controller.m
//  SequeTest
//
//  Created by hyun0699 on 30/11/2019.
//  Copyright © 2019 hyun0699. All rights reserved.
//

#import "Controller.h"

@implementation Controller

- (void)setCount:(NSInteger)a {
    count = a;
}
- (NSUInteger)getCount {
    return count;
};

- (void)increaseCount {
    count++;
}
@end
