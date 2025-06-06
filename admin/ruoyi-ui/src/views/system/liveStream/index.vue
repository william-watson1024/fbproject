<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="直播名称" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入直播名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="直播描述" prop="description">
        <el-input
          v-model="queryParams.description"
          placeholder="请输入直播描述"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="直播链接" prop="url">
        <el-input
          v-model="queryParams.url"
          placeholder="请输入直播链接"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="直播状态" prop="isActive">
        <el-select
          v-model="queryParams.isActive"
          placeholder="请选择直播状态"
          clearable
          @change="handleQuery"
        >
          <el-option label="直播中" :value="1"></el-option>
          <el-option label="未直播" :value="0"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="游戏类型" prop="gameType">
        <el-input
          v-model="queryParams.gameType"
          placeholder="请输入游戏类型"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="游戏主播名称" prop="gameHost">
        <el-input
          v-model="queryParams.gameHost"
          placeholder="请输入游戏主播名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="游戏开始时间" prop="gameStartTime">
        <el-date-picker clearable
          v-model="queryParams.gameStartTime"
          type="datetime"
          value-format="yyyy-MM-dd HH:mm:ss"
          placeholder="请选择游戏开始时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:liveStream:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:liveStream:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:liveStream:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:liveStream:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="liveStreamList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="直播ID" align="center" prop="id" />
      <el-table-column label="直播名称" align="center" prop="name" />
      <el-table-column label="直播描述" align="center" prop="description" />
      <el-table-column label="直播链接" align="center" prop="url" />
      <el-table-column label="直播状态" align="center" width="100">
        <template slot-scope="scope">
          <el-switch
            v-model="scope.row.isActive"
            :active-value="1"
            :inactive-value="0"
            @change="handleStatusChange($event, scope.row)"
          ></el-switch>
        </template>
      </el-table-column>
      <el-table-column label="游戏类型" align="center" prop="gameType" />
      <el-table-column label="游戏主播名称" align="center" prop="gameHost" />
      <el-table-column label="游戏开始时间" align="center" prop="gameStartTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.gameStartTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:liveStream:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:liveStream:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改直播网站管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="直播名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入直播名称" />
        </el-form-item>
        <el-form-item label="直播描述" prop="description">
          <el-input v-model="form.description" placeholder="请输入直播描述" />
        </el-form-item>
        <el-form-item label="直播链接" prop="url">
          <el-input v-model="form.url" placeholder="请输入直播链接" />
        </el-form-item>
        <el-form-item label="直播状态" prop="isActive">
          <el-select v-model="form.isActive" placeholder="请选择直播状态" clearable>
            <el-option label="直播中" :value="1"></el-option>
            <el-option label="未直播" :value="0"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="游戏类型" prop="gameType">
          <el-input v-model="form.gameType" placeholder="请输入游戏类型" />
        </el-form-item>
        <el-form-item label="游戏主播名称" prop="gameHost">
          <el-input v-model="form.gameHost" placeholder="请输入游戏主播名称" />
        </el-form-item>
        <el-form-item label="游戏开始时间" prop="gameStartTime">
          <el-date-picker clearable
            v-model="form.gameStartTime"
            type="datetime"
            value-format="yyyy-MM-dd HH:mm:ss"
            placeholder="请选择游戏开始时间">
          </el-date-picker>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {
  listLiveStream,
  getLiveStream,
  delLiveStream,
  addLiveStream,
  updateLiveStream,
  changeLiveStreamStatus
} from "@/api/system/liveStream"

export default {
  name: "LiveStream",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 直播网站管理表格数据
      liveStreamList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
        description: null,
        url: null,
        isActive: null,
        gameType: null,
        gameHost: null,
        gameStartTime: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        name: [
          { required: true, message: "直播名称不能为空", trigger: "blur" }
        ],
        description: [
          { required: true, message: "直播描述不能为空", trigger: "blur" }
        ],
        url: [
          { required: true, message: "直播链接不能为空", trigger: "blur" }
        ],
        isActive: [
          { required: true, message: "直播状态不能为空", trigger: "blur" }
        ],
        gameType: [
          { required: true, message: "游戏类型不能为空", trigger: "blur" }
        ],
        gameHost: [
          { required: true, message: "游戏主播名称不能为空", trigger: "blur" }
        ],
        gameStartTime: [
          { required: true, message: "游戏开始时间不能为空", trigger: "blur" }
        ]
      }
    }
  },
  created() {
    this.getList()
  },
  methods: {
    /** 查询直播网站管理列表 */
    getList() {
      this.loading = true
      listLiveStream(this.queryParams).then(response => {
        this.liveStreamList = response.rows
        this.total = response.total
        this.loading = false
      })
    },
    // 取消按钮
    cancel() {
      this.open = false
      this.reset()
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        name: null,
        description: null,
        url: null,
        isActive: null,
        gameType: null,
        gameHost: null,
        gameStartTime: null
      }
      this.resetForm("form")
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1
      this.getList()
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm")
      this.handleQuery()
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加直播网站管理"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const id = row.id || this.ids
      getLiveStream(id).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改直播网站管理"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateLiveStream(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addLiveStream(this.form).then(response => {
              this.$modal.msgSuccess("新增成功")
              this.open = false
              this.getList()
            })
          }
        }
      })
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids
      this.$modal.confirm('是否确认删除直播网站管理编号为"' + ids + '"的数据项？').then(function() {
        return delLiveStream(ids)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/liveStream/export', {
        ...this.queryParams
      }, `liveStream_${new Date().getTime()}.xlsx`)
    },
    handleStatusChange(newVal, row) {
      const originalStatus = row.isActive  // 当前真实值
      const newStatus = newVal            // 用户点击后的新值
      const text = newStatus === 1 ? '开启' : '关闭'

      // 先将 row.status 改为原值，避免 UI 预切换
      row.isActive = originalStatus

      this.$modal.confirm(`确认要${text}“${row.id}”直播间吗？`)
        .then(() => {
          return changeLiveStreamStatus(row.id, newStatus)
        })
        .then(() => {
          row.isActive = newStatus    // 用户确认后才更新状态
          this.getList()
          this.$modal.msgSuccess(`${text}成功`)
        })
        .catch(() => {
          // 用户取消，row.isActive 保持原值，switch UI恢复
        })
    }
  }
}
</script>
