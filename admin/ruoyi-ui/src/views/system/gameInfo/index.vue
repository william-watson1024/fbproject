<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="游戏名称" prop="gameName">
        <el-input
          v-model="queryParams.gameName"
          placeholder="请输入游戏名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="游戏主播" prop="gameHost">
        <el-input
          v-model="queryParams.gameHost"
          placeholder="请输入游戏主播"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="房间号" prop="liveStreamId">
        <el-input
          v-model="queryParams.liveStreamId"
          placeholder="请输入房间号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="游戏局号" prop="gameRound">
        <el-input
          v-model="queryParams.gameRound"
          placeholder="请输入游戏局号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="开奖结果" prop="result">
        <el-input
          v-model="queryParams.result"
          placeholder="请输入开奖结果"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="游戏状态" prop="gameStatus">
        <el-select
          v-model="queryParams.gameStatus"
          placeholder="请选择游戏状态"
          clearable
          @change="handleQuery"
        >
          <el-option label="投注中" value="投注中" />
          <el-option label="封盘" value="封盘" />
          <el-option label="已结算" value="已结算" />
        </el-select>
      </el-form-item>
      <el-form-item label="游戏局流水号" prop="gameSerialNumber">
        <el-input
          v-model="queryParams.gameSerialNumber"
          placeholder="请输入游戏局流水号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="开局时间" prop="startTime">
        <el-date-picker clearable
          v-model="queryParams.startTime"
          type="datetime"
          value-format="yyyy-MM-dd HH:mm:ss"
          placeholder="请选择开局时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="实际封盘时间" prop="closeTime">
        <el-date-picker clearable
          v-model="queryParams.closeTime"
          type="datetime"
          value-format="yyyy-MM-dd HH:mm:ss"
          placeholder="请选择实际封盘时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="结算时间" prop="endTime">
        <el-date-picker clearable
          v-model="queryParams.endTime"
          type="datetime"
          value-format="yyyy-MM-dd HH:mm:ss"
          placeholder="请选择结算时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="游戏图片URL" prop="resultImage">
        <el-input
          v-model="queryParams.resultImage"
          placeholder="请输入游戏图片URL"
          clearable
          @keyup.enter.native="handleQuery"
        />
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
          v-hasPermi="['system:gameInfo:add']"
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
          v-hasPermi="['system:gameInfo:edit']"
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
          v-hasPermi="['system:gameInfo:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:gameInfo:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="gameInfoList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="游戏ID" align="center" prop="id" />
      <el-table-column label="游戏名称" align="center" prop="gameName" />
      <el-table-column label="游戏主播" align="center" prop="gameHost" />
      <el-table-column label="房间号" align="center" prop="liveStreamId" />
      <el-table-column label="游戏局号" align="center" prop="gameRound" />
      <el-table-column label="开奖结果" align="center" prop="result" />
      <el-table-column label="游戏状态" align="center" prop="gameStatus" />
      <el-table-column label="游戏局流水号" align="center" prop="gameSerialNumber" />
      <el-table-column label="开局时间" align="center" prop="startTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.startTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="实际封盘时间" align="center" prop="closeTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.closeTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="结算时间" align="center" prop="endTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.endTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="游戏图片" align="center" prop="resultImage">
        <template slot-scope="scope">
          <el-image
            v-if="scope.row.resultImage"
            :src="scope.row.resultImage"
            :preview-src-list="[scope.row.resultImage]"
            style="width: 75px; height: 75px; object-fit: cover; border: 1px solid #eee; cursor:pointer;"
            fit="cover"
          />
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:gameInfo:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:gameInfo:remove']"
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

    <!-- 添加或修改游戏信息管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="游戏名称" prop="gameName">
          <el-input v-model="form.gameName" placeholder="请输入游戏名称" />
        </el-form-item>
        <el-form-item label="游戏主播" prop="gameHost">
          <el-input v-model="form.gameHost" placeholder="请输入游戏主播" />
        </el-form-item>
        <el-form-item label="房间号" prop="liveStreamId">
          <el-input v-model="form.liveStreamId" placeholder="请输入房间号" />
        </el-form-item>
        <el-form-item label="游戏局号" prop="gameRound">
          <el-input v-model="form.gameRound" placeholder="请输入游戏局号" />
        </el-form-item>
        <el-form-item label="开奖结果" prop="result">
          <el-input v-model="form.result" placeholder="请输入开奖结果" />
        </el-form-item>
        <el-form-item label="游戏状态" prop="gameStatus">
          <el-select
            v-model="form.gameStatus"
            placeholder="请选择游戏状态"
            clearable
          >
            <el-option label="投注中" value="投注中" />
            <el-option label="封盘" value="封盘" />
            <el-option label="已结算" value="已结算" />
          </el-select>
        </el-form-item>
        <el-form-item label="游戏局流水号" prop="gameSerialNumber">
          <el-input v-model="form.gameSerialNumber" placeholder="请输入游戏局流水号" />
        </el-form-item>
        <el-form-item label="开局时间" prop="startTime">
          <el-date-picker clearable
            v-model="form.startTime"
            type="datetime"
            value-format="yyyy-MM-dd HH:mm:ss"
            placeholder="请选择开局时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="实际封盘时间" prop="closeTime">
          <el-date-picker clearable
            v-model="form.closeTime"
            type="datetime"
            value-format="yyyy-MM-dd HH:mm:ss"
            placeholder="请选择实际封盘时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="结算时间" prop="endTime">
          <el-date-picker clearable
            v-model="form.endTime"
            type="datetime"
            value-format="yyyy-MM-dd HH:mm:ss"
            placeholder="请选择结算时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="游戏图片上传" prop="resultImage">
          <el-upload
            action="/common/upload"
            :headers="uploadHeaders"
            :on-success="handlePictureSuccess"
            :before-upload="beforeUpload"
            list-type="picture-card"
            :file-list="dialogFileList"
            :limit="1"
            :on-remove="handleRemove"
            :on-preview="(file) => {}"
          >
            <i class="el-icon-plus"></i>
          </el-upload>
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
import { listGameInfo, getGameInfo, delGameInfo, addGameInfo, updateGameInfo } from "@/api/system/gameInfo"

