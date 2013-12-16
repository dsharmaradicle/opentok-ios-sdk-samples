//
//  TBPublisher.m
//  Lets-Build-OTPublisher
//
//  Copyright (c) 2013 TokBox, Inc. All rights reserved.
//

#import "TBExamplePublisher.h"
#import "TBExampleVideoCapture.h"
#import "TBExampleVideoRender.h"

@implementation TBExamplePublisher {
    TBExampleVideoCapture* _myVideoCapture;
    TBExampleVideoRender* _myVideoRender;
}

@synthesize view = _myVideoRender;

#pragma mark - Object lifecycle

- (id)init {
    self = [super init];
    if (self) {
        _myVideoCapture = [[TBExampleVideoCapture alloc] init];
        [self setVideoCapture:_myVideoCapture];
        
        _myVideoRender =
        [[TBExampleVideoRender alloc] initWithFrame:CGRectMake(0,0,1,1)];
        [self setVideoRender:_myVideoRender];

    }
    return self;
}

- (id)initWithDelegate:(id<OTPublisherDelegate>)delegate {
    self = [self init];
    if (self) {
        [self setDelegate:delegate];
    }
    return self;
}

- (id)initWithDelegate:(id<OTPublisherDelegate>)delegate
                  name:(NSString*)name
{
    self = [self init];
    if (self) {
        [self setDelegate:delegate];
        [self setName:name];
    }
    return self;
}

- (void)dealloc {
    [self setVideoCapture:nil];
    [self setVideoRender:nil];
    [_myVideoCapture release];
    _myVideoCapture = nil;
    [_myVideoRender release];
    _myVideoRender = nil;
    [super dealloc];
}

# pragma mark - TBExamplePublisher API extensions

- (void)setCameraPosition:(AVCaptureDevicePosition)cameraPosition
{
    _myVideoCapture.cameraPosition = cameraPosition;
}

- (AVCaptureDevicePosition)cameraPosition {
    return _myVideoCapture.cameraPosition;
}

@end