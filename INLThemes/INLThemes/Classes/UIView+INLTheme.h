//
//  INLThemedView.h
//
//  Created by Tomas Hakel on 01/02/2016.
//  Copyright © 2016 Inloop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "INLThemeElement.h"


@protocol INLThemedView <NSObject>

@property (nonatomic) NSString * elementId;

-(void)applyTheme:(INLThemeElement *)theme;

@end


@interface UIView (INLTheme)<INLThemedView>

@property (nonatomic) IBInspectable NSString * elementId;

@end


@interface NSObject (INLThemable)

-(BOOL)isThemable;

@end


#define synthesizeElementId \
	- (NSString *)elementId { \
		return objc_getAssociatedObject(self, @selector(elementId)); \
	} \
	- (void)setElementId:(NSString *)elementId { \
		objc_setAssociatedObject(self, @selector(elementId), elementId, OBJC_ASSOCIATION_RETAIN_NONATOMIC); \
	}