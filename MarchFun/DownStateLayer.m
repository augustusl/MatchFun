//
//  DownStateLayer.m
//  MatchFun
//
//  Created by Apple on 8/12/13.
//  Copyright hku.cs.msccs 2013年. All rights reserved.
//

#import "DownStateLayer.h"
#import "DotHudController.h"


@implementation DownStateLayer


- (id)init
{
    CGSize s = [CCDirector sharedDirector].winSize;
    self = [super initWithColor:ccc4(255,255,255, 255) width:s.width height:60];
    if (self) {
        
        [self setAnchorPoint:ccp(0, 0) ];
        
        CCMenuItemImage * skillOne = [CCMenuItemImage itemWithNormalImage:@"stoptimebutton.png" selectedImage:@"stoptimebutton_back.png" target:self selector:@selector(skillOnePressed)];
        CCMenuItemImage * skillTwo = [CCMenuItemImage itemWithNormalImage:@"deleteonebutton.png" selectedImage:@"deleteonebutton_back.png" target:self selector:@selector(skillTwoPressed)];
        CCMenuItemImage * skillThree = [CCMenuItemImage itemWithNormalImage:@"deleteallbutton.png" selectedImage:@"deleteallbutton_back.png" target:self selector:@selector(skillThreePressed)];
        
        
        [skillOne setAnchorPoint:ccp(0, 0)];
        [skillTwo setAnchorPoint:ccp(0.5, 0)];
        [skillThree setAnchorPoint:ccp(1, 0)];
        
        [skillOne setPosition:ccp(0, 0)];
        [skillTwo setPosition:ccp(s.width/2, 0)];
        [skillThree setPosition:ccp(s.width, 0)];
        
        CCMenu * menu = [CCMenu menuWithItems:skillOne,skillTwo,skillThree, nil];
        [menu setPosition:ccp(0, 17)];
        [self addChild:menu];
        
        [self setVisible:false];
    }
    return self;
}

-(void)startAnimationDisplay{
    
    [self setAnchorPoint:ccp(0, 0) ];
    [self setPosition:ccp(0, -60) ];
    
    [self setVisible:true];
    //
    CCMoveTo * moveTo1 = [CCMoveTo actionWithDuration:0.2 position:ccp(0, 0)];
    CCMoveTo * moveTo2 = [CCMoveTo actionWithDuration:0.2 position:ccp(0, -17)];
    
    [self runAction:[CCSequence actions:moveTo1, moveTo2, nil]];
}


-(void) skillOnePressed{
    
    if (self.parent) {
        DotHudController * dhc = (DotHudController*)self.parent;
        [dhc playerUseSkill:tooltime];
    }
}
-(void) skillTwoPressed{
    if (self.parent) {
        DotHudController * dhc = (DotHudController*)self.parent;
        [dhc playerUseSkill:toolDisappearOne];
    }
}
-(void) skillThreePressed{
    if (self.parent) {
        DotHudController * dhc = (DotHudController*)self.parent;
        [dhc playerUseSkill:toolDisappearAll];
    }
}

@end
