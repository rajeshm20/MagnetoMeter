//
//  MagnetometerViewController.m
//  BackgroundTracker
//
//  Created by foundry on 15/03/2013.
//  Copyright (c) 2013 foundry. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "MagnetometerViewController.h"
#import "Arrow.h"
#import "Circle.h"
#import "ForwardProgressView.h"
#import "InverseProgressView.h"
#import "UIImage+FillColor.h"

@interface MagnetometerViewController ()

    //CMMagnetometer
@property (weak, nonatomic) IBOutlet Arrow* arrow;
@property (weak, nonatomic) IBOutlet Arrow *arrow2;
@property (weak, nonatomic) IBOutlet Arrow *arrow3;
@property (weak, nonatomic) IBOutlet Arrow *arrow4;
@property (weak, nonatomic) IBOutlet Circle *circle;

@property (weak, nonatomic) IBOutlet UIProgressView *clMagneticHeadingBarX;
@property (weak, nonatomic) IBOutlet UIProgressView *clMagneticHeadingBar_X;
@property (weak, nonatomic) IBOutlet UILabel *clMagneticHeadingLabelX;
@property (strong, nonatomic) IBOutletCollection (UIProgressView) NSArray* clMagneticHeadingCollection;

@property (weak, nonatomic) IBOutlet UIProgressView *cmMagneticFieldBarX;
@property (weak, nonatomic) IBOutlet UIProgressView *cmMagneticFieldBar_X;
@property (weak, nonatomic) IBOutlet UIProgressView *cmMagneticFieldBarY;
@property (weak, nonatomic) IBOutlet UIProgressView *cmMagneticFieldBar_Y;
@property (weak, nonatomic) IBOutlet UIProgressView *cmMagneticFieldBarZ;
@property (weak, nonatomic) IBOutlet UIProgressView *cmMagneticFieldBar_Z;
@property (weak, nonatomic) IBOutlet UIProgressView *cmMagneticFieldBarS;
@property (weak, nonatomic) IBOutlet UIProgressView *cmMagneticFieldBar_S;
@property (strong, nonatomic) IBOutletCollection (UIProgressView) NSArray* cmMagneticCollection;

@property (weak, nonatomic) IBOutlet UILabel *cmMagneticFieldLabelX;
@property (weak, nonatomic) IBOutlet UILabel *cmMagneticFieldLabelY;
@property (weak, nonatomic) IBOutlet UILabel *cmMagneticFieldLabelZ;
@property (weak, nonatomic) IBOutlet UILabel *cmMagneticFieldLabelS;


    //CMDeviceMotion CMCalibratedMagneticField
@property (weak, nonatomic) IBOutlet UIProgressView *cmCalibratedMagneticFieldBarX;
@property (weak, nonatomic) IBOutlet UIProgressView *cmCalibratedMagneticFieldBarY;
@property (weak, nonatomic) IBOutlet UIProgressView *cmCalibratedMagneticFieldBarZ;
@property (weak, nonatomic) IBOutlet UIProgressView *cmCalibratedMagneticFieldBarS;
@property (weak, nonatomic) IBOutlet UIProgressView *cmCalibratedMagneticFieldBar_X;
@property (weak, nonatomic) IBOutlet UIProgressView *cmCalibratedMagneticFieldBar_Y;
@property (weak, nonatomic) IBOutlet UIProgressView *cmCalibratedMagneticFieldBar_Z;
@property (weak, nonatomic) IBOutlet UIProgressView *cmCalibratedMagneticFieldBar_S;
@property (strong, nonatomic) IBOutletCollection (UIProgressView) NSArray* cmCalibratedMagneticFieldCollection;


@property (weak, nonatomic) IBOutlet UILabel *cmCalibratedMagneticFieldLabelX;
@property (weak, nonatomic) IBOutlet UILabel *cmCalibratedMagneticFieldLabelY;
@property (weak, nonatomic) IBOutlet UILabel *cmCalibratedMagneticFieldLabelZ;
@property (weak, nonatomic) IBOutlet UILabel *cmCalibratedMagneticFieldLabelS;

    //CLHeading
