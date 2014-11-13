//
//  TMSunflower.m
//  Plants
//
//  Created by Admin on 04.11.14.
//  Copyright (c) 2014 tsipfvadim. All rights reserved.
//

#import "TMSunflower.h"

@implementation TMSunflower{
    BOOL _dazzling;
    UInt _superRecoveryCount;
}

-(instancetype)initWithName:(NSString*)name{
    self=[super init];
    if (self) {
        _name=name;
        _maxHealth=85;
        _health=_maxHealth;
        _damage=15;
        _isDead=NO;
        _rHealth=20;
        _dazzling=NO;
        _superRecoveryCount=0;
    }
    return self;
}

-(void)dazzlingMode{
    if (_isDead) {
        NSLog(@"\n  %@ is Dead and can't do it.",self.name);
        return ;
    }
    if (_dazzling) {
        _dazzling=NO;
        _damage=15;
        NSLog(@"\n  %@ in Normal mode",self.name);
    }else{
        _dazzling=YES;
        _damage=13;
        NSLog(@"\n  %@ in Dazzling mode",self.name);
    }
}

-(void)attack:(TMPlant*)obj{
    UInt damageOfObject=obj.damage;
    if (_dazzling) {
        obj->_damage=arc4random_uniform(obj.damage);
    }
    [super attack:obj];
    obj->_damage=damageOfObject;
}

-(void)superRecovery{
    if (_isDead) {
        NSLog(@"\n  %@ is Dead and can't do it.",self.name);
        return ;
    }
    if (_superRecoveryCount>0) {
        NSLog(@"\n  SuperRecovery can't be used twice!");
        return;
    }
    if (_health+45>=_maxHealth) {
        _health=_maxHealth;
    }else{
    _health+=45;
    }
    _superRecoveryCount+=1;
    NSLog(@"\n  %@ use SuperRecovery!",self);
}
-(void)recoveryHealthOfObject:(TMPlant*)obj{
    if (_isDead) {
        NSLog(@"\n  %@ is Dead and can't do it.",self.name);
        return ;
    }
    if (obj->_isDead) {
        NSLog(@"\n  %@ is Dead! I can't recover.",obj.name);
        return ;
    }
    if (obj.health+_rHealth>=obj.maxHealth) {
        obj->_health=obj.maxHealth;
    }else{
        obj->_health+=_rHealth;
    }
    NSLog(@"\n  %@ recover %@!",self.name,obj);
}
@end
