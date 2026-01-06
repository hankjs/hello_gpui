#!/bin/bash

# ==============================================================================
# SYNOPSIS
#   设置CARGO_MANIFEST_DIR环境变量为运行脚本时的当前工作目录下的demo/_assets路径
# DESCRIPTION
#   - 路径拼接自动适配类Unix系统路径分隔符（/）
#   - 包含路径存在性校验，增强脚本健壮性
#   - 环境变量仅当前Shell会话有效（临时）
# ==============================================================================

# ========== 核心配置 ==========
# 获取运行脚本时的当前工作目录（对应PowerShell的$PWD.Path）
base_dir=$(pwd)

# 安全拼接路径：基础目录 + demo/hello_gpui（避免手动拼接的路径错误）
cargo_manifest_dir="${base_dir}/demo/hello_gpui"

# ========== 路径校验（可选） ==========
if [ ! -d "${cargo_manifest_dir}" ]; then
    echo "⚠️  警告：路径 ${cargo_manifest_dir} 不存在！"
    # 可选：自动创建该目录（取消下面注释）
    # mkdir -p "${cargo_manifest_dir}"
    # echo "📁 已自动创建目录：${cargo_manifest_dir}"
fi

# ========== 设置环境变量 ==========
export CARGO_MANIFEST_DIR="${cargo_manifest_dir}"

# 输出确认信息
echo -e "✅ 已设置环境变量："
echo -e "   CARGO_MANIFEST_DIR = ${cargo_manifest_dir}"

# 可选：验证环境变量是否生效（取消下面注释）
# echo -e "\n🔍 验证值：${CARGO_MANIFEST_DIR}"
