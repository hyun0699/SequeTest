//
//  Controller.h
//  SequeTest
//
//  Created by hyun0699 on 30/11/2019.
//  Copyright © 2019 hyun0699. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Controller : NSObject {
    NSInteger count;
}

- (void)setCount:(NSInteger)a;
- (NSUInteger)getCount;
- (void)increaseCount;

@end

NS_ASSUME_NONNULL_END
