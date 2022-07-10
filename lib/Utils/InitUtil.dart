import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../Models/Db/DbHelper.dart';
import '../Utils/PrivacyUtil.dart';
import '../Utils/UmengUtil.dart';
import 'UpdateUtil.dart';

class InitUtil {
  static initBeforeStart() async {
    await GetStorage.init();
    Hive.registerAdapter(ArticleAdapter());
    Hive.registerAdapter(CategoryAdapter());
    await Hive.initFlutter();

    const Map totalData = {
      "categories": [
        {"title": "致读者"},
        {"title": "家族答集"},
      ],
      "articles": [
        {
          "name": "致用户",
          "title": "致用户",
          "question": "关于Caritas App",
          "content":
              "# 致用户\n\n> Author: #Dav \nLast update: *26\/03\/2022*  \n\n\nCaritas 译为 爱。App的存在，是为了宣扬爱。\n\nCaritas App希望解决两个问题\n\n- 以Caritas伦理观提供当代抑郁潮可能的解药，友好便携的帮助人们学习Cartitas。\n- 构建互联网社区，推动Caritas伦理观进一步完善。\n\nApp收录了知乎上以Caritas原则写下的两千多篇文章，帮助用户学习Caritas，谢谢Ta们的爱。\n\n**这条爱的道路的唯一的要求——不报复，无论如何，死死的守住不报复的底线，尽力原谅，不去报复。**\n\nCaritas（名字暂定）1.0版本，为单机版本，无需联网即可使用，但收藏夹信息也会随着卸载而丢失。\n\n下一步计划是开发联网类功能，遵循监管要求，上架应用市场。\n\n后续更新将发布在知乎以及微信个人订阅号『予你告白』上。",
          "zhihuLink": "https://www.zhihu.com/people/gu-dao-lu-ren-26",
          "author": "#大卫",
          "tags": ["致读者"],
          "links": ["报复社会", "平庸", "耽误了五六年", "原谅", "爱"],
          "lastUpdate": ""
        },
        {
          "name": "致读者 - I",
          "title": "致读者 - I",
          "question": "你有哪些话想对知乎上关注你的人说？",
          "content":
              "# 致读者 - I\n \n > Author: #Anonymity\nLast update: *23/07/2021* \nLinks: [[致读者 - II]] [[致读者 - III]] [[Anonymity/00 - 致读者/致读者 - 留言]]\nTags:  #方法实践SOP   #亲密关系\n沙海拾金： [[致读者1.jpg]] [[致读者2.JPG]] [[致读者3.jpeg]] [[沙海拾金/公平因果]] [[施粥人]] [[人类共性2.jpeg]] [[人类共性1.JPEG]] [[人类共性2]] [[人类共性3.jpg]] [[天使与恶魔.JPEG]] \n\n\n“看完我的全部答案。”\n\n---\n\n关注我的人需要知道几个tip：\n\n\n\n#### 1）增补与更新\n我的很多答案都是会反复增补更新的。你第一次看到的不见得就会是全部，而是很可能隔不特定的时间就会增加一段。\n\n很多问题都是很宏大的问题，不是寥寥数语就可以说明白的。所以我的答案都有一个特殊的订阅机制——我更新后会在评论区回复所有人来通知此答案有更新。\n\n**所以评论就等于订阅了一本关于这个问题的“微杂志”。反过来，如果你不希望被更新信息打扰，那就不要轻易在讨论区留言。**\n\n只是点一下赞，看过一次，其实往往会错过大部分的内容。\n\n我已经看到有人看懂了这个惯例，这些人聪明得很。\n\n\n#### 2）**我不接私信**\n有问题不要私下里问我。理由如下：写这些答案的时间对我而言是一种计划中的捐献。虽然我不想自夸，但是真要按我的时间价值来付费，只怕对绝大多数人都是很大的负担。\n\n我之所以觉得丢出来是值得的，是因为我在心中默认这些答案是面向无限的后来人的。这样我才会觉得这时间——说得严重一点，这生命——才不算是虚掷了。\n\n我有个原则——**对捐出自己的问题给公众的人，我才考虑捐出答案。**这是一种合作构建的公共服务，双方是一种“同事关系”。\n\n占用我的时间仅仅满足你个人的需要，这个我是不接受的，给钱也不行。\n\n你要得到解答的机会，你可以在知乎公开提问或者找一个能代表你的疑问的现成问题邀请我，然后随缘。**请注意，我没承诺一定会回答，这仅仅是在谈其中一个必要条件。**\n\n\n\n#### 3）越是有普遍性的、超越时代性的问题，邀请我就越有机会得到回答。\n\n越是具体的、现下的、适用于特定人物特性条件的问题，我就兴趣越小。**因为这些问题不解决也会消失，时过境迁也不见得会重现，不应该花费他人的生命来解决。\n\n有时我会回答一些看似如此的问题，但那多半是借题发挥，答案多半不是只适用于那一事件的。\n\n\n\n#### 4）我的答案随时会匿名，也可能随时会从收藏夹里移除。\n\n**所以你觉得有用的话最好自己收藏，考虑到知乎可能因为某种原因删帖，你甚至可可以考虑拷贝粘贴/截屏保留，否则你转眼可能就找不到了。**你并不能遵循“到对方空间里挨着翻”的方法来保证找到你看到过的某个答案。\n\n**正常的友好谈话即可，**不要加“x大”“x神”“x叔”“x伯”这样的称呼，也不要给我加尊称（包括“先生”）。**\n\n你若是能直接评论我，意味着已经在上下文里说明了你在谈论的对象是我，其实你没有多大称呼我的必要。只要你的心态是尊重的，你的话语就是尊重的——最重要的是你的话自然会言之有物，这已经足够了。\n\n\n\n#### 5）**我的答案全部都不可以被认为是“正确”的。**\n\n谁能提供这种真理，完全建议你去找ta。我提供的只是一种“有质量的错误”。\n\n在我的认知里，是没人能提供真理的。很自然，我也不可能承担这种人类承担不了的责任。\n\n我完全不介意你觉得这个东西是错的，甚至到评论区指出来。\n\n但是第一，**请注意你的语气**。你看到了错误，完全不表示你有什么额外的优越地位；第二，如果你认为你看到的问题很“无脑”，认为作者肯定是“傻x”，麻烦你先做点基本的调查工作，比如多看点这个“傻x”的其他答案，掂量一下对手的量级再考虑清楚。\n\n当喷子也要有点江湖直觉和专业水准——开片之前一定要摸海底。这点习惯都没养成的，都在头几年就挂了，这是连小混混都懂的道理。\n\n如果我看出来你没有做过基本调查就假定对手“铁定无知”，我毫不客气的说——**在我眼里这样的人没有资格得到我的注意**。\n\n我不喜欢自夸，但我不缺交流对象，而且多到可以随便任性挑选的程度。\n\n\n\n#### 6）做这些回答，目的之一是为了得到有质量的反对意见。\n\n没有外界的砥砺，以我的能力要自洽太容易。自洽了就无法再改进了，需要有人指出我不知道的其他资讯和从我遗留的角度看到我没看到的破绽。\n\n在大量的批评者之中，这种有质量的批评发生频率极低（注意，最起码的礼貌和教养是质量中不容缺少的一环）。但是这极低可能的输入也是非常关键的东西。值得为了这些沙金，跳入沙河。\n\n但请不要误认为“沙”就没问题。就像做警察的人自然就做好了被人伤害的准备，但这并不意味着伤害警察的人就“没问题”。\n\n所以，如果要给我回报，其实最有效的方式是写下你的疑惑，发出你的疑问（**但请注意不要搞成得意洋洋的反问——反问是自以为对答案绝对确信的，既然确信为什么不用陈述句？**），尤其是提出你看到的与此相矛盾的事实。这不但不会显得不尊重，反而在我看来有特殊的帮助。\n\n\n\n#### 7）**建议你把我关注置顶**\n\n这样可以第一时间收到新内容提示。**否则你点击了关注意义是不大的。**\n\n因为你一般都会关注个一两百人，我新发布的内容很快就会被淹没，实际上和没有关注差别不大。\n\n\n\n#### 8）如果你猜测某些匿名答案实际上是我写的，那么把结论埋在自己心里，不要找我验证。\n\n我如果选择了匿名，自然是有需要匿名的充分理由。既然如此，我当然就不希望被人打破这个状态。这包括在评论区中直呼我的账号、使用你给我设定的专属尊称、在其他场合宣称某条答案是我所写等等（这往往会导致你的评论被删除**）**。凡打算与我保持友好的，都不宜有意打破这条禁忌。\n\n你们想与匿名答案的作者交流的东西，为什么不直接在人家的讨论区直接问呢。\n\n\n\n#### 9）我写的东西都可以随便免费转载，不用问我，不用注明出处、不需要声明原著作权、不用给钱，你赚了钱的话都归你自己。\n\n**再说一遍，可以不用注明出处，而且我鼓励不注明出处**。\n\n要是有人直接质问你是不是从我这抄走的，你可以直接用这个许可回答他们。\n\n但在实践上，如果你是整段摘抄或者整篇转载，有人问你是不是从哪里转载的，我非常不建议你强行否认，这不是我要来稀罕这个著作权，主要是你硬否认的话人们会非常积极的站在我的立场上捍卫我的潜在利益对你形成你本来可以避免的困扰。然后他们非常热心的来告诉我哪里哪里抄我的文章，我也不好打击他们的热情，我不回答他们会反过来觉得是我抄你，但我也很不想花时间无穷的解释。\n\n我的时间不打算这样用。\n\n这样你反而无谓的浪费很多人的精力，也没达到你自己的目的，这太傻了。\n\n这只是一方面。\n\n另一方面，毫不客气的说，经过适当的营销，直接抄这些东西是很容易得到崇拜、得到“粉丝团”、得到你想要的名利的，但这种名利背后的偶像崇拜是非常危险的。如果你是不配得的，你是无法驾驭住自己的贪念和这些崇拜行为的。这很容易发生危险的反噬。\n\n把这些文字轻易的集中归于自己的名下，这对你自己并不是一件纯然的好事——即使我不会从著作权、使用权上给你麻烦，因“我还以为是你自己写的”而幻灭的粉丝也会是个很大的、很实际的风险。\n\n切忌。\n\n> 可能将来有一天我会取消现在的自由转载许可，如果作出这个改变的话，我会在正文更新，并在评论区全员推送。因此我建议你如果转载了我的东西，请务必在评论区留下评论，以便得到及时通知。  \n> 免费转载的免责期以评论中的那一次正式通知为准，早于那个评论的自由转载不受限制。（此条于2020.7.26日更新）\n\n另外，我也提示各位，不要看到了和我一模一样的文字后来问我是我抄ta还是ta抄我。\n\n我不抄袭。我的东西看多了，自然也不会问这个问题了。\n\n#### 10）建立私人存储方案\n\n如果你看到某条我撰写或者推送的答案深入你心以至于你觉得很需要长期复看，那么我强烈的建议你直接把它拷贝下来保存到你的私人存储方案里。\n\n要知道，百度贴吧可是将2017年以前的帖子一次性干掉过的，360网盘也曾一夜间关闭。\n\n你不能假设知乎于世长存，也不能假设某个收藏夹、某个链接会于世长存。\n\n\n\n#### 11）我先预告清楚，我很容易拉黑人、而且很容易删除、折叠我因为任何理由觉得有必要处理的回复。\n\n**而且我完全不保证我拉黑、删除、折叠的理由会让人能接受，或者符合某种被拉黑者认为“公平”的标准。**\n\n你在任何评论区发言，就等于默认接受了这种内涵在知乎规则里的默认法则——这其实不是我在这里特别规定的，而是**知乎的系统设置直接决定的**。\n\n**作者有作者的身份特权，是作者的写作劳动的成果之一。**\n\n你可以自己当作者，去付出这种劳动，去**平等的享有这种劳动成果**。这才是平等的含义所在，而不是在没有付出同等劳动的前提下，靠着种种施加压力的手段去逼迫别人按照自己的喜好来使用别人的合法权利。\n\n**这本质上是不尊重他人的劳动成果，将自己视为了一种可以言出法随的特权阶级。**\n\n额外要说明的是，我这里其实是有给一部分人特权的——**那些我查看过之后看到有奉献过公益性答案的人，在我这里自然会享有额外慎重的对待。**\n\n**ta们的疑问和反对，我会额外重视。——虽然这不表示我就一定不会拉黑、删除、折叠，但信不信由你，我会额外慎重。**\n\n因为我还有另一种考虑，就是因为我的不断更新和完善，我的一些答案注定会成为一个人流和评论非常密集的地方。因为我管理答案的方式，我这里会不断的、越来越多的涌入对我抱有很大敬意甚至感情的读者。\n\n**你的质疑若是被我感觉会让人觉察到（或误读出）对我有轻蔑和伤害之意，那么它会自然而然成为一个永久性的吸引对你的攻击的入口。**\n\n**而我不希望你受到这样的折磨。所以我要替你关闭掉这个会引来鲨鱼的伤口。**\n\n**我更不希望对我抱有善意的人因为你的引诱犯下伤人的罪，无论多轻微都不希望。**\n\n如果你只是发现你的答案被折叠或者删除，而没有被拉黑，你是可以考虑重新组织语言、去掉这种我顾忌的问题，重新提出你的疑问的。（但是你要注意，我没有保证它肯定不可能被删除和折叠，或者会导致被拉黑——人生的每一刻都是冒险）。\n\n尤其是，如果我已经把你拉黑了，让你再无还手之力的挨揍那对你更不好。\n\n删除和折叠，常是一种保护措施，而非单纯你理解的“迫害”、“报复”。\n\n我再坦白点说——很多你以为是我删除的评论，其实我根本留着没动，是因为我持续更新答案不断的有人流入，三天两头挨骂，原作者自己删除的。\n\n\n\n#### 12）关于评论区管理。\n\n你们可能没有意识到我的评论区的价值。\n\n如果你认同着这些的理念，你应该很容易在我的评论区里的评论者中找到值得关注的人。\n\n如果你不认同，那么你也可以因着你的不认同，找到与你同样不认同的朋友。\n\n这里面可能有你将来的老板、下属、朋友、恋人。\n\n只要你说话，你也会也容易被看见——说话之前问问自己——你想要怎样被看见？\n\n这些回答是被有意创造的孵化器。\n\n是为了孵化值得一搏的关系的。\n\n因为这个原因，我希望评论者们主动自肃，避免在我的评论区对人发动攻击性言论。\n\n并且我鼓励你们对我评论区里发现的任何攻击性言论积极举报——**包括我的言论。**\n\n\n\n#### **13）关于粉丝团体。**\n\n我不建议任何人组建以我为中心的粉丝团体。你们组织起来整理我的答案是一回事，但组织起来组成我的“追星俱乐部”我是不赞成的。\n\n赞同我所阐述的那些逻辑推断和事实判断是一回事，赞同我这个人是另一回事。\n\n我绝对不赞成人因为喜欢我这个人，而赞成我讲的话，而且绝对反对人只看我的话，不看与我立场对立者的话。\n\n我希望你们接受某些话，不是因为它来自什么先知圣贤、人生榜样，而是因为你们正正反反、上下左右的对比推敲后发现的确这是最合理的方案，所以照办。\n\n**成为我的“粉丝”和成为我的读者其实在深处是互相矛盾的，而我绝不希望任何一个读者变成我的粉丝。**\n\n一个也不想。\n\n**所以我呼吁你们不要成立以赞美我、关注我为主题的任何组织，也不要加入这样的组织。**（仅以临时合作抢救性收集我的回答的临时组织不在其列，但既然我这里已经整理完毕，你们的工作应该也收尾了）。\n\n我虽不会妨碍人这样做的自由，但我不会对这样的组织及其成员给予特殊的优待——因为这样只会于你们有害。\n\n最能让我高兴的是你提出我没想到过的问题，发现我没考虑到的矛盾和破绽，并以尊重的态度提出来，而不是对我说好话。\n\n我没有授予任何人评价我的权利——无论是差评还是好评。\n\n将来你们也慢慢会发现，这种评价其实本身也没什么意义。\n\n\n\n#### 14）**因为13的原因，我大概率会将用“粉丝”来指代与我友好互动者的人拉黑。**\n\n对一个人表示了超出你自己水平的尊重，一定就是“无脑崇拜”吗？你就是“正确分寸”的准绳吗？\n\n现在一般青年人里面流行的所谓“正常关系”一般都被我认定为“还不知道尊重为何物”。\n\n**这意味着楞头青们则会参考自己的水平认为只要高于这种可以“说话随便一点”的水平的尊重就叫“拍马屁”，“个人崇拜”，“粉丝”。**\n\n将来你们挨的教训会告诉你到底是我对还是你对。\n\n我评论区里的基本氛围，只不过是很普通水平的以礼相待，如果你认为这就叫“粉丝互动”，叫“个人崇拜“，我只会同情你将来的命运——等你走出社会，你会发现现实生活至少也要求这个水平的礼仪。\n\n**在我这里，称呼任何人是我的“粉丝”，都会被我视作一种对他人的侮辱。**\n\n**因为你在侮辱别人的教养和智商，你也在侮辱我做的这些事。**\n\n**既然如此，我会削弱你看到这些东西的便利，这不是为了“报复”，而是为了降低这种事发生的概率。**\n\n外面我管不了，但是不能搞成别人到我这一做客，仅仅因为特别礼貌周全就被人批评为“狂热粉丝”，这像什么话。\n\n至于你们认为很有礼貌就算狂热崇拜，这个需要你们自己多看看这些讨论区是不是真的“没有反对意见，一味吹捧”，去研究反对意见应该怎么提。\n\n这话我之前没有明确提醒，考虑到一般人对粉丝这词用得不严谨，既往不咎。\n\n**但从本次更新开始，凡有用“粉丝”“粉丝团”来指代与我友好互动的人，除非是用来指说话人自己（指自己请参看第13条），否则大概率拉黑。**\n\n\n\n#### 15）如果你觉得应该要取关，我没有任何意见。\n\n但不要跑来发在我的评论区或者想法下面特别声明一下，这种行为会导致你**很大概率会被拉黑**，这意味着至少你的这个账号将不再有机会再次关注我了。\n\n\n\n#### 16）点赞与收藏\n\n我的点赞和收藏都是按照“这一篇值得你们看看”、“这一篇适合你们现在再看看”的标准操作的，这是一种有意设计的公共服务。但因为知乎关闭了对被关注人点赞和收藏的推送功能，这个推送的成本大为提高了。\n\n因此我在这里提出这个方案，呼吁有心人参与：\n\n如果你认同我所推送的东西值得进一步传播，愿意成为助力，那么请你注意我的主页动态，（这里可以看到点赞和收藏信息），并且根据你自己的判断，转发这些被点赞和推送的答案到想法。\n\n同时也提倡你们关注一两个有转发我动态习惯的用户，作为万一知乎有什么变化的辅助保险手段。\n\n\n\n#### 17）**我的东西，最好不要直接转发给自己的朋友、父母、恋人看。\n\n因为这有“让你学学怎么对我好”的含义，副作用比正面意义更大。**\n\n你想要更多人看到，最好**以身边人所不知道的身份，转发给不认识你的人**看。否则你很容易被人攻击。\n\n看到的人多了，自然有一天传回到希望能看到的人手边。只有经过这样一道轮转，才能解决这个负面效应。\n\n\n\n#### 18）可以在此直接搜索内容关键词和查看版本变迁。\n\n*https://github.com/itrewub/jh-notes#jh-notes​github.com*(http://link.zhihu.com/?target=https%3A//github.com/itrewub/jh-notes%23jh-notes)\n\n望周知。\n\n\n\n#### 19）有一个禁忌——在我的评论区慎用“面子“这个概念。\n\n无论你在任何意义上觉得我是在跟任何人在任何问题上争面子，只要说出来，很大概率会进入黑名单。\n\n因为我认为以下几点是很显然的——\n\na）以我展现出来的能力，我若想要“面子”，用得着以写这些东西这种低效率的办法吗？就算是，有必要用这种写法吗？\n\nb）就算我想要面子，要这种不知哪来的路人的面子干什么用？\n\n这是【缺少基本的思考能力】的表现，会让我觉得往下跟你多说的任何一句话都是浪费时间。\n\n这于是带来进一步的问题——\n\nc）对于觉得我是在自己面前为了争这个面子才说什么做什么的人而言，得到缺少基本思考能力的人的认同，有什么“面子”可言？\n\n这跟生不生气关系不大，之所以要拉黑，是而是因为每一秒钟都是不可挽回的生命，我一秒钟也不愿意再被浪费。\n\n\n\n#### 20）之所以拿出那么多精力来无所不包的写，根本不是为了引人赞叹崇拜。\n\n而是为了提供一种“能力的基线”，以便让人在发现与自己意见截然相反的时候，不能不犹豫一下“会不会不是这个作者疯了 / 有病 / 突然逻辑能力丧失，而是可能是我自己搞错了”。\n\n这些回答真正对一个人有重大价值的部分，绝不是那些你击节赞赏的部分。那部分让你很愉快，是因为你觉得有人替你把你说不出但同意的东西用了你无法达到的力度说了出来，大快你心，那不过是本来就有的价值得到二次肯定而重复消费。\n\n**真正对你至关重要的，恰恰是正是那些你原本完全不可能接受的东西。**\n\n这你绝无办法同意、连看在眼里都觉得荒唐而不可思议的充满“冒犯”和“傲慢”的一百字，才是对你最重要的东西。\n\n那是被倾尽心血以钢铁般的逻辑推演浇铸在那一百一十九万九千九百字的基座上的。\n\n那一百一十九九千九百字，都只是为了让你对剩下那一百个字的“荒诞不经”“岂有此理”，**犹豫**片刻。\n\n**哪怕你只是犹豫，哪怕只有片刻，也对你有重于那一百一十九万九千九百字的意义。**\n\n这要的不是你对那些有多“击节赞叹”，要的是你对这些的片刻犹豫。\n\n力举千钧，唯求一发。\n\n真正将一个人牢牢的禁锢在那个钢制小盒子里的，根本不是他人的所谓“压迫”，而恰恰是自己的“绝对无法接受”。\n\n只有将千钧之重集于这毫针之尖，才有可能洞穿这钢铁的盒子，刺穿一个极小的孔。\n\n哪怕这个小孔只能维持一秒，在这一秒，铁盒里的你也在这一秒与你自己隔绝的东西相连。\n\n**在那只张开了一秒钟的、一毫米的小孔的，另一头，有被你恨与憎恶的人等了一辈子的理解和原谅的可能，**\n\n**有真正无垠的世界。**\n\n**千针万孔，终有通时。**\n\n如果你遇到这样的地方，就以“这个作者为什么在这里如此大失水准，看来术业有专攻，古人诚不我欺也”一摆手含糊过去了，那么你花那么多时间，仅仅只是在为自己找到了一个“很牛的人”赞同自己已经赞同的东西，找到了一个可以用于捍卫你本来就持有的弹药库而已。\n\n那于你好处极为有限，甚至可能反而有害了。\n\n不求你现在明白，更不用你叫好喝彩，但要你**沉吟片刻**。\n\n沉吟吧，不是为我，而是为你自己，最终为那些已经、正在和即将被你错失的人。\n\n那些人是你安身立命、存亡续绝、有所成就的真正关键，是你真正光明的未来。\n\n\n\n#### 21）说话和占用我的注意力，最好是为了除了自己之外的其他人类，最好要是其它路人看了也会有所助益的话。\n\n在我的答案下的留言，会自然的消耗掉所有看到它的人的时间，如果与其他人并无关系，也无参考意义，那么第一，这一般都不会得到我的回应，因为给予回复会进一步扩大后人的损失；\n\n第二，我会视为一种问题——可以理解，在一定限度内可以容忍，因为人非草木，孰能无过——但忍让是一个问题。\n\n要知道我现在的浏览量是一天十万。你的话如果会让人无谓平均多花一秒，就是人类损失了十万秒。\n\n而在第二天可能还会再令人类损失十万秒。\n\n我的东西大概将会长久的流传下去，它存在一天，随附在它之上的种种其实于人无意义的信息也会一直继续夺走一切随之看到它们的人的一秒又一秒。\n\n人非草木，孰能无过？所以一次两次有感而发，并没有顾及这一点的话也罢了。\n\n但是如果你打算在我的评论区**长期活跃**，那么要注意到这个问题，因为长期活跃而并不在意这一公众代价的存在，会造成的损失会是另一个量级的。\n\n我的损失并不重要，因为我已经预先接受了可能的消耗，因此你不会因为造成了我的这些的痛苦欠我什么东西。\n\n虽然有折叠删除拉黑，但是那是一种对未来的处理，不是对过去的追究。\n\n**你真正亏欠的是没有像我一样事先同意的其他人。**\n\n**真正会令我在意的，是你对其他人的爱，而不是将其他人置若罔闻而专注在我身上那些东西。**\n\n这在我看来不但不会令我萌生好感，反而是**越“专一”、越炽烈、越减分**的。\n\n爱我即爱我所爱。\n\n你眼中、口中、心中没有他们，你的眼中就其实没有我。\n\n\n\n#### 22）我写的这些东西几乎不会提供来源引用，也并不会给出每一步的论证。\n\n我一向选择只写那些我认为你在足够真诚而且有对应经历的前提下，仍然不容易凭自己直接想通的那些断点。\n\n只替读者补上**关键的那一环**。\n\n这首先是因为我只有这样的精力——说直白点，就这条件，你挑剔也没啥用。\n\n其次是因为这些东西本身就是力求避免建立在“因为某人那样说过”这种依据之上的。定义和论证都给了，直接看定义和论证，在自己的生活中去验证。\n\n其他人没谁有资格为这些东西背书，因为ta曾经说过，而且ta很伟大，于是你的人生就应该怎样怎样过吗？如果哪天那个人被察觉说的是错的，这些论述就要连环倒塌吗？\n\n所以毫无引用的意义。\n\n第三，真正要想从外界受益的人，总是分得清谁是主动，谁是被动。\n\n自己去考虑使得这些东西可以成立的语境，是从这些东西里受益的天然前提。\n\n对于有缺环的表达，有人将原命题自行补强然后讨论仍然存在的疑问，有人将原命题补弱然后发表不屑一顾的贬斥。\n\n只有前者有资格得到在意，后者根本没有活醒，还欠生活的耳光。\n\n而对于前者，有时候你无法理解是因为你并没有经历过必要的体验，所以全靠理论认识补不上被省略的缺环。这种情况意味着你的时候还没有到。这并无贬义——谁也都是先上一年级，再上二年级……然后再上大学的。直接询问大学的问题，有时候唯一的最短路线就是让你先把一二三四……年级都上掉，那是无法用简单的描述来替代的。\n\n这种时候只能说“再过些年再回来看”，别无他法。\n\n而只有在既补强了、又有经历了的前提下，仍然保有的疑问，才的确是我的表达过于省略或者的确是错的。\n\n基本上只有这最后的一种疑问会导致内容的修订。\n\n望周知。\n\n\n\n#### 23）**我回答的对象不是题主，而是是看到那个问题会点进来的人。**\n\n这是对于很多人很在乎的“离题”问题统一的回复。\n\n我回答的不是题主的那个问题，而是关心那个问题的人真正想要解决的那个问题。\n\n因为**绝大多数问题本身就问错了**。\n\n**连题主自己，问的都不是自己真正想问的那个问题。**\n\n这是解决自己问题的最大屏障——无法解决问题的人，首先的困难是缺少提出正确的问题的能力。之所以找不到答案，是因为问题本身就提错了。\n\n关于“离题”的提醒，不必再重复。\n\n\n\n#### 24）**从现在开始，接受评论区指出“这个说法可以改得柔和一些“的建议。**\n\n人们很难接受别人对他们不认同甚至担心受其伤害的观点如此肯定。这可以理解，不演化成对人的攻击行为也是人正常的权利。\n\n我写的东西如果没有什么论证，对ta们反而没有这么大刺激。\n\n对他们来说艰难的一点是每一点刺心椎骨的东西都不是那么一根小刺，而是从一个很难整体否定的、绝大部分ta们自己也认同的东西上无缝的生长出来的。\n\nta们不是担心这些是错的，而是担心这是对的。担心如果这真的是对的、如果这东西真的说服了越来越多的人，会导致ta们根据原来的计划打算的人生会受影响，会担心影响到ta们前十几年甚至几十年努力的价值。\n\n这对很多人都是折磨。\n\n我并不是不理解这些人对这些东西的矛盾心态。\n\n我只希望在最后不能不停止之前把来得及讲的话尽量多讲点。\n\n那对ta们将来有大用。\n\n我说不能原谅，其实是气话。\n\n因为【一开始就是为ta们写的】。\n\n我很清楚这其实违背了我预先决定要给的宽容。\n\n最后我是会道歉的，但是我现在要任性一下。\n\n这不需要惋惜，因为这是自然规律，不能简单的归咎于那些忍受不了而不能不对我做些什么的人。\n\nta们其实不是故意的，ta们只是太痛苦和害怕了。\n\n事实上，我很抱歉无法因为顾及他们的感受而停笔不写，因为我更担心ta们将来需要的时候看不到这些东西。\n\n觉得自己的路走得通，那么就先去走，等那些路走不通了，至少还有一条你以前不喜欢，但是知道存在的路放着。\n\n为了怕动摇自己的走现在这条路的决心和怕失去对现在选择的道路就是“绝对最优解”的信心，是可以理解的。毕竟很多人之所以还能在现有的道路上苦熬，凭的也不过就是这仅存的“这就是最佳选择”的念想了。\n\n只有相信除此之外别无它路，相信连第二条可能的路都没有，ta们才能说服自己接受已经接受和即将接受接受的全部痛苦和折磨。\n\n给人选择、给人自由，其实与杀人无异，因为真正难以承受的不是痛苦本身，而是“我可以不必受这些苦”的可能性。\n\n所以怎么能不想把在建第二条路的人杀死呢。\n\n为人铺路，必须要承受这个，不能有任何侥幸。\n\n这跟公平不公平其实没关系，这就是事实，就和凭啥不抽烟也有可能得癌症一样是事实的一部分。\n\n说到这里，我也的确需要反省。我有能力做得更柔和点，就应该再柔和点。\n\n我觉得委屈，所以在这方面努力不够。\n\n觉得委屈应该自己处理好，不应该过于勉强而把过于勉强的后果责怪到其他人身上。\n\n所有可以消除的痛苦，都应该被消除。\n\n虽然这不意味着我会取消掉现有的黑名单，但应该会改变一些现在的和将来的文字。\n\n总而言之，希望你们好好的。\n\n包括觉得我应该被消灭的各位。\n\n我为我无法克制怨恨你们而道歉。\n\n自觉正确、自信利他，也不可以是不原谅的理由。\n\n人难以免俗，希望你们理解。\n\n这不表示我会改变屏蔽攻击性言论的做法，但请你们理解这更多的是技术性的，并不表示这是一种报复。\n\n我必须想办法坚持得久一点，而我并不能做到对我所热爱的人们伤害我无感，抱歉。\n\n从现在开始，接受评论区指出“这个说法可以改得柔和一些“的建议。\n\n预先感谢所有的帮助和谅解。\n\n25）我的东西，不建议直接转发给自己的亲属家人。因为这就像傻男生送女朋友美白霜一样。\n\n人家不但不会擦，还会连本来自己下的单都退掉。\n\nta们只能凭缘分从与你无关处自己去看到。**别人的亲朋，看到的该是你的转发；你的亲朋，看到的该是别人的转发。**\n\n将这东西转发给自己的亲朋这个行为是直接违背这些东西的原则的，那会形成一个奇妙的讽刺——ta们否定的根本不是“美白霜”，而是“男朋友”。\n\n  \n\n#未完待续TBC \n\n\n\n",
          "zhihuLink":
              "https://www.zhihu.com/question/264373660/answer/1710187984",
          "author": "#Anonymity",
          "tags": ["致读者"],
          "links": ["致读者 - II", "致读者 - III", "Anonymity/00 - 致读者/致读者 - 留言"],
          "lastUpdate": "23/07/2021",
        },
        {
          "name": "致读者 - II",
          "title": "致读者 - II",
          "question": "如果你生活中有一个很像John Hexa的人，应该怎样处理最好",
          "content":
              "# 致读者 - II\n*如果你生活中有一个很像John Hexa的人，应该怎样处理最好?*\n\n> Author: #Anonymity\nLast update: *24/07/2021* \nLinks: [[致读者 - I]] [[致读者 - III]]\nTags: \n\n我不喜欢任何私人的注目，这对我是一种负担。\n\n因为转交这些知识而得到人的感谢，在我的角度看是窃取了根本不该属于我的荣耀。因为这些而得人迷恋，就像一个负责发福利的小助理却被人看做真正捐赠的施主感激一样，是一种近乎盗窃的罪行。\n\n更不用说这样做的人本身也是误入歧途。\n\n---\n\n（以下是原答案，这些话要说透点好，所以照样保留）\n\n回答这个问题很容易导致被我拉黑，自己掂量清楚要不要冒这个险。\n\n我不喜欢被人“粉”，更不喜欢被“柏拉图单恋”。\n\n这是我**明文的拒绝**，凡不遵从者勿要自认与我为友。\n\n同时，我建议你们自己也这样做——用粉丝语调粉你的，并不是值得庆祝的。\n\n我不喜欢直接伤人心，因为我能理解。但是如果没有选择，我只能直白的说——这不但无助于与我建立任何实际关系，反而会极大的破坏你本来可能有的任何机会。\n\n**因为我最不喜欢不能摆脱这些执念的人。**\n\n不要以为“崇拜”和“赞扬”就足以让我改变主意，因为那些在我这全是**负分**。\n\n这篇发出之前的，不知者不为罪。\n\n现在东八区时间是2021年4.12日1点54。\n\n发出之后还要强试的，各安天命。\n\n  \n",
          "zhihuLink":
              "https://www.zhihu.com/question/452528312/answer/1830226228",
          "author": "#Anonymity",
          "tags": ["致读者"],
          "links": ["致读者 - I", "致读者 - III"],
          "lastUpdate": "24/07/2021",
        },
        {
          "name": "致读者 - III",
          "title": "致读者 - III",
          "question": "成为像John Hexa这样的人，有没有一套可供参考的努力方向",
          "content":
              "# 致读者 - III\n*成为像John Hexa这样的人，有没有一套可供参考的努力方向?*\n\n> Author: #Anonymity\nLast update: *23/07/2021* \nLinks: [[致读者 - I]] [[致读者 - II]] [[爱]]\nTags:  \n\n \n总结一下我变成我的几大因素：\n\n首要的，其实是我自己复杂的个人经历。这个得看老天安排，所以这个没得学习模仿。\n\n但从另一面看，也没什么必要去学习模仿。上天自然给每个人安排了各自自己的职业、事业和道路，会把人塑造成各种有趣的样子。你可以变成你自己有趣的样子，跟我一样是有多无趣。\n\n第二，好奇心。\n\n人间最有意思的事情，就是无论你如何阅历丰富，总有令你不得不拍案叫绝的前所未有的精妙设计和绝妙情节。而且越是站得高，可以看见的风景也就越宽阔和精彩。\n\n只要人保持着持续的、强烈的好奇心，而不被那些无聊的功名利禄的占据全部能量，自然而然的就会一路向山顶行去。\n\n你其实真的不需要那么多钱、不需要那么多人羡慕、那么多权力来自保。一箪食一豆羹，回也不改其乐。学而时习之，不亦乐乎？\n\n学习探索，没必要是为了吃饭赚钱这样的理由。仅仅是这样的理由，并不能支撑你走得很远——更不必说看得到我能看到的风景了。\n\n原因不复杂——我能看到我所能看到的，是依赖了大量没有明显经济效益的学习。那在一心赚钱的人眼里是不可思议的“精力浪费”。但在我看来，把能走上更高观景点的机会拿来换了那么点金钱，才是更大的浪费。\n\n没站到这个地方的人，很难体会到这种快乐程度——放眼望去，这个世界充满着难以对没有同等积累的人言说的美与绝妙。就像世界在不停的说相声，但与你同行的人却听不懂中文。你可以尽力用英语对人解释，但这意思可以说通，这神韵却会在翻译中遗失。\n\n而最重要的是，翻译的速度远远的追不上台上演出的速度。你们看着我给你们说得精彩纷呈，其实远远不如我看得见的精彩之万一。你们也不知道我多为你们焦急——世界是如此的丰富和美妙，你们却被各种荆棘树杈勾住了袖子口袋，在黑暗的地方纠缠痛苦。\n\n真的是很浪费。\n\n痛苦的绝大多数原因，都是人看问题太近、太局限、太缺少智慧。\n\n太近、太局限，于是很多远期的、非直接的、非具象的积极收益你就看不见、信不足，于是你算起账来，就自然少计算了大量的进项，当然总是得到一个巨亏的数字，然后被这个数字吓到失魂落魄。\n\n这几乎不可能靠所谓的奇妙计策陡然提高现金流来把亏账瞬间做成盈账。\n\n于是你们总是心里发苦，眼里发花，匍匐在地，喘不过气来。\n\n一本书也没有心思再看，一点好奇的力气也不再花。\n\n只是忧愁啊忧愁，无限的忧愁下去。忧愁到受不了了，到处去找“悲观的人如何变得乐观”的答案。\n\n这双眼睛是盲的，你的账就怎么也抹不平，而你“账算不平”，你的眼睛又会一直被忧郁紧紧的蒙住，眼睛看不见，账又一直平不了，账平不了，你就没有余力睁开眼……\n\n看懂没有？**解决的关键并不在于那些眼前怎么也算不平的账，而在于那双看不见账本来就是平的、甚至是盈利着的眼睛。**\n\n而我的幸运，就在于我一直在跟着风景走，在低头算账前，就先有了看得见那些“隐藏收入项”的眼睛。这些对普通人看来“虚无缥缈”“不切实际”、只会被恐惧的心态抹杀掉的东西，在我眼里有形有相，宛如实质。\n\n于是我不担心，我不担心，我就不焦虑，我不焦虑，我就一直有时间接着往下看风景。我风景看得越多，视力就越好，我的账本就越乐观，越不无谓占用我的精力去焦虑，于是我风景就看得越多，视力就越好……\n\n另一个问题就是欠缺智慧。\n\n很多问题对你来说很难，难到令你绝望，是因为你知道的方法太少。你的工具箱里只有锤子，如果问题不是一颗钉子，你一下子就完蛋了。你锤了又锤，就是不能把打碎的花瓶锤成好花瓶，你就慌了。慌了你就失眠了，失眠了你就乱来了。\n\n你知道要寻找办法可以顺藤摸瓜，然后顺着所有你知道的藤摸了个遍，一个瓜都没有摸到。\n\n这才是真正令人绝望。\n\n而你如果一直保持着单纯的好奇，漫无目的的、不顺着功利线索的去随机的追寻一切知识，你一定会常常发现这种现象——**某些能救你命的瓜，长在别的树上。而你要先看见了它们，才能反过来看见那些以前你绝对发现不了的藤。**很多你觉得绝无办法的问题，有着难以想象的天马行空的方案，需要的只是你再站高一点，看深一点。\n\n单纯的好奇而带来的知识宽阔性给你带来的首要好处，并不是你会多很多方法，变得特别能解决问题——相信我，就算你思路宽阔十倍，一样书到用时要恨少，而且一时之间解决不了你眼前的问题。因为那时难住你的问题也会是能难得住你的问题——不然它怎么会成其为一个问题呢？\n\n**首要的好处不在于你工具箱里多出的那几件有限的工具，而在于对“问题存在着可能的出路”的信心。**\n\n**你见识过那些藤可以藏得多么诡异绝妙的深，你就不会再因为简单的顺藤摸瓜摸了个空就轻易绝望。你就会多一些耐心，晚几个星期焦虑。**\n\n这是一个极大的优势，能进一步的帮助你不被那些荆棘牵绊，耽误你看风景。\n\n  \n\n\n越过这山丘，站到我所立足的地方，你们就会会懂得我在说什么。\n\n那个时候，大概才会与我“一样”。\n\n我在做的事情，最直接的两个用意，一是指出一些隐藏的进项，帮助人们先从眼下的“账面亏损”的绝对焦虑里解脱出来，有能力抬头看看风景，一是摘录一些我看得到的相声来，作为一种尝鲜包，让人生出继续前进的念想。\n\n  \n\n\n这个世界如此美妙，栽倒在一本错误的账本里，实在太可惜了。因此而生的那些痛苦，实在无谓。\n\n无谓的痛苦，是纯然的恶。能去除任何一点，都是好事。\n\n\n\n",
          "zhihuLink":
              "https://www.zhihu.com/question/388065354/answer/1165852691",
          "author": "#Anonymity",
          "tags": ["致读者"],
          "links": ["致读者 - I", "致读者 - II", "爱"],
          "lastUpdate": "23/07/2021",
        },
        {
          "name": "门当户对",
          "title": "门当户对",
          "question": "什么才是门当户对",
          "content":
              "# 门当户对\n*什么才是门当户对？*\n\n> Author: #Anonymity\nLast update: *23/07/2021* \nLinks: [[紧追不放]] [[恋爱原理]] [[家族]]\nTags:    #亲密关系\n\n\n好好说一说门当户对的问题。\n\n因为这个问题对中国太重要了。\n\n  \n\n\n**你们有没有想过，你们中的每一个人——每一个人——有多大的概率是名门之后？**\n\n如果你们算过名门世家和一般平民的生育率差异、子女幸存率差异。你们会看到一个很朴素的事实——从数学概率上讲，你的整个祖宗链条里完全没有名门背景的可能性几乎为零。\n\n中国一共只有几千个姓。即使折算掉易姓、自号、在极近的年代归化的成分，这几千个姓里也尽皆曾有过不折不扣的名门。\n\n而且是屡屡崛起的名门，层层叠叠的名门。\n\n**你们全部是世家子弟，例外的可能性接近于零。**\n\n只是，你们忘记了。\n\n你们曾有历经数代乃至数十代先人的血汗总结出的黄金一般的世家传承、家族经验。\n\n只是，你们忘记了。\n\n你们一忘，就归零了。\n\n多少代先人累世沉浮才明白的教训和禁忌，你们不知道了。只好从自己开始再经历这若干代人的沉浮去重新知道。\n\n是因为你不知道这些，你才失去了“门户”。\n\n你才有与别人的“门不当、户不对”。\n\n你连门户都没有，怎么和有门户的去“门当户对”呢？\n\n**不要误会，这不是在说你家不够有钱于是和别的“家资万贯的家庭”不“门当户对”。**\n\n对方如果因为这个来嫌弃你，那么你大可以放心——你有机会看着这家人在两代之内家破人亡，曲终人散去。\n\n这样看待门户的家庭，没有资格称“门户”。\n\n那不是你跟他们门户不对，而是他们跟你门户不对。\n\n谈得上门户的世家，懂得一种最朴素的道理——财富并不是最难获得的家族资源，传承和韧性才是。\n\n超越自身和时代的胸襟和自觉才是。\n\n**你要知道，你自己就是你后人的祖宗，是你自己家族的开创者。**\n\n**什么叫“门当户对”？——永世长存的家族和另一个永世长存的家族，永远门当户对。一时之间谁盛谁衰，对于永世长存的家族而言都只是次要的、暂时的起伏而已。**\n\n这才是讲究“门当户对”时正确的理解——不是嫌你穷，不是嫌你不走运，而是嫌你没有身为一个家族祖宗的自觉。\n\n这种自觉性其实正是谈婚论嫁的基本门槛。你真的迈过了这个门槛，那么明白道理的世家大族不会认为你真的有什么门不当户不对。永生的东西分什么贫富贵贱？\n\n你没这种自觉，那么就不是门当户对的问题，而是干脆最好不要祸害他人。\n\n**你有没有这个身为祖宗的自觉？**\n\n**什么叫做“身为祖宗的自觉”？你们不妨好好想一想清楚。**\n\n**你们能明白这是指什么，那么你们与这世上任何一家，都只有对方能不能配得起你的问题，没有你配不配得起对方的问题。**\n\n**而且真正的世家一定看得懂这一点。**\n\n看得到你有建立传承的自觉，对方就明白你这家族是必须重视的存在。\n\n无论现在的势力强弱、一时尊卑如何，与世长存的家族之间只能互相平视。\n\n这才是人人平等的根子——**永恒者必与永恒者平等。**\n\n三代而亡的“富家”，只是不值得特别关注的烟尘。没有资格得到重视，也没有必要在意。他们彼此间的态度，也最终随着它们的消亡而毫无意义，当不当、对不对、都是虚无。\n\n能成其为门户的，尽皆门当户对。哪怕此时你贫他富，你“贱”他贵。\n\n**那么，到底什么是身为祖宗的自觉？**\n\n（7.9续）\n\n**所谓祖宗的自觉，就是不再仅从自身的立场来看待成功，而是把成功来做一种家族事业。**\n\n每一代的祖宗都不必力求速成，但要寻求为家族后代更进一步的夯实基础。\n\n一言以蔽之——要求事业，但更要求**基业**。\n\n代以代继，终有竟时。\n\n一人一代的能力总是有限的，机会总是难得的。世事无常，沉浮不定，祸福难料，因此若是总是存着“一定要在自己这一代当个富一代”的心，不断的心怀侥幸，急功近利，想要铤而走险、一蹴而就，反而往往容易导致久作不兴——你自己如此浮躁，哪里能积累起什么真优势？即使侥幸谋得浮财，家风不靖、根基不稳，这浮财不但不足以为福，反而足以为祸。\n\n这中间最大的问题就在于“每一代人都想要在自己这一代完成大翻身”这种投机策略。这种没有理心的焦虑感驱使着人不断的投机取巧，越是投机取巧失败，后半生为了达成这“目标”就越是要加倍投机取巧。\n\n要么一败涂地，要么侥幸成功，然后把侥幸当作成功之道，加倍下注，直到再次失去一切，还要更加深陷。\n\n以家族基业为考量中心的人就可以轻松的摆脱这种恶性循环。\n\n正确的家族战略，是每一代人都谋求为下一代创造更好的根基，哪怕每一代都只是拱一小卒，代代不息，也终有一天会走到“这一代人想不成功也难”的优势状态。而且这成功水到渠成，自自然然，且因为代代家风的建设积累，这成果足以持久，能循环光大。因着财富可以开枝散叶，将来越发同气连枝，从总体上就更加稳固。\n\n这对于身为列祖列宗的先辈们来说当然也是一种解脱。因为身为创业的先祖，你的任务就不再是在你这一代要如何谋得亿万身家，而只是为家族后代留下可以继承的一份正资产和充分可借鉴的经验教训、以及良好的教育而已。\n\n这是一种朴实的、踏实的、可以追求，不必依赖什么疯狂的幸运的目标。\n\n而且你会发现，一旦你的眼光不再是谋一世，而是为了谋万世，你做事反而容易有定性、有踏实的成果、有同志、有意料之外的帮助——反而比那些憋着心思必需一代成功的人们更容易获得真实的成功。\n\n（7.10更新）\n\n那么你的家族到底以什么为界？\n\n这一点万分的重要——**基业所及，即为族人**。\n\n不要——再强调一遍——**不要以血缘为界**。\n\n你的家族要立得住，要把与你基业相关的所有人都视为家族成员，而绝不能仅仅偏向你自己的亲属或者直系血亲。\n\n对志同道合处在同一生态中的平辈**爱之如己**，对托庇和仰赖这一生态生存并且尽力奉献的晚辈**视如己出**，这是你这个家族能拥有足够的资源和人才来应对未来风险所绝对不能少的安排。\n\n你越是爱惜自己的子女血亲，就越是要明白他们需要这些不同姓、不沾亲的兄弟姐妹叔伯姑姨。\n\n同姓族人是不容选择的，即使仅仅从概率上说，也很难支撑一个基业所必需的才智需求。等着每一代都同时出现大量的文武俊才，且绵延不绝这是非常困难的，也是短视的。\n\n家族必须存在一种机制能有效的吸收外部的人才。在古代，这靠的是乡谊、同僚、同窗、结交、联姻、收养、结拜。\n\n手段繁复，说明古人完全理解这个道理。可惜时过境迁，在现代，人际关系原子化，社会伦理个人化之后，原有的对乡党、同学、朋友、结拜兄弟甚至联姻配偶、亲生子女的社会性伦理约束已经几乎崩溃了。\n\n手段几乎已经尽数失效，但问题仍然存在，如之奈何？\n\n#未完待续TBC \n\n下面这个集子，对于养成正确的家风都有关系，建议仔细的想想。\n\n*家族答集*(https://zhihu.com/collection/378738313)\n\n",
          "zhihuLink":
              "https://www.zhihu.com/question/320314301/answer/687854449",
          "author": "#Anonymity",
          "tags": ["家族答集", "第一性"],
          "links": ["紧追不放", "恋爱原理", "家族"],
          "lastUpdate": "23/07/2021",
        },
        {
          "name": "家里不富裕",
          "title": "家里不富裕",
          "question": "家长要在孩子面前表露出「赚钱辛苦、我们家不_富裕_」这样的态度吗",
          "content":
              "# 家里不富裕\n[家长要在孩子面前表露出「赚钱辛苦、我们家不_富裕_」这样的态度吗？](https://www.zhihu.com/question/296333267/answer/551002721)\n\n> Author: #Anonymity\nLast update: *23/07/2021* \nLinks:\nTags:  \n\n\n\n换一个角度，莫非家长要在孩子面前**隐瞒**家里缺钱的事实吗？怎么瞒？\n\n何谓贫，何谓富？\n\n一百万是贫是富？一千万呢？一亿呢？\n\n很多人没有意识到人生最重大的一种因果倒置——**价值判断先于价值观**。\n\n一百万、两百万，这是事实，“穷”和“富”却是附有沉重的价值效应的主观判断。这一判断势必要带来价值审判。没有教会小孩价值判断的体系，也没有为子女建立承受着价值判断的心理结构。**直接将价值判断的结果丢给他们，意味着他们只能依靠稚嫩的心灵强行接纳这个先被规定的结论，将会迫使儿童的心灵自发创造适应机制。**其结果常常要到几十年后的婚姻咨询和抑郁症咨询里才被明确的发掘出来。\n\n为时已晚。\n\n这不仅仅是在贫富课题上，还在几乎一切价值观问题上存在。\n\n好人/坏人，能干/没用，聪明/愚笨，优秀/落后。家长们以为只要丢给孩子自己的判决，孩子就可以自动被判决推动着向自己希望的方向发展。\n\n有几个人能提供坏人与好人的确切判定标准？有几个人能提供“当我被认定为坏人时我该怎么办”的可靠方案？\n\n只有极少数的幸运儿，能自发的凑巧踩中强健的方案，这些人会在将来成为万人瞩目的“教学案例”。被完全逻辑错误的用在“贫穷教育”、“富养论”、“挫折教育”、“鼓励教育”这类蹩脚的鬼扯里面当论据。一万人里出了一个“成功案例”，就能将一种根本没有效力的做法变成一亿人的肘后千金方。\n\n悲哉！\n\n无知的家长们以为“既然只有要么不说、要么说贫、要么说富三种选择”，那么必然三者之一会是对的。\n\n这是一个**致命的逻辑错误**。因为顺序弄错，则三者皆错。在肉都没化冻的时候，是该先热锅呢，还是应该先入油呢？\n\n问题本身就是错的，因此任何答案都无意义。提供再多“案例”，在没有先明确的理解这一点的前提下，都是盲人骑瞎马，半夜临深池。\n\n问题根本不在于家里的贫富状况，而在于在没有给子女建立一个恰当的承受贫富的态度。无论家里贫或者富，你既要能过没钱的生活，也要能过有钱的生活。\n\n不是你没钱你才要学节俭，而是你有钱也要节俭。不是你有钱才要讲体面，而是你没钱也要讲体面。你若不能教育他拥有一种富贵不能淫、贫贱不能移的价值观，那么你教会他过穷日子，富日子就会对他构成诅咒，你教会他过富日子，则穷日子就会对他构成诅咒。**这种诅咒，并不需要对应的情况真的实现，仅仅是自觉贫穷而对富贵病态的饥渴，或自觉富贵而对贫穷病态的恐惧，就已足以发挥它最大的威力。**\n\n**何仇何怨，你要如此诅咒ta？**\n\n作为家长，太少有人在二十几岁生育时就想通了贫贱富贵免疫的价值观，也太少有人在子女价值观成型的三十几岁明了如何传授这些道理。所以这种饥渴和恐惧的双重夹击才代代相传，造成三世而斩百事哀的悲剧。这是需要几代乃至几十代的家族兴衰起伏，代代积累才会明了的东西。但这些本来最宝贵的遗产，被骤然而起的现代化稀释掉了。\n\n现代人全部来自古老的家族，可惜现代婴儿潮大大的胀破了世家传统所能照顾的范围。无论如何，现在的实情已然如此。现代人普遍的缺少一种基本的认知——人的竞争，首先是家族的竞争，任何不懂的积累家族史的家庭，都是对后代放弃了自己最基本的责任。**生与养，只是在延迟你自己家族的灭亡，立刻开始建立自己的家族史，才是作为祖先最大的责任。**无论前几代如何失败，只要你有这个意识，家族不绝嗣（其实你可以依靠养子或者精神继承人），你必将开创一个新的成功的家族。\n\n**家族必然成功。**\n\n**你们不要忘了，你们不仅仅是父母，你们还是新家族的祖先。**\n\n回到正题上来，教育的规律——如果你在构建子女的财富观之前，丢给他既有价值观产生的价值判断、身份认定，你不是在教育他，而是在将他本该得到的教育抛弃了。你等于把自己的子女交给在世上横行的魔鬼任其附身——这只要一句“我们家穷/有钱”就能办到。\n\n何仇何怨，竟然要如此厌弃ta？\n\n你自己有一个说得通的财富观吗？请问？\n\n当你自己感到穷困时，你自己的解决方案有效吗？当你自己净资产高涨的时候，你觉得安心吗？你如何确定这份财产是好事，而不是给绑匪准备的奖金？靠高薪聘请的保镖和隐姓埋名吗？\n\n在你想明白之前，不要跟子女说什么穷和富，保守的策略是先教他们什么是财富、要如何获得财富、财富会带来什么样的正面和负面的影响，如何面对金钱的缺乏和过剩（如果你没有金钱过剩的概念，这是一种能致命的错误）。\n\n在金钱观不明确的前提下，你能做到的最好的结果，就是教会他贫富的相对性。\n\n那至少在将来能保他的命。\n\n正确的财富观，是要从你的信仰为起点依着坚实的逻辑重新构建的。\n\n你的信仰是什么？你的财富观为什么与你的信仰一致？回答好这个问题，再去教子女金钱的事。\n\n其实，“家里穷”“家里不穷”，都是错的。\n\n*如何树立正确的财富观？*(https://www.zhihu.com/question/314627020/answer/1193533378)  \n\n\n*家族答集*(https://zhihu.com/collection/378738313)\n\n",
          "zhihuLink":
              "https://www.zhihu.com/question/296333267/answer/551002721",
          "author": "#Anonymity",
          "tags": ["家族答集"],
          "links": [""],
          "lastUpdate": "*23/07/2021* ",
        },
      ]
    };

    var cBox = await Hive.openBox('categories');
    for (Map data in totalData['categories']) {
      Category category = Category(title: data['title']);
      cBox.add(category);
    }
    var aBox = await Hive.openBox('articles');
    for (Map data in totalData['articles']) {
      Article article = Article(
        name: data['name'],
        title: data['title'],
        question: data['question'],
        content: data["content"],
        zhihuLink: data["zhihuLink"],
        author: data["author"],
        tags: data["tags"] as List<String>,
        links: data["links"] as List<String>,
        lastUpdate: data["lastUpdate"],
      );
      aBox.add(article);
    }

    UmengUtil.init();
  }

  static initAfterStart(context) async {
    await PrivacyUtil().checkPrivacy(context, false);
    await UpdateUtil().checkUpdate(context, false);
  }
}
