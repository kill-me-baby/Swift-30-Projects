//
//  ViewController.m
//  Stopwatch
//
//  Created by Uladzislau Volchyk on 7/2/20.
//

#import "ViewController.h"
#import "Stoptimer.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *lapLabel;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *labButton;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) Stoptimer *mainTimer;
@property (nonatomic, strong) Stoptimer *lapTimer;
@property (nonatomic, assign, getter=isPlay) BOOL play;

@property (nonatomic, strong) NSMutableArray<NSString *> *laps;

@end

@implementation ViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _play = NO;
        _mainTimer = [Stoptimer new];
        _lapTimer = [Stoptimer new];
        _laps = [NSMutableArray new];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.startButton addTarget:self action:@selector(playPauseTimer) forControlEvents:UIControlEventTouchUpInside];
    [self.labButton addTarget:self action:@selector(lapResetTimer) forControlEvents:UIControlEventTouchUpInside];
    [self.labButton setEnabled:NO];
    [self.labButton setTitleColor:[UIColor.systemBlueColor colorWithAlphaComponent:0.3] forState:UIControlStateDisabled];
    
    self.startButton.layer.backgroundColor = UIColor.whiteColor.CGColor;
    self.startButton.layer.cornerRadius = 40.0f;
    
    self.labButton.layer.backgroundColor = UIColor.whiteColor.CGColor;
    self.labButton.layer.cornerRadius = 40.0f;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)playPauseTimer {
    [self.labButton setEnabled:YES];
    if(self.isPlay) {
        [self.mainTimer.timer invalidate];
        [self.lapTimer.timer invalidate];
        [self changeButton:self.startButton withText:@"Start" andColor:UIColor.redColor];
        [self changeButton:self.labButton withText:@"Reset" andColor:UIColor.blackColor];
        self.play = NO;
    } else {
        self.mainTimer.timer = [NSTimer scheduledTimerWithTimeInterval:0.035 target:self selector:@selector(updateMainTimer) userInfo:nil repeats:YES];
        self.lapTimer.timer = [NSTimer scheduledTimerWithTimeInterval:0.035 target:self selector:@selector(updateLapTimer) userInfo:nil repeats:YES];
        
        [NSRunLoop.currentRunLoop addTimer:self.mainTimer.timer forMode:NSRunLoopCommonModes];
        [NSRunLoop.currentRunLoop addTimer:self.lapTimer.timer forMode:NSRunLoopCommonModes];
        
        [self changeButton:self.labButton withText:@"Lap" andColor:UIColor.blueColor];
        [self changeButton:self.startButton withText:@"Stop" andColor:UIColor.redColor];
        self.play = YES;
    }
}

- (void)lapResetTimer {
    if(self.isPlay) {
        
        [self saveLapOnLabel:self.lapLabel];
        [self resetLapTimer];
        self.lapTimer.timer = [NSTimer scheduledTimerWithTimeInterval:0.035 target:self selector:@selector(updateLapTimer) userInfo:nil repeats:YES];
        [NSRunLoop.currentRunLoop addTimer:self.lapTimer.timer forMode:NSRunLoopCommonModes];
    } else {
        [self resetMainTimer];
        [self resetLapTimer];
        [self changeButton:self.labButton withText:@"Lap" andColor:UIColor.blueColor];
        [self.labButton setEnabled:NO];
        [self.laps removeAllObjects];
        [self.tableView reloadData];
        [self.labButton setEnabled:NO];
    }
}

- (void)resetMainTimer {
    [self resetTimer:self.mainTimer onLabel:self.timerLabel];
}

- (void)resetLapTimer {
    [self resetTimer:self.lapTimer onLabel:self.lapLabel];
}

- (void)resetTimer:(Stoptimer *)timer onLabel:(UILabel *)label {
    label.text = @"00:00:00";
    [timer.timer invalidate];
    timer.offset = @(0);
}

- (void)updateMainTimer {
    [self updateTimer:self.mainTimer onLabel:self.timerLabel];
}

- (void)updateLapTimer {
    [self updateTimer:self.lapTimer onLabel:self.lapLabel];
}

- (void)updateTimer:(Stoptimer *)timer onLabel:(UILabel *)label {
    timer.offset = @(0.035 + timer.offset.floatValue);
    
    NSString *seconds = @"";
    if(timer.offset.intValue % 60 < 10) {
        seconds = [NSString stringWithFormat:@"0%@", getRemainder(timer.offset)];
    } else {
        seconds = [NSString stringWithFormat:@"%@", getRemainder(timer.offset)];
    }
    
    NSString *minutes = @"";
    if(timer.offset.intValue / 60 < 10) {
        minutes = [NSString stringWithFormat:@"0%@", @(timer.offset.intValue / 60)];
    } else {
    minutes = [NSString stringWithFormat:@"%@", @(timer.offset.intValue / 60)];
    }
    
    label.text = [NSString stringWithFormat:@"%@:%@",minutes, seconds];
}

- (void)changeButton:(UIButton *)button withText:(NSString *)text andColor:(UIColor *)color {
    [button setTitle:text forState:[UIControl new].state];
    [button setTitleColor:color forState:[UIControl new].state];
}

- (void)saveLapOnLabel:(UILabel *)label {
    [self.laps insertObject:label.text atIndex:0];
    [self.tableView reloadData];
}

NSString *getRemainder(NSNumber *number) {
    double afterPoint = number.doubleValue - number.intValue;
    int twoDigits = (afterPoint * 100);
    NSString *result = [NSString stringWithFormat:@"%d.%d", number.intValue, twoDigits];
    return result;
}

#pragma mark - Delegate & Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.laps.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    cell.detailTextLabel.text = self.laps[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"Lap %ld",self.laps.count - (long)indexPath.row];
    
    return cell;
}

@end
