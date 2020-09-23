const MPKIDATA = {
    caName: [{
        name: 'Globalsign',
        value: 1,
        info: 'Globalsign是一家声誉卓著，备受信赖的CA中心和SSL数字证书提供商，服务超过14万用户。GlobalSign所颁发的SSL证书具有2048位防解密，支持128位至256位SSL加密级别；兼容性高，通用所有浏览器、服务器及各式移动设备；支持通配型SSL证书、SANS证书及签名证书等特点。'
    }, {
        name: 'CFCA',
        value: 2,
        info: 'CFCA作为国内第一家与国外SSL服务器证书厂商媲美的电子认证服务机构,严格按照国际标准提供电子认证服务,并结合我国国情,在密码算法、安全技术服务等方面兼容国际和国产算法。'
    }, {
        name: 'Symantec',
        value: 3,
        info: 'Symantec是全球最大的信息安全服务商。该证书为国内证书服务商TrustAsia（亚洲诚信）联合Symantec为百度云用户专供的证书产品。市场价值1900元。'
    }, {
        name: 'AlphaSSL',
        value: 4,
        info: 'AlphaSSL是全球最大的信息安全服务商。该证书为国内证书服务商TrustAsia（亚洲诚信）联合Geotrust为百度云用户专供的证书产品。市场价值1900元。'
    }],
    caType: [{
        name: '企业型OV',
        value: 1,
        info: '针对网站的域名及所有权进行严格的书面审查程序，通过审核后证书标示企业组织机构详情，让网友直接了解拥有该网站的企业真实身份，强化对该站的信任感。而网友也可于浏览器中发现「黄色小锁」符号已经激活。'
    }, {
        name: '增强型EV',
        value: 2,
        info: '除了进行严格的网站所有权的真实身份验证之外，还加入第三方验证，证书标示增强组织机构详情，强化信任度，增强型SSL证书（EVSSL）最大的特色便是激活网站浏览器的栏位使其变成绿色。'
    }, {
        name: '域名型DV',
        value: 3,
        info: 'DV证书属于域名验证型证书，支持线上5分钟内快速签发，免费版仅支持单域名。'
    }],
    proType: [{
        name: '单域名板',
        value: 1,
        info: '此类产品仅支持一个标准域名。eg：baidu.com，不限制域名层级'
    }, {
        name: '多域名板',
        value: 2,
        info: '一张数字证书同时保护多个域名、服务器，节省大量管理成本；可以任意添加任何域名、子域名、IP 地址和本地服务器的组合，数量最多101个，需要一次性提交。'
    }, {
        name: '通配符域名版',
        value: 3,
        info: '一张数字证书下可同时保护同一个域下多个子域名，如申请 *.baidu.com, 那么该证书支持a1. baidu.com, a2.baidu.com。'
    }],
    proYear: [{
        name: '1年',
        value: 1,
        info: '证书有效期自审核通过日起 1 年内生效'
    }, {
        name: '2年',
        value: 2,
        info: '证书有效期自审核通过日起 2 年内生效'
    }]
};
let caObject = {
    caName: 1,
    caType: 1,
    proType: 1,
    caCount: 1,
    proYear: 1,
    tpfCount: 0,
    price: 0
};
const rbRadios = (value, {
    radioDis = [111111011111, 111111011111, 111100110011, 111111011011, 111100110111]
} = {}) => {
    const cmInt = (e, i) => Array.from(e[i] + '', e => parseInt(e));
    const radios = document.querySelectorAll('#buyCA input[type="radio"]');
    caObject['proType'] = 1;
    [...radios].map((e, i) => {
        e.disabled = !cmInt(radioDis, value)[i]
    });
};
const setShopCar = () => {
    let unLess = ['caName', 'caType', 'proType'];
    for (key in caObject) {
        // console.log(`${key}:${caObject[key]}`);
        document.querySelector(`#shopcar p[data-id=${key}]`).innerText = unLess.includes(key) ? MPKIDATA[key][caObject[key] - 1]['name'] : caObject[key]
    }
};
const seText = () => {
    [...document.querySelectorAll('input[type="radio"]:checked')].forEach((e, i) => {
        const nodeEl = e.parentNode;
        caObject[nodeEl.id] = e.value * 1;
        nodeEl.nextSibling.nextSibling.innerText = MPKIDATA[nodeEl.id][e.value - 1]['info'];
    })
};
const showTpf = (k, v) => {
    const $el = document.querySelectorAll('#buyCount div.form-group')[1];
    let isShow = (k === 'proType' && v === 2) || caObject['proType'] === 2;
    [$el, $el.nextSibling.nextSibling].forEach(e => {
        if (isShow) {
            e.className = 'form-group row';
            e.nextSibling.className = 'form-group row';
        } else {
            e.className += ' d-none';
            e.nextSibling.className += ' d-none';
        };
    });
    const $elt = document.getElementById('tpfCountBox');
    isShow ? $elt.className = 'form-group row' : $elt.className += ' d-none';
};
const caProxy = new Proxy(caObject, {
    get: function(target, key, receiver) {
        return Reflect.get(target, key, receiver);
    },
    set: function(target, key, value, receiver) {
        (key === 'caName') &&
        (value === 1 && rbRadios(1) || value === 2 && rbRadios(1) || value === 3 && rbRadios(2) || value === 4 && rbRadios(4)) ||
        (key === 'caType') &&
        (value === 1 && rbRadios(1) || value === 2 && rbRadios(3));
        !!value && showTpf(key, value);
        (!!key && key === 'caName') && document.querySelectorAll("[data-check*='Type']").forEach(e =>
            e.querySelector("input:not(:disabled)").checked = true);
        (!!key && key === 'caType') && (document.querySelector('#proType input:not(:disabled)').checked = true);
        (!!key && key !== 'proYear') && (document.querySelector('input[name="proYear"]').checked = true);
        let inputTxt = [...document.querySelectorAll('#buyCount input[type="text"]')];
        if (key === 'caName' || key === 'caType' || (key === 'proType' && value !== 2)) {
            caObject.caCount = 1;
            caObject.tpfCount = 0;
            inputTxt[0].value = 1;
            inputTxt[1].value = 0;
            document.getElementsByName('caCount')[0].disabled = true;
        } else if (key === 'proType' && value === 2) {
            caObject.caCount = 1;
            inputTxt[0].value = 1;
            document.getElementsByName('caCount')[0].disabled = false;
        };
        !!value && seText();
        !!value && setShopCar();
        // 验证
        if (key === 'caCount' || key === 'tpfCount') {
            const toggleHide = (b, e) => !!b ? e.className += ' layui-form-danger' : e.className = 'layui-input';
            toggleHide((value > 100 || value < 0), document.querySelector(`input[name="${key}"]`));
            const maxCount = Array.from(document.querySelectorAll('#buyCount input[type="text"]'), e => e.value * 1).reduce((a, b) => a + b) > 100;
            [...document.querySelectorAll('#buyCount input[type="text"]')].forEach((e, i) => {
                toggleHide(!!maxCount, e);
            });
            !!maxCount && alert('域名数量和通配符数量之和不能大于100');
        } else {
            caObject[key] = parseInt(value);
            target[key] = value;
        };

        // return Reflect.set(target, key, value, receiver);
    }
});
$('#warp').on('change', 'input', (e) => {
    let [cname, cvalue, pid] = [e.target.name, e.target.value, e.target.parentNode.id];
    caObject[cname] = parseInt(cvalue);
    caProxy[cname] = parseInt(cvalue);
    if (e.type === 'radio') {
        $(`#${pid}`).next().text(MPKIDATA[cname][cvalue - 1].info)
    }
});