<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="下注用户id号" prop="myFbuserId">
        <el-input
          v-model="queryParams.myFbuserId"
          placeholder="请输入下注用户id号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="下注用户账号" prop="myFbuserAccount">
        <el-input
          v-model="queryParams.myFbuserAccount"
          placeholder="请输入下注用户账号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="下注数量" prop="betNum">
        <el-input
          v-model="queryParams.betNum"
          placeholder="请输入下注数量"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="下注名" prop="betName">
        <el-input
          v-model="queryParams.betName"
          placeholder="请输入下注名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="下注处理状态" prop="isActive">
        <el-input
          v-model="queryParams.isActive"
          placeholder="请输入下注处理状态"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="下注时间" prop="betTime">
        <el-date-picker clearable
            v-model="form.betTime"
            type="datetime"
            value-format="yyyy-MM-dd HH:mm:ss"
            placeholder="请选择下注时间">
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
          v-hasPermi="['system:mybetrecord:add']"
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
          v-hasPermi="['system:mybetrecord:edit']"
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
          v-hasPermi="['system:mybetrecord:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:mybetrecord:export']"
        >导出</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-download"
          size="medium"
          @click="handleCount"
          v-hasPermi="['system:mybetrecord:export']"
        >自动结算</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="mybetrecordList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="下注id" align="center" prop="id" />
      <el-table-column label="下注用户id号" align="center" prop="myFbuserId" />
      <el-table-column label="下注用户账号" align="center" prop="myFbuserAccount" />
      <el-table-column label="下注数量" align="center" prop="betNum" />
      <el-table-column label="下注名" align="center" prop="betName" />
      <el-table-column label="下注处理状态" align="center" prop="isActive" />
      <el-table-column label="下注时间" align="center" prop="betTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.betTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:mybetrecord:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:mybetrecord:remove']"
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

    <!-- 添加或修改下注信息管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="下注用户id号" prop="myFbuserId">
          <el-input v-model="form.myFbuserId" placeholder="请输入下注用户id号" />
        </el-form-item>
        <el-form-item label="下注用户账号" prop="myFbuserAccount">
          <el-input v-model="form.myFbuserAccount" placeholder="请输入下注用户账号" />
        </el-form-item>
        <el-form-item label="下注数量" prop="betNum">
          <el-input v-model="form.betNum" placeholder="请输入下注数量" />
        </el-form-item>
        <el-form-item label="下注名" prop="betName">
          <el-input v-model="form.betName" placeholder="请输入下注名" />
        </el-form-item>
        <el-form-item label="下注处理状态" prop="isActive">
          <el-input v-model="form.isActive" placeholder="请输入下注处理状态" />
        </el-form-item>
        <el-form-item label="下注时间" prop="betTime">
          <el-date-picker clearable
                v-model="form.betTime"
                type="datetime"
                value-format="yyyy-MM-dd HH:mm:ss"
                placeholder="请选择下注时间">
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
  listMybetrecord,
  getMybetrecord,
  delMybetrecord,
  addMybetrecord,
  updateMybetrecord,
  processBetRecord
} from "@/api/system/mybetrecord"

export default {
  name: "Mybetrecord",
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
      // 下注信息管理表格数据
      mybetrecordList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        myFbuserId: null,
        myFbuserAccount: null,
        betNum: null,
        betName: null,
        isActive: null,
        betTime: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    }
  },
  created() {
    this.getList()
  },
  methods: {
    /** 查询下注信息管理列表 */
    getList() {
      this.loading = true
      listMybetrecord(this.queryParams).then(response => {
        this.mybetrecordList = response.rows
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
        myFbuserId: null,
        myFbuserAccount: null,
        betNum: null,
        betName: null,
        isActive: null,
        betTime: null
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
      this.title = "添加下注信息管理"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const id = row.id || this.ids
      getMybetrecord(id).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改下注信息管理"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateMybetrecord(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addMybetrecord(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除下注信息管理编号为"' + ids + '"的数据项？').then(function() {
        return delMybetrecord(ids)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/mybetrecord/export', {
        ...this.queryParams
      }, `mybetrecord_${new Date().getTime()}.xlsx`)
    },
    /** 处理下注记录操作 */
    handleCount() {
      this.$prompt('请输入倍率（正整数）', '处理下注记录', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        inputPattern: /^[1-9]\d*$/,
        inputErrorMessage: '请输入有效的正整数倍率',
        type: 'warning'
      })
        .then(({ value: multiple }) => {
          this.$prompt('请输入下注名称（bet_name）', '处理下注记录', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            inputPattern: /.+/,
            inputErrorMessage: '下注名称不能为空',
            type: 'warning'
          })
            .then(({ value: betName }) => {
              this.$modal
                .confirm(`是否确认处理所有状态为1的下注记录，并将下注名称为 "${betName}" 的记录的用户积分增加相应的值？`)
                .then(() => {
                  console.log(`处理下注记录：倍率=${multiple}, 下注名称=${betName}`);
                  return processBetRecord({ betName, multiple: Number(multiple) });
                })
                .then(() => {
                  this.getList(); // 刷新列表
                  this.$modal.msgSuccess('处理成功');
                })
                .catch(() => {
                  this.$modal.msgError('处理失败，请重试');
                });
            })
            .catch(() => {
              this.$modal.msgWarning('已取消输入下注名称');
            });
        })
        .catch(() => {
          this.$modal.msgWarning('已取消输入倍率');
        });
    }

  }
}
</script>
