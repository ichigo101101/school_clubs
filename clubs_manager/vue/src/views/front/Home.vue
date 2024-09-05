<template>
    <div class="main-content">
        <div class="container">
            <!-- 轮播图 -->
            <el-carousel height="300px" class="carousel">
                <el-carousel-item v-for="(item, index) in carousel" :key="index">
                    <img :src="item" alt="" class="carousel-image">
                </el-carousel-item>
            </el-carousel>

            <!-- 社团活动和社团资讯 -->
            <el-row :gutter="10">
                <!-- 社团活动 -->
                <el-col :span="12">
                    <div class="section-title activity-title">社团活动</div>
                    <div v-for="item in activityData" :key="item.id" class="activity-item">
                        <el-row :gutter="5" class="activity-row">
                            <el-col :span="4">
                                <img :src="item.img" alt="" class="activity-image">
                            </el-col>
                            <el-col :span="15">
                                <div class="activity-name">
                                    <a href="#" @click="navTo('/front/activityDetail?id=' + item.id)"> {{ item.name }} </a>
                                </div>
                                <div class="activity-description">{{ item.description }}</div>
                            </el-col>
                            <el-col :span="5" class="activity-time">
                                <div>{{ item.time }}</div>
                            </el-col>
                        </el-row>
                    </div>
                    <div class="pagination-wrapper">
                        <el-pagination
                                background
                                @current-change="handleActivityCurrentChange"
                                :current-page="activityPageNum"
                                :page-size="activityPageSize"
                                layout="prev, next"
                                :total="activityTotal">
                        </el-pagination>
                    </div>
                </el-col>

                <!-- 社团资讯 -->
                <el-col :span="12">
                    <div class="section-title information-title">社团资讯</div>
                    <div v-for="item in informationData" :key="item.id" class="information-item">
                        <el-row :gutter="20">
                            <el-col :span="19">
                                <a href="#" @click="navTo('/front/informationDetail?id=' + item.id)">{{ item.name }}</a>
                            </el-col>
                            <el-col :span="5" class="information-time">{{ item.time }}</el-col>
                        </el-row>
                    </div>
                    <div class="pagination-wrapper">
                        <el-pagination
                                background
                                @current-change="handleInformationCurrentChange"
                                :current-page="informationPageNum"
                                :page-size="informationPageSize"
                                layout="prev, next"
                                :total="informationTotal">
                        </el-pagination>
                    </div>
                </el-col>
            </el-row>

            <!-- 优秀社团 -->
            <div>
                <div class="section-title excellent">优秀社团</div>
                <div class="department-list">
                    <el-row :gutter="20">
                        <el-col :span="5" v-for="item in departmentData" :key="item.id">
                            <img :src="item.img" alt="" class="department-image" @click="navTo('/front/departmentDetail?id=' + item.id)">
                            <div class="department-name">{{ item.name }}</div>
                        </el-col>
                    </el-row>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                carousel: [
                    require('@/assets/imgs/lun-1.png'),
                    require('@/assets/imgs/lun-2.png'),
                    require('@/assets/imgs/lun-3.png'),
                ],
                departmentData: [],
                activityData: [],
                activityPageNum: 1,
                activityPageSize: 3,
                activityTotal: 0,
                informationData: [],
                informationPageNum: 1,
                informationPageSize: 6,
                informationTotal: 0,
            }
        },
        mounted() {
            this.loadDepartment();
            this.loadActivity();
            this.loadInformation();
        },
        methods: {
            navTo(url) {
                location.href = url;
            },
            loadDepartment() {
                this.$request.get('/department/selectAll').then(res => {
                    if (res.code === '200') {
                        this.departmentData = res.data;
                    } else {
                        this.$message.error(res.msg);
                    }
                });
            },
            loadInformation(pageNum) {
                if (pageNum) this.informationPageNum = pageNum;
                this.$request.get('/information/selectPage2', {
                    params: {
                        pageNum: this.informationPageNum,
                        pageSize: this.informationPageSize,
                    }
                }).then(res => {
                    if (res.code === '200') {
                        this.informationData = res.data?.list;
                        this.informationTotal = res.data?.total;
                    } else {
                        this.$message.error(res.msg);
                    }
                });
            },
            loadActivity(pageNum) {
                if (pageNum) this.activityPageNum = pageNum;
                this.$request.get('/activity/selectPage2', {
                    params: {
                        pageNum: this.activityPageNum,
                        pageSize: this.activityPageSize,
                    }
                }).then(res => {
                    if (res.code === '200') {
                        this.activityData = res.data?.list;
                        this.activityTotal = res.data?.total;
                    } else {
                        this.$message.error(res.msg);
                    }
                });
            },
            handleActivityCurrentChange(pageNum) {
                this.loadActivity(pageNum);
            },
            handleInformationCurrentChange(pageNum) {
                this.loadInformation(pageNum);
            }
        }
    }
</script>

<style scoped>
    .container {
        width: 70%;
        margin: 20px auto;
    }

    .carousel {
        border-radius: 10px;
    }

    .carousel-image {
        width: 100%;
        height: 300px;
        border-radius: 10px;
    }

    .section-title {
        margin: 20px 0;
        width: 130px;
        height: 30px;
        line-height: 30px;
        text-align: center;
        font-size: 18px;
        font-weight: bold;
        border-radius: 20px;
        color: white;
    }

    .activity-title {
        background-color: #f16f44;
    }

    .information-title {
        background-color: #f16f44;
    }

    .excellent {
        background-color: #4498f1;
    }

    .activity-item {
        margin-bottom: 10px;
    }

    .activity-row {
        margin-bottom: 10px;
    }

    .activity-image {
        width: 60px;
        height: 60px;
        border-radius: 10px;
    }

    .activity-name {
        font-weight: 550;
        font-size: 15px;
        color: #404040;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    .activity-description {
        font-size: 13px;
        color: #404040;
        margin-top: 5px;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 2;
    }

    .activity-time {
        color: #8d8a8a;
        text-align: right;
    }

    .information-item {
        margin-bottom: 10px;
    }

    .information-time {
        color: #8d8a8a;
    }

    .department-list {
        margin-top: 15px;
    }

    .department-image {
        width: 100%;
        height: 190px;
        border-radius: 50%;
        cursor: pointer;
    }

    .department-name {
        text-align: center;
        margin-top: 10px;
        font-size: 16px;
    }

    .pagination-wrapper {
        text-align: right;
        margin-top: 10px;
    }
</style>
