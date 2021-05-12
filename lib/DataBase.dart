import 'dart:typed_data';

class User{
  String name;
  String number;
  String pass;
  String nickname;
  ByteBuffer icon;
  int level=1;
  int sex=0;
  User(
      this.name,
      this.nickname,
      this.number,
      this.pass,
      this.level,
      this.icon,
      this.sex
      );

  static List users=List();

  static User check(String numder,String pass){
    for(User user in users){
      if(user.number==numder&&user.pass==pass)
        return user;
    }
    return null;
  }

  static bool adduser(User user){
    for(User u in users){
      if(u.number==user.number)
        return false;
    }
    users.add(user);
    return true;
  }

  static void init(){
    users.add(User('陈龙', '万年老二','19960209350', '123456', 1, null, 1));
    users.add(User('邹存玉', '万年老二','19960209351', '123456', 1, null, 0));
    users.add(User('杨璇', '万年老二','13208285009', '999999', 1, null, 0));
  }
}

class News{
  String url;
  String title;
  String imgurl;
  String description;
  News(
      this.url,
      this.title,
      this.imgurl,
      this.description
      );

  static List<News> mynews=[
    News(
        "https://t.cj.sina.com.cn/articles/view/7176059334/1abb9f9c600100u4h8?cre=tianyi&mod=pctech&loc=1&r=0&rfunc=45&tj=cxvertical_pc_tech&tr=145",
        "美团、拼多多被约谈，美团已跌超40％，拼多多市值蒸发1155亿美元",
        "https://n.sinaimg.cn/sinakd10110/271/w644h427/20210512/8dc4-kpzzqmz4350067.jpg",
        "5月20日 10:35 反垄断"
    ),
    News(
        "https://k.sina.com.cn/article_1984847913_764e602902000va1v.html?cre=tianyi&mod=pctech&loc=4&r=0&rfunc=45&tj=cxvertical_pc_tech&tr=145&from=food",
        "这个档案室“管理员”不简单！新技术加持的机器人干起活来多快好省",
        "https://n.sinaimg.cn/sinakd2021512s/130/w550h380/20210512/c9a3-kpzzqmz3765237.jpg",
        "5月20日 06:44 机器人"
    ),
    News(
        "https://t.cj.sina.com.cn/articles/view/7247071404/1aff588ac00100wb9r?cre=tianyi&mod=pctech&loc=5&r=0&rfunc=45&tj=cxvertical_pc_tech&tr=145",
        "共享充电宝风云又起：小电提交招股书，街电、搜电合并为竹芒科技",
        "https://n.sinaimg.cn/sinakd20210511ac/711/w1080h431/20210511/f70f-kpuunne1826688.png",
        "5月11日 12:02 怪兽充电"
    ),
    News(
        "https://t.cj.sina.com.cn/articles/view/6179910875/m17059f4db03300v7bb?cre=tianyi&mod=pctech&loc=6&r=0&rfunc=45&tj=cxvertical_pc_tech&tr=145",
        "大数据告诉你，谁才是德云一哥",
        "https://k.sinaimg.cn/n/sinakd20210511ac/136/w576h360/20210511/72e4-kpuunne1892604.jpg/w150h100f1t0l0q100syf.jpg",
        "5月11日 08:59 德云一哥"
    ),
    News(
        "https://finance.sina.com.cn/tech/2021-05-12/doc-ikmxzfmm1925223.shtml?cre=tianyi&mod=pctech&loc=8&r=0&rfunc=45&tj=cxvertical_pc_tech&tr=145",
        "职业篮球手因伤退役，投资开店卖嫩牛五方，赔光",
        "https://n.sinaimg.cn/spider2021512/640/w1280h960/20210512/534f-kpzzqmz3983273.png",
        "5月12日 08:33 外卖平台"
    ),
    News(
        "https://t.cj.sina.com.cn/articles/view/7018117363/1a24ff8f300100spcd?cre=tianyi&mod=pctech&loc=1&r=0&rfunc=45&tj=cxvertical_pc_tech&tr=145",
        "滴滴、美团长期处于亏损与收入负增长状态,为何还能财大气粗?",
        "https://n.sinaimg.cn/sinakd20210512ac/224/w640h384/20210512/071b-kpzzqmz4497040.jpg",
        "5月12日 11:17 美团 滴滴"
    ),
    News(
        "https://k.sina.com.cn/article_6237080477_173c24b9d00100xyfe.html?cre=tianyi&mod=pctech&loc=3&r=0&rfunc=45&tj=cxvertical_pc_tech&tr=145",
        "百度助力智慧丽江\"数智\"管理 丽江城市大脑正式上线",
        "http://n.sinaimg.cn/sinakd20210510ac/628/w1268h960/20210510/7fee-kpuunne0186252.png",
        "5月10日 16:13 城市大脑"
    ),
  ];
}