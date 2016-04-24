//
//  ExerciseAndFoodLog.m
//  Adept_iOS
//
//  Created by Martin Kuvandzhiev on 4/24/16.
//  Copyright © 2016 Martin Kuvandzhiev. All rights reserved.
//

#import "ExerciseAndFoodLog.h"

@implementation ExerciseAndFoodLog

+ (id)sharedInstance
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init]; // or some other init method
    });
    return _sharedObject;
}

- (instancetype) init
{
    self = [super init];
    if(self)
    {
        if(![[NSUserDefaults standardUserDefaults] objectForKey:@"LogType"]) // logValue, logDate
        {
            NSArray * foodArray = [NSArray arrayWithObject:@"Лютеница"];
            NSArray * logValue = [NSArray arrayWithObject:@"60"];
            NSArray * dateArray = [NSArray arrayWithObject:[NSDate date]];
            [[NSUserDefaults standardUserDefaults] setObject:foodArray forKey:@"LogType"];
            [[NSUserDefaults standardUserDefaults] setObject:logValue forKey:@"logValue"];
            [[NSUserDefaults standardUserDefaults] setObject:dateArray forKey:@"logDate"];
        }

    }
    return self;
}

- (NSMutableArray *) logArray
{
    _logArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"LogType"];
    return _logArray;
}

- (NSMutableArray *) dataArray
{
    _dataArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"logValue"];
    return _dataArray;
}

- (NSMutableArray *) dateArray
{
    _dateArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"logDate"];
    return _dateArray;
}

@end
