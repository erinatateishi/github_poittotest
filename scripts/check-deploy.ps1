Write-Host "デプロイ完了確認中..."
$maxRetries = 10
$url = 'http://localhost/'

for ($i = 0; $i -lt $maxRetries; $i++) {
    try {
        $res = Invoke-WebRequest -Uri $url -UseBasicParsing -TimeoutSec 5
        if ($res -and $res.StatusCode -eq 200) {
            Write-Host "サイトが正常に応答しています。"
            exit 0
        }
    } catch {
        Write-Host "応答なし、再試行します... ($i)"
    }
    Start-Sleep -Seconds 5
}

Write-Error "デプロイ確認に失敗しました。"
exit 1
