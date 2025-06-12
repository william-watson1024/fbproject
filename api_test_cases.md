# API 测试用例文档

本测试文档基于 `fb.openapi.json` 和后端代码接口，覆盖所有核心功能的正常与异常测试场景。

---

## 一、用户端接口（/app/）

### 1. 用户相关

#### 1.1 用户登录
- **接口**：`POST /app/gameUser/login`
- **参数**：account, password

| 用例编号 | 用例描述     | 输入参数                             | 预期结果                   |
|----------|--------------|--------------------------------------|----------------------------|
| U-TC001  | 正常登录     | account=admin, password=123456       | 登录成功，返回状态码200    |
| U-TC002  | 缺少账号     | password=123456                      | 返回参数缺失错误信息       |
| U-TC003  | 密码错误     | account=admin, password=wrongpass    | 返回密码错误提示           |
| U-TC004  | 空参数提交   | 无                                   | 返回请求参数非法提示       |

#### 1.2 用户注册
- **接口**：`POST /app/gameUser/register`
- **参数**：account, password, name

| 用例编号 | 用例描述     | 输入参数                                      | 预期结果                   |
|----------|--------------|-----------------------------------------------|----------------------------|
| U-TC005  | 正常注册     | account=test1, password=abc123, name=张三     | 注册成功                   |
| U-TC006  | 缺少字段     | account=test2, password=abc123                | 返回缺少参数错误提示       |
| U-TC007  | 重复注册     | account=admin, password=abc123, name=重复用户 | 返回账号已存在提示         |

#### 1.3 注册并登录
- **接口**：`POST /app/gameUser/registerAndLogin`
- **参数**：account, password, name

| 用例编号 | 用例描述         | 输入参数                                      | 预期结果                   |
|----------|------------------|-----------------------------------------------|----------------------------|
| U-TC008  | 正常注册并登录   | account=test3, password=abc123, name=李四     | 注册并自动登录成功         |
| U-TC009  | 已存在账号       | account=admin, password=abc123, name=重复用户 | 返回账号已存在提示         |

#### 1.4 查询用户积分
- **接口**：`GET /app/gameUser/points`
- **参数**：account

| 用例编号 | 用例描述         | 输入参数            | 预期结果               |
|----------|------------------|---------------------|------------------------|
| U-TC010  | 查询正常账号积分 | account=user001     | 返回积分数值           |
| U-TC011  | 账号为空         | 无                  | 返回请求参数缺失提示   |
| U-TC012  | 非法账号         | account=unknownUser | 返回账号不存在错误信息 |

#### 1.5 Token 积分充值
- **接口**：`POST /app/gameUser/rechargePointsByToken`
- **参数**：account, amount, token

| 用例编号 | 用例描述           | 输入参数                              | 预期结果                     |
|----------|--------------------|---------------------------------------|------------------------------|
| U-TC013  | 正常充值           | account=user001, amount=100, token=abc123 | 返回充值成功状态         |
| U-TC014  | token 失效         | account=user001, amount=100, token=expired | 返回 token 失效错误提示 |
| U-TC015  | 缺少参数           | account=user001, amount=100            | 返回缺少 token 提示      |
| U-TC016  | 非法金额           | account=user001, amount=-50, token=abc123 | 返回参数非法错误提示   |

#### 1.6 Redis Token 积分充值
- **接口**：`POST /app/gameUser/rechargeByRedisToken`
- **参数**：account, points, token

| 用例编号 | 用例描述           | 输入参数                              | 预期结果                     |
|----------|--------------------|---------------------------------------|------------------------------|
| U-TC017  | 正常充值           | account=user001, points=100, token=abc123 | 返回充值成功状态         |
| U-TC018  | token 失效         | account=user001, points=100, token=expired | 返回 token 失效错误提示 |
| U-TC019  | 用户不存在         | account=notfound, points=100, token=abc123 | 返回用户不存在错误提示 |

#### 1.7 下注并扣除积分
- **接口**：`POST /app/gameUser/deductPoints`
- **参数**：account, points, liveStreamId, gameType, gameRound, betName, betContent

