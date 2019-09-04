#!/bin/bash
mkdir -p bin
if [ ! -f bin/choerodon-tool-liquibase.jar ]
then
    curl https://oss.sonatype.org/content/groups/public/io/choerodon/choerodon-tool-liquibase/0.6.2.RELEASE/choerodon-tool-liquibase-0.6.2.RELEASE.jar -o ./bin/choerodon-tool-liquibase.jar
fi
java -Dspring.datasource.url="jdbc:mysql://localhost:3306/ureport2?useUnicode=true&characterEncoding=utf-8&useSSL=false" \
 -Dspring.datasource.username=ureport2 \
 -Dspring.datasource.password=ureport2 \
 -Ddata.drop=false -Ddata.init=true \
 -Ddata.dir=./src/main/resources \
 -jar ./bin/choerodon-tool-liquibase.jar
