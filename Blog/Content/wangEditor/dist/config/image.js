"use strict";
/**
 * @description 图片相关的配置
 * @author wangfupeng
 */
Object.defineProperty(exports, "__esModule", { value: true });
var const_1 = require("../utils/const");
exports.default = {
    // 网络图片校验的配置函数
    linkImgCheck: function (src, alt, href) {
        return true;
    },
    // 显示“插入网络图片”
    showLinkImg: true,
    // 显示“插入图片alt”
    showLinkImgAlt: true,
    // 显示“插入图片href”
    showLinkImgHref: true,
    // 插入图片成功之后的回调函数
    linkImgCallback: const_1.EMPTY_FN,
    // accept
    uploadImgAccept: ['jpg', 'jpeg', 'png', 'gif', 'bmp'],
    // 服务端地址
    uploadImgServer: '',
    // 使用 base64 存储图片
    uploadImgShowBase64: false,
    // 上传图片的最大体积，默认 5M
    uploadImgMaxSize: 5 * 1024 * 1024,
    // 一次最多上传多少个图片
    uploadImgMaxLength: 100,
    // 自定义上传图片的名称
    uploadFileName: '',
    // 上传图片自定义参数
    uploadImgParams: {},
    // 自定义参数拼接到 url 中
    uploadImgParamsWithUrl: false,
    // 上传图片自定义 header
    uploadImgHeaders: {},
    // 钩子函数
    uploadImgHooks: {},
    // 上传图片超时时间 ms
    uploadImgTimeout: 10 * 1000,
    // 跨域带 cookie
    withCredentials: false,
    // 自定义上传
    customUploadImg: null,
    // 从媒体库上传
    uploadImgFromMedia: null,
};
//# sourceMappingURL=image.js.map