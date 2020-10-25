'use strict'

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = (app) => {
  const pre = 'api'
  const { router, controller } = app
  router.get(pre + '/', controller.home.index)
  router.get(pre + '/list', controller.home.list)
  // 用户注册
  router.post(pre + '/reg', controller.user.reg)
  // 用户登录
  router.post(pre + '/login', controller.user.login)
  // 退出登录
  router.post(pre + '/logout', controller.user.logout)
  //上传
  router.post(pre + '/upload', controller.file.upload)
  //剩余容量
  router.get(pre + '/getsize', controller.user.getSize)
  //文件列表
  router.get(pre + '/file', controller.file.list)
  //创建文件
  router.post(pre + '/file/createdir', controller.file.createdir)
  //重命名
  router.post(pre + '/file/rename', controller.file.rename)
  //批量删除
  router.post(pre + '/file/delete', controller.file.delete)
  //搜索文件
  router.get(pre + '/file/search', controller.file.search)

  //创建分享
  router.post(pre + '/share/create', controller.share.create)
  //我的分享列表
  router.get(pre + '/share/list', controller.share.list)
  //查看分享
  router.get(pre + '/share/:sharedurl', controller.share.read)
  //保存到自己的网盘
  router.post(pre + '/share/save_to_self', controller.share.saveToSelf)
}
