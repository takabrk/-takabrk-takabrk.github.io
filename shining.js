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
        spider("anim8").css("opacity",{opacity:0}).scrollanim("fadein");
        spider("anim10").css("opacity",{opacity:0}).scrollanim("fadein");
        spider("anim11").css("opacity",{opacity:0}).scrollanim("fadein");
        spider("anim12").css("opacity",{opacity:0}).scrollanim("fadein");
        spider("anim13").css("opacity",{opacity:0}).scrollanim("fadein");
        spider("anim14").css("opacity",{opacity:0}).scrollanim("fadein");
        spider("anim15").css("opacity",{opacity:0}).scrollanim("fadein");
        spider("youtube").css("opacity",{opacity:0}).scrollanim("fadein").html("ajax",{url:"youtube.txt"});
        spider("bookmarks").css("opacity",{opacity:0}).scrollanim("fadein").html("ajax",{url:"bookmarks.txt"});
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
        spider("browser_info").css("font",{size:"10pt",fontcolor:"#ffffff"})
                         .info("date")
                         .info("browser")
                         .info("screen")
                         .matrixEffect();
          }else{
              spider("youtube").html("ajax",{url:"youtube.txt"});
              spider("bookmarks").html("ajax",{url:"bookmarks.txt"});
          }
         spider("").tool("deleteCookie",{name:"website"}).tool("createCookie",{name:"website", value:"Welcome", expires:new Date(new Date().getTime() + 10000)});
         spider("browser_info").html("add",{str:spider("").tool("getCookie",{name:"website"})});
    }
);
