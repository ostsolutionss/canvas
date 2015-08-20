$(document).ready(function () {
    /*PROCESS AND EVENT DESIGN 3D */
    processDesignObj.view.event('.buttonView');
    processDesignObj.view.eventSwitchStyleDesign('#option-view-style li', processDesignObj);
    processDesignObj.items.event(".menuS-list:visible li");
    processDesignObj.zoomFabric('.zoom-fabric');
    processDesignObj.monogram.keypress('#input-monogram-text');

    /*PROCESS MENU AND BUTTON [MENU MAIN | SUBMENU MAIN | BUTTON NEXT , BACK]*/
    processMenuObj.eventMenuMain('#menuMain li:not(.subMenuMain li)');
    processMenuObj.eventSubMenuMain('#subMenu ul li,#subMenu-contrast li');
    processMenuObj.eventButtonStep(".buttonStep-Layout div,.btnBackMeasurements");
    processMenuObj.eventMenu3DPrDesign();
    processMenuObj.eventMeasurementTab(".tab-measurement-detail .tab, .measurement-menu-tab > div");

    processDesignObj.event.buttonViewAll('#buttonViewAllFabric,.buttonViewAllFabric');

    /*PROCESS CALL EVENT INPUT [CHECK BOX | SELECT BOX]*/
    processDesignObj.optionInput.checkboxMenuL('#menuL input[type="checkbox"]');
    processDesignObj.optionInput.selectBoxPocket('#menu-l-packetCount');

    $('#menu-l :checkbox').prop('checked', false); /*re set all checkbox for design*/
    $(':input[type="text"]').val(''); /*re set all checkbox for design*/
    $('#btnDesignIdea').popupMaya({url: "elements/designIdea/design-idea.php", effStart: "right", width: "100%", height: $(window).height()}, function () {
        new $.designIdea();
    });

    /*SET WINDOWS BODY VIEW*/
    mainObj.call();
});
var mainObj = {
    call: function () {
        this.menuHeight();
        this.bodyHeight();
    },
    menuHeight: function () {
        /*set height menu*/
        var winHight = $(window).height();
        if (winHight < 785) {
            winHight = 785;
        }
        $('#menu').css('height', winHight + 80);
        $('.tab-main').css('height', winHight + 80);
        $(window).resize(function () {
            $('#menu').css('height', winHight + 80);
            $('.tab-main').css('height', winHight + 80);
        });
    },
    bodyHeight: function () {
        set();
        var body = $('body');
        $(window).resize(function () {
            set();
        });
        function set() {
            var winHeight = $(window).height();
            var body = $('body');
            if (body.scrollHeight > body.height()) {
                body.css({height: "auto"});
            } else {
                body.css({height: winHeight});
            }
        }
    }
};
var processMenuObj = {
    call: function () {
        // processMenuS.call();
        this.menuL();
        processDesignObj.view.toggleView();
        processDesignObj.condition.menu();
    },
    eventButtonStep: function (ele) {
        var self = this;
        $(ele).click(function () {
            if (self.condition.check(self)) {
                return false;
            }
            var button = $(this).data('value');
            var menuMain = $('#menuMain ul li.active');
            var menuSubMain = $('#subMenu ul.subMenu-active li.active');

            var menuMainId = menuMain.attr('id');
            var menuSubMainId = menuSubMain.attr('id');

            var classMainActive = "active";
            var classSubMainActive = "active";

            switch (button) {
                case "back":
                    if (menuMainId === "menu-fabric") {
                        return false;
                    }
                    if (menuMain.is(':first-child')) {
                        return false;
                    } else {
                        /*EVENT SUB MENU*/
                        if (menuSubMain.is(':first-child')) {
                            menuMain.removeClass(classMainActive).prev().click();/*menu prev*/
                            if ((designObject.menuMain !== "fabric")) {
                                $("#subMenu ul.subMenu-active").find("li:last-child").click();
                            }
                        } else {
                            if (menuSubMain.prev().is(':visible')) {
                                menuSubMain.removeClass(classSubMainActive).prev().click();/*sub menu prev*/
                            } else {
                                menuSubMain.removeClass(classSubMainActive).prev().prev().click();/*sub menu prev*/
                            }
                        }

                        /*Evemt click btn Back Measurements*/
                        var proStatus = iTailorObject.design3DPro.status;
                        var eleMain = $('.tab-measurement-detail').is(':visible');
                        if (menuMainId === "menu-measurement" || proStatus === "true") {
                            if (proStatus === "true") {
                                if (eleMain) {
                                    $('#menuMain').find('.active').removeClass('active');
                                    designObject.menuMain = "fabric";
                                }
                                $('#buttonPremium').click();/*Event Click Button Call Function [ processDesign.eventMenu3DPrDesign() ]*/
                            } else {
                                if (!eleMain) {
                                    var ele = $('#tab-measurement-box >li')
                                    ele.hide();
                                    ele.eq(0).show();
                                } else {
                                    menuMain.removeClass(classMainActive).prev().click();/*menu prev*/
                                    $("#subMenu ul.subMenu-active").find("li:last-child").click();
                                }
                            }
                        }
                    }
                    break;
                case "next":
                    /*CONDITION MENU FABRIC NEXT STEP*/
                    if (menuMainId === "menu-fabric") {
                        menuMain.removeClass(classMainActive).next().click();/*menu next*/
                        return false;
                    }
                    if (menuMain.is(':last-child')) {
                        return false;
                    } else {
                        /*EVENT SUB MENU*/
                        if (menuSubMain.is(':last-child')) {
                            menuMain.removeClass(classMainActive).next().click();/*menu next*/
                        } else {
                            if (menuSubMain.next().is(':visible')) {
                                menuSubMain.removeClass(classSubMainActive).next().click();/*sub menu next*/
                            } else {
                                menuSubMain.removeClass(classSubMainActive).next().next().click();/*sub menu next*/
                            }
                        }
                    }
                    break;
            }
        });
    },
    eventMenuMain: function (ele) {
        var self = this;
        $(ele).click(function () {
            if (self.condition.check(self, this)) {
                return false;
            }
            var _this = $(this);
            var _id = _this.attr('id').replace('menu-', '');
            var _class = "active";
            var main = $(this).parent();
            if (!_this.hasClass(_class)) {
                main.find('.' + _class).removeClass(_class);
                _this.addClass(_class);
                designObject.menuMain = _id;
                self.slideMenuMain();
            }
        });
    },
    eventSubMenuMain: function (ele) {
        var self = this;
        $(ele).click(function () {
            if (self.condition.check(self, false)) {
                return false;
            }
            var _this = $(this);
            var id = "";
            var _class = "active";
            var main = _this.parent();
            main.find('.' + _class).removeClass(_class);
            _this.addClass(_class);
            id = _this.attr('id').replace('subMenu-list-', '');

            if (designObject.menuMain === "fabric" && id !== "buttonViewAllFabric" && id !== "buttonPremium") {
                processGetVariable.category(id);
                id = "fabric";
            }
            designObject.subMenuMain = id;

            /*CONDITION HIDE MAP DESIGN*/
            /* if (designObject.subMenuMain !== "advanced") {
                processProDesign._map(false);
            } */
            self.call();
        });
    },
    slideMenuMain: function () {
        var self = this;
        var main = $('#menu #subMenu');
        var menuMain = designObject.menuMain;
        var subMenu = "";
        var _class = "subMenu-active";
        main.find('.' + _class).removeClass(_class + " transition05s ");

        subMenu = main.find('#subMenu-' + menuMain);
        if (menuMain === "fabric") {
            var id = "#subMenu-list-" + iTailorObject.fabricGroup;
            subMenu.addClass("transition05s");
            subMenu.addClass(_class).find(id).click();
        } else if (menuMain === "style" || menuMain === "contrast") {
            subMenu.addClass("transition05s");
            subMenu.addClass(_class).find('li:first').click();
        }
        self.conditionTab();
    },
    conditionTab: function () {
        var menuMain = designObject.menuMain;
        var subMenu = designObject.subMenuMain;
        var proStatus = iTailorObject.design3DPro.status;
        var container = $('#mainContainer');
        var menu = $('#menu');
        var menuL = $('#mainContainer-MainDesign');
        var menuS = $('#mainContainer-MenuS');
        var mainDesign = $('#mainContainer-Img3D');
        var tab = $('.mainContainer-Layout');
        tab.hide();
        if (proStatus === "true") {
            if (menuMain === "measurement") {
                var main = tab.eq(1);
                container.Animation({transition: 0});
                main.show();
                condition_measurement_tab();
            } else {
                var main = tab.eq(0);

                main.show();/*main design*/
                menuL.Animation({opacity: "0"});
                menuS.Animation({translateX: "-100%"});
                menu.Animation({translateX: "-100%"});

                setTimeout(function () {
                    menu.removeClass('w30').css({width: 0});
                    container.removeClass('w70').css({width: "100%"}).Animation({transition: 1});
                    mainDesign.Animation({translateX: "-50%"});
                }, 800);
            }
        } else {
            if (menuMain === "measurement") {
                var main = tab.eq(1);

                menu.removeClass('w30').css({width: ""}).Animation({translateX: 0});
                container.css({width: 860}).Animation({transition: 0});
                main.show();
                condition_measurement_tab();
            } else {
                var main = tab.eq(0);

                main.show();/*main design*/
                mainDesign.Animation({translateX: 0});
                menu.addClass('w30');
                container.addClass('w70').css({width: ""}).Animation({transition: 0});

                setTimeout(function () {
                    menu.Animation({translateX: 0});
                    menuL.Animation({opacity: "1"});
                    menuS.Animation({translateX: 0});
                }, 800);
            }
        }
        optionProDesign();
        function optionProDesign() {
            var buttonView = $('#mainContainer-option .buttonView');
            var buttonViewStyle = $('#mainContainer-option #option-view-style');
            var buttonViewStyleLast = buttonViewStyle.find('li:last');
            var txtProDesign = $('#mainPro-design .titleProDesign');
            var priceFont = $('#mainContainer-option-detail .price');

            /*view pro design*/
            if (proStatus === "true") {
                buttonView.hide();

                buttonViewStyleLast.show();
                priceFont.css({"font-size": "150%"});
                setTimeout(function () {
                    txtProDesign.Animation({transition: 2, translateY: "0%"});
                    buttonViewStyle.Animation({transition: 1, translateY: "-150%"});
                }, 1500);
            } else {
                buttonView.show();

                buttonViewStyleLast.hide();
                priceFont.css({"font-size": "100%"});
                buttonViewStyle.Animation({transition: 0, translateY: "0%"});
                txtProDesign.Animation({transition: 0, translateY: "-150%"});
            }
        }
        function condition_measurement_tab() {
            /*condition measurement*/
            var tabObject = designObject.subMenuMain;
            var tabMeasurement = $('#tab-measurement-box > li');
            tabMeasurement.hide();
            if (tabObject === "tab-body-size") {
                tabMeasurement.eq(1).show();
                var ele = tabMeasurement.eq(1).find('.typeInput').find('input:first').focus();

            } else if (tabObject === "tab-standard-size") {
                tabMeasurement.eq(2).show();
            } else {
                tabMeasurement.eq(0).show();
            }
        }
    },
    eventMeasurementTab: function (ele) {
        var self = this;
        $(ele).click(function () {
            var tab = $(this).attr('data-id');
            designObject.subMenuMain = tab;
            self.conditionTab();
        });
    },
    menuL: function () {
        var menuL = $('#menuL');
        var _class = "tab-menu-l-active";
        menuL.find('.' + _class).removeClass(_class).find('.detail-menuL-active').removeClass('detail-menuL-active');
        menuL.find('#menu-l-' + designObject.subMenuMain).addClass(_class);/*show element menu L*/
        clearTimeout(time);
        var time = setTimeout(function () {
            menuL.find('#menu-l-' + designObject.subMenuMain).find('.detail-menuL').addClass('detail-menuL-active');
        }, 500);
        /* if (designObject.subMenuMain) {
            processMenuL.call(designObject.subMenuMain);
        } */
    },
    eventMenu3DPrDesign: function () {
        var self = this;
        $('#buttonPremium,#button-toolber-3dpro').click(function () {
            processDesignObj.defaults.viewStyleDesign = "advanced";/*Status Design 3d Pro*/
            processProDesign._setDefaults();
            processMenuObj.conditionTab();
            window.history.pushState(null, null, '?Professional3D');
        });
    },
    log: {
        visitProDesign: false,
        cuserMenu: "",
        menuPrev: false/*use event Button Step*/
    },
    condition: {
        check: function (self, _this) {
            var status = false;
            if (_this) {
                self.log.cuserMenu = _this;
            }
            /*condition monogram empty*/
            if (this.monogram()) {
                status = true;
            }


            return status;
        },
        monogram: function () {
            var status = false;
            if ((iTailorObject.monogram).toLowerCase() !== "no-mono" && !iTailorObject.monogramTxt) {
                status = true;
                $("#menu").popupMaya({url: "../iTailor-data/elements/popup2/monogram.php", position: "middle", subEleHeight: 300, effStart: "top", run: true});
            }
            return status;
        }
    }

};

