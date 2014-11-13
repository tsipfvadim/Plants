//
//  TMPlant.m
//  Plants
//
//  Created by Admin on 04.11.14.
//  Copyright (c) 2014 tsipfvadim. All rights reserved.
//

#import "TMPlant.h"

@implementation TMPlant

-(instancetype)initWithName:(NSString*)name{
    self=[super init];
    if (self) {
        self.name=name;
        _maxHealth=100;
        _health=_maxHealth;
        _damage=20;
        _isDead=NO;
        _rHealth=10;
    }
    return self;
}

-(void)attack:(TMPlant*)obj{
    if (_isDead) {
        NSLog(@"\n  %@ is Dead and can't attack!",self.name);
        return ;
    }
    if (obj->_isDead) {
        NSLog(@"\n  %@ is Dead! Don't beat lying.",obj.name);
        return ;
    }
    //Атаку
    if (self.damage>=obj.health) {
        obj->_health=0;
        obj->_isDead=YES;
        NSLog(@"\n  %@ killed %@!",self.name,obj.name);
        return;
    }
    obj->_health-=self.damage;
    //Контратака
    if (obj.damage/2>=self.health) {
        _health=0;
        _isDead=YES;
        NSLog(@"\n  %@ killed %@!",obj.name,self.name);
        return;
    }
    _health-=obj.damage/2;
    NSLog(@"\n  %@ attack %@\n  %@    %@",self.name,obj.name,obj,self);
}

-(void)recoveryOfHealth{
    if (_isDead) {
        NSLog(@"\n  %@ is Dead and can't recovery yourself.",self.name);
        return ;
    }
    if (_health+_rHealth > _maxHealth) {
        _health = _maxHealth;
    }else{
        _health += _rHealth;
    }
}
-(NSString*)description{
    return [NSString stringWithFormat:@"%@ (%u/%u)",self.name, self.health,self.maxHealth];
}
@end
