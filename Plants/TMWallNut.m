//
//  TMWallNut.m
//  Plants
//
//  Created by Admin on 05.11.14.
//  Copyright (c) 2014 tsipfvadim. All rights reserved.
//

#import "TMWallNut.h"

@implementation TMWallNut{
    BOOL _defense;
    UInt _shotgunCount;
    UInt _increaseMaxHealthCount;
}
-(instancetype)initWithName:(NSString*)name{
    self=[super init];
    if (self) {
        self.name=name;
        _maxHealth=110;
        _health=_maxHealth;
        _damage=15;
        _isDead=NO;
        _rHealth=5;
        _defense=NO;
        _shotgunCount=0;
        _increaseMaxHealthCount=0;
    }
    return self;
}
-(void)defenseMode{
    if (_isDead) {
        NSLog(@"\n  %@ is Dead! I can't do it.",self.name);
        return ;
    }
    if (_defense){
        _defense=NO;
        NSLog(@"\n  %@ in Normal mode",self.name);
    }else{
        _defense=YES;
        NSLog(@"\n  %@ in Defense mode",self.name);
    }
}
-(void)attack:(TMPlant *)obj{
    if (_isDead) {
        NSLog(@"\n  %@ is Dead! I can't attack.",self.name);
        return ;
    }
    if (obj->_isDead) {
        NSLog(@"\n  %@ is Dead! Don't beat lying.",obj.name);
        return ;
    }
    if (_defense) {
        NSLog(@"\n  %@ in Defense mode! I can't attack.",self.name);
        return ;
    }
    SEL selector = NSSelectorFromString(@"attackedBy:");
    [obj performSelector:selector withObject:self];
    NSLog(@"\n  %@ attack %@\n  %@    %@",self.name,obj.name,obj,self);
}
-(void)attackedBy:(TMPlant*)obj{
    UInt rDamage;
    if (_defense) {
        rDamage=obj.damage/2;
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
    if (_defense) {
        rDamage=obj.damage/4;
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

-(void)shotgunAttack:(TMPlant*)obj{
    if (_isDead) {
        NSLog(@"\n  %@ is Dead! I can't attack.",self.name);
        return ;
    }
    if (obj->_isDead) {
        NSLog(@"\n  %@ is Dead! Don't beat lying.",obj.name);
        return ;
    }
    if (_defense) {
        NSLog(@"\n  %@ in Defense mode! I can't attack.",self.name);
        return ;
    }
    if (_shotgunCount>0) {
        NSLog(@"\n  Shotgun can't be used twice!");
        return;
    }
    
    NSLog(@"\n  %@ use Shotgun!",self);

    _damage*=2;
    SEL selector = NSSelectorFromString(@"attackedBy:");
    [obj performSelector:selector withObject:self];
    _shotgunCount+=1;
    _damage/=2;
    NSLog(@"\n  %@ attack %@\n  %@    %@",self.name,obj.name,obj,self);
}
-(void)increaseMaxHealthOfObject:(TMPlant*)obj{
    if (_isDead) {
        NSLog(@"\n  %@ is Dead! I can't do it.",self.name);
        return ;
    }
    if (obj->_isDead) {
        NSLog(@"\n  %@ is Dead! I can't do it.",obj.name);
        return ;
    }
    if (_increaseMaxHealthCount>0) {
        NSLog(@"\n  IncreaseMaxHealth can't be used twice!");
        return;
    }
    if (_health<=50) {
        NSLog(@"\n  %@ have only %d health. I can't do it.",self.name,self.health);
        return;
    }
    obj->_maxHealth+=25;
    obj->_health+=25;
    _health-=50;
    _increaseMaxHealthCount+=1;
    NSLog(@"\n  %@ IncreaseMaxHealth %@",self,obj);
}
@end
