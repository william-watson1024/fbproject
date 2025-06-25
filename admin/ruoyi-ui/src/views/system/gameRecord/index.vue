<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="下注用户ID" prop="gameUserId">
        <el-input
          v-model="queryParams.gameUserId"
          placeholder="请输入下注用户ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="下注用户账号" prop="gameUserAccount">
        <el-input
          v-model="queryParams.gameUserAccount"
          placeholder="请输入下注用户账号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="直播房间ID" prop="liveStreamId">
        <el-input
          v-model="queryParams.liveStreamId"
          placeholder="请输入直播房间ID"
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
      <el-form-item label="下注金额" prop="betNum">
        <el-input
          v-model="queryParams.betNum"
          placeholder="请输入下注金额"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="下注名称" prop="betName">
        <el-input
          v-model="queryParams.betName"
          placeholder="请输入下注名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="备注" prop="betContent">
        <el-input
          v-model="queryParams.betContent"
          placeholder="请输入备注"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="下注状态" prop="isActive">
        <el-select
          v-model="queryParams.isActive"
          placeholder="请选择下注状态"
          clearable
          @change="handleQuery"
        >
          <el-option label="已处理" :value="0" />
          <el-option label="未处理" :value="1" />
        </el-select>
      </el-form-item>
      <el-form-item label="下注时间" prop="betTime">
        <el-date-picker clearable
          v-model="queryParams.betTime"
          type="datetime"
          value-format="yyyy-MM-dd HH:mm:ss"
          placeholder="请选择下注时间">
        </el-date-picker>
      </el-form-item>
      <!-- <el-form-item label="结算图片URL" prop="resultImage"> -->
        <!-- 移除图片搜索栏 -->
      <!-- </el-form-item> -->
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
          v-hasPermi="['system:gameRecord:add']"
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
          v-hasPermi="['system:gameRecord:edit']"
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
          v-hasPermi="['system:gameRecord:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:gameRecord:export']"
        >导出</el-button>
      </el-col>
      <!-- 新增的“设置赔率”按钮 -->
      <el-col :span="2">
        <el-button
          type="info"
          plain
          icon="el-icon-setting"
          size="mini"
          @click="showOddsDialog"
        >设置赔率</el-button>
      </el-col>
      <!-- 新增的“结算”按钮 -->
      <el-col :span="2">
        <el-button
          type="primary"
          plain
          icon="el-icon-check"
          size="mini"
          @click="handleSettlement"
        >结算</el-button>
      </el-col>

      <!-- 新增的“开启下一局”复选框
      <el-col :span="2">
        <el-checkbox v-model="nextRoundEnabled" size="mini">开启下一局</el-checkbox>
      </el-col> -->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="gameRecordList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="下注ID" align="center" prop="id" />
      <el-table-column label="下注用户ID" align="center" prop="gameUserId" />
      <el-table-column label="下注用户账号" align="center" prop="gameUserAccount" />
      <el-table-column label="直播房间ID" align="center" prop="liveStreamId" />
      <el-table-column label="游戏类型" align="center" prop="gameType" />
      <el-table-column label="游戏局号" align="center" prop="gameRound" />
      <el-table-column label="下注金额" align="center" prop="betNum" />
      <el-table-column label="下注名称" align="center" prop="betName" />
      <el-table-column label="备注" align="center" prop="betContent" />
      <el-table-column label="下注状态" align="center" prop="isActive">
        <template #default="{ row }">
          <span>
            {{ row.isActive === 0 ? '已处理' : '未处理' }}
          </span>
        </template>
      </el-table-column>

      <el-table-column label="下注时间" align="center" prop="betTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.betTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>
      <!-- 移除表格图片列 -->
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:gameRecord:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:gameRecord:remove']"
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

    <!-- 添加或修改游戏记录管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="下注用户ID" prop="gameUserId">
          <el-input v-model="form.gameUserId" placeholder="请输入下注用户ID" />
        </el-form-item>
        <el-form-item label="下注用户账号" prop="gameUserAccount">
          <el-input v-model="form.gameUserAccount" placeholder="请输入下注用户账号" />
        </el-form-item>
        <el-form-item label="直播房间ID" prop="liveStreamId">
          <el-input v-model="form.liveStreamId" placeholder="请输入直播房间ID" />
        </el-form-item>
        <el-form-item label="游戏类型" prop="gameType">
          <el-input v-model="form.gameType" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="游戏局号" prop="gameRound">
          <el-input v-model="form.gameRound" placeholder="请输入游戏局号" />
        </el-form-item>
        <el-form-item label="下注金额" prop="betNum">
          <el-input v-model="form.betNum" placeholder="请输入下注金额" />
        </el-form-item>
        <el-form-item label="下注名称" prop="betName">
          <el-input v-model="form.betName" placeholder="请输入下注名称" />
        </el-form-item>
        <el-form-item label="备注" prop="betContent">
          <el-input v-model="form.betContent" placeholder="请输入备注" />
        </el-form-item>
        <el-form-item label="下注状态" prop="isActive">
          <el-select
            v-model="form.isActive"
            placeholder="请选择下注状态"
            clearable
          >
            <el-option label="已处理" :value="0" />
            <el-option label="未处理" :value="1" />
          </el-select>
        </el-form-item>
        <el-form-item label="下注时间" prop="betTime">
          <el-date-picker clearable
            v-model="form.betTime"
            type="datetime"
            value-format="yyyy-MM-dd HH:mm:ss"
            placeholder="请选择下注时间">
          </el-date-picker>
        </el-form-item>
        <!-- 移除弹窗图片上传 -->
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
    <!-- 新增的“设置赔率”弹窗 -->
    <el-dialog
      title="设置直播间赔率与开奖结果"
      :visible.sync="oddsDialogVisible"
      width="400px"
    >
      <el-form :model="tempForm" label-width="120px" size="small">
        <el-form-item label="直播间ID">
          <el-input v-model="tempForm.liveStreamId" placeholder="请输入直播间ID" clearable />
        </el-form-item>

        <el-form-item label="第一个骰子">
          <el-select v-model="tempForm.dice1" placeholder="请选择">
            <el-option
              v-for="(icon, name) in animalIcons"
              :key="name"
              :label="name + ' ' + icon"
              :value="name"
            />
          </el-select>
        </el-form-item>

        <el-form-item label="第二个骰子">
          <el-select v-model="tempForm.dice2" placeholder="请选择">
            <el-option
              v-for="(icon, name) in animalIcons"
              :key="name"
              :label="name + ' ' + icon"
              :value="name"
            />
          </el-select>
        </el-form-item>

        <el-form-item label="第三个骰子">
          <el-select v-model="tempForm.dice3" placeholder="请选择">
            <el-option
              v-for="(icon, name) in animalIcons"
              :key="name"
              :label="name + ' ' + icon"
              :value="name"
            />
          </el-select>
        </el-form-item>

        <el-form-item label="中一只赔率">
          <el-input v-model="tempForm.odds1" placeholder="请输入中一只赔率" clearable type="number" />
        </el-form-item>

        <el-form-item label="中两只赔率">
          <el-input v-model="tempForm.odds2" placeholder="请输入中两只赔率" clearable type="number" />
        </el-form-item>

        <el-form-item label="中三只赔率">
          <el-input v-model="tempForm.odds3" placeholder="请输入中三只赔率" clearable type="number" />
        </el-form-item>

        <el-form-item label="开奖结果图片">
          <el-upload
            class="upload-demo"
            action="/common/upload"
            :headers="uploadHeaders"
            :on-preview="handleOddsPreview"
            :on-remove="handleOddsRemove"
            :before-upload="beforeOddsUpload"
            :file-list="oddsFileList"
            list-type="picture"
            :on-success="handleOddsUploadSuccess"
            with-credentials
          >
            <el-button size="small" type="primary">点击上传</el-button>
          </el-upload>
          <div v-if="oddsUploadedImageUrl" style="margin-top: 10px;">
            <img :src="oddsUploadedImageUrl" alt="预览" style="max-width: 200px; max-height: 200px; border: 1px solid #eee;" />
          </div>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="confirmOdds">确 定</el-button>
        <el-button >取 消</el-button>
      </div>
    </el-dialog>

  </div>
