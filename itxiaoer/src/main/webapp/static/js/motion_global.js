$(document).ready(function () {
  var body = $('body');
  var isSidebarVisible = true;
  var sidebarToggle = $('.sidebar-toggle');
  var sidebarToggleLine1st = $('.sidebar-toggle-line-first');
  var sidebarToggleLine2nd = $('.sidebar-toggle-line-middle');
  var sidebarToggleLine3rd = $('.sidebar-toggle-line-last');
  var sidebar = $('.sidebar');

  var SIDEBAR_WIDTH = '30%';
  var SIDEBAR_DISPLAY_DURATION = 300;

  var sidebarToggleLineStatusInit = {width: '100%', opacity: 1, left: 0, rotateZ: 0, top: 0};

  var sidebarToggleLine1stStatusInit = sidebarToggleLineStatusInit;
  var sidebarToggleLine1stStatusArrow = {width: '50%', rotateZ: '-45deg', top: '2px'};
  var sidebarToggleLine1stStatusClose = {width: '100%', rotateZ: '-45deg', top: '5px'};

  var sidebarToggleLine2ndStatusInit = sidebarToggleLineStatusInit;
  var sidebarToggleLine2ndStatusArrow = {width: '90%'};
  var sidebarToggleLine2ndStatusClose = {opacity: 0};

  var sidebarToggleLine3rdStatusInit = sidebarToggleLineStatusInit;
  var sidebarToggleLine3rdStatusArrow = {width: '50%', rotateZ: '45deg', top: '-2px'};
  var sidebarToggleLine3rdStatusClose = {width: '100%', rotateZ: '45deg', top: '-5px'};

  sidebarToggleMotion();
  sidebarShowMotion();
  //add motion effect to toc
  $('.sidebar-nav-toc') && $('.post-toc-wrap').addClass('motion-element');


  //当前选择的是目录列表时添加 class 'motion-element'
  sidebar.bind('click', function(e){
    if(!!$('.sidebar-nav-toc') && e.target == $('.sidebar-nav-toc')[0]){
      $('.post-toc-wrap').addClass('motion-element');
    }});

  document.onselectstart = function(e) {
    if((e.target == sidebarToggle[0]) || (e.target == $('.sidebar-toggle-line-wrap')[0]) || (e.target == sidebarToggleLine1st[0]) || (e.target == sidebarToggleLine2nd[0]) || (e.target == sidebarToggleLine3rd[0])){
      e.preventDefault();
    }
  };

  $(document)
    .on('sidebar.isShowing', function () {
      isDesktop() && body.velocity('stop').velocity(
        {paddingRight: SIDEBAR_WIDTH},
        SIDEBAR_DISPLAY_DURATION
      );
    })
    .on('sidebar.isHiding', function () {});

  function sidebarShowMotion () {
	$(".content-wrapper").css("marginLeft","30%");
    sidebarToggleLine1st.velocity('stop').velocity(sidebarToggleLine1stStatusClose);
    sidebarToggleLine2nd.velocity('stop').velocity(sidebarToggleLine2ndStatusClose);
    sidebarToggleLine3rd.velocity('stop').velocity(sidebarToggleLine3rdStatusClose);

    //添加 “.velocity('stop')” 用以中止动画
    sidebar.velocity('stop').velocity({width: SIDEBAR_WIDTH}, {
      display: 'block',
      duration: SIDEBAR_DISPLAY_DURATION,
      //将 sidebar 内容动画效果函数移动到这里
      begin: function(e) {
        sidebarContentMotion();
      },
      complete: function () {
        sidebar.addClass('sidebar-active');
        sidebar.trigger('sidebar.didShow');
      }
    });
    sidebar.trigger('sidebar.isShowing');
	$(".content-wrapper").velocity({width: "70%"});
  }

  function sidebarHideMotion () {
	$(".content-wrapper").css("marginLeft","0");
    //添加 “.velocity('stop')” 用以中止动画
    isDesktop() && body.velocity('stop').velocity({paddingRight: 0});
    // sidebar 内容动画中止和隐藏
    $('.sidebar .motion-element').velocity('stop').css('display','none');;
    // sidebar 动画中止和隐藏
    sidebar.velocity('stop').velocity({width: 0}, {display: 'none'});

    sidebarToggleLine1st.velocity('stop').velocity(sidebarToggleLine1stStatusInit);
    sidebarToggleLine2nd.velocity('stop').velocity(sidebarToggleLine2ndStatusInit);
    sidebarToggleLine3rd.velocity('stop').velocity(sidebarToggleLine3rdStatusInit);

    sidebar.removeClass('sidebar-active');
    sidebar.trigger('sidebar.isHiding');
	$(".content-wrapper").velocity({width: "100%"});
  }

  function sidebarContentMotion () {
    $('.sidebar .motion-element')
      .velocity('transition.slideRightIn',{
        stagger: 50,
        drag: true,
        complete: function () {
          sidebar.trigger('sidebar.motion.complete');
        }
      }
    );
  }

  function postsListMotion () {
    var postMotionOptions = window.postMotionOptions || {stagger: 300, drag: true};
    $('.post').velocity('transition.slideDownIn', postMotionOptions);
  }

  function sidebarToggleMotion () {
    sidebarToggle.on('click', function () {
      isSidebarVisible ? sidebarHideMotion() : sidebarShowMotion();
      isSidebarVisible = !isSidebarVisible;
    });

    sidebarToggle.hover(function () {
      if (isSidebarVisible) {return}
      sidebarToggleLine1st.velocity('stop').velocity(sidebarToggleLine1stStatusArrow);
      sidebarToggleLine2nd.velocity('stop').velocity(sidebarToggleLine2ndStatusArrow);
      sidebarToggleLine3rd.velocity('stop').velocity(sidebarToggleLine3rdStatusArrow);
    }, function () {
      if (isSidebarVisible) {return}
      sidebarToggleLine1st.velocity('stop').velocity(sidebarToggleLine1stStatusInit);
      sidebarToggleLine2nd.velocity('stop').velocity(sidebarToggleLine2ndStatusInit);
      sidebarToggleLine3rd.velocity('stop').velocity(sidebarToggleLine3rdStatusInit);
    });
  }
});