@property (weak, nonatomic) IBOutlet UIProgressView *clHeadingBarX;
@property (weak, nonatomic) IBOutlet UIProgressView *clHeadingBarY;
@property (weak, nonatomic) IBOutlet UIProgressView *clHeadingBarZ;
@property (weak, nonatomic) IBOutlet UIProgressView *clHeadingBarS;
@property (weak, nonatomic) IBOutlet UIProgressView *clHeadingBar_X;
@property (weak, nonatomic) IBOutlet UIProgressView *clHeadingBar_Y;
@property (weak, nonatomic) IBOutlet UIProgressView *clHeadingBar_Z;
@property (weak, nonatomic) IBOutlet UIProgressView *clHeadingBar_S;
@property (strong, nonatomic) IBOutletCollection (UIProgressView) NSArray* clHeadingCollection;

@property (weak, nonatomic) IBOutlet UILabel *clHeadingLabelX;
@property (weak, nonatomic) IBOutlet UILabel *clHeadingLabelY;
@property (weak, nonatomic) IBOutlet UILabel *clHeadingLabelZ;
@property (weak, nonatomic) IBOutlet UILabel *clHeadingLabelS;


    //Difference
@property (weak, nonatomic) IBOutlet UIProgressView *diffBarX;
@property (weak, nonatomic) IBOutlet UIProgressView *diffBarY;
@property (weak, nonatomic) IBOutlet UIProgressView *diffBarZ;
@property (weak, nonatomic) IBOutlet UIProgressView *diffBarS;
@property (weak, nonatomic) IBOutlet UIProgressView *diffBar_X;
@property (weak, nonatomic) IBOutlet UIProgressView *diffBar_Y;
@property (weak, nonatomic) IBOutlet UIProgressView *diffBar_Z;
@property (weak, nonatomic) IBOutlet UIProgressView *diffBar_S;
@property (strong, nonatomic) IBOutletCollection (UIProgressView) NSArray* diffCollection;


@property (weak, nonatomic) IBOutlet UILabel *diffLabelX;
@property (weak, nonatomic) IBOutlet UILabel *diffLabelY;
@property (weak, nonatomic) IBOutlet UILabel *diffLabelZ;
@property (weak, nonatomic) IBOutlet UILabel *diffLabelS;


@end

@implementation MagnetometerViewController


- (void) viewDidLoad
{
    [super viewDidLoad];
    
        //arrow1 (red) -   -heading.magneticHeading;
    [self.arrow setFillColor:[UIColor colorWithRed:0.8
                                             green:0.1
                                              blue:0.1
                                             alpha:0.1]];
    
        //arrow2 (green) - pitch
    [self.arrow2 setFillColor:[UIColor colorWithRed:0.1
                                             green:0.8
                                              blue:0.1
                                             alpha:0.1]];
    
        //arrow3 (blue) - pitch + heading
    [self.arrow3 setFillColor:[UIColor colorWithRed:0.1
                                             green:0.1
                                              blue:0.8
                                             alpha:0.1]];
    
        //arrow4 (yellow) - heading calc from CMMagneticField.field
    [self.arrow4 setFillColor:[UIColor colorWithRed:0.8
                                             green:0.8
                                              blue:0.1
                                             alpha:0.1]];
    UIColor* foreColor; UIColor* backColor;
    
    CGFloat strongTone = 0.90;
    CGFloat weakTone = 0.70;
    backColor = [UIColor colorWithWhite:strongTone
                                  alpha:1.0];
    
    foreColor = [UIColor colorWithRed:strongTone
                                green:weakTone
                                 blue:weakTone
                                alpha:1.0];
    [self colorProgressViews:self.clMagneticHeadingCollection
                   foreColor:foreColor
                   backColor:backColor];
    
    
    foreColor = [UIColor colorWithRed:strongTone
                                green:strongTone
                                 blue:weakTone
                                alpha:1.0];
    [self colorProgressViews:self.cmMagneticCollection
                   foreColor:foreColor
                   backColor:backColor];
 
       
    foreColor = [UIColor colorWithRed:weakTone
                                green:weakTone
                                 blue:strongTone
                                alpha:1.0];
    
    [self colorProgressViews:self.cmCalibratedMagneticFieldCollection
                   foreColor:foreColor
                   backColor:backColor];
    foreColor = [UIColor colorWithRed:weakTone
                                green:strongTone
                                 blue:weakTone
                                alpha:1.0];
    [self colorProgressViews:self.clHeadingCollection
                   foreColor:foreColor
                   backColor:backColor];
    foreColor = [UIColor colorWithRed:strongTone
                                green:weakTone
                                 blue:strongTone
                                alpha:1.0];
    [self colorProgressViews:self.diffCollection
                   foreColor:foreColor
                   backColor:backColor];

}

