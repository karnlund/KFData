//
//  KFAttribute_Spec.m
//  KFData
//
//  Created by Kyle Fuller on 30/04/2013.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "Kiwi.h"
#import "KFAttribute.h"


SPEC_BEGIN(KFAttribute_Spec)

describe(@"KFAttribute", ^{
    KFAttribute *attribute = [KFAttribute attributeWithKey:@"id"];

    it(@"should create ascending sort descriptors", ^{
        NSSortDescriptor *sortDescriptor = [attribute ascending];
        [(KWEqualMatcher*)[sortDescriptor should] equal:[NSSortDescriptor sortDescriptorWithKey:@"id" ascending:YES]];
    });

    it(@"should create descending sort descriptors", ^{
        NSSortDescriptor *sortDescriptor = [attribute descending];
        [(KWEqualMatcher*)[sortDescriptor should] equal:[NSSortDescriptor sortDescriptorWithKey:@"id" ascending:NO]];
    });

    it(@"should create equals predicates", ^{
        NSPredicate *predicate = [attribute equal:@4];
        [(KWEqualMatcher*)[predicate should] equal:[NSPredicate predicateWithFormat:@"id == 4"]];
    });

    it(@"should create unequal predicates", ^{
        NSPredicate *predicate = [attribute notEqual:@4];
        [(KWEqualMatcher*)[predicate should] equal:[NSPredicate predicateWithFormat:@"id != 4"]];
    });
});

SPEC_END