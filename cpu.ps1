# Mendapatkan semua proses Chrome
$chromeProcesses = Get-Process -Name "chrome"

# Memeriksa jumlah proses Chrome yang berjalan
if ($chromeProcesses.Count -gt 30) {
    # Menyortir proses Chrome berdasarkan waktu mulai (ascending) dan mengambil 30 proses pertama
    $processesToKeep = $chromeProcesses | Sort-Object StartTime | Select-Object -First 30

    # Menghentikan proses Chrome yang tidak termasuk dalam 30 proses pertama
    foreach ($process in $chromeProcesses) {
        if ($processesToKeep -notcontains $process) {
            Write-Host "Menutup proses Chrome $($process.Id)..."
            Stop-Process -Id $process.Id -Force
        }
    }

    Write-Host "Batas jumlah proses Chrome berhasil diatur."
} else {
    Write-Host "Jumlah proses Chrome kurang dari atau sama dengan 30. Tidak ada tindakan yang diambil."
}
