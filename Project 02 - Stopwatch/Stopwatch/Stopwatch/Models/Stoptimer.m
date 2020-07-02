//
//  Stoptimer.m
//  Stopwatch
//
//  Created by Uladzislau Volchyk on 7/2/20.
//

#import "Stoptimer.h"

@interface Stoptimer ()

@end

@implementation Stoptimer

- (instancetype)init
{
    self = [super init];
    if (self) {
        _timer = [NSTimer new];
        _offset = [NSNumber new];
    }
    return self;
}

@end