- (void) colorProgressViews:(NSArray*)viewCollection
                  foreColor:(UIColor*)foreColor
                  backColor:(UIColor*)backColor
{
    UIImage* foreImage; UIImage*  backImage;

    backImage   = [UIImage fillImgOfSize:(CGSize){10,10}
                               withColor:backColor];
    foreImage   = [UIImage fillImgOfSize:(CGSize){10,10}
                               withColor:foreColor];

    for (UIProgressView* pView in viewCollection) {
        if ([pView isKindOfClass:[InverseProgressView class]]) {
            [pView setProgressImage:backImage];
            [pView setTrackImage:foreImage];
        } else {
            [pView setProgressImage:foreImage];
            [pView setTrackImage:backImage];
        }
    }

}
- (CGFloat) rawHeadingFromX:(CGFloat)xVec Y:(CGFloat)yVec
{
    
    /*
     to obtain this X and Y we really need to use the original mag XYZ and do some kind of matrix multiplication with the rotation matrix for the device 
     
     
     */
    
        //http://stackoverflow.com/questions/11383968/which-ios-class-code-returns-the-magnetic-north/11384054#11384054
        //http://www51.honeywell.com/aero/common/documents/myaerospacecatalog-documents/Defense_Brochures-documents/Magnetic__Literature_Application_notes-documents/AN203_Compass_Heading_Using_Magnetometers.pdf
    
    CGFloat rawHeading;
    if (yVec > 0) rawHeading = 90.0 - atan(xVec/yVec)*180.0/M_PI;
    if (yVec < 0) rawHeading = 270.0 - atan(xVec/yVec)*180.0/M_PI;
    if (yVec == 0 && xVec < 0) rawHeading = 180.0;
    if (yVec == 0 && xVec > 0) rawHeading = 0.0;
    rawHeading -=90;
    return rawHeading;
}

#define DELTA 128 
#define ACCUDELTA 180
    //most of these params are normalised to a scale of 0-128.

