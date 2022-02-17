FROM  mcr.microsoft.com/playwright:v1.15.0-focal
RUN mv /etc/apt/sources.list /etc/apt/sources.list.backup
ADD sources.list /etc/apt/ 
# RUN sed -i "s@/security.ubuntu.com/@/mirrors.aliyun.com/@g" /etc/apt/sources.list&&sed -i "s@/security.ubuntu.com/@/mirrors.ustc.edu.cn/@g" /etc/apt/sources.list
RUN apt-get update&&apt-get -y upgrade&&apt-get clean&&rm -rf /var/lib/apt/lists/*&&pip install playwright&&playwright install
RUN cp /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime