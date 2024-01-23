## Building the Windows ISO (Server versions only)

1. Get the latest binary VirtIO drivers for Windows, packaged as an ISO file, from [this link](https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/stable-virtio/virtio-win.iso).

2. Make a folder: `c:\custom`.

3. Extract your Windows Server ISO to: `c:\custom\winserver` with a compression tool such as [7zip](http://www.7-zip.org/).

4. Extract the VirtIO ISO to `c:\custom\winserver\virtio`.

5. Use an ISO mastering tool to create your custom slipstream ISO. In general https://www.imgburn.com/index.php?act=download, the following mastering options are needed:
    - Filesystem: UDF, Include Hidden Files, Include System Files
    - Make image bootable.
    - Emulation Type: none
    - Boot Image: C:\custom\winserver\boot\etfsboot.com
    - Platform ID: 80x86
    - Developer ID: Microsoft Corporation
    - Sectors to load: 8

6. You now have a Windows ISO with built-in VirtIO drivers ready for use as a custom Vultr ISO.
