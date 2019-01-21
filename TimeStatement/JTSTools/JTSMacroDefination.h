//
//  JTSMacroDefination.h
//  TimeStatement
//
//  Created by 王嘉宁 on 2018/12/20.
//  Copyright © 2018 Johnny. All rights reserved.
//

#ifndef JTSMacroDefination_h
#define JTSMacroDefination_h

#define NSMutableArrayGetter(property) - (NSMutableArray *)property { \
if (_##property == nil) {  \
_##property = [NSMutableArray array];   \
}   \
return _##property;  \
}

#define JTSSafeCallBlock(block) if(block) { block(); }

//#ifdef DEBUG
#define JTSLog(fmt, ...) NSLog((@"\n[File:%s]\n" "[Function:%s]\n" "[Line:%d] \n\n" fmt "\n"), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
//#else
//#define JTSLog(...)
//#endif

#endif /* JTSMacroDefination_h */
