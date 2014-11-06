//
//  TMPlant.h
//  Plants
//
//  Created by Admin on 04.11.14.
//  Copyright (c) 2014 tsipfvadim. All rights reserved.
//

#import <Foundation/Foundation.h>

//Герої по мотивам гри "Plants vs. Zombies"
@interface TMPlant  : NSObject{
@protected
    UInt _maxHealth;
    UInt _health;
    UInt _damage;
    NSString* _name;
    BOOL _isDead;
    UInt _rHealth;
}
@property (nonatomic, readonly) UInt maxHealth;
@property (nonatomic, readonly) UInt health;
@property (nonatomic, readonly) UInt damage;
@property (nonatomic, copy) NSString* name;

-(instancetype)initWithName:(NSString*)name;
-(void)attack:(TMPlant*)obj;
-(void)recoveryOfHealth;
@end