/*------------------------------------------------------
 * PROCESS DESIGN
 *-----------------------------------------------------*/

var processDesignObj = {
    defaults: {
        view: "front",
        viewStyleDesign: 'normal' /*normal | advanced*/
    },
    design: function (_iTailorObject) {
        var salf = this;
        var viewVisibleStr = '';
        var viewHiddenStr = '';

        salf.view.toggleItemViewAdvanced();
        salf.condition.setDefaultsValue();
        salf.price.set();

        var objiTailor = _iTailorObject ? _iTailorObject : iTailorObject;/*Obj data Design*/
        var viewVisible = $('#mainContainer-Img3D .design-3D-view-tab:visible').attr('id');
        var viewHidden = $('#mainContainer-Img3D .design-3D-view-tab:hidden').attr('id');
        var length = $('#mainContainer-Img3D .design-3D-view-tab:hidden').length;
        var proStatusDesign = salf.defaults.viewStyleDesign === "normal" ? false : true;/*Status view main design [ normal | advanced ]*/

        if (length >= 2) {
            viewVisible = "design-3D-front";
            viewHidden = "design-3D-back";
        }

        /*-----------------------------------------------
         * Condition conver View [ front | back ]
         *-----------------------------------------------*/

        if (viewVisible === "design-3D-front") {
            viewVisibleStr = "front";
        } else {
            viewVisibleStr = "back";
        }

        if (viewHidden === "design-3D-back") {
            viewHiddenStr = "back";
        } else {
            viewHiddenStr = "front";
        }

        /*CHANG FABRIC MENU L BEFORE CALL FUNCRION DESIGN MAIN*/
        var menu = designObject.menuMain;
        if (menu === "fabric" && iTailorObject.design3DPro.status === "false") {
            processMenuL.call("fabric");
        }
        /*CALL DESIGN FRONT | BACK*/
        processShirtDesign.call({iTailorObject: objiTailor, view: viewVisibleStr, preload: true, proStatusDesign: proStatusDesign}, function (dataURL) {
            salf.appendImageMain({view: viewVisible, url: dataURL});

            processShirtDesign.call({iTailorObject: objiTailor, view: viewHiddenStr, preload: false, proStatusDesign: proStatusDesign}, function (dataURL) {
                salf.appendImageMain({view: viewHidden, url: dataURL});

                /*Call function Design Menu L*/
                if (iTailorObject.design3DPro.status === "true") {
                    processProDesign._callMenu();
                } else {
                    var _menuId = $('#menuL li:visible').attr('id');
                    if (_menuId) {
                        var menuId = _menuId.replace('menu-l-', "");
                        if (menuId !== "fabric") {
                            processMenuL.call(menuId);
                        }
                    }
                }
            });
            salf.monogram.set();
            salf.monogram.setDisplay();
        });
        salf.imageError();
//        debug();
    },
    appendImageMain: function (data) {
        var img = $('<img>').attr('src', data.url).css({display: 'none'});
        if (data.view === "design-3D-front") {
            $(img).load(function () {
                $(this).appendTo('#design-3D-front').fadeIn();
                var time = "";
                clearTimeout(time);
                var time = setTimeout(function () {
                    if ($('#design-3D-front img').length > 1) {
                        $('#design-3D-front img:not(:last)').fadeOut(200, function () {
                            $('#design-3D-front img:not(:last)').remove();
                        });
                    }
                }, 500);
            });
        } else {

            $(img).load(function () {
                $(this).appendTo('#design-3D-back').stop(true, true).fadeIn(1000);
                setTimeout(function () {
                    if ($('#design-3D-back img').length > 1) {
                        $('#design-3D-back img:first').fadeOut(1000, function () {
                            $('#design-3D-back img:not(:last)').remove();
                        });
                    }
                }, 2000);
            });
        }
    },
    preloadMainDesign: {
        defaults: {percent: 0, startCanvas: 0, width: 0, height: 0, gauge: ""},
        setEle: function (ele) {
            var defaults = this.defaults;
            var canvasGauge = document.getElementById(ele);
            var gauge = this.defaults.gauge = canvasGauge.getContext('2d');
            var W = this.defaults.width = canvasGauge.width;
            var H = this.defaults.height = canvasGauge.height;
            this.defaults.percent = 0;
            this.defaults.startCanvas = 0;
            this.drawCanvasBase(gauge, W, H);
            $('#' + ele).stop(true, true).fadeIn();
        },
        call: function (loaded, length) {
            var defaults = this.defaults;
            defaults.percent = Math.round(((loaded + 1) * 100) / length);
            defaults.startCanvas = Math.round((((loaded + 1) * 100) / length) * (2 * Math.PI / 100));
            this.initCanvasStaff(defaults.gauge, "rgba(255,255,255,0.5)", "#FFF", defaults.width, defaults.height);
            this.status();
        },
        status: function () {
            var defaults = this.defaults;
            var percent = defaults.percent;
            var ele = defaults.gauge;
            if (percent >= 100) {
                $(ele['canvas']).stop(true, true).fadeOut();
            }
        },
        drawCanvasBase: function (gauge, W, H) {
            var defaults = this.defaults;
            gauge.clearRect(0, 0, W, H);
            gauge.beginPath();
            gauge.strokeStyle = "transparent";
            gauge.lineWidth = 4;
            gauge.arc(W / 2, H / 2, 30, 0, Math.PI * 2, false);
            gauge.stroke();
        },
        initCanvasStaff: function (gauge, color_gauge, color_font, width, height) {
            var defaults = this.defaults;
            defaults.startCanvas = defaults.startCanvas + (Math.PI / 180);
            this.drawCanvasStaff(gauge, defaults.startCanvas, color_gauge, color_font, width, height);
            var end1 = this.drawCanvasStaff(gauge, defaults.startCanvas, color_gauge, color_font, width, height);
        },
        drawCanvasStaff: function (gauge, arcEndStaff, color_gauge, color_font, W, H) {
            var defaults = this.defaults;
            gauge.clearRect(0, 0, W, H);
            gauge.beginPath();
            gauge.strokeStyle = color_gauge;
            gauge.lineWidth = 4;
            gauge.arc(W / 2, H / 2, 30, 0 - 90 * Math.PI / 180, (arcEndStaff + 1) - 90 * Math.PI / 180, false);/*edit*/
            gauge.stroke();

            gauge.fillStyle = color_font;
            gauge.font = "14px Century Gothic";
            var val = Math.floor((arcEndStaff / (2 * Math.PI)) * 100);
            if (val >= 95)/*edit*/
                val = 100;
            var text = val + "%";
            var text_width = gauge.measureText(text).width;
            gauge.fillText(text, W / 2 - text_width / 2, H / 2 + 5);

            return arcEndStaff;
        }
    },
    zoomFabric: function (ele) {
        $(ele).click(function () {
            var i = iTailorObject.fabric;
            if ((iTailorObject.fabricType).toUpperCase() === "PROMOTION") {
                $(this).popupMaya({url: "elements/popup/zoom-fabric-promotion.php?id=" + i, position: "middle", transparent: false, run: true, width: 961, subEleHeight: 600});
            } else {
                $(this).popupMaya({url: "elements/popup/zoom-fabric.php?id=" + i, position: "middle", transparent: true, run: true, width: 500, subEleHeight: 500});
            }
        });
    },
    monogram: {
        keypress: function (ele) {
            var self = this;
            $(ele).on('keyup keydown', function () {
                var val = $(this).val();
                var regex = /[a-zA-Z0-9. ]$/;
                if (val) {
                    if (regex.test(val)) {
                        iTailorObject.monogramTxt = val;
                    }
                } else {
                    iTailorObject.monogramTxt = "";
                }
                $(this).val(iTailorObject.monogramTxt);
                self.setDisplay();
            });
        },
        setDisplay: function () {
            var self = processDesignObj;
            var view = self.defaults.view;
            var viewStyle = self.defaults.viewStyleDesign;
            var pocation = iTailorObject.monogram;
            var color = iTailorObject.monogramCode;
            var font = iTailorObject.monogramStyle;
            var txt = iTailorObject.monogramTxt;
            var sleeve = iTailorObject.sleeve;
            var minMonogram = $('#monogramMain div , #menu-l-monogram #menu-l-monogram-txt');
            var frontStyle = "";
            minMonogram.removeAttr('class');
            switch (font) {
                case "Regular":
                    frontStyle = "ProximaNovaA-Light";
                    break;
                case "Italic":
                    frontStyle = "Mtcorsva";
                    break;
                case "Diamond":
                    frontStyle = "ProximaNovaA-Light";
                    break;
            }
            minMonogram.show();
            if (pocation === "No-Mono") {
                minMonogram.text("");
            } else {
                minMonogram.css({color: color, "font-family": frontStyle}).text(txt).addClass(pocation);
                if ((sleeve === "Long-Sleeve-Roll-Up") && (pocation === "Cuff")) {
                    minMonogram.hide();
                }
                if (view === "front" && pocation === "Collar" && viewStyle === "advanced") {
                    minMonogram.hide();
                }
                if (view === "front" && pocation === "CollarBack") {
                    minMonogram.hide();
                }
                if (view === "back" && pocation !== "CollarBack") {
                    minMonogram.hide();
                }
            }

        },
        set: function () {
            var monoP = $('.monogram-effect p ,.monogram-effect p span');
            var monoTagColor = $('.monogram-effect #menu-l-monogram-color');
            var textFreeMonogram = $('.text-free-monogram');
            var monoTabSlie = $('.monogramTabSlide');

            /*re set monogram sleeve == "Short-Sleeve"*/
            var monogram = (iTailorObject.monogram).toLowerCase();
            var sleeve = (iTailorObject.sleeve).toLowerCase();
            var packet = (iTailorObject.packet).toLowerCase();

            if ((monogram === "no-mono") || (sleeve === "short-sleeve" && monogram === "cuff") ||
                    (packet === "no-pocket" && monogram === "pocket") || (packet !== "no-pocket" && monogram === "chest")) {
                setMonogram();
            }

            /* -------------------------------
             * SET MENU L
             * -------------------------------*/
            if (iTailorObject.monogram === "No-Mono") {
                setMonogram();
                monoTabSlie.Animation({translateX: "-100%"});
                monoP.css('color', '#807e7c');
                monoTagColor.stop().fadeOut();
            } else {
                monoTabSlie.Animation({translateX: 0});
                monoP.css('color', '#8FD6F3');
                monoTagColor.fadeIn();
            }

            if ((iTailorObject.fabricType).toUpperCase() === "PROMOTION") {
                textFreeMonogram.css({opacity: 0});
            } else {
                textFreeMonogram.css({opacity: 1});
            }

            /*Value set Monogram --> NO Monogram*/
            function setMonogram() {
                processGetVariable.monogram("No-Mono");
                iTailorObject.monogramTxt = "";
                $('#input-monogram-text').val('');
            }
        },
        validation: function () {
            /*Alert Enter Desired Monogram/Initials*/
            if (iTailorObject.monogram !== "No-Mono" && iTailorObject.monogramTxt.length <= 0) {
                messages({file: "monogram"});
                $(document).popupMaya({url: "../iTailor-data/elements/popup2/monogram.php", position: "middle", subEleHeight: 300, effStart: "top", run: true});
                $(document).stopPropagation();
                return false;
            }
        }
    },
    imageError: function () {
        $('img').each(function () {
            $(this).error(function () {
                $(this).attr('src', '../iTailor-data/webroot/img/missing.png');
            });
        });
    },
    view: {
        event: function (ele) {
            var self = this;
            $(ele).click(function () {
                var view = $('#mainContainer-Img3D li.design-3D-view-tab:hidden').attr('id');
                self.toggleView(view);
                processDesignObj.monogram.setDisplay();
                processProDesign._map(true, null, 100);
            });
        },
        toggleView: function (_view) {
            var view = $('#mainContainer-Img3D .design-3D-view-tab');
            var boxViewStyle = $('#option-view-style li:last-child img');
            var front = $('#design-3D-front');
            var back = $('#design-3D-back');
            var strTxt = "";
            var viewStr = "";

            view.hide();
            if (_view === "design-3D-back" || (!_view ? designObject.subMenuMain === "back" : false)) {
                if (back.is(':hidden')) {
                    back.show();
                    boxViewStyle.attr({src: "webroot/img/icon/view-advanced.png"});
                    strTxt = publicObject.languageObj["front-view"];
                    viewStr = "back";
                }
            } else {
                if (front.is(':hidden')) {
                    front.show();
                    boxViewStyle.attr({src: "webroot/img/icon/view-back.png"});
                    viewStr = "front";
                   // strTxt = publicObject.languageObj["back-view"];
                }
            }
            processDesignObj.defaults.view = viewStr;
            var viewStr = (viewStr === "front") ? "back" : "front";
            $('.buttonView').text(strTxt).attr('data-lang', viewStr + '-view');
            this.effGrow();
        },
        eventSwitchStyleDesign: function (ele, self) {
            var front = $('#design-3D-front');
            var back = $('#design-3D-back');

            $(ele).click(function () {
                var _this = $(this);
                var sty = _this.attr('data-viewStyle');

                if (sty === "toggleView") {
                    $('#mainContainer-option .viewDesign').click();
                } else {
                    if (front.is(':hidden')) {
                        $('#mainContainer-option .viewDesign').click();
                    }
                    processDesignObj.defaults.viewStyleDesign = sty;

                    /*Condition get valuable obj Design*/
                    if ($('#mainContainer-3dPro').is(':visible')) {
                        self.design(processProDesign.defaults.logDesign);
                    } else {
                        self.design();
                    }
                }

            });
        },
        toggleItemViewAdvanced: function () {
            var collar = iTailorObject.collar;
            var ele = $('#option-view-style [data-viewstyle="advanced"]');
            var collarArr = ['CL-8', 'CL-11', 'CL-12', 'CL-13', 'CL-14'];   /*Display Collar Advanced*/

            if (collarArr.indexOf(collar) > -1) {
                ele.css({opacity: 0});
            } else {
                ele.css({opacity: 1});
            }
            this.effGrow();
        },
        effGrow: function () {
            var viewStyle = iTailorObject.design3DPro.status;
            var view = processDesignObj.defaults.viewStyleDesign;
            var _class = "grow";
            var main = $('#option-view-style');

            main.find("." + _class).removeClass(_class);
            if (viewStyle === "true") {
                main.find('li:last').addClass(_class);
            } else {
                if (view === "normal") {
                    main.find('li').eq(0).addClass(_class);
                } else {
                    main.find('li').eq(1).addClass(_class);
                }
            }
        }
    },
    condition: {
        setDefaultsCheckBox: function () {
            $('#menuL input[type="checkbox"]').each(function () {
                var id = $(this).attr('id').replace('menu-l-checkbox-', '');
                if (iTailorObject[id] === "true") {
                    $(this).prop('checked', true);
                } else {
                    $(this).prop('checked', false);
                }
            });
            $('#input-monogram-text').val(iTailorObject.monogramTxt);
        },
        setDefaultsValue: function () {
            var obj = iTailorObject;
            var objPro = iTailorObject.design3DPro;

            if (obj.front !== "Box") {
                obj.frontBoxOutSide = "false";

            }

            /*Monogram*/
            if (obj.monogram === "No-Mono") {
                obj.monogramTxt = "";
            }

            if (obj.back === "Side" || obj.back === "Center") {
                obj.dart = "false";
            }

            if (obj.collar === "CL-12") {
                objPro.collarStiching = "false";
            }

            var collarNoStayArr = ["CL-7", "CL-9", "CL-10", "CL-11", "CL-12", "CL-13", "CL-14", "CL-16"];
            if (collarNoStayArr.indexOf(obj.collar) > -1) {
                obj.collarStay = "false";
            }
            if (obj.back !== "Box") {
                obj.backBoxOutSide = "false";
            }
            /*------------------------------------------------
             * 3D PRO DESIGNER
             *------------------------------------------------*/

            /*contrast*/
            if (objPro.collarIn === "true" || objPro.cuffIn === "true") {
                obj.CollarCuffInside = "true";
            } else {
                obj.CollarCuffInside = "false";
            }
            if (objPro.collarOut === "true" || objPro.cuffOut === "true") {
                obj.CollarCuffOutside = "true";
            } else {
                obj.CollarCuffOutside = "false";
            }

            if (obj.shoulder === "false") {
                objPro.shoulderContrast = "false";
            }
            if (obj.front !== "Box") {
                objPro.placketTrimming = "false";
                objPro.frontPlacketSize = "Normal";
                objPro.placketAngled = "false";
            }

            /*Pocket*/
            if (((obj.packet).toLowerCase()) === "no-pocket") {
                objPro.pocketFlap = "false";
                objPro.pocketMain = "false";
                objPro.pocketTrimming = "false";
                obj.packetCount = "1 pocket";
            }

            /*condition sleeve*/
            if (((obj.sleeve).toLowerCase()) === "short-sleeve") {

                /*cuff*/
                obj.cuff = "";
                obj.cuffName = "";
                obj.cuffButton = "";
                obj.cuffButtonStyle = "";
                obj.cuffSize = "";

                /*cuff pro*/
                objPro.cuff = "No-Style";
                objPro.cuffIn = "false";
                objPro.cuffOut = "false";
                objPro.cuffStiching = "false";

                /*Wristband*/
                objPro.wristband = "false";

                /*Elbow*/
                objPro.elbow = "false";
                objPro.elbowCoduroy = "false";
            }

            /*Arrow Sleeve*/
            if (((obj.sleeve).toLowerCase()) !== "long-sleeve-roll-up") {
                objPro.arrowSleeve = "false";
            }

            /*Elbow*/
            if (objPro.elbow === "false") {
                objPro.elbowCoduroy = "false";
            }
        },
        pocket: function () {
            /*re set pocket and show / hide select pocket*/
            var tag = $('#menu-l-pocket .option');
            if (iTailorObject.packet === "No-pocket") {
                tag.stop().fadeOut();
            } else {
                tag.stop().fadeIn();
                if (((iTailorObject.packetCount).toLowerCase()) === "2 pockets") {
                    $('#menu-l-packetCount').val("2 Pockets");
                }
            }
        },
        backStyle: function () {
            var checkbox = $('#menu-l-checkbox-dart');
            var main = checkbox.parent();
            if (iTailorObject.back === "Side" || iTailorObject.back === "Center") {
                main.fadeOut();
                checkbox.attr('checked', false);
            } else {
                main.fadeIn();
            }
        },
        menu: function () {
            var ele = $('#subMenu-list-cuff');
            if (iTailorObject.sleeve === "Short-Sleeve") {
                ele.hide();
            } else {
                ele.show();
            }

            /*SET NUMBER MENU STYLE*/
            var ele = $("#subMenu-style [data-run='number']:visible");
            ele.each(function (index) {
                $(this).text("2." + (index + 1));
            });
        },
        buttonAdvanced: function () {
            var btnCollar = $('[data-buttonstyle="collar"] ,#menu-l-cuff-size-str');
            var btnCuff = $('[data-buttonstyle="cuff"] ,#menu-l-collar-size-str');
            if (iTailorObject.collarSize) {
                btnCollar.show();
            } else {
                btnCollar.hide();
            }
            if (iTailorObject.cuffSize) {
                btnCuff.show();
            } else {
                btnCuff.hide();
            }
        },
        checkBox_frontBox_BackBox: function () {
            var frontBox = $('#menu-l-checkbox-frontBoxOutSide').parents('p');
            var backBox = $('#menu-l-checkbox-backBoxOutSide').parents('p');

            /*FrontBox*/
            if (iTailorObject.front === "Box") {
                frontBox.show();
            } else {
                frontBox.hide();
                $('#menu-l-checkbox-frontBoxOutSide').attr('checked', false);
            }

            /*BackBox*/
            if (iTailorObject.back === "Box") {
                backBox.show();
            } else {
                backBox.hide();
                $('#menu-l-checkbox-backBoxOutSide').attr('checked', false);
            }

        },
        checkStatus3DPro: function (log3DPro) {
            var defaults3DPro = pro3DObject();
            var logDesign = log3DPro['design3DPro'];
            var arrCondition = ['button', 'buttonHole', 'buttonHoleStyle', 'contrast', 'contrastName', 'frontBoxOutSide', 'backBoxOutSide', 'monogramColor', 'monogramTxt', 'monogramCode', 'monogramHoleName', 'status'];
            var status = "false";
            if (logDesign) {
                for (var i in defaults3DPro) {
                    if ((arrCondition.indexOf(i) === -1)) {
                        if (defaults3DPro[i] !== logDesign[i]) {
                            status = "true";
                        }
                    }
                }
            }
            iTailorObject.design3DPro.status = status;
            return status;
        }
    },
    items: {
        call: function () {
            processDesignObj.condition.backStyle();
            processDesignObj.condition.menu();
            processDesignObj.design();
        },
        event: function (ele) {
            var self = this;
            $("#mainContainer #mainContainer-MenuS").delegate(ele, "click", function () {
                var $this = $(this);
                var id = $this.attr('id');
                var name = $this.attr('data-name');
                var main = $this.parents('ul').attr('data-main');
                if (iTailorObject[main] === id) {
                    return false;
                }
                self.getValue(main, id);
                self.check(main);
                self.call();
            });
        },
        getValue: function (style, id) {
            var getValue = processGetVariable;
            switch (style) {
                case "fabric":
                    getValue.fabricMain(id);

                    /*EVENT CLICK SUN MENU FABRIC AND/REMOVE CLASS*/
                    var _class = "active";
                    $('#subMenu').find('.' + _class).removeClass(_class);
                    $('#subMenu #subMenu-fabric').find('#subMenu-list-' + iTailorObject.fabricGroup).addClass(_class);
                    break;
                case "Stylesleeve":
                    processGetVariable.cuff("CU-1");
                    getValue.sleeve(id);
                    break;
                case "front":
                    getValue.front(id);

                    /*Event Toggle show / hide tag front box*/
                    processDesignObj.condition.checkBox_frontBox_BackBox();
                    break;
                case "back":
                    getValue.back(id);

                    /*Event Toggle show / hide tag back box*/
                    processDesignObj.condition.checkBox_frontBox_BackBox();
                    break;
                case "bottom":
                    getValue.bottom(id);
                    break;
                case "collar":
                    getValue.collar(id);
                    iTailorObject.design3DPro.collar = "No-Style";
                    break;
                case "pocket":
                    getValue.pocket(id);
                    break;
                case "cuff":
                    getValue.cuff(id);
                    iTailorObject.design3DPro.cuff = "No-Style";
                    break;
                    /*-------------------------------------
                     * contrast 
                     *-------------------------------------*/
                case "contrast":
                    getValue.contrast(id);
                    break;
                case "button":
                    getValue.button(id);
                    break;
                case "buttonHole":
                    var before = iTailorObject.buttonHole;
                    var after = id.replace("ButtonHole-", "");
                    getValue.buttonHole(after);
                    /*re name src*/
                    $('#menuS-Layout [data-main="buttonHoleStyle"] li').each(function () {
                        var _this = $(this).find('img').eq(1);
                        var src = _this.attr('src').replace(before, after);
                        _this.attr('src', src);
                    });
                    break;
                case "buttonHoleStyle":
                    getValue.buttonHoleStyle(id);
                    break;
                case "monogram":
                    getValue.monogram(id);
                    break;
                case "monogramColor":
                    var id = id.replace("MonoColor-", "");
                    getValue.monogramHole(id);
                    break;

                    /*-------------------------------------
                     * PRO DESIGN
                     *-------------------------------------*/
                case "sleeve":
                    iTailorObject.design3DPro.sleeve = id;
                    break;
                case "arrowSleeve":
                    iTailorObject.design3DPro.arrowSleeve = id;
                    break;
                case "placketTrimming":
                    iTailorObject.design3DPro.placketTrimming = id;
                    break;
                case "placketAngled":
                    iTailorObject.design3DPro.placketAngled = id;
                    break;
                case "frontPlacketSize":
                    iTailorObject.design3DPro.frontPlacketSize = id;
                    break;
                case "collarStyle":
                    iTailorObject.design3DPro.collar = id;
                    if (id !== "No-Style") {
                        processDesignObj.items.getValue('collarOut', 'true');
                    }
                    break;
                case "cuffStyle":
                    iTailorObject.design3DPro.cuff = id;
                    if (id !== "No-Style") {
                        processDesignObj.items.getValue('cuffOut', 'true');
                    }
                    break;
                case "cuffIn":
                    iTailorObject.design3DPro.cuffIn = id;
                    break;
                case "cuffOut":
                    iTailorObject.design3DPro.cuffOut = id;
                    if (id === "false") {
                        processDesignObj.items.getValue('cuffStyle', 'No-Style');
                    }
                    break;
                case "cuffStiching":
                    iTailorObject.design3DPro.cuffStiching = id;
                    break;
                case "collarIn":
                    iTailorObject.design3DPro.collarIn = id;
                    break;
                case "collarOut":
                    iTailorObject.design3DPro.collarOut = id;
                    if (id === "false") {
                        processDesignObj.items.getValue('collarStyle', 'No-Style');
                    }
                    break;
                case "collarBand":
                    iTailorObject.design3DPro.collarBand = id;
                    break;
                case "collarStiching":
                    iTailorObject.design3DPro.collarStiching = id;
                    break;
                case "stichingColor":
                    iTailorObject.design3DPro.stichingColor = id;
                    break;
                case "shoulderContrast":
                    iTailorObject.design3DPro.shoulderContrast = id;
                    break;
                case "pocketFlap":
                    iTailorObject.design3DPro.pocketFlap = id;
                    break;
                case "pocketMain":
                    iTailorObject.design3DPro.pocketMain = id;
                    break;
                case "pocketTrimming":
                    iTailorObject.design3DPro.pocketTrimming = id;
                    break;
                case "arrowSleeve":
                    iTailorObject.design3DPro.arrowSleeve = id;
                    break;
                case "elbow":
                    iTailorObject.design3DPro.elbow = id;
                    break;
                case "elbowCoduroy":
                    iTailorObject.design3DPro.elbowCoduroy = id;
                    break;
                case "elbowColor":
                    iTailorObject.design3DPro.elbowColor = id;
                    break;
                case "yorkPlacket":
                    iTailorObject.design3DPro.yorkPlacket = id;
                    break;
                case "wristband":
                    iTailorObject.design3DPro.wristband = id;
                    break;
                default:
                    iTailorObject[style] = id;
                    break;
            }
        },
        checkAllItems: function () {
            var self = this;
            /*check all item visible*/
            $('[data-main]:visible').each(function () {
                var style = $(this).data('main');
                self.check(style);
            });
        },
        check: function (tag) {
            var salf = processDesignObj;
            var id = '';
            switch (tag) {
                case "fabric":
                    id = iTailorObject.fabric;
                    break;
                case "Stylesleeve":
                    id = iTailorObject.sleeve;
                    break;
                case "front":
                    id = iTailorObject.front;
                    break;
                case "back":
                    id = iTailorObject.back;
                    break;
                case "bottom":
                    id = iTailorObject.bottom;
                    break;
                case "collar":
                    id = iTailorObject.collar;
                    salf.condition.buttonAdvanced();
                    break;
                case "pocket":
                    id = iTailorObject.packet;
                    salf.condition.pocket();
                    break;
                case "cuff":
                    id = iTailorObject.cuff;
                    salf.condition.buttonAdvanced();
                    break;
                    /*-------------- contrast -------------*/
                case "contrast":
                    id = iTailorObject.contrast;
                    break;
                case "button":
                    id = iTailorObject.button;
                    break;
                case "buttonHole":
                    id = "ButtonHole-" + iTailorObject.buttonHole;
                    break;
                case "buttonHoleStyle":
                    id = iTailorObject.buttonHoleStyle;
                    break;
                case "monogram":
                    id = iTailorObject.monogram;
                    break;
                case "monogramColor":
                    id = "MonoColor-" + iTailorObject.monogramColor;
                    break;
                default :
                    /*------------*/
                    break;
            }
            var main = "";
            main = $("[data-main='" + tag + "']:visible");
            var img = $("<div>").addClass('icon-check');
            var iconShadow = $("<div>").addClass('icon-shadow');
            main.find('.icon-check').remove();
            main.find('.icon-shadow').remove();
            img.appendTo(main.find('#' + id));
        }
    },
    optionInput: {
        checkboxMenuL: function (ele) {
            var salf = processDesignObj;
            $(ele).change(function () {
                var $this = $(this);
                var type = $this.attr('type');
                var id = $this.attr('id').replace('menu-l-checkbox-', '');
                var status = $this.is(':checked').toString();
                /*condition ToggleView Back Box Placket */
                if (status === "true" && id === "backBoxOutSide" || id === "dart") {
                    designObject.subMenuMain = "back";
                } else {
                    designObject.subMenuMain = "menu-front";
                }
                iTailorObject[id] = status;

                /*---------------------------------------------------
                 * condition [CollarCuffInside | CollarCuffOutside]
                 *---------------------------------------------------*/
                if (id === "CollarCuffInside") {
                    if (status === "true") {
                        iTailorObject.design3DPro.collarIn = "true";
                        iTailorObject.design3DPro.cuffIn = "true";
                    } else {
                        iTailorObject.design3DPro.collarIn = "false";
                        iTailorObject.design3DPro.cuffIn = "false";
                    }
                }
                if (id === "CollarCuffOutside") {
                    if (status === "true") {
                        iTailorObject.design3DPro.collarOut = "true";
                        iTailorObject.design3DPro.cuffOut = "true";
                    } else {
                        iTailorObject.design3DPro.collarOut = "false";
                        iTailorObject.design3DPro.cuffOut = "false";
                    }
                }

                /*condition contrast inSide and outSide*/
                salf.design();
                salf.view.toggleView();
            });
        },
        selectBoxPocket: function (ele) {
            $(document).delegate(ele, 'change', function () {
                var _val = $(this).val();
                if (iTailorObject.packetCount !== _val && _val) {
                    iTailorObject.packetCount = $(this).val();
                    setTimeout(function () {
                        processDesignObj.design();
                    }, 200);
                }
            });
        }
    },
    price: {
        set: function () {
            var salf = this;
            var _price = processGetVariable.fabricMain();
            var _monogramPrice = processGetVariable.monogramPrice();
            var _designProPrice = processGetVariable.designProPrice();

            var monoText = $('.monogram-text-price').parent();
            var price = parseFloat(_price['fabricPrice']);
            var regular = parseFloat(_price['regular']);
            var monogramPrice = parseFloat(_monogramPrice);
            var sumPrice = price;
            var sign = designObject.sign;

            /*CONDITION CAL PRICE [MONOGRAM , PRICE , PRICE PRODESIGN]*/
            if (iTailorObject.monogram !== 'No-Mono' && ((iTailorObject.fabricType).toUpperCase() === "PROMOTION" && iTailorObject.design3DPro.status === "false")) {
                sumPrice = price + monogramPrice;
                iTailorObject.monogramMixStatus = 'true';
                monoText.find('span').css({opacity: 1});
            } else {
                iTailorObject.monogramMixStatus = 'false';
                iTailorObject.monogramPrice = 0.00;
                monoText.find('span').css({opacity: 0});
            }

            /*CONDITION PRO PRICE DESIGN*/
            if (iTailorObject.design3DPro.status === "true") {
                sumPrice += _designProPrice;
            }

            var regularStr = regular ? ((regular).toFixed(2) + " " + sign) : "";

            $('.PriceSum').html((sumPrice).toFixed(2) + " " + sign); /*SUM PRICE MAIN DESIGN*/
            $('.fabric-price').html((price).toFixed(2) + " " + sign); /*FABRIC PRICE MENU L*/

            monoText.find('.monogram-text-price').html("+" + (monogramPrice).toFixed(2) + " " + sign); /*MONOGRAM PRICE MENU L [MENU L MONOGRAM]*/

            //block regular empty value display
            if (regularStr) {
                $('.menu-l-price .regular').html(regularStr).css({visibility: "visible"});
            } else {
                $('.menu-l-price .regular').html(regularStr).css({visibility: "hidden"});
            }
        },
        setCategoryPrice: function () {
            var arr = dataObject.category;
            var sign = designObject.sign;
            var designProPrice = processGetVariable.designProPrice();

            /*------------------------------------
             * CATEGORY 3D MAIN
             *------------------------------------*/

            $('#subMenu-fabric li').each(function () {
                var _this = $(this);
                var p = _this.find(".category-price");
                var discount = _this.find(".discount");
                var str = _this.data('str') ? _this.data('str').toLowerCase() : "";
                var price = loopGetPrice(str);
                var regular = loopGetRegular(str);
                var priceStr = "", regularStr = "";
                
                if (str === "premium") {
                    /*var startPrice = loopGetPrice("promotion") + designProPrice;
                     var endPrice = loopGetPrice("pattern") + designProPrice;
                     priceStr = ((startPrice).toFixed(2) + sign + " - " + (endPrice).toFixed(2) + sign);*/
                } else {
                    priceStr = price + sign;
                    regularStr = regular + sign;
                }

                if (str) {
//                    discount.html(priceStr);
                    p.html(priceStr);
                }
            });

            /*------------------------------------
             * CATEGORY 3D PRO DESIGN
             *------------------------------------*/

            $('#mainPro-design .category-price li').each(function () {
                var _this = $(this);
                var p = _this.find("p:last-child");
                var str = _this.data('str') ? _this.data('str').toLowerCase() : "";
                var price = loopGetPrice(str);
                var priceStr = "";

                if (str === "premium") {
                    var startPrice = loopGetPrice("promotion") + designProPrice;
                    var endPrice = loopGetPrice("pattern") + designProPrice;
                    priceStr = ((startPrice).toFixed(2) + sign + " - " + (endPrice).toFixed(2) + sign);
                } else {
                    priceStr = (price + designProPrice).toFixed(2) + sign;
                }
                if (str) {
                    p.html(priceStr);
                }
            });

            function loopGetPrice(str) {
                for (var i in arr) {
                    var obj = arr[i];
                    var _str = obj['TYPECATEGORY_STR'];
                    var price = obj['PRICE'];
                    if (_str.toLowerCase() === str) {
                        return parseFloat(price);
                    }
                }
            }
            function loopGetRegular(str) {
                for (var i in arr) {
                    var obj = arr[i];
                    var _str = obj['TYPECATEGORY_STR'];
                    var regular = obj['REGULAR'];
                    if (_str.toLowerCase() === str) {
                        return parseFloat(regular);
                    }
                }
            }
        },
        setPriceMenuS: function () {
            /*function change price fabric promotion and signature event run login mober and call function set price*/
            $('[data-main="fabric"] .fabric-price-menu-s').each(function () {
                var id = $(this).parent().attr('id');
                var price = processGetVariable.getFabricPriceByITEMID(id);
                var sign = designObject.sign;
                $(this).html(price + " " + sign);
            });
        },
        setSumMenuMain: function () {

        }
    },
    customer: {
        setSize: function () {
            var data = publicObject.customer;
            var main = $('#FrmBodySize');
            main.find('.border-validate').removeClass('border-validate');
            if (data) {
                for (var i in data) {
                    main.find('input[name="' + i + '"]:text').val(data[i]);
                }
                this.convertSize();
            }
            if (data) {
                var name = data.FIRSTNAME + " " + data.LASTNAME;
                if (name.FIRSTNAME !== undefined && data.LASTNAME !== undefined)
                    $('.user-name').html("welcome , " + name);
            }
        },
        convertSize: function () {
            fnConvertSize.callConvert(publicObject.customer.sizeType, "measurement");/*CALL FUNCRION CONVERT SIZE*/
        }
    },
    log: {
        fabric: "",
        defaultiTailorObject: {}
    },
    event: {
        buttonViewAll: function (ele) {
            $(document).delegate(ele, 'click', function () {
                $('.btnClose').click(); /*Hide All Ele Popup*/
                $(ele).popupMaya({url: "elements/popup/view-fabric-all.php", option: true, run: true}, function () {
                    new $.viewAllFabric();
                });
            });
        },
        addToCart: function () {
            var fromVal = $('#tab-measurement form:visible').serializeArray();
            var qtyArr = {};
            var sizeCount = 0;
            var nameSize = "";
            for (var i in fromVal) {
                var name = fromVal[i]['name'];
                var value = fromVal[i]['value'];
                if (name === "size") {
                    qtyArr[value] = "";
                    nameSize = value;
                } else if (name === "qty") {
                    qtyArr[nameSize] = value;
                } else {
                    iTailorObject[name] = value;
                }
            }
            iTailorObject['qtyList'] = qtyArr;
            $.post('../checkout/elements/add/shirts.php', {data: iTailorObject}, function () {
                window.location = "../checkout";
            });
        }
    }
};
function toggleFabricMenuL() {
    /*Toggle CONDITION FABRIC OF WEEK*/
    if (designObject.menuMain === "menu-fabric") {
        var a = $('.sub-tab-fabric');
        a.hide();
        if (designObject.fabricWeekCategory === iTailorObject.fabricGroup) {
            a.eq(0).fadeIn();
        } else {
            a.eq(1).fadeIn();
        }
    }
}
function setPrice(arr) {
    if (!arr) {
        return false;
    }
    /**SET VARABLE AFTER LOGIN CUSTOMER*/
    designObject.curr = arr.SUM.CURR;
    designObject.sign = arr.SUM.SIGN;
    dataObject.category = arr.CATEGORY;
    publicObject.customer = arr.PERSONAL;
    publicObject.sum = arr.SUM;

    /*CALL FUNCTION SET PRICE [PRICE FABRIC | MONOGRAM | DESIGNPRO PRICE] AND CATEGPRY PRICE*/
    processDesignObj.price.set();
    processDesignObj.price.setCategoryPrice();
    processDesignObj.price.setPriceMenuS();
    processDesignObj.customer.setSize();
}