</template>

<script>
import { listGameRecord, getGameRecord, delGameRecord, addGameRecord, updateGameRecord ,settleGameRecord} from "@/api/system/gameRecord"


export default {
  name: "GameRecord",
  data() {
    return {
      animalIcons: {
        "Hươu": "🦌",
        "Bầu": "🎃",
        "Gà": "🐔",
        "Cá": "🐟",
        "Cua": "🦀",
        "Tôm": "🦐"
      },
      tempForm: {
        liveStreamId: '',
        dice1: '',
        dice2: '',
        dice3: '',
        odds1: '',
        odds2: '',
        odds3: ''
      },
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
      // 游戏记录管理表格数据
      gameRecordList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        gameUserId: null,
        gameUserAccount: null,
        liveStreamId: null,
        gameType: null,
        gameRound: null,
        betNum: null,
        betName: null,
        betContent: null,
        isActive: null,
        betTime: null,
        resultImage: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        gameUserId: [
          {required: true, message: "下注用户ID不能为空", trigger: "blur"}
        ],
        gameUserAccount: [
          {required: true, message: "下注用户账号不能为空", trigger: "blur"}
        ],
        liveStreamId: [
          {required: true, message: "直播房间ID不能为空", trigger: "blur"}
        ],
        gameType: [
          {required: true, message: "游戏类型不能为空", trigger: "blur"}
        ],
        gameRound: [
          {required: true, message: "游戏局号不能为空", trigger: "blur"}
        ],
        betNum: [
          {required: true, message: "下注金额不能为空", trigger: "blur"}
        ],
        betName: [
          {required: true, message: "下注名称不能为空", trigger: "blur"}
        ],
        betContent: [
          {required: true, message: "备注不能为空", trigger: "blur"}
        ],
        isActive: [
          {required: true, message: "下注状态不能为空", trigger: "blur"}
        ],
        betTime: [
          {required: true, message: "下注时间不能为空", trigger: "blur"}
        ]
      },
      // =================== 新增“设置赔率”相关数据 ===================
      // 是否显示“设置赔率”弹窗
      oddsDialogVisible: false,
      // 临时编辑变量：打开弹窗时用于绑定输入
      tempLiveStreamId: null,
      tempOdds: null,
      tempResult: null,
      // 持久化存储：只有点击“确定”后才会覆盖
      persistLiveStreamId: null,
      persistOdds: null,
      persistResult: null,
      // ====== 新增的“结算”与“下一局”相关数据 ======
      nextRoundEnabled: false, // 是否开启下一局
      // ==============================================================
      // 新增：上传图片的 fileList（仅用于弹窗，和表格无关）
      // dialogFileList: [],
      dialogVisible: false,
      dialogImageUrl: '',
      uploadHeaders: {
        Authorization: 'Bearer ' + (localStorage.getItem('token') || '')
      },
      limit: 1,
      // 新增：上传图片的 fileList（设置赔率弹窗专用）
      oddsFileList: [],
      oddsUploadedImageUrl: '',
    }
  },
  created() {
    this.getList()
  },
  methods: {
    /** 查询游戏记录管理列表 */
    getList() {
      this.loading = true
      listGameRecord(this.queryParams).then(response => {
        this.gameRecordList = response.rows
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
        gameUserId: null,
        gameUserAccount: null,
        liveStreamId: null,
        gameType: null,
        gameRound: null,
        betNum: null,
        betName: null,
        betContent: null,
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
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加游戏记录管理";
      // this.dialogFileList = [];
      this.form.resultImage = '';
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids;
      getGameRecord(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改游戏记录管理";
      });
    },
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateGameRecord(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addGameRecord(this.form).then(response => {
              this.$modal.msgSuccess("新增成功")
              this.open = false
              this.getList()
            })
          }
        }
      })
    },
    settleGameRecord(payload) {
      return settleGameRecord(payload);
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids
      this.$modal.confirm('是否确认删除游戏记录管理编号为"' + ids + '"的数据项？').then(function () {
        return delGameRecord(ids)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {
      })
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/gameRecord/export', {
        ...this.queryParams
      }, `gameRecord_${new Date().getTime()}.xlsx`)
    },
    // =================== 新增“设置赔率”相关方法 ===================
    /** 点击“设置赔率”按钮，打开弹窗前先把临时变量设为上一次已保存的数据 */
    showOddsDialog() {
      this.oddsDialogVisible = true;
      // 打开弹窗时清空专用图片状态，避免影响其他页面
      this.oddsFileList = [];
      this.oddsUploadedImageUrl = '';
    },
    /** 点击弹窗“确定” */
    confirmOdds() {
      // 简单校验：直播间ID、三个骰子、赔率不能为空
      if (
        !this.tempForm.liveStreamId ||
        !this.tempForm.dice1 ||
        !this.tempForm.dice2 ||
        !this.tempForm.dice3 ||
        !this.tempForm.odds1 ||
        !this.tempForm.odds2 ||
        !this.tempForm.odds3
      ) {
        this.$message.warning("请完整填写直播间ID、三个骰子结果和所有赔率！");
        return;
      }

      // 保存数据：可以根据你业务是否需要持久化，这里我直接赋值给持久变量（和你原逻辑保持一致）
      this.persistLiveStreamId = this.tempForm.liveStreamId;
      this.persistDice1 = this.tempForm.dice1;
      this.persistDice2 = this.tempForm.dice2;
      this.persistDice3 = this.tempForm.dice3;
      this.persistOdds1 = this.tempForm.odds1;
      this.persistOdds2 = this.tempForm.odds2;
      this.persistOdds3 = this.tempForm.odds3;
      this.persistFileList = this.fileList;
      this.persistImageUrl = this.oddsUploadedImageUrl;

      this.oddsDialogVisible = false;
      this.$message.success("赔率设置已保存");
    },

    /** 结算处理 */
    handleSettlement() {
      console.log("开始结算");

      // 校验：必须有完整数据
      if (
        !this.persistLiveStreamId ||
        !this.persistDice1 || !this.persistDice2 || !this.persistDice3 ||
        !this.persistOdds1 || !this.persistOdds2 || !this.persistOdds3
      ) {
        this.$message.warning("请先在‘设置赔率’中完整填写数据！");
        return;
      }

      // 构造请求参数，注意这里你要和后端统一好字段名称
      const payload = {
        liveStreamId: this.persistLiveStreamId,
        result: [this.persistDice1, this.persistDice2, this.persistDice3],
        odds: {
          one: this.persistOdds1,
          two: this.persistOdds2,
          three: this.persistOdds3
        },
        nextRoundEnabled: this.nextRoundEnabled,
        resultImage: this.oddsUploadedImageUrl || null // 结算时传递图片URL
      };

      // 发起结算请求
      this.settleGameRecord(payload)
        .then(() => {
          this.$message.success("结算成功！");
          if (this.nextRoundEnabled) {
            this.$message.success("已开启下一局");
          }
          this.getList();
        })
        .catch(() => {
          this.$message.error("结算失败，请重试！");
        });
    },
    // 上传图片成功后回调，保存图片URL
    handleUploadSuccess(response, file, fileList) {
      // 若依 /common/upload 返回 { code: 200, url: '图片URL', ... }
      console.log('上传成功返回：', response);
      if (response && response.code === 200 && response.url) {
        let previewUrl = response.url;
        if (response.url.startsWith('/')) {
          previewUrl = window.location.origin + response.url;
        }
        this.uploadedImageUrl = previewUrl;
        this.fileList = [{ name: file.name, url: previewUrl }];
      } else {
        this.$message.error('图片上传失败');
      }
    },
    // 上传图片时重命名为 image-room{直播间}time{游戏结束时间}.png
    handleUploadRequest(file) {
      // 重命名为 image-room{直播间}time{游戏结束时间}.png
      const room = this.tempForm.liveStreamId || 'unknown';
      let endTime = this.tempForm.endTime;
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
      const renamedFile = new File([file], newName, { type: file.type });
      return Promise.resolve(renamedFile);
      // 调试输出
      console.log('[图片上传重命名调试]', {
        原始名: file.name,
        新名: newName,
        endTime,
        endTimeStr,
        room,
        fileObj: renamedFile
      });
      return renamedFile;
    },
    // el-upload before-upload 钩子
    beforeUpload(file) {
      // 只允许图片
      const isImage = file.type.startsWith('image/');
      if (!isImage) {
        this.$message.error('只能上传图片文件');
        return false;
      }
      // 重命名
      const renamedFile = this.handleUploadRequest(file);
      this.uploadedFile = renamedFile;
      return renamedFile;
    },
    // 设置赔率弹窗专用图片上传逻辑
    beforeOddsUpload(file) {
      // 只允许图片
      const isImage = file.type.startsWith('image/');
      if (!isImage) {
        this.$message.error('只能上传图片文件');
        return false;
      }
      // 调用重命名逻辑并调试输出
      const renamedFile = this.handleUploadRequest(file);
      // 调试：输出重命名结果
      console.log('[赔率弹窗图片上传重命名调试]', {
        原始名: file.name,
        新名: renamedFile.name,
        fileObj: renamedFile
      });
      return renamedFile;
    },
    handleOddsUploadSuccess(response, file, fileList) {
      if (response && response.code === 200 && response.url) {
        let previewUrl = response.url;
        if (response.url.startsWith('/')) {
          previewUrl = window.location.origin + response.url;
        }
        this.oddsUploadedImageUrl = previewUrl;
        this.oddsFileList = [{ name: file.name, url: previewUrl }];
      } else {
        this.$message.error('图片上传失败');
      }
    },
    handleOddsRemove(file, fileList) {
      this.oddsFileList = fileList;
      if (fileList.length === 0) this.oddsUploadedImageUrl = '';
    },
    handleOddsPreview(file) {
      window.open(file.url);
    },
  }
}
</script>