- (void) updateMotionViews
{
    CMMagnetometerData* magnetometerData = self.motionManager.magnetometerData;
    CMDeviceMotion* motion = self.motionManager.deviceMotion;
    CLHeading* heading = self.locationManager.heading;
        //arrow
    if (self.circle.scale != heading.headingAccuracy/ACCUDELTA) {
        
            //animate a CAShapeLayer here
        
            //self.circle.scale = heading.headingAccuracy/ACCUDELTA;
        [self.circle animateRadius:heading.headingAccuracy/ACCUDELTA];
            //[self.circle setNeedsDisplay];
    }
    
    CGFloat hAngle =  -heading.magneticHeading;
    CGFloat pitch = -motion.attitude.pitch;
    CGFloat xVec, yVec, zVec, rawHeading, rawHeadingAngle;

    CATransform3D hRotate = CATransform3DMakeRotation([[self class] degreesToRadians:hAngle], 0, 0, 1);
    CATransform3D pRotate = CATransform3DMakeRotation(pitch, 1, 0, 0);

    self.arrow.layer.transform = hRotate;
 
    CATransform3D transform = CATransform3DConcat(hRotate, pRotate);
    
    xVec = [[self class] degreesToRadians:heading.x];
    yVec = [[self class] degreesToRadians:heading.y];
    zVec = [[self class] degreesToRadians:heading.z];
    rawHeading = [self rawHeadingFromX:xVec Y:yVec];
    
    rawHeadingAngle = -[[self class] degreesToRadians:rawHeading];
    transform = CATransform3DMakeRotation(rawHeadingAngle, 0, 0, 1);
    
    self.arrow2.layer.transform = transform;

 
     xVec = [[self class] degreesToRadians:motion.magneticField.field.x];
     yVec = [[self class] degreesToRadians:motion.magneticField.field.y];
     zVec = [[self class] degreesToRadians:motion.magneticField.field.z];
     rawHeading = [self rawHeadingFromX:xVec Y:yVec];
    
     rawHeadingAngle = -[[self class] degreesToRadians:rawHeading];
    transform = CATransform3DMakeRotation(rawHeadingAngle, 0, 0, 1);
    
    self.arrow3.layer.transform = transform;
 
    
     xVec = [[self class] degreesToRadians:magnetometerData.magneticField.x];
     yVec = [[self class] degreesToRadians:magnetometerData.magneticField.y];
     zVec = [[self class] degreesToRadians:magnetometerData.magneticField.z];
     rawHeading = [self rawHeadingFromX:xVec Y:yVec];
       
     rawHeadingAngle = -[[self class] degreesToRadians:rawHeading];
    transform = CATransform3DMakeRotation(rawHeadingAngle, 0, 0, 1);
    
    self.arrow4.layer.transform = transform;
 
    CGFloat xData,yData,zData;
    xData = heading.magneticHeading<180?-heading.magneticHeading:360-heading.magneticHeading;
    yData = 0;
    zData = 0;
    [self updateProgress:@"clMagneticHeading"
                   Xdata:xData
                   yData:yData
                   zData:zData
                   delta:180];
    
    xData = magnetometerData.magneticField.x;
    yData = magnetometerData.magneticField.y;
    zData = magnetometerData.magneticField.z;
    [self updateProgress:@"cmMagneticField"
                   Xdata:xData
                   yData:yData
                   zData:zData
                   delta:DELTA];

    xData = heading.x;
    yData = heading.y;
    zData = heading.z;
    [self updateProgress:@"clHeading"
                   Xdata:xData
                   yData:yData
                   zData:zData
                   delta:DELTA];
    
    xData = motion.magneticField.field.x;
    yData = motion.magneticField.field.y;
    zData = motion.magneticField.field.z;
    [self updateProgress:@"cmCalibratedMagneticField"
                   Xdata:xData
                   yData:yData
                   zData:zData
                   delta:DELTA];
    
    xData = heading.x - motion.magneticField.field.x;
    yData = heading.y - motion.magneticField.field.y;
    zData = heading.z - motion.magneticField.field.z;
    [self updateProgress:@"diff"
                   Xdata:xData
                   yData:yData
                   zData:zData
                   delta:DELTA/10];
}

- (void) updateProgress:(NSString*)progress
                  Xdata:(CGFloat)xData
                  yData:(CGFloat)yData
                  zData:(CGFloat)zData
                  delta:(CGFloat)delta

