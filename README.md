## 简介
将Markdown文件中的远程图片下载到本地
## 安装

cd到脚本所在目录,然后执行

```
sudo mv mdpic-dl.sh /bin/mdpic-dl
```
## 用法

### 用法1
```
mdpic-dl demo.md
```
说明:将demo.md中的远程图片下载到demo.md.files文件夹中,并且改变demo.md中图片链接

### 用法2
```
mdpic-dl demo.md out.md
```
说明:将demo.md中的远程图片下载到out.md.files文件夹中,并且将demo.md复制到out.md,并改变out.md中的图片链接

### 依赖

**需要安装curl才能使用**
