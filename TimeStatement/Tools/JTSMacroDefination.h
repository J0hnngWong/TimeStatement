//
//  JTSMacroDefination.h
//  TimeStatement
//
//  Created by 王嘉宁 on 2018/12/20.
//  Copyright © 2018 Johnny. All rights reserved.
//

#ifndef JTSMacroDefination_h
#define JTSMacroDefination_h

#define DDNSMutableArrayGetter(property) - (NSMutableArray *)property { \
if (_##property == nil) {  \
_##property = [NSMutableArray array];   \
}   \
return _##property;  \
}

#define JTSSafeCallBlock(block) if(block) { block(); }

#endif /* JTSMacroDefination_h */
