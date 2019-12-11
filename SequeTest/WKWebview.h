//
//  WKWebview.h
//  SequeTest
//
//  Created by hyun0699 on 02/12/2019.
//  Copyright © 2019 hyun0699. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WKWebview : UIViewController<WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler>

@property(nonatomic, strong)WKWebView *webview;
@end


NS_ASSUME_NONNULL_END
