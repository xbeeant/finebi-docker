FROM centos:7.8.2003

#设置系统编码,不然地图显示有问题
RUN yum install kde-l10n-Chinese glibc-common expect -y
RUN localedef -c -f UTF-8 -i zh_CN zh_CN.utf8

ENV LC_ALL zh_CN.UTF-8
ENV LANG C.UTF-8
ENV TZ Asia/Shanghai

WORKDIR /

# to be modified
ADD linux_unix_FineBI6_0-CN.sh ./

ADD linux_unix_FineBI6_0-CN-expect.sh ./

RUN ./linux_unix_FineBI6_0-CN-expect.sh 

# to be modified
RUN chmod 777 /usr/local/FineBI6.0/bin/finebi

# /usr/local/FineBI6.0/bin/output.log
# /usr/local/FineBI6.0/bin/error.log
# /usr/local/FineBI6.0/bin/finebi.vmoptions
# /usr/local/FineBI6.0/logs/basic
# /usr/local/FineBI6.0/temp
# /usr/local/FineBI6.0/webapps

EXPOSE 37799 48888
ENTRYPOINT ["/bin/bash", "/usr/local/FineBI6.0/bin/finebi"]
