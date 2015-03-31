Content-Type: multipart/mixed; boundary="===============8782115172239183123=="
MIME-Version: 1.0
From: huang ying <huang.ying.caritas@gmail.com>
To: lkp@lists.01.org
Subject: Re: [x86/intel/quark] 8bbc2a135b6: WARNING: CPU: 0 PID: 1 at arch/x86/platform/intel-quark/imr.c:358 imr_add_range+0x2b4/0x370()
Date: Tue, 31 Mar 2015 10:02:12 +0800
Message-ID: <CAC=cRTOxu7mYzVzg0vQhmWp=AXLJfOkgY_1S=hCtbj=YXrgLHA@mail.gmail.com>
In-Reply-To: <5519060A.3080909@nexus-software.ie>
List-Id: <oe-lkp.lists.linux.dev>

--===============8782115172239183123==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The qemu command line we used is as follow:

qemu-system-i386 -enable-kvm -kernel
/kernel/i386-randconfig-ib0-03292200/bc465aa9d045feb0e13b4a8f32cc33c1943f62=
d6/vmlinuz-4.0.0-rc5
-append 'user=3Dlkp
job=3D/lkp/scheduled/vm-kbuild-yocto-i386-4/rand_boot-1-yocto-minimal-i386.=
cgz-i386-randconfig-ib0-03292200-bc465aa9d045feb0e13b4a8f32cc33c1943f62d6-0=
-20150329-102587-1i8stfj.yaml
ARCH=3Di386
BOOT_IMAGE=3D/kernel/i386-randconfig-ib0-03292200/bc465aa9d045feb0e13b4a8f3=
2cc33c1943f62d6/vmlinuz-4.0.0-rc5
kconfig=3Di386-randconfig-ib0-03292200
commit=3Dbc465aa9d045feb0e13b4a8f32cc33c1943f62d6 branch=3Dlinus/master
root=3D/dev/ram0 max_uptime=3D3600
RESULT_ROOT=3D/result/vm-kbuild-yocto-i386/boot/1/yocto-minimal-i386.cgz/i3=
86-randconfig-ib0-03292200/bc465aa9d045feb0e13b4a8f32cc33c1943f62d6/0
ip=3D::::vm-kbuild-yocto-i386-4::dhcp earlyprintk=3DttyS0,115200
rd.udev.log-priority=3Derr systemd.log_target=3Djournal
systemd.log_level=3Dwarning debug apic=3Ddebug sysrq_always_enabled
rcupdate.rcu_cpu_stall_timeout=3D100 panic=3D-1 softlockup_panic=3D1
nmi_watchdog=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0
console=3DttyS0,115200 console=3Dtty0 vga=3Dnormal rw drbd.minor_count=3D8'
-initrd /fs/sda1/initrd-vm-kbuild-yocto-i386-4 -m 320 -smp 2 -net
nic,vlan=3D1,model=3De1000 -net user,vlan=3D1 -boot order=3Dnc -no-reboot -=
watchdog
i6300esb -rtc base=3Dlocaltime -drive
file=3D/fs/sda1/disk0-vm-kbuild-yocto-i386-4,media=3Ddisk,if=3Dvirtio -pidf=
ile
/dev/shm/kboot/pid-vm-kbuild-yocto-i386-4 -serial
file:/dev/shm/kboot/serial-vm-kbuild-yocto-i386-4 -daemonize -display none
-monitor null

Best Regards,
Huang, Ying

