//
//  ViewController.h
//  WebView
//
//  Created by Parallelogramist on 6/20/14.
//  Copyright (c) 2014 Oscicoil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    
    IBOutlet UITextField *searchField;
    IBOutlet UIWebView *webView;
}
- (IBAction)back:(id)sender;
- (IBAction)forward:(id)sender;
- (IBAction)go:(id)sender;
- (IBAction)share:(id)sender;

@end
