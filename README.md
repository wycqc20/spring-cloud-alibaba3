# Spring Cloud Alibaba 3 项目介绍

## 项目概述
本项目 `spring-cloud-alibaba3` 是一个基于 Spring Cloud Alibaba 构建的分布式微服务项目，旨在展示如何利用 Spring Cloud Alibaba 生态系统中的各种组件，如 Nacos、Sentinel 等，构建一个完整的分布式微服务应用。项目涵盖了服务发现、配置管理、API 网关、流量控制、熔断降级等功能，通过各个模块的协作，实现了服务的注册与发现、服务之间的调用、数据库的访问等功能。

## 项目结构
项目包含多个模块，每个模块都有其特定的功能和用途：
- `nacos-config-demo`：演示如何使用 Nacos 进行配置管理和服务发现。
- `spring-cloud-gateway`：作为 API 网关，负责路由请求和过滤。
- `user-provider` 和 `user-provider2`：作为服务提供者，提供用户相关的服务。
- `sentinel-demo`：演示如何使用 Sentinel 进行流量控制和熔断降级。
- `user-consumer`：作为服务消费者，调用 `user-provider` 提供的服务。

## 环境要求
- Java 8
- Maven
- MySQL
- Nacos
- Sentinel Dashboard

## 快速开始

### 1. 克隆项目
```bash
git clone https://github.com/your-repo/spring-cloud-alibaba3.git
cd spring-cloud-alibaba3
```

### 2. 配置数据库
创建一个名为 `blog` 的 MySQL 数据库，并执行 `blog.sql` 文件中的 SQL 脚本，初始化数据库表和数据。

### 3. 启动 Nacos 和 Sentinel Dashboard
确保 Nacos 和 Sentinel Dashboard 服务已经启动，并且 Nacos 的地址为 `localhost:8848`，Sentinel Dashboard 的地址为 `localhost:8080`。

### 4. 编译和运行项目
使用 Maven 编译项目：
```bash
mvn clean install
```

依次启动各个模块：
```bash
# 启动 user-provider
mvn -pl user-provider spring-boot:run

# 启动 user-provider2
mvn -pl user-provider2 spring-boot:run

# 启动 user-consumer
mvn -pl user-consumer spring-boot:run

# 启动 nacos-config-demo
mvn -pl nacos-config-demo spring-boot:run

# 启动 sentinel-demo
mvn -pl sentinel-demo spring-boot:run

# 启动 spring-cloud-gateway
mvn -pl spring-cloud-gateway spring-boot:run
```

## 模块详情

### 1. nacos-config-demo
- **功能**：演示如何使用 Nacos 进行配置管理和服务发现。
- **依赖**：包含 `spring-cloud-starter-alibaba-nacos-discovery` 和 `spring-cloud-starter-alibaba-nacos-config` 等依赖。
- **启动类**：`NacosConfigMain` 类，用于启动应用。

### 2. spring-cloud-gateway
- **功能**：作为 API 网关，负责路由请求和过滤。
- **依赖**：包含 `spring-cloud-starter-gateway` 和 `spring-cloud-starter-alibaba-nacos-discovery` 等依赖。
- **过滤器**：自定义了 `MyLogGatewayFilter` 全局过滤器，用于日志记录和用户认证。
- **启动类**：`GateWayMain` 类，用于启动网关服务。

### 3. user-provider 和 user-provider2
- **功能**：作为服务提供者，提供用户相关的服务。
- **依赖**：包含 `spring-cloud-starter-alibaba-nacos-discovery`、`spring-boot-starter-web`、`mysql-connector-java`、`druid-spring-boot-starter` 和 `mybatis-plus-boot-starter` 等依赖。
- **数据库**：使用 MySQL 数据库，并集成了 Druid 连接池和 MyBatis-Plus。

### 4. sentinel-demo
- **功能**：演示如何使用 Sentinel 进行流量控制和熔断降级。
- **依赖**：包含 `spring-cloud-starter-alibaba-nacos-discovery`、`sentinel-datasource-nacos` 和 `spring-cloud-starter-alibaba-sentinel` 等依赖。
- **配置**：在 `application.yml` 中配置了 Nacos 和 Sentinel 的地址。

### 5. user-consumer
- **功能**：作为服务消费者，调用 `user-provider` 提供的服务。
- **依赖**：包含 `spring-cloud-starter-alibaba-sentinel`、`spring-cloud-starter-openfeign` 和 `spring-cloud-starter-alibaba-nacos-discovery` 等依赖。
- **配置**：在 `application.yml` 中配置了 Nacos 和 Sentinel 的地址，以及服务调用的 URL 和负载均衡规则。

## 配置说明
各个模块的配置文件（`application.yml` 或 `bootstrap.yml`）中包含了项目的关键配置信息，如 Nacos 地址、Sentinel Dashboard 地址、数据库连接信息等。请根据实际情况进行修改。

## 注意事项
- 确保 Nacos 和 Sentinel Dashboard 服务已经启动，并且地址配置正确。
- 数据库连接信息（如用户名、密码、数据库名等）需要根据实际情况进行修改。
- 项目中的部分依赖版本可能需要根据实际情况进行调整。

## 贡献
欢迎贡献代码和提出建议！如果你有任何问题或建议，请在 GitHub 上提交 issue 或 pull request。

## 许可证
本项目采用 [MIT 许可证](LICENSE)。
