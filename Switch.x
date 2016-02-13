#import "FSSwitchDataSource.h"
#import "FSSwitchPanel.h"

@interface ClearBadgeFlipSwitchSwitch : NSObject <FSSwitchDataSource>
@end

@implementation ClearBadgeFlipSwitchSwitch

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier
{
	return FSSwitchStateOff;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier
{
 if ([%c(SBIconViewMap) respondsToSelector:@selector(homescreenMap)]) {
  for (NSString *identifier in [[[%c(SBIconViewMap) homescreenMap] iconModel] visibleIconIdentifiers]) {
   id *icon = [[[%c(SBIconViewMap) homescreenMap] iconModel] applicationIconForBundleIdentifier:identifier];
   if (icon && [icon badgeNumberOrString]) {
    [icon setBadge:nil];
   }
  }
 }
}
- (NSString *)titleForSwitchIdentifier:(NSString *)switchIdentifier {
	return @"ClearBadge";
}

@end
