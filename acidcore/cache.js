var cache = window.applicationCache;
cache.addEventListener("updaterready",function(){
    if(confirm("アプリケーションの新しいデータに更新可能です。更新しますか？"){
        cache.swapCache();
        location.reload();
     }
});
if(navigator.onLine){
    cache.update();
}