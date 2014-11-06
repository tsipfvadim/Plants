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
        NSLog(@"\n  %@ is Dead! I can't do it.",self.name);
        return ;
    }
    if (_dazzling) {
        _dazzling=NO;
        _damage=15;
        NSLog(@"\n  %@ in Normal mode",self.name);
    }else{
        _dazzling=YES;
        _damage=10;
        NSLog(@"\n  %@ in Dazzling mode",self.name);
    }
}
-(void)attackedBy:(TMPlant*)obj{
    UInt rDamage;
    if (_dazzling) {
        rDamage=arc4random_uniform(obj.damage);
    }else{
        rDamage=obj.damage;
    }
    if (rDamage>=self.health) {
        _health=0;
        _isDead=YES;
        NSLog(@"\n  %@ killed %@!",obj.name,self.name);
        return;
    }
    _health-=rDamage;
    SEL selector = NSSelectorFromString(@"counterAttackedBy:");
    [obj performSelector:selector withObject:self];
}
-(void)counterAttackedBy:(TMPlant*)obj{
    if (_isDead) {
        return;
    }
    UInt rDamage;
    if (_dazzling) {
        rDamage=arc4random_uniform(obj.damage/2);
    }else{
        rDamage=obj.damage/2;
    }
    //Перевірка self isDead
    if (rDamage>=self.health) {
        _health=0;
        _isDead=YES;
        NSLog(@"\n  %@ killed %@!",obj.name,self.name);
        return;
    }
    //зменшення одиниць здоров'я
    _health-=rDamage;
}
-(void)superRecovery{
    if (_isDead) {
        NSLog(@"\n  %@ is Dead! I can't do it.",self.name);
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
        NSLog(@"\n  %@ is Dead! I can't do it.",self.name);
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
