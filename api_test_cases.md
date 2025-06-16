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

# 管理端接口测试用例

## 1. 验证码以及uuid获取

- **接口路径**：`GET /captchaImage`
- **请求参数**（可选过滤）


- **返回示例**（成功）：
```json
{
    "msg": "操作成功",
    "img": "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",
    "code": 200,
    "captchaEnabled": true,
    "uuid": "60b2522cc98d443db7a2a281066d51b2"
}
```

- **注意事项**：
  - 获取返回信息`img`后需要在返回信息前面加上`data:image/jpeg;base64,`然后复制一整段，并在浏览器中打开，即可看到验证码图片，根据图片计算获得登录需要的验证码`code`字段，`uuid`字段可以直接获取

## 2. 管理员登录（获取 token）

- **接口路径**：`POST /login`
- **请求参数**（JSON）：

  - `username`：用户名
  - `password`：密码
  - `code`：验证码（如启用验证码时必填，否则可省略）
  - `uuid`：验证码唯一标识（如启用验证码时必填，否则可省略）


- **返回示例**（成功）：
```json
{
    "msg": "操作成功",
    "code": 200,
    "token": "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImxvZ2luX3VzZXJfa2V5IjoiZTc5YThkYzQtNGI5OC00ZjBhLWFiYTQtMzhlOWM0ODhiYjM5In0.xCaQTIYipvDkRfgDzjm3rBUA-MbXq5NdcQbkUiP-Ugb8se3hXM4CAUVADP0LoWRXnpxZBkLi_wfiKhd9cvjYrA"
}
```

- **用例表**：

| 用例编号   | 用例描述     | 输入参数（JSON）                                         | 预期结果                      |
|------------|--------------|----------------------------------------------------------|-------------------------------|
| M-LOGIN-01 | 正常登录     | username=admin, password=123456, code=, uuid=             | 返回 code=200，含 token       |
| M-LOGIN-02 | 密码错误     | username=admin, password=wrong                           | 返回 code!=200，msg 登录失败  |
| M-LOGIN-03 | 缺少参数     | username=admin                                          | 返回参数缺失错误              |
| M-LOGIN-04 | 验证码错误   | username=admin, password=123456, code=wrong, uuid=xxx    | 返回验证码错误                |

- **注意事项**：
  - 登录成功后，需保存返回的 `token`，后续所有管理端接口都需在请求头携带：`Authorization: token`, 可以在apifox中设置全局参数，避免多次重复设置
  - token 失效或未携带时，接口会返回 401 未授权

## 3. 用户管理相关接口
| 用例编号 | 接口               | 方法 | 参数         | 预期结果      | 备注          |
| -------- | ------------------ | ---- | ------------ | ------------- | ------------- |
| U-1      | /admin/user/list   | GET  | -            | 返回用户列表  | 需带 token    |
| U-2      | /admin/user/add    | POST | 用户信息     | 新增成功      | 需带 token    |
| U-3      | /admin/user/edit   | POST | 用户信息     | 编辑成功      | 需带 token    |
| U-4      | /admin/user/delete | POST | 用户id       | 删除成功      | 需带 token    |
| U-5      | /admin/user/list   | GET  | 无/错误token | 返回401未授权 | token失效用例 |

## 4. 其他管理端接口
| 用例编号 | 接口       | 方法 | 参数 | 预期结果 | 备注       |
| -------- | ---------- | ---- | ---- | -------- | ---------- |
| O-1      | /admin/xxx | ...  | ...  | ...      | 需带 token |

## 5. Token 失效/未登录用例
| 用例编号 | 场景      | 操作               | 预期结果              |
| -------- | --------- | ------------------ | --------------------- |
| T-1      | token失效 | 请求任意管理端接口 | 返回401，前端跳转登录 |
| T-2      | 未登录    | 请求任意管理端接口 | 返回401，前端跳转登录 |

---

**所有管理端接口均需先登录获取 token，后续请求需在请求头加 `Authorization: token`，否则返回未授权。**

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

---