| 用例编号 | 用例描述           | 输入参数                              | 预期结果                     |
|----------|--------------------|---------------------------------------|------------------------------|
| U-TC020  | 正常下注           | account=user001, points=10, ...       | 下注成功，积分减少           |
| U-TC021  | 积分不足           | account=user001, points=999999, ...   | 返回积分不足错误             |
| U-TC022  | 用户不存在         | account=notfound, points=10, ...      | 返回用户不存在错误           |
| U-TC023  | 非法下注积分       | account=user001, points=-10, ...      | 返回参数非法错误提示         |

---

### 2. 直播间相关

#### 2.1 获取直播间详情
- **接口**：`GET /app/liveStream/getLiveStreamById/{id}`
- **参数**：id

| 用例编号 | 用例描述           | 输入参数         | 预期结果           |
|----------|--------------------|------------------|--------------------|
| U-TC024  | 正常获取           | id=1001          | 返回直播间详情     |
| U-TC025  | id不存在           | id=999999        | 返回直播间不存在   |

#### 2.2 获取直播间列表
- **接口**：`GET /app/liveStream/getLiveStreamList`
- **参数**：无/可选过滤

| 用例编号 | 用例描述           | 输入参数         | 预期结果           |
|----------|--------------------|------------------|--------------------|
| U-TC026  | 获取所有直播间     | 无               | 返回直播间列表     |

---

### 3. 游戏信息相关

#### 3.1 按游戏局号查找
- **接口**：`GET /app/gameInfo/listByGameRound`
- **参数**：gameRound

| 用例编号 | 用例描述           | 输入参数         | 预期结果           |
|----------|--------------------|------------------|--------------------|
| U-TC027  | 正常查找           | gameRound=202301 | 返回对应游戏信息   |
| U-TC028  | gameRound为空      | 无               | 返回参数缺失错误   |

#### 3.2 查询最近X分钟内的游戏
- **接口**：`GET /app/gameInfo/listMinutesBeforeNow`
- **参数**：minutesBeforeNow

| 用例编号 | 用例描述           | 输入参数         | 预期结果           |
|----------|--------------------|------------------|--------------------|
| U-TC029  | 正常查找           | minutesBeforeNow=60 | 返回近60分钟游戏 |
| U-TC030  | 参数为空           | 无               | 返回参数缺失错误   |

---

### 4. 注单/下注记录相关

#### 4.1 查询下注记录
- **接口**：`GET /app/gameRecord/list`
- **参数**：gameUserAccount, liveStreamId, gameRound等

| 用例编号 | 用例描述           | 输入参数                           | 预期结果           |
|----------|--------------------|------------------------------------|--------------------|
| U-TC031  | 查询所有下注记录   | 无                                 | 返回所有记录列表   |
| U-TC032  | 根据直播间过滤     | liveStreamId=1001                  | 返回对应房间下注记录 |
| U-TC033  | 非法直播间 ID      | liveStreamId=-1                    | 返回参数错误提示     |

#### 4.2 查询已结算下注记录
- **接口**：`GET /app/gameRecord/settled`
- **参数**：liveStreamId

| 用例编号 | 用例描述             | 输入参数           | 预期结果         |
|----------|----------------------|--------------------|------------------|
| U-TC034  | 查询全部结算记录     | 无                 | 返回所有 isActive=1 的记录 |
| U-TC035  | 指定房间已结算记录   | liveStreamId=1001  | 返回对应记录     |

#### 4.3 按直播间查询下注记录
- **接口**：`GET /app/gameRecord/byLiveStream`
- **参数**：liveStreamId

| 用例编号 | 用例描述           | 输入参数         | 预期结果           |
|----------|--------------------|------------------|--------------------|
| U-TC036  | 正常查询           | liveStreamId=1001| 返回该房间下注记录 |
| U-TC037  | 房间不存在         | liveStreamId=9999| 返回空或错误提示   |

---

## 二、管理端接口（/system/）

### 1. 直播网站管理

#### 1.1 查询直播网站列表
- **接口**：`GET /system/liveStream/list`
- **参数**：可选过滤

| 用例编号 | 用例描述           | 输入参数         | 预期结果           |
|----------|--------------------|------------------|--------------------|
| M-TC001  | 查询全部           | 无               | 返回全部直播网站   |
| M-TC002  | 按条件过滤         | name=xxx         | 返回过滤后列表     |

#### 1.2 新增/修改/删除/导出直播网站
- **接口**：`POST /system/liveStream`、`PUT /system/liveStream`、`DELETE /system/liveStream/{ids}`、`POST /system/liveStream/export`

