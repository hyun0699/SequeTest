//
//  ShowTableViewController.m
//  SequeTest
//
//  Created by hyun0699 on 01/12/2019.
//  Copyright © 2019 hyun0699. All rights reserved.
//

#import "ShowTableViewController.h"
#import "Model.h"
#import "CustomCell.h"
#import "StackViewController.h"
#import "ScrollViewController.h"

@interface ShowTableViewController ()

@end

@implementation ShowTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Table 샘플";
    // Do any additional setup after loading the view.
    self.table.dataSource = self;
    self.table.delegate = self;
    self.table.hidden = YES;
    self.model = [[Model alloc] initWithData:^(NSDictionary * _Nonnull outData, Boolean success) {
        if(success) {
            NSDictionary *ins = outData[@"args"];
            self.outData = [ins valueForKey:@"baz[]"];
            self.loading.hidden = YES;
            self.table.hidden = NO;
            [self.table reloadData];
            
        }
    }];
    
    arr = @[@"사과",@"바나나",@"딸기"];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *identifier = @"CustomCell2";
    CustomCell *cell = (CustomCell *)[self.table dequeueReusableCellWithIdentifier:identifier];
    cell.textLabel.text = [self.outData objectAtIndex:indexPath.row];
    
    return cell;
    
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.outData count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 1) {
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ScrollViewController *scroll = [story instantiateViewControllerWithIdentifier:@"Scroll"];
        
        [self.navigationController pushViewController:scroll animated:YES];
    } else {
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        StackViewController *stack = [story instantiateViewControllerWithIdentifier:@"Stack"];
        
        [self.navigationController pushViewController:stack animated:YES];
    }
}

//- (void)encodeWithCoder:(nonnull NSCoder *)coder {
//    <#code#>
//}
//
//- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
//    <#code#>
//}
//
//- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
//    <#code#>
//}
//
//- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
//    <#code#>
//}
//
//- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
//    <#code#>
//}
//
//- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
//    <#code#>
//}
//
//- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
//    <#code#>
//}
//
//- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {
//    <#code#>
//}
//
//- (void)setNeedsFocusUpdate {
//    <#code#>
//}
//
//- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
//    <#code#>
//}
//
//- (void)updateFocusIfNeeded {
//    <#code#>
//}

@end
