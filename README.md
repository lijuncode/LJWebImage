# LJWebImage

## 简介
**LJWebImage**是用swift2.0简单模仿SDWebImage,实现网络图片的下载,功能如下:


- **使用方便** 只需要调用一句代码就可以从网络中下载图片,并设置给imageView
- **实现内存和沙盒缓存** 减少网络访问提高运行速度
- **能够响应内存警告** 在收到内存警告时,能释放内存中的图片和线程

## 使用方法

只需要让UIImageView对象调用这个方法即可
```
 setWebImage(path: String)
```
