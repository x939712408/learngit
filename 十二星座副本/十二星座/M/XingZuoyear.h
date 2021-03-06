//
//  XingZuoyear.h
//  十二星座
//
//  Created by kiss-minmin on 16/6/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XingZuoyear : NSObject
/*
 "name":"水瓶座",
 "date":"2016年",
 "year":2016,
 "mima":{
 "info":"继续乘风的破冰之年",
 "text":["回顾过去两年，水瓶座无疑是上升最快的星座之一。很多水瓶座已经摆脱了过去受制于人的局面，全面掌舵自己的生活。而经过大浪淘沙，大多数实力出色的水瓶座脱颖而出，成为各自行业的楷模与领军人物。但也有部分之前过于膨胀的水瓶座在土星的压制之下走下了高贵的神台。而在2016年中，大多数水瓶座将继续之前的趋势，将蛋糕做大，在人生赢家的路上越走越快。对小部分跌落凡尘的水瓶座来说，今年也将是有机会展开自救的一年。水瓶座的整个上半年走的依然是人脉路线，可以通过合作拉到不少资源，也为长线发展打下稳固基础，但也要注意存在因手笔过大，投资超出个人掌控能力的问题，尤其在年后一段时间易因为买房或是旅行而开销过大入不敷出。进入下半年会相对忙乱，很多长线项目的上马都需要你投入精力努力经营，同时也有不少细节问题必须去处理，但也是借助他人力量翻身的时机，一些长久以来的问题迎来破冰机会。部分水瓶可以从合作中捞得不少好处，但其中辛苦曲折也只有自己知道。"]},
 "career":["未来三年将是很多水瓶座大力发展，恒者恒强的三年。你会继续延续此前的良心循环，将自己的理念真正推开，获得丰厚的事业收益。土星进入你们的友朋宫，也意味着你们会接受广泛的评估和考验。部分水瓶座会因为朋友从中牵线而获得巨额投资得以将事业铺大，但同时也要注意某些酒肉朋友会背后添乱，让你更深刻地明白“道不同不相为谋”，到了远离某些的时候。对身处高管位置的水瓶座来说，上半年会是你们发展的关键期，很多影响长远的重要合作项目都会在此时签署，你需要用火眼金睛从众多希望合作的对象里挑选出最为优质的选择。进入下半年则会相对忙乱，准备处理很多因为并购、合作带来的资金问题，7、8月是问题密集爆发期，尤其避免随口承诺过后却填不上坑。对自由职业者而言，上半年是生意最为红火的时候，大家手口相传将你的名声远播，接踵而至的客户让你根本不愁生机，做事也相对轻松。但进入下半年后，某些曾经忽略的隐患可能爆发，必须学会提升效率，减少部分工作量。对打工者来说，上半年是容易接到各种跳槽邀约的时刻，可以轻松获得满意的薪资，但责任相应更重。下半年则会相对辛苦，之前的承诺可能货不对板，只有通过自己辛苦工作去摆平问题，好在是为长远发展而忙碌，虽然付出但却很有意义。"],
 "love":["来到新的一年，水瓶座依然还是单身市场上的香馍馍。因为自身能力出色，社会地位的提升，水瓶也总有机会遇到比自身实力强大、位高权重的异性或是年长对象。对一直不缺乏爱慕者的水瓶座而言，能否脱单既要看时间、地点，又要看自己有没有心境，要求太高反而显得曲高和者寡，想要被人降服总不是那么容易。上半年，由于木星与土星都进入人际宫位，你将有如花蝴蝶一般出没于各类私人、工作的社交场所，谈笑有鸿儒，往来无白丁。出色的个人气质会给你招来不少行业内顶尖对象，既可以作为业务拓展的工作关系，也可以形成个人的私人关系，对方的好感表现无疑，主要还看水瓶们自己是否愿意尝试一段新恋情。而对本就已有稳定对象的水瓶们来说，上半年无疑也是决定走入婚姻殿堂的高峰期，可以与爱人举案齐眉享受浓情时分。5月下旬到6月中旬可能会因为身边的插曲太多，而对已有的恋情有些犹豫。但进入下半年后，感情又会逐渐进入稳定期。7月底至9月中旬的金星逆行虽然会给感情带来一些小涟漪，或是与多年前的故人相遇，或是旅行中遇到耀眼对象，但都只是昙花一现难成真爱。其余时间多数因为太忙而无暇他顾。"],
 "health":["水瓶座在占星学上掌管着人体的循环系统，所以水瓶座的人应该对于属性方面有更高的要求，比方说同样是吃水果，水瓶座的人就要注意什么时候吃凉性的水果、什么时候吃热性的水果。"],
 "finance":["就2016年全年而言，水瓶座的财运在上下半年会呈现不同走势，但都有一个共同特点，既大多通过合作或是代理方式获得。整体而言，财运在下半年会明显弱于上半年，所以不论你是从事何种行业的，请抓紧上半年的捞钱机会。在上半年中，年后会有不少赚零散小钱的机会，但同时开销也不小，基本可以做到略有盈余。4月中旬开始，财运明显转强，也有机会通过投资获取喜人收益。这一轮财运将一直延续到8月，之后就会开始减弱。尤其投资方面应注意见好就收，否则容易出现先赚后亏，在下半年出现亏损状况。进入下半年，因为木星移位的缘故，财运方面会出现支出多于收入的状况，也容易碰到被人借钱不还或是拖延还款的状况，建议理财以保守态度为主。可以尝试各类高端代理业务，将有机会获得不稳定的高额提成，但也必修以谨慎、专业的态度才可能把业务做大，而非一竿子买卖。"],
 "luckyStone":"摩根石",
 */
@property(nonatomic,strong) NSString* date;
@property(nonatomic,strong) NSString* name;
@property(nonatomic,strong) NSNumber* year;
@property(nonatomic,strong) NSString* info;
@property(nonatomic,strong) NSString* text;
@property(nonatomic,strong) NSString* career;
@property(nonatomic,strong) NSString* love;
@property(nonatomic,strong) NSString* health;
@property(nonatomic,strong) NSString* finance;
@property(nonatomic,strong) NSString* luckyStone;
- (instancetype)initWithZiDian:(NSDictionary*)obj;
@end
