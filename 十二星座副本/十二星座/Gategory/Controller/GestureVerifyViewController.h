
#import <UIKit/UIKit.h>
typedef void(^ShouShiPanDuan)(BOOL);
@interface GestureVerifyViewController : UIViewController
@property(nonatomic,strong)ShouShiPanDuan shoushipanduan;
@property (nonatomic, assign) BOOL isToSetNewGesture;

@end
