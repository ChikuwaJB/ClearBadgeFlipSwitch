#import "FSSwitchDataSource.h"
#import "FSSwitchPanel.h"

@interface SBIconModel
- (id)visibleIconIdentifiers;
- (id)applicationIconForBundleIdentifier:(id)arg1;
@end

@interface SBApplicationIcon
- (id)badgeNumberOrString;
- (void)setBadge:(id)arg1;
@end

@interface SBIconViewMap
@property (nonatomic,retain,readonly) SBIconModel * iconModel;
+ (id)homescreenMap;
- (SBIconModel *)iconModel;
@end


@interface ClearBadge : NSObject <FSSwitchDataSource>
@end

@implementation ClearBadge

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier
{
	return FSSwitchStateOff;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier
{
    if ([%c(SBIconViewMap) respondsToSelector:@selector(homescreenMap)]) {
        for (NSString *identifier in [[[%c(SBIconViewMap) homescreenMap] iconModel] visibleIconIdentifiers]) {
            NSString *icon = [[[%c(SBIconViewMap) homescreenMap] iconModel] applicationIconForBundleIdentifier:identifier];
            
            NSString *badgeStr = [[[[%c(SBIconViewMap) homescreenMap] iconModel] applicationIconForBundleIdentifier:identifier] badgeNumberOrString];
            int badgeValue = [badgeStr intValue];
            
            if (icon != nil && badgeValue > 0) {
                [[[[%c(SBIconViewMap) homescreenMap] iconModel] applicationIconForBundleIdentifier:identifier] setBadge:nil];
            }
        }
    }
    // Support Polus's bottom shelf
    [[FSSwitchPanel sharedPanel] stateDidChangeForSwitchIdentifier:@"com.chikuwa.clearbadgeflipswitch"];
}

- (NSString *)titleForSwitchIdentifier:(NSString *)switchIdentifier
{
	return @"ClearBadge";
}

@end
