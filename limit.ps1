# Skrip Deteksi CPU
$counterPath = '\Processor(_Total)\% Processor Time'
$threshold = 100  # Ambang batas penggunaan CPU yang memicu tindakan
$waitTime = 120   # Waktu tunggu dalam detik (2 menit)

while ($true) {
    # Mendapatkan penggunaan CPU saat ini
    $cpuUsage = (Get-Counter -Counter $counterPath).CounterSamples.CookedValue

    Write-Host "Penggunaan CPU: $cpuUsage%"

    # Jika penggunaan CPU mencapai atau melebihi ambang batas
    if ($cpuUsage -ge $threshold) {
        Write-Host "Penggunaan CPU mencapai $threshold%! Menunggu $waitTime detik sebelum menjalankan cpu.ps1..."

        $elapsedTime = 0

        # Tunggu hingga waktu yang ditentukan sebelum memeriksa lagi
        while ($elapsedTime -lt $waitTime) {
            Start-Sleep -Seconds 1
            $elapsedTime++
            $cpuUsage = (Get-Counter -Counter $counterPath).CounterSamples.CookedValue

            # Jika penggunaan CPU kembali ke nilai di bawah ambang batas, keluar dari loop
            if ($cpuUsage -lt $threshold) {
                break
            }
        }

        # Jika penggunaan CPU tetap di atas ambang batas selama 2 menit, jalankan cpu.ps1
        if ($elapsedTime -ge $waitTime) {
            Write-Host "Penggunaan CPU tetap tinggi selama 2 menit! Menjalankan cpu.ps1..."

            # Menjalankan skrip cpu.ps1
            & ".\cpu.ps1"
        }
    }

    # Tunggu 1 detik sebelum memeriksa kembali
    Start-Sleep -Seconds 1
}
