//
//  Model.h
//  SequeTest
//
//  Created by hyun0699 on 30/11/2019.
//  Copyright © 2019 hyun0699. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^connectBlock)(NSDictionary *outData, Boolean success);

@interface Model : NSObject {
    NSString *_name;
    NSString *_key;
}
@property(nonatomic, strong)NSDictionary *data;

-(instancetype)initWithData:(connectBlock)blcok;

@end

NS_ASSUME_NONNULL_END
