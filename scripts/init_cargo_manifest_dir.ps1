<#
.SYNOPSIS
设置CARGO_MANIFEST_DIR环境变量为当前脚本目录下的demo/_assets路径
.DESCRIPTION
- 路径拼接使用PowerShell内置命令，自动适配Windows路径分隔符（\）
- 包含路径存在性校验，增强脚本健壮性
- 环境变量仅当前会话有效（临时）
#>

# ========== 核心配置 ==========
# 方式1（推荐）：使用脚本所在目录（脚本移动后路径仍正确）
#$baseDir = $PSScriptRoot
# 方式2（备选）：使用运行脚本时的"当前工作目录"（取消下面注释，注释上面一行）
$baseDir = $PWD.Path

# 安全拼接路径：基础目录 + demo/hello_gpui（避免手动拼接的路径错误）
$cargoManifestDir = Join-Path -Path $baseDir -ChildPath "demo/hello_gpui"

# ========== 路径校验（可选） ==========
if (-not (Test-Path -Path $cargoManifestDir)) {
    Write-Warning "警告：路径 $cargoManifestDir 不存在！"
    # 可选：自动创建该目录（取消下面注释）
    # New-Item -Path $cargoManifestDir -ItemType Directory -Force | Out-Null
}

# ========== 设置环境变量 ==========
$env:CARGO_MANIFEST_DIR = $cargoManifestDir

# 输出确认信息
Write-Host "✅ 已设置环境变量："
Write-Host "   CARGO_MANIFEST_DIR = $cargoManifestDir"

# 可选：验证环境变量是否生效（取消下面注释）
# Write-Host "`n🔍 验证值：$($env:CARGO_MANIFEST_DIR)"