| 用例编号 | 用例描述           | 输入参数         | 预期结果           |
|----------|--------------------|------------------|--------------------|
| M-TC003  | 新增直播网站       | name=xxx, ...    | 新增成功           |
| M-TC004  | 修改直播网站       | id=1, name=xxx   | 修改成功           |
| M-TC005  | 删除直播网站       | id=1             | 删除成功           |
| M-TC006  | 导出直播网站       | 无/过滤条件      | 导出文件           |

---

### 2. 游戏信息管理

#### 2.1 查询/新增/修改/删除/导出游戏信息
- **接口**：`GET /system/gameInfo/list`、`POST /system/gameInfo`、`PUT /system/gameInfo`、`DELETE /system/gameInfo/{ids}`、`POST /system/gameInfo/export`

| 用例编号 | 用例描述           | 输入参数         | 预期结果           |
|----------|--------------------|------------------|--------------------|
| M-TC007  | 查询全部           | 无               | 返回全部游戏信息   |
| M-TC008  | 新增游戏信息       | name=xxx, ...    | 新增成功           |
| M-TC009  | 修改游戏信息       | id=1, name=xxx   | 修改成功           |
| M-TC010  | 删除游戏信息       | id=1             | 删除成功           |
| M-TC011  | 导出游戏信息       | 无/过滤条件      | 导出文件           |

---

### 3. 游戏用户管理

#### 3.1 查询/新增/修改/删除/导出游戏用户
- **接口**：`GET /system/gameUser/list`、`POST /system/gameUser`、`PUT /system/gameUser`、`DELETE /system/gameUser/{ids}`、`POST /system/gameUser/export`

| 用例编号 | 用例描述           | 输入参数         | 预期结果           |
|----------|--------------------|------------------|--------------------|
| M-TC012  | 查询全部           | 无               | 返回全部用户       |
| M-TC013  | 新增用户           | account=xxx, ... | 新增成功           |
| M-TC014  | 修改用户           | id=1, name=xxx   | 修改成功           |
| M-TC015  | 删除用户           | id=1             | 删除成功           |
| M-TC016  | 导出用户           | 无/过滤条件      | 导出文件           |

#### 3.2 根据账号查询用户
- **接口**：`GET /system/gameUser/byAccount`
- **参数**：account

| 用例编号 | 用例描述           | 输入参数         | 预期结果           |
|----------|--------------------|------------------|--------------------|
| M-TC017  | 正常查询           | account=admin    | 返回用户信息       |
| M-TC018  | 账号不存在         | account=notfound | 返回空或错误提示   |

---

### 4. 游戏记录管理

#### 4.1 查询/新增/修改/删除/导出游戏记录
- **接口**：`GET /system/gameRecord/list`、`POST /system/gameRecord`、`PUT /system/gameRecord`、`DELETE /system/gameRecord/{ids}`、`POST /system/gameRecord/export`

| 用例编号 | 用例描述           | 输入参数         | 预期结果           |
|----------|--------------------|------------------|--------------------|
| M-TC019  | 查询全部           | 无               | 返回全部记录       |
| M-TC020  | 新增记录           | ...              | 新增成功           |
| M-TC021  | 修改记录           | id=1, ...        | 修改成功           |
| M-TC022  | 删除记录           | id=1             | 删除成功           |
| M-TC023  | 导出记录           | 无/过滤条件      | 导出文件           |

#### 4.2 结算游戏记录
- **接口**：`POST /system/gameRecord/settle`
- **参数**：liveStreamId, odds, betContent, nextRoundEnabled

| 用例编号 | 用例描述           | 输入参数         | 预期结果           |
|----------|--------------------|------------------|--------------------|
| M-TC024  | 正常结算           | liveStreamId=1, odds=2.0, ... | 结算成功，积分变更 |
| M-TC025  | 参数缺失           | 无/部分参数      | 返回参数缺失错误   |

---

### 5. 工具接口

#### 5.1 管理员生成一次性充值 token
- **接口**：`POST /system/utils/generateToken`
- **参数**：account

| 用例编号 | 用例描述           | 输入参数         | 预期结果           |
|----------|--------------------|------------------|--------------------|
| M-TC026  | 正常生成           | account=admin    | 返回token，5分钟有效 |
| M-TC027  | 5分钟后失效        | account=admin    | token失效           |