--===============8782115172239183123==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdj48ZGl2PlRoZSBxZW11IGNvbW1hbmQgbGluZSB3ZSB1c2VkIGlz
IGFzIGZvbGxvdzo8YnI+PGJyPnFlbXUtc3lzdGVtLWkzODYgLWVuYWJsZS1rdm0gLWtlcm5lbCAv
a2VybmVsL2kzODYtcmFuZGNvbmZpZy1pYjAtMDMyOTIyMDAvYmM0NjVhYTlkMDQ1ZmViMGUxM2I0
YThmMzJjYzMzYzE5NDNmNjJkNi92bWxpbnV6LTQuMC4wLXJjNSAtYXBwZW5kICYjMzk7dXNlcj1s
a3Agam9iPS9sa3Avc2NoZWR1bGVkL3ZtLWtidWlsZC15b2N0by1pMzg2LTQvcmFuZF9ib290LTEt
eW9jdG8tbWluaW1hbC1pMzg2LmNnei1pMzg2LXJhbmRjb25maWctaWIwLTAzMjkyMjAwLWJjNDY1
YWE5ZDA0NWZlYjBlMTNiNGE4ZjMyY2MzM2MxOTQzZjYyZDYtMC0yMDE1MDMyOS0xMDI1ODctMWk4
c3Rmai55YW1sIEFSQ0g9aTM4NiBCT09UX0lNQUdFPS9rZXJuZWwvaTM4Ni1yYW5kY29uZmlnLWli
MC0wMzI5MjIwMC9iYzQ2NWFhOWQwNDVmZWIwZTEzYjRhOGYzMmNjMzNjMTk0M2Y2MmQ2L3ZtbGlu
dXotNC4wLjAtcmM1IGtjb25maWc9aTM4Ni1yYW5kY29uZmlnLWliMC0wMzI5MjIwMCBjb21taXQ9
YmM0NjVhYTlkMDQ1ZmViMGUxM2I0YThmMzJjYzMzYzE5NDNmNjJkNiBicmFuY2g9bGludXMvbWFz
dGVyIHJvb3Q9L2Rldi9yYW0wIG1heF91cHRpbWU9MzYwMCBSRVNVTFRfUk9PVD0vcmVzdWx0L3Zt
LWtidWlsZC15b2N0by1pMzg2L2Jvb3QvMS95b2N0by1taW5pbWFsLWkzODYuY2d6L2kzODYtcmFu
ZGNvbmZpZy1pYjAtMDMyOTIyMDAvYmM0NjVhYTlkMDQ1ZmViMGUxM2I0YThmMzJjYzMzYzE5NDNm
NjJkNi8wIGlwPTo6Ojp2bS1rYnVpbGQteW9jdG8taTM4Ni00OjpkaGNwIGVhcmx5cHJpbnRrPXR0
eVMwLDExNTIwMCByZC51ZGV2LmxvZy1wcmlvcml0eT1lcnIgc3lzdGVtZC5sb2dfdGFyZ2V0PWpv
dXJuYWwgc3lzdGVtZC5sb2dfbGV2ZWw9d2FybmluZyBkZWJ1ZyBhcGljPWRlYnVnIHN5c3JxX2Fs
d2F5c19lbmFibGVkIHJjdXBkYXRlLnJjdV9jcHVfc3RhbGxfdGltZW91dD0xMDAgcGFuaWM9LTEg
c29mdGxvY2t1cF9wYW5pYz0xIG5taV93YXRjaGRvZz1wYW5pYyBvb3BzPXBhbmljIGxvYWRfcmFt
ZGlzaz0yIHByb21wdF9yYW1kaXNrPTAgY29uc29sZT10dHlTMCwxMTUyMDAgY29uc29sZT10dHkw
IHZnYT1ub3JtYWwgcncgZHJiZC5taW5vcl9jb3VudD04JiMzOTvCoCAtaW5pdHJkIC9mcy9zZGEx
L2luaXRyZC12bS1rYnVpbGQteW9jdG8taTM4Ni00IC1tIDMyMCAtc21wIDIgLW5ldCBuaWMsdmxh
bj0xLG1vZGVsPWUxMDAwIC1uZXQgdXNlcix2bGFuPTEgLWJvb3Qgb3JkZXI9bmMgLW5vLXJlYm9v
dCAtd2F0Y2hkb2cgaTYzMDBlc2IgLXJ0YyBiYXNlPWxvY2FsdGltZSAtZHJpdmUgZmlsZT0vZnMv
c2RhMS9kaXNrMC12bS1rYnVpbGQteW9jdG8taTM4Ni00LG1lZGlhPWRpc2ssaWY9dmlydGlvIC1w
aWRmaWxlIC9kZXYvc2htL2tib290L3BpZC12bS1rYnVpbGQteW9jdG8taTM4Ni00IC1zZXJpYWwg
ZmlsZTovZGV2L3NobS9rYm9vdC9zZXJpYWwtdm0ta2J1aWxkLXlvY3RvLWkzODYtNCAtZGFlbW9u
aXplIC1kaXNwbGF5IG5vbmUgLW1vbml0b3IgbnVsbCA8YnI+PGJyPjwvZGl2PkJlc3QgUmVnYXJk
cyw8YnI+PC9kaXY+SHVhbmcsIFlpbmc8YnI+PGJyPjwvZGl2Pgo=

--===============8782115172239183123==--

