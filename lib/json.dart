class Chaptermenu{
  var data;
  List chapter = [];
  List chapternames = [];
  List subchapterlist = [];
  var results = Map();

  Chaptermenu(final this.data);

  main_chapter_names(){
    this.results["chaptername"] = this.data["chapter"]["name"];
  }

  learn_module_name(){
    this.results["learnmodulename"] = this.data["exam"]["name"];
  }

  chapter_names(){
    var chaptername = data["chapter"]["chapter"];
    for(var i in chaptername){
      var _chapname = i["name"];
      this.chapternames.add(_chapname);
    }
    this.results["chapternames"] = chapternames;
  }

  subchapter_info(){
    var chaptername = data["chapter"]["chapter"];
    var rootsubchapterlist = [];
    var subchapterlist = [];
    for(var i in chaptername){
        for(var subchapter in i["chapter"]){
          var name = subchapter["name"];
          var icon = subchapter["icon"];
          subchapterlist.add([name, icon]);
          //print(rootsubchapterlist);
        }
        rootsubchapterlist.add(subchapterlist);
        subchapterlist = [];
        //print(rootsubchapterlist);
    }
    this.results["chapterinfo"] = rootsubchapterlist;

  }
  question(final int chapter,final int subchapter, final int question){
    var chaptername = this.data["chapter"]["chapter"];
    //todo take a coustom question not the first one!!!
    print(chaptername[chapter]["chapter"][subchapter]["question"][question]);
    var result = chaptername[chapter]["chapter"][subchapter]["question"][question];
    return result;
  }
}

/*
[
  "subchapter" = [[[name,icon], [name,icon]], [[name,icon]]]
]
*/