{
    NSArray* progressViewNames = @[
                                   [NSString stringWithFormat:@"%@BarX",progress]
                                  ,[NSString stringWithFormat:@"%@BarY",progress]
                                  ,[NSString stringWithFormat:@"%@BarZ",progress]
                                  ,[NSString stringWithFormat:@"%@BarS",progress]
                                  ,[NSString stringWithFormat:@"%@Bar_X",progress]
                                  ,[NSString stringWithFormat:@"%@Bar_Y",progress]
                                  ,[NSString stringWithFormat:@"%@Bar_Z",progress]
                                  ,[NSString stringWithFormat:@"%@Bar_S",progress]
                                  ];
        NSArray* labelViewNames = @[
                                    [NSString stringWithFormat:@"%@LabelX",progress]
                                   ,[NSString stringWithFormat:@"%@LabelY",progress]
                                   ,[NSString stringWithFormat:@"%@LabelZ",progress]
                                   ,[NSString stringWithFormat:@"%@LabelS",progress]
                                   ];
    CGFloat magnitude = sqrt (pow(xData,2)+
                              pow(yData,2)+
                              pow(zData,2));
    
    for (NSString* string in progressViewNames) {
        if ([self respondsToSelector:NSSelectorFromString(string)]) {
            UIProgressView* pView = [self valueForKey:string];
            NSString* character = [string substringFromIndex:string.length-2];
            [character isEqualToString:@"rX"]? pView.progress = xData/delta:
            [character isEqualToString:@"rY"]? pView.progress = yData/delta:
            [character isEqualToString:@"rZ"]? pView.progress = zData/delta:
            [character isEqualToString:@"_X"]? pView.progress = xData/delta+1:
            [character isEqualToString:@"_Y"]? pView.progress = yData/delta+1:
            [character isEqualToString:@"_Z"]? pView.progress = zData/delta+1:
            [character isEqualToString:@"rS"]? pView.progress = magnitude/delta:
            [character isEqualToString:@"_S"]? pView.progress = 1-magnitude/delta:
        0;
        }
    }
    for (NSString* string in labelViewNames) {
        if ([self respondsToSelector:NSSelectorFromString(string)]) {
            UILabel* lView = [self valueForKey:string];
            NSString* character = [string substringFromIndex:string.length-2];
            [character isEqualToString:@"lX"]?
                lView.text = [NSString stringWithFormat:@"%.1f",xData]:
            [character isEqualToString:@"lY"]?
                lView.text = [NSString stringWithFormat:@"%.1f",yData]:
            [character isEqualToString:@"lZ"]?
                lView.text = [NSString stringWithFormat:@"%.1f",zData]:
            [character isEqualToString:@"lS"]?
                lView.text = [NSString stringWithFormat:@"%.1f",magnitude]:
            0;
        }
    }
}


- (void) pullMotionAdditions
{
    [self.motionManager startMagnetometerUpdates];
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.distanceFilter = 0.0001;
    self.locationManager.headingFilter = kCLHeadingFilterNone;
    [self.locationManager startUpdatingHeading];
    [self.motionManager startDeviceMotionUpdatesUsingReferenceFrame:CMAttitudeReferenceFrameXTrueNorthZVertical];


}

- (void) pullBufferMotion:(NSTimer*)timer {
    
}

- (void)pushMotionAdditions
{
    self.motionManager.deviceMotionUpdateInterval = self.samplingFrequency;
    [self.sampleQueue  setMaxConcurrentOperationCount:1];
    
    if (self.motionManager.magnetometerAvailable) {
        
        [self.motionManager startMagnetometerUpdatesToQueue:self.sampleQueue
                                                withHandler:^(CMMagnetometerData *magnetometerData, NSError *error)
         {
         
         }];
    }
    
    if (self.motionManager.deviceMotionAvailable) {
        
        NSLog (@"updateInterval %f",self.motionManager.deviceMotionUpdateInterval);
        [self.motionManager startDeviceMotionUpdatesUsingReferenceFrame:CMAttitudeReferenceFrameXArbitraryCorrectedZVertical
                                                                toQueue:self.sampleQueue
                                                            withHandler:^(CMDeviceMotion *motion, NSError *error)
         {
         
         }];

        
        
              
    }
}



- (void)viewDidUnload {
    [self setArrow:nil];
    [self setArrow2:nil];
    [self setArrow3:nil];
    [self setArrow4:nil];
    [super viewDidUnload];
}
@end
