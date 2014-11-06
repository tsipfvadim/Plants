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
    //Перевірка self isDead
    if (_isDead) {
        NSLog(@"\n  %@ is Dead! I can't attack.",self.name);
        return ;
    }
    //Перевірка obj isDead
    if (obj->_isDead) {
        NSLog(@"\n  %@ is Dead! Don't beat lying.",obj.name);
        return ;
    }
    //Атака
    SEL selector = NSSelectorFromString(@"attackedBy:");
    [obj performSelector:selector withObject:self];
    NSLog(@"\n  %@ attack %@\n  %@    %@",self.name,obj.name,obj,self);
}

-(void)attackedBy:(TMPlant*)obj{
    //Перевірка self isDead
    if (obj.damage>=self.health) {
        _health=0;
        _isDead=YES;
        NSLog(@"\n  %@ killed %@!",obj.name,self.name);
        return;
    }
    //зменшення одиниць здоров'я
    _health-=obj.damage;
    //контратака
    SEL selector = NSSelectorFromString(@"counterAttackedBy:");
    [obj performSelector:selector withObject:self];
}
-(void)counterAttackedBy:(TMPlant*)obj{
    if (_isDead) {
        return;
    }
    //Перевірка self isDead
    if (obj.damage/2>=self.health) {
        _health=0;
        _isDead=YES;
        NSLog(@"\n  %@ killed %@!",obj.name,self.name);
        return;
    }
    //зменшення одиниць здоров'я
    _health-=obj.damage/2;
}
-(void)recoveryOfHealth{
    if (_isDead) {
        NSLog(@"\n  %@ is Dead! I can't recovery yourself.",self.name);
        return ;
    }
    if (_health+_rHealth>_maxHealth) {
        _health=_maxHealth;
    }
    _health+=_rHealth;
}
-(NSString*)description{
    return [NSString stringWithFormat:@"%@ (%u/%u)",self.name, self.health,self.maxHealth];
}
@end
