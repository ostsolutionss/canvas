/*------------------------------------------------------------------------------
 * Function Call load Xml to Java Array
 *------------------------------------------------------------------------------*/

function loadXml(style, Contrast, callback) {
    dataObject.style.sleeve = style['sleeve'];
    dataObject.style.front = style['front'];
    dataObject.style.back = style['back'];
    dataObject.style.bottom = style['bottom'];
    dataObject.style.collar = style['collar'];
    dataObject.style.pocket = style['pocket'];
    dataObject.style.cuff = style['cuff'];

    dataObject.style.button = Contrast['button'];
    dataObject.style.buttonStyle = Contrast['buttonStyle'];
    dataObject.style.buttonHole = Contrast['buttonHole'];
    dataObject.style.monogram = Contrast['monogram'];
    dataObject.style.stiching = Contrast['stiching'];

    dataObject.sizeAdvStyle = Contrast['size'];
    dataObject.stylePro = Contrast['3dPro'];

    callback();
}
function loadObjArr(obj) {
    dataObject.fabric = obj['FABRIC'];
    dataObject.category = obj['CATEGORY'];
    designObject.priceMonogram = obj['RICE_MONOGRAM'];/***********/
    dataObject.style.fabric = obj['FABRIC_CONTRAST'];
    dataObject.optionPrice = obj['OPTION_PRICE'];
    var defaults = obj['DEFAUIT_ARR'];
    setDefault(defaults);
}
function  setDefault(arr) {
    designObject.fabricMenu = arr['fabricMenu'];
    designObject.fabricType = arr['fabricType'];
    iTailorObject.fabricGroup = arr['fabricGroup'];

    iTailorObject.fabricType = arr['fabricType'];
    iTailorObject.fabric = arr['fabric'];
    iTailorObject.fabricName = arr['fabricName'];
    iTailorObject.fabricPrice = arr['fabricPrice'];
    iTailorObject.monogramPrice = arr['monogramPrice'];
    iTailorObject.extraFabricStr = arr['extraFabricStr'];
}
var dataObject = {
    fabric: [],
    category: [],
    optionPrice: [],
    size: [],
    sizeAdvStyle: [],
    style: {
        fabric: [],
        monogram: [],
        stiching: [],
        button: [],
        buttonHole: []
    },
    stylePro: {
        collar: [],
        cuff: [],
        elbow: [],
        monogram: []
    }
};

/*Public function design 3D */
var designObject = {
    menuMain: 'menu-fabric',
    subMenuMain: '',
    menuLast: false,
    designView: 'front', /*front,back*/
    fabricWeekCategory: "28",
    fabricSignatureCategory: "29",
    fabricWeekArr: '',
    priceMonogram: '',
    fabricMenu: '', /*val test*/
    sign: '',
    curr: '',
    language: '',
    fabricType: '',
    designIdeaArr: [],
    log: {
        iTailorObject: []
    }
};

var iTailorObject = {
    productType: 'shirt',
    fabricGroup: '', //'2'
    fabricType: '', /*val test*/
    fabric: '',
    fabricName: '',
    fabricPrice: '',
    extraFabricStr: '',
    monogramPrice: 0.00,
    monogramMixStatus: "false",
    /*----- style no -----*/
    sleeve: "Long-Sleeve",
    sleeveName: "Long Sleeve",
    front: "Plain",
    frontFolder: "F-1",
    frontName: "Single Placket",
    back: "Plain",
    backName: "Plain",
    bottom: "Round",
    bottomSty: "Tri_Tab", /*new*/
    bottomName: "Tri-Tab",
    collar: "CL-1",
    collarButtonCount: '1_button',
    collarSize: '',
    collarName: "Italian Collar 1 Button",
    collarStay: "false",
    packet: "No-pocket",
    packetCount: "1 Pocket", /* Default 1 Pocket,2 Pocket*/
    packetButton: "false",
    packetTp: "false",
    packetFk: "false",
    packetName: "No Pocket",
    cuff: "CU-1",
    cuffButton: 1, /* 1,2*/
    cuffButtonStyle: "Round", /* Default Rount,Angle,Square*/
    cuffSize: "",
    cuffName: "1 Button Round",
    /*style option*/
    shoulder: "false",
    seams: "false",
    dart: "false",
    /*----- Contrast Fabric -----*/
    contrast: "41",
    contrastName: "white",
    button: 'A8',
    buttonName: "White",
    CollarCuffInside: "false",
    CollarCuffOutside: "false",
    frontPlacketInside: "false",
    frontPlacketOutside: "false",
    frontBoxOutSide: "false",
    backBoxOutSide: "false",
    buttonHole: "A8",
    buttonHoleName: "White",
    buttonHoleCode: "#FFFFFF",
    buttonHoleStyle: 'V',
    buttonHoleStyleName: "Vertical",
    monogram: 'No-Mono',
    monogramName: 'No Monogram',
    monogramColor: "A8",
    monogramHoleName: "White",
    monogramCode: '#FFFFFF',
    monogramTxt: '',
    monogramStatus: "true",
    monogramStyle: 'Italic',
    /*----- size -----*/
    sizeType: 'inch', /* Default inch,cm*/
    sizeFit: 'Comfortable', /* Default Comfortable,Slim*/
    size: '', /* Default s,m,l,xl,xxl,3xl,4xl*/

    sizeNeck: '',
    sizeChest: '',
    sizeWaist: '',
    sizeHip: '',
    sizeLength: '',
    sizeShoulder: '',
    sizeSleeve: '',
    qty: 1,
    design3DPro: new pro3DObject()
};
function pro3DObject() {
    var A = {
        status: 'false',
        collar: "No-Style",
        collarIn: "false",
        collarOut: "false",
        collarStiching: "false",
        collarBand: "false",
        cuff: "No-Style",
        cuffIn: "false",
        cuffOut: "false",
        cuffStiching: "false",
        stichingColor: "A8",
        shoulderContrast: 'false',
        frontPlacketSize: 'Normal',
        placketTrimming: 'false',
        placketAngled: 'false',
        pocketFlap: 'false',
        pocketMain: 'false',
        pocketTrimming: 'false',
        arrowSleeve: 'false',
        sleeve: 'false',
        elbow: 'false',
        elbowCoduroy: 'false',
        elbowColor: 'CR1', /*value test*/
        wristband: 'false',
        yorkPlacket: 'false'
    };
    return A;
}