<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="应用标识" prop="code">
        <el-input
          v-model="queryParams.code"
          placeholder="请输入应用标识"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="应用描述" prop="description">
        <el-input
          v-model="queryParams.description"
          placeholder="请输入应用描述"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否需要服务授权 0 否  1 是" prop="svcAuthorization">
        <el-input
          v-model="queryParams.svcAuthorization"
          placeholder="请输入是否需要服务授权 0 否  1 是"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="创建时间" prop="createOn">
        <el-date-picker clearable
                        v-model="queryParams.createOn"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="请选择创建时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="修改时间" prop="updateOn">
        <el-date-picker clearable
                        v-model="queryParams.updateOn"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="请选择修改时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="扩展字段1" prop="extend1">
        <el-input
          v-model="queryParams.extend1"
          placeholder="请输入扩展字段1"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="扩展字段2" prop="extend2">
        <el-input
          v-model="queryParams.extend2"
          placeholder="请输入扩展字段2"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="扩展字段3" prop="extend3">
        <el-input
          v-model="queryParams.extend3"
          placeholder="请输入扩展字段3"
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
          v-hasPermi="['system:globalApp:add']"
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
          v-hasPermi="['system:globalApp:edit']"
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
          v-hasPermi="['system:globalApp:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:globalApp:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="globalAppList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="应用ID" align="center" prop="id" v-if="true"/>
      <el-table-column label="应用标识" align="center" prop="code" />
      <el-table-column label="应用描述" align="center" prop="description" />
      <el-table-column label="认证方式 1 访问密钥  0 无认证" align="center" prop="authType" />
      <el-table-column label="是否需要服务授权 0 否  1 是" align="center" prop="svcAuthorization" />
      <el-table-column label="应用状态, 状态：0: 停用  1：启用" align="center" prop="status" />
      <el-table-column label="创建时间" align="center" prop="createOn" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createOn, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="修改时间" align="center" prop="updateOn" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.updateOn, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="扩展字段1" align="center" prop="extend1" />
      <el-table-column label="扩展字段2" align="center" prop="extend2" />
      <el-table-column label="扩展字段3" align="center" prop="extend3" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:globalApp:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:globalApp:remove']"
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

    <!-- 添加或修改全局应用对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="应用标识" prop="code">
          <el-input v-model="form.code" placeholder="请输入应用标识" />
        </el-form-item>
        <el-form-item label="应用描述" prop="description">
          <el-input v-model="form.description" placeholder="请输入应用描述" />
        </el-form-item>
        <el-form-item label="是否需要服务授权 0 否  1 是" prop="svcAuthorization">
          <el-input v-model="form.svcAuthorization" placeholder="请输入是否需要服务授权 0 否  1 是" />
        </el-form-item>
        <el-form-item label="创建时间" prop="createOn">
          <el-date-picker clearable
                          v-model="form.createOn"
                          type="datetime"
                          value-format="yyyy-MM-dd HH:mm:ss"
                          placeholder="请选择创建时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="修改时间" prop="updateOn">
          <el-date-picker clearable
                          v-model="form.updateOn"
                          type="datetime"
                          value-format="yyyy-MM-dd HH:mm:ss"
                          placeholder="请选择修改时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="扩展字段1" prop="extend1">
          <el-input v-model="form.extend1" placeholder="请输入扩展字段1" />
        </el-form-item>
        <el-form-item label="扩展字段2" prop="extend2">
          <el-input v-model="form.extend2" placeholder="请输入扩展字段2" />
        </el-form-item>
        <el-form-item label="扩展字段3" prop="extend3">
          <el-input v-model="form.extend3" placeholder="请输入扩展字段3" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button :loading="buttonLoading" type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listGlobalApp, getGlobalApp, delGlobalApp, addGlobalApp, updateGlobalApp } from "@/api/system/globalApp";

export default {
  name: "GlobalApp",
  data() {
    return {
      // 按钮loading
      buttonLoading: false,
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
      // 全局应用表格数据
      globalAppList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        code: undefined,
        description: undefined,
        authType: undefined,
        svcAuthorization: undefined,
        status: undefined,
        createOn: undefined,
        updateOn: undefined,
        extend1: undefined,
        extend2: undefined,
        extend3: undefined,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        id: [
          { required: true, message: "应用ID不能为空", trigger: "blur" }
        ],
        code: [
          { required: true, message: "应用标识不能为空", trigger: "blur" }
        ],
        createOn: [
          { required: true, message: "创建时间不能为空", trigger: "blur" }
        ],
        version: [
          { required: true, message: "不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询全局应用列表 */
    getList() {
      this.loading = true;
      listGlobalApp(this.queryParams).then(response => {
        this.globalAppList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: undefined,
        code: undefined,
        description: undefined,
        authType: undefined,
        svcAuthorization: undefined,
        status: undefined,
        createBy: undefined,
        createOn: undefined,
        updateBy: undefined,
        updateOn: undefined,
        extend1: undefined,
        extend2: undefined,
        extend3: undefined,
        version: undefined
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
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
      this.title = "添加全局应用";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.loading = true;
      this.reset();
      const id = row.id || this.ids
      getGlobalApp(id).then(response => {
        this.loading = false;
        this.form = response.data;
        this.open = true;
        this.title = "修改全局应用";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.buttonLoading = true;
          if (this.form.id != null) {
            updateGlobalApp(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            }).finally(() => {
              this.buttonLoading = false;
            });
          } else {
            addGlobalApp(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            }).finally(() => {
              this.buttonLoading = false;
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除全局应用编号为"' + ids + '"的数据项？').then(() => {
        this.loading = true;
        return delGlobalApp(ids);
      }).then(() => {
        this.loading = false;
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
      }).finally(() => {
        this.loading = false;
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/globalApp/export', {
        ...this.queryParams
      }, `globalApp_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
