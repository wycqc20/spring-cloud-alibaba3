#Spring Cloud Alibaba 3 项目介绍
项目概述
本项目 spring-cloud-alibaba3 是一个基于 Spring Cloud Alibaba 构建的分布式微服务项目，旨在展示如何利用 Spring Cloud Alibaba 生态系统中的各种组件，如 Nacos、Sentinel 等，构建一个完整的分布式微服务应用。项目涵盖了服务发现、配置管理、API 网关、流量控制、熔断降级等功能，通过各个模块的协作，实现了服务的注册与发现、服务之间的调用、数据库的访问等功能。
项目结构
项目包含多个模块，每个模块都有其特定的功能和用途：
nacos-config-demo：演示如何使用 Nacos 进行配置管理和服务发现。
spring-cloud-gateway：作为 API 网关，负责路由请求和过滤。
user-provider 和 user-provider2：作为服务提供者，提供用户相关的服务。
sentinel-demo：演示如何使用 Sentinel 进行流量控制和熔断降级。
user-consumer：作为服务消费者，调用 user-provider 提供的服务。
#环境要求
Java 8
Maven
MySQL
Nacos
Sentinel Dashboard
#快速开始
1. 克隆项目
bash
git clone https://github.com/your-repo/spring-cloud-alibaba3.git
cd spring-cloud-alibaba3
2. 配置数据库
创建一个名为 blog 的 MySQL 数据库，并执行 blog.sql 文件中的 SQL 脚本，初始化数据库表和数据。
3. 启动 Nacos 和 Sentinel Dashboard
确保 Nacos 和 Sentinel Dashboard 服务已经启动，并且 Nacos 的地址为 localhost:8848，Sentinel Dashboard 的地址为 localhost:8080。
