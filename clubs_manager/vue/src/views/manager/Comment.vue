<template>
    <div>
        <!-- 搜索框 -->
        <div class="search">
            <el-input placeholder="请输入评论内容" style="width: 200px" v-model="content"></el-input>
            <el-button type="info" plain style="margin-left: 10px" @click="load(1)">查询</el-button>
            <el-button type="warning" plain style="margin-left: 10px" @click="reset">重置</el-button>
        </div>

        <!-- 操作按钮 -->
        <div class="operation">
            <el-button type="danger" plain @click="delBatch">批量删除</el-button>
        </div>

        <!-- 表格 -->
        <div class="table">
            <el-table :data="tableData" stripe @selection-change="handleSelectionChange">
                <el-table-column type="selection" width="55" align="center"></el-table-column>
                <el-table-column prop="id" label="序号" width="80" align="center" sortable></el-table-column>
                <el-table-column prop="content" label="评论内容" show-overflow-tooltip></el-table-column>
                <el-table-column prop="time" label="评论时间"></el-table-column>
                <el-table-column prop="userName" label="评论人"></el-table-column>
                <el-table-column prop="departmentName" label="评论社团"></el-table-column>

                <el-table-column label="操作" width="180" align="center">
                    <template v-slot="scope">
                        <el-button plain type="danger" size="mini" @click="del(scope.row.id)">删除</el-button>
                    </template>
                </el-table-column>
            </el-table>

            <!-- 分页 -->
            <div class="pagination">
                <el-pagination
                        background
                        @current-change="handleCurrentChange"
                        :current-page="pageNum"
                        :page-sizes="[5, 10, 20]"
                        :page-size="pageSize"
                        layout="total, prev, pager, next"
                        :total="total">
                </el-pagination>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: "Comment",
        data() {
            return {
                tableData: [],  // 表格数据
                pageNum: 1,   // 当前页码
                pageSize: 10,  // 每页显示条数
                total: 0,  // 总记录数
                content: null,  // 搜索内容
                fromVisible: false,
                form: {},
                user: JSON.parse(localStorage.getItem('xm-user') || '{}'),
                rules: {},
                ids: []
            };
        },
        created() {
            this.load(this.pageNum);  // 初始化加载数据
        },
        methods: {
            // 删除单条评论
            del(id) {
                this.$confirm('您确定删除吗？', '确认删除', { type: "warning" }).then(() => {
                    this.$request.delete(`/comment/delete/${id}`).then(res => {
                        if (res.code === '200') {
                            this.$message.success('删除成功');
                            this.load(this.pageNum);  // 删除后重新加载当前页数据
                        } else {
                            this.$message.error(res.msg);
                        }
                    });
                }).catch(() => {});
            },
            // 批量删除选中评论
            delBatch() {
                if (!this.ids.length) {
                    this.$message.warning('请选择数据');
                    return;
                }
                this.$confirm('您确定批量删除这些数据吗？', '确认删除', { type: "warning" }).then(() => {
                    this.$request.delete('/comment/delete/batch', { data: this.ids }).then(res => {
                        if (res.code === '200') {
                            this.$message.success('批量删除成功');
                            this.load(this.pageNum);  // 删除后重新加载当前页数据
                        } else {
                            this.$message.error(res.msg);
                        }
                    });
                }).catch(() => {});
            },
            // 加载数据
            load(pageNum) {
                this.pageNum = pageNum;  // 更新当前页码
                this.$request.get('/comment/selectPage', {
                    params: {
                        pageNum: this.pageNum,
                        pageSize: this.pageSize,
                        content: this.content,
                    }
                }).then(res => {
                    this.tableData = res.data?.list || [];
                    this.total = res.data?.total || 0;
                }).catch(() => {
                    this.$message.error('数据加载失败');
                });
            },
            // 重置搜索
            reset() {
                this.content = null;
                this.load(this.pageNum);  // 重置后重新加载当前页数据
            },
            // 页码改变时加载新页数据
            handleCurrentChange(pageNum) {
                this.load(pageNum);
            },
            // 处理选中项变化
            handleSelectionChange(rows) {
                this.ids = rows.map(v => v.id);
            }
        }
    };
</script>

<style scoped>
    /* 添加必要的样式 */
</style>
