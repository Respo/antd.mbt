# Ant Design MoonBit 绑定

这是一个为 MoonBit 语言提供的 Ant Design (antd) 组件绑定库，使开发者能够在 MoonBit 项目中使用 Ant Design 的 React 组件。

## ⚠️ 项目状态

**本项目依赖 AI 生成，未经充分验证，仍在完善当中。**

- 🤖 **AI 生成**: 大部分代码由 AI 辅助生成
- ⚠️ **未经验证**: 组件绑定可能存在不完整或错误的实现
- 🚧 **开发中**: 项目仍在积极开发和完善中
- 🤝 **欢迎贡献**: 我们欢迎社区贡献代码和反馈

## 组件实现状态

### ✅ 已实现组件

| 组件分类     | 组件名称       | 实现状态 | 文件                       |
| ------------ | -------------- | -------- | -------------------------- |
| **通用**     | Button         | ✅ 完整  | `antd_button.mbt`          |
|              | Icon           | ✅ 完整  | `antd-icon.mbt`            |
|              | Typography     | ✅ 完整  | `antd-typography.mbt`      |
| **布局**     | Divider        | ✅ 完整  | `antd-layout.mbt`          |
|              | Flex           | ✅ 完整  | `antd-layout.mbt`          |
|              | Space          | ✅ 完整  | `antd-layout.mbt`          |
|              | Layout         | ✅ 完整  | `antd-layout.mbt`          |
| **导航**     | Breadcrumb     | ✅ 完整  | `antd-breadcrumb.mbt`      |
|              | Menu           | ✅ 完整  | `antd-menu.mbt`            |
|              | Steps          | ✅ 完整  | `antd-steps.mbt`           |
| **数据录入** | Input          | ✅ 基础  | `antd-input.mbt`           |
|              | Checkbox       | ✅ 完整  | `antd-checkbox-radio.mbt`  |
|              | Radio          | ✅ 完整  | `antd-checkbox-radio.mbt`  |
|              | Switch         | ✅ 完整  | `antd-switch.mbt`          |
| **数据展示** | Avatar         | ✅ 完整  | `antd-avatar.mbt`          |
|              | Badge          | ✅ 完整  | `antd-badge.mbt`           |
|              | Card           | ✅ 完整  | `antd-card.mbt`            |
|              | Tag            | ✅ 完整  | `antd-tag.mbt`             |
|              | Tooltip        | ✅ 完整  | `antd-tooltip.mbt`         |
| **反馈**     | Alert          | ✅ 完整  | `antd-alert.mbt`           |
|              | Modal          | ✅ 完整  | `antd-modal.mbt`           |
|              | Progress       | ✅ 完整  | `antd-progress-spin.mbt`   |
|              | Spin           | ✅ 完整  | `antd-progress-spin.mbt`   |
|              | Result         | ✅ 完整  | `antd-result.mbt`          |
|              | Drawer         | ✅ 完整  | `antd-drawer.mbt`          |
| **其他**     | Affix          | ✅ 完整  | `antd-affix.mbt`           |
|              | App            | ✅ 完整  | `antd-app.mbt`             |
|              | ConfigProvider | ✅ 完整  | `antd-config-provider.mbt` |
|              | FloatButton    | ✅ 完整  | `antd-float-button.mbt`    |
|              | BackTop        | ✅ 完整  | `antd-back-top.mbt`        |

### 🚧 待实现组件

以下是 Ant Design 中尚未实现的主要组件：

| 组件分类     | 组件名称     | 优先级 |
| ------------ | ------------ | ------ |
| **数据录入** | AutoComplete | 中     |
|              | Cascader     | 中     |
|              | ColorPicker  | 低     |
|              | DatePicker   | 高     |
|              | Form         | 高     |
|              | InputNumber  | 中     |
|              | Mentions     | 低     |
|              | Rate         | 中     |
|              | Select       | 高     |
|              | Slider       | 中     |
|              | TimePicker   | 中     |
|              | Transfer     | 低     |
|              | TreeSelect   | 低     |
|              | Upload       | 高     |
| **数据展示** | Calendar     | 中     |
|              | Carousel     | 中     |
|              | Collapse     | 中     |
|              | Descriptions | 中     |
|              | Empty        | 中     |
|              | Image        | 中     |
|              | List         | 高     |
|              | Popover      | 中     |
|              | QRCode       | 低     |
|              | Segmented    | 中     |
|              | Statistic    | 中     |
|              | Table        | 高     |
|              | Tabs         | 高     |
|              | Timeline     | 中     |
|              | Tour         | 低     |
|              | Tree         | 中     |
| **反馈**     | Message      | 高     |
|              | Notification | 高     |
|              | Popconfirm   | 中     |
|              | Skeleton     | 中     |
| **导航**     | Anchor       | 低     |
|              | Dropdown     | 高     |
|              | Pagination   | 高     |

## 快速开始

### 安装依赖

```bash
# 安装 Node.js 依赖
yarn install

# 或使用 npm
npm install
```

### 开发

```bash
# 启动开发服务器
yarn vite

# 运行测试
moon test

# 构建项目
moon build
```

### 使用示例

...

## 项目结构

```
antd.mbt/
├── main/                 # 主要源码目录
│   └── main.mbt         # 主应用文件
├── antd-*.mbt           # 各个组件的绑定文件
├── react.mjs            # React 和 Ant Design 导入
├── package.json         # Node.js 依赖
└── moon.mod.json        # MoonBit 模块配置
```

## 贡献指南

我们非常欢迎社区贡献！以下是一些贡献方式：

### 🐛 报告问题

- 在 GitHub Issues 中报告 bug
- 提供详细的重现步骤
- 包含错误信息和环境信息

### 💡 功能建议

- 提出新组件的实现需求
- 建议现有组件的改进
- 分享使用经验和最佳实践

### 🔧 代码贡献

1. **Fork 项目**
2. **创建功能分支**: `git checkout -b feature/new-component`
3. **实现组件绑定**:
   - 在相应的 `antd-*.mbt` 文件中添加组件
   - 确保类型安全和完整的属性绑定
   - 添加必要的文档注释
4. **更新 react.mjs**: 如果需要新的 Ant Design 组件导入
5. **测试**: 运行 `moon test` 确保代码正确
6. **提交更改**: `git commit -m "feat: add new component"`
7. **推送分支**: `git push origin feature/new-component`
8. **创建 Pull Request**

### 组件实现规范

实现新组件时，请遵循以下规范：

1. **类型定义**: 为组件属性定义完整的枚举类型
2. **函数签名**: 使用可选参数和合理的默认值
3. **文档注释**: 添加详细的组件说明和属性描述
4. **错误处理**: 适当处理无效输入和边界情况
5. **一致性**: 保持与现有组件相同的代码风格

### 示例：添加新组件

...

## 许可证

本项目采用 MIT 许可证。详见 [LICENSE](LICENSE) 文件。

## 相关链接

- [Ant Design 官方文档](https://ant.design/)
- [MoonBit 语言文档](https://www.moonbitlang.com/)
- [React 文档](https://react.dev/)

---

**注意**: 由于本项目主要由 AI 生成，建议在生产环境使用前进行充分测试。我们正在努力提高代码质量和完整性。
