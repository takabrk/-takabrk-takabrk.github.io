//Script For The shining Sun
// Event Setting
load(
    () => {
        if($w.innerWidth >= 768){
        spider("anim1").css("opacity",{opacity:0}).scrollanim("fadein");
        spider("anim2").css("opacity",{opacity:0}).scrollanim("fadein");
        spider("anim3").css("opacity",{opacity:0}).scrollanim("fadein");
        spider("anim4").css("opacity",{opacity:0}).scrollanim("fadein");
        spider("anim5").css("opacity",{opacity:0}).scrollanim("fadein");
        spider("anim6").css("opacity",{opacity:0}).scrollanim("fadein");
        spider("anim7").css("opacity",{opacity:0}).scrollanim("fadein");
        spider("anim8").css("opacity",{opacity:0}).scrollanim("fadein");
        spider("anim9").css("opacity",{opacity:0}).scrollanim("fadein");
        spider("anim10").css("opacity",{opacity:0}).scrollanim("fadein");
        spider("bookmarks").html("ajax",{url:"bookmarks.txt"});
        spider("anim12").css("opacity",{opacity:0}).scrollanim("fadein");
        //spider("app_display").command("s u p e r d a t a b a s e 2","super_database2.php");
        //spider("app_display").command("g l o w","webdata/main_data/site.html");
//Background Movie
       //$sti(() => {
  //         spider("body").moviePlayer("bg-video",["BRKpics/movie/valkyrie17.mp4"],"BRKpics/valkyrie/valkyrie17.png",{control_set:"false",mute_set:"true",loop_set:"true",preload:"true"});
       //},6000);
// Meltdown
        spider("logo").click(() => {
            spider("").meltdown();
        });
// Display Information
        spider("browser_info").css("font",{size:"10pt",fontcolor:"#00ee00"})
                         .info("date")
                         .info("browser")
                         .info("screen")
                         .matrixEffect();
              //spider("").createLayer("av1",{width:800,height:480});
              //spider("av1")
              //.css("background",{color:"#ff0000"})
              //.css("position",{x:-300,y:500})
              //.css("opacity",{opacity:0})
              //.html("add",{string:"av1"});
              //spider("av1").scrollanim("movex");

              //spider("").createLayer("av2",{width:300,height:200});
              //spider("av2")
              //    .css("background",{color:"#00ff00"})
               //   .css("position",{x:-300,y:300})
                //  .css("opacity",{opacity:0})
                //  .html("add",{string:"av2"});
              //spider("av2").scrollanim("movex");
          }else{
              spider("youtube").html("ajax",{url:"youtube.txt"});
              spider("bookmarks").html("ajax",{url:"bookmarks.txt"});
          }
         spider("").tool("deleteCookie",{name:"website"}).tool("createCookie",{name:"website", value:"Welcome", expires:new Date(new Date().getTime() + 10000)});
         spider("browser_info").html("add",{str:spider("").tool("getCookie",{name:"website"})});
    }
);
