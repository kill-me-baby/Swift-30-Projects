//
//  Stoptimer.h
//  Stopwatch
//
//  Created by Uladzislau Volchyk on 7/2/20.
//

#import <Foundation/Foundation.h>

@interface Stoptimer : NSObject
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, copy) NSNumber *offset;
@end
