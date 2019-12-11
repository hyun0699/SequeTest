//
//  ShowTableViewController.h
//  SequeTest
//
//  Created by hyun0699 on 01/12/2019.
//  Copyright © 2019 hyun0699. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"

NS_ASSUME_NONNULL_BEGIN


@interface ShowTableViewController : UIViewController<UITableViewDelegate, UITableViewDataSource> {
    NSArray *arr;
}
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (strong, nonatomic) Model *model;
@property (strong, nonatomic)NSArray *outData;
@property (weak, nonatomic) IBOutlet UILabel *loading;
@end

NS_ASSUME_NONNULL_END
