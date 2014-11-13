//
//  TMChomper.m
//  Plants
//
//  Created by Admin on 05.11.14.
//  Copyright (c) 2014 tsipfvadim. All rights reserved.
//

#import "TMChomper.h"

@implementation TMChomper{
    BOOL _devour;
    UInt _devourCount;
}
-(instancetype)initWithName:(NSString*)name{
    self=[super init];
    if (self) {
        _name=name;
        _maxHealth=80;
        _health=_maxHealth;
        _damage=20;
        _isDead=NO;
        _rHealth=7;
        _devour=NO;
        _devourCount=0;
    }
    return self;
}
-(void)devourMode{
    if (_isDead) {
        NSLog(@"\n  %@ is Dead! I can't do it.",self.name);
        return ;
    }
    if (!_devour) {
        _devour=YES;
        NSLog(@"\n  %@ in Devour mode",self.name);
    }
}
-(void)attack:(TMPlant*)obj{
    if (_devour&&_devourCount==0) {
        if (_isDead) {
            NSLog(@"\n  %@ is Dead and can't attack!",self.name);
            return ;
        }
        if (obj->_isDead) {
            NSLog(@"\n  %@ is Dead! Don't beat lying.",obj.name);
            return ;
        }
        obj->_health=0;
        obj->_isDead=YES;
        NSLog(@"\n  %@ devoured %@",self.name,obj.name);
        _devourCount+=1;
        _damage=0;
    }else{
        [super attack:obj];
    }
}

-(void)explosionObject:(TMPlant*)obj{
    if (_isDead) {
        NSLog(@"\n  %@ is Dead and can't attack.",self.name);
        return ;
    }
    _health=0;
    _damage=75;
    NSLog(@"\n  %@ exploded!",self.name);
    [super attack:obj];
    _isDead=YES;
}
-(void)giveHealthToObject:(TMPlant*)obj{
    if (_isDead) {
        NSLog(@"\n  %@ is Dead! I can't do it.",self.name);
        return ;
    }
    if (_rHealth>=_health) {
        NSLog(@"\n  %@ have only %d health. I can't do it.",self.name,self.health);
        return;
    }
    if (obj->_isDead) {
        NSLog(@"\n  %@ is Dead! I can't do it.",obj.name);
        return ;
    }
    if (obj.health+_rHealth>=obj.maxHealth) {
        obj->_health=obj.maxHealth;
        _health-=_rHealth;
    }else{
        obj->_health+=_rHealth;
        _health-=_rHealth;
    }
    NSLog(@"\n  %@ recover %@!",self.name,obj);
}
@end