/*-------------------------------------------------------------------------------
 * CONVERT SIZE CUSTOMMER CUFF /COLLAR / MEASUREMENT
 * - Note !!
 *      styleObj = [collar / cufff / measurement]
 *      unit = [cm / inch]
 * - CALL FUNCTION CONVERT SIZE ALL PROJECT
 *      fnConvertSize.callConvert(new unit,style)
 *-------------------------------------------------------------------------------*/

var fnConvertSize = {
    callConvert: function (_newUnit, styleObj) {
        if (!_newUnit) {
            return false;
        }
        /*styleObj = [collar / cufff / measurement]*/
        var oldUnit = iTailorObject.sizeType.toLowerCase();
        var newUnit = _newUnit.toLowerCase();
        if (oldUnit === newUnit || !newUnit) {
            return false;
        }
        var badge = (newUnit === "cm" ? "*" : "/");
        this.convert(badge, styleObj);
        iTailorObject.sizeType = newUnit;
        this.optionEventOther(newUnit);

    },
    convert: function (a, styleObj) {
        if (styleObj === "collar") {
            this.styleCuff(a);
            this.measurement(a);
        } else if (styleObj === "cuff") {
            this.styleCollar(a);
            this.measurement(a);
        } else if (styleObj === "measurement") {
            this.styleCollar(a);
            this.styleCuff(a);
        } else {
            this.styleCollar(a);
            this.styleCuff(a);
            this.measurement(a);
        }
    },
    styleCollar: function (badge) {
        var size = iTailorObject.collarSize;
        iTailorObject.collarSize = this.convertNumber(size, badge);
    },
    styleCuff: function (badge) {
        var size = iTailorObject.cuffSize;
        iTailorObject.cuffSize = this.convertNumber(size, badge);
    },
    measurement: function (badge) {
        var main = $('form#FrmBodySize input[type="text"]');
        var objfnConvertSize = fnConvertSize;
        main.each(function () {
            var _this = $(this);
            var _val = _this.val();
            if (_val) {
                _this.val(objfnConvertSize.convertNumber(_val, badge));
            }
        });
    },
    convertNumber: function (number, badge) {
        if (number) {
            var _number = parseFloat(number);
            return ((badge === "*") ? (_number * 2.54) : (_number / 2.54)).toFixed(2);
        } else {
            return "";
        }
    },
    optionEventOther: function (newUnit) {
        /*------------------------------- Chnage Input Type Checkbox -------------------------------*/

        $('input[name="sizeType"]').prop('checked', false);
        $('input[value="' + newUnit + '"]').prop('checked', true);

        /*------------------------- toggle Table Measurements standard size -------------------------*/
        var tableStandard = $('.table-standard-size');
        tableStandard.hide();
        if (newUnit === "cm") {
            $('#table-size-cm').show();
        } else {
            $('#table-size-inch').show();
        }
    }
};


/*---------------------------------------------------
 * Developer
 *---------------------------------------------------*/
var logBug = {};
function debug(arr) {
    var obj = arr ? arr : iTailorObject;
    var main = $("#debug ul");
    main.empty();
    var ul = $("<ul>");
    for (var i in obj) {
        var li = $("<li>").html("[" + i + "] = <span style='color:yellow'>" + obj[i] + "</span>");
        li.appendTo(main);
    }

    for (var j in iTailorObject.design3DPro) {
        var li = $("<li>").html("[" + j + "] = <span style='color:white'>" + iTailorObject.design3DPro[j] + "</span>");
        li.appendTo(main);
    }
    function _getArr(arr) {
        var salf = this;
        var data = {};
        if (arr) {
            for (var i in arr) {
                var val = arr[i];
                if (typeof val === "object") {
                    data[i] = {};
                    data[i] = salf._getArr(arr[i]);
                } else {
                    data[i] = val;
                }
            }
        }
        return data;
    }
}