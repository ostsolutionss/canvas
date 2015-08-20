
/*-----------------------------------------------------
 * POPUP OPTION
 *-----------------------------------------------------*/

$.fn.popupMaya = function (option, callback) {
    var _this = $(this);
    var defaults = {
        main: "body",
        transparent: false,
        url: "",
        par: "",
        val: "",
        effStart: "top",
        effEnd: "top",
        time: 1000,
        width: 1024,
        height: '',
        position: 'top',
        subEleHeight: '',
        getData: false,
        run: false
    };
    option = $.extend(defaults, option);
    var classEff = "";
    var paddingTop = "";
    var getdata = '';
    if (option.run) {
        paddingTop = positionEle(option.position);
        classEff = effStart(option.effStart);
        popupShow();
    } else {
        _this.click(function () {
            paddingTop = positionEle(option.position);
            classEff = effStart(option.effStart);
            if (option.getData) {
                option.val = $(this).attr('data-par');
                option.par = "d=" + option.val;
            }
            popupShow();
        });
    }
    function popupShow() {
        preloadPopup();
        var _class = "popupMaya " + (!defaults.transparent ? "transparent" : "");
        var ele = $('<div>').addClass(_class);
        var eleData = $('<div>')
                .addClass(classEff + " popupMaya-data transition1s")
                .css({width: option.width, height: option.height, 'padding-top': paddingTop});
        ele.appendTo(option.main);
        eleData.appendTo(ele);
        $.get(getDataUrl(), function (data) {
            preloadPopupHide();
            eleData.html(data);
            eleData.removeClass(classEff);

            /*------------------------------------
             * close
             *-----------------------------------*/
            $('.popupMaya').delegate('.btnClose', 'click', function () {
                var _this = $(this);
                var popupMain = _this.parents('.popupMaya');
                popupMain.find('.popupMaya-data').addClass(classEff);
                setTimeout(function () {
                    popupMain.fadeOut(function () {
                        setTimeout(function () {
                            popupMain.remove();
                        }, option.time / 2);
                    });
                }, option.time / 2);
            });
            if (callback) {
                callback(option);
            }
            function preloadPopupHide() {
                var tag = $("#preloadPopup");
                setTimeout(function () {
                    tag.css({width: '100%'});
                }, 500);
            }
            $(document).Language();
        });
    }
    $(window).resize(function () {
        /****/
    });
    function effStart(e) {
        var classEff = "";
        switch (e) {
            case "left":
                classEff = "effLeft";
                break;
            case "right":
                classEff = "effRight";
                break;
            case "top":
                classEff = "effTop";
                break;
            case "bottom":
                classEff = "effBottom";
                break;
            case "fadeIn":
                classEff = "effFadeIn";
                break;
            case "fadeOut":
                classEff = "effFadeOut";
                break;
        }
        return classEff;
    }
    function positionEle(e) {
        var winH = $(window).height();
        var padding = '';
        if (e === "middle") {
            padding = (winH - option.subEleHeight) / 2;
        } else if (e === "top") {
            padding = 0;
        } else {
            padding = e;
        }
        return padding;
    }
    function getDataUrl() {
        var data = option.url;
        if (option.par) {
            data += "?" + option.par;
        }
        return data;
    }
    function preloadPopup() {
        var tag = $("#preloadPopup");
        tag.remove();

        /*-------------------------------------------
         * createTag preload popup
         *------------------------------------------*/
        var ele = $('<div>').attr('id', 'preloadPopup').addClass('transition3s');//.css({width: '100%'});
        $('body').append(ele);
        setTimeout(function () {
            ele.css({width: '70%'});
        }, 500);
    }
};