export default {
  name: "GameInfo",
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
      // 游戏信息管理表格数据
      gameInfoList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        gameName: null,
        gameHost: null,
        liveStreamId: null,
        gameRound: null,
        result: null,
        gameStatus: null,
        gameSerialNumber: null,
        startTime: null,
        closeTime: null,
        endTime: null,
        resultImage: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        gameName: [
          { required: true, message: "游戏名称不能为空", trigger: "blur" }
        ],
        gameHost: [
          { required: true, message: "游戏主播不能为空", trigger: "blur" }
        ],
        liveStreamId: [
          { required: true, message: "房间号不能为空", trigger: "blur" }
        ],
        gameRound: [
          { required: true, message: "游戏局号不能为空", trigger: "blur" }
        ],
        result: [
          { required: true, message: "开奖结果不能为空", trigger: "blur" }
        ],
        gameStatus: [
          { required: true, message: "游戏状态不能为空", trigger: "blur" }
        ],
        gameSerialNumber: [
          { required: true, message: "游戏局流水号不能为空", trigger: "blur" }
        ],
        startTime: [
          { required: true, message: "开局时间不能为空", trigger: "blur" }
        ],
        closeTime: [
          { required: true, message: "实际封盘时间不能为空", trigger: "blur" }
        ],
        endTime: [
          { required: true, message: "结算时间不能为空", trigger: "blur" }
        ]
      },
      dialogFileList: [],
      uploadHeaders: {
        Authorization: 'Bearer ' + (localStorage.getItem('token') || '')
      },
      limit: 1,
    }
  },
  created() {
    this.getList()
  },
  methods: {
    /** 查询游戏信息管理列表 */
    getList() {
      this.loading = true
      listGameInfo(this.queryParams).then(response => {
        this.gameInfoList = response.rows
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
        gameName: null,
        gameHost: null,
        liveStreamId: null,
        gameRound: null,
        result: null,
        gameStatus: null,
        gameSerialNumber: null,
        startTime: null,
        closeTime: null,
        endTime: null,
        resultImage: null
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
      this.reset();
      this.open = true;
      this.title = "添加游戏信息管理";
      this.dialogFileList = [];
      this.form.resultImage = '';
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids;
      getGameInfo(id).then(response => {
        this.form = response.data;
        if (response.data.resultImage) {
          this.dialogFileList = [{ name: '游戏图片', url: response.data.resultImage }];
          this.form.resultImage = response.data.resultImage;
        } else {
          this.dialogFileList = [];
          this.form.resultImage = '';
        }
        this.open = true;
        this.title = "修改游戏信息管理";
      });
    },
    handlePictureSuccess(res, file) {
      if (res && res.code === 200 && res.url) {
        this.dialogFileList = [{ name: file.name, url: res.url }];
        this.form.resultImage = res.url;
      } else {
        this.$message.error('图片上传失败');
      }
    },
    handleRemove(file, fileList) {
      this.dialogFileList = fileList;
      if (fileList.length === 0) this.form.resultImage = '';
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.form.resultImage = (this.dialogFileList.length > 0 && this.dialogFileList[0].url) ? this.dialogFileList[0].url : '';
          if (this.form.id != null) {
            updateGameInfo(this.form).then(response => {
              // console.log(this.form.resultImage);
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addGameInfo(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除游戏信息管理编号为"' + ids + '"的数据项？').then(function() {
        return delGameInfo(ids)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/gameInfo/export', {
        ...this.queryParams
      }, `gameInfo_${new Date().getTime()}.xlsx`)
    },
    beforeUpload(file) {
      // 重命名为 image-room{直播间}time{游戏结束时间}.png
      const room = this.form.liveStreamId || 'unknown';
      let endTime = this.form.endTime;
      let endTimeStr = '';
      if (endTime) {
        if (typeof endTime === 'string') {
          // 期望格式 yyyy-MM-dd HH:mm:ss
          endTimeStr = endTime.replace(/[- :]/g, '').slice(0, 14);
        } else if (endTime instanceof Date) {
          const pad = n => n < 10 ? '0' + n : n;
          endTimeStr = `${endTime.getFullYear()}${pad(endTime.getMonth()+1)}${pad(endTime.getDate())}${pad(endTime.getHours())}${pad(endTime.getMinutes())}${pad(endTime.getSeconds())}`;
        }
      } else {
        const now = new Date();
        const pad = n => n < 10 ? '0' + n : n;
        endTimeStr = `${now.getFullYear()}${pad(now.getMonth()+1)}${pad(now.getDate())}${pad(now.getHours())}${pad(now.getMinutes())}${pad(now.getSeconds())}`;
      }
      const ext = '.png';

      const newName = `image-room${room}time${endTimeStr}${ext}`;
      console.log(newName);
      const renamedFile = new File([file], newName, { type: file.type });
      return Promise.resolve(renamedFile);
    },
  }
}
</script>
