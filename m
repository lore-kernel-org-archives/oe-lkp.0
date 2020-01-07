Content-Type: multipart/mixed; boundary="===============2462322046504635115=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/debug] 87c4696d57: kernel_BUG_at_include/linux/mm.h
Date: Tue, 07 Jan 2020 16:22:58 +0800
Message-ID: <d001a2dd-5651-9520-7c8e-47bfebc6d0ff@intel.com>
In-Reply-To: <490e77d6-a3ef-dd70-4c29-b90234f8a13d@arm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2462322046504635115==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 1/7/20 2:46 PM, Anshuman Khandual wrote:
> On 12/27/2019 07:52 PM, kernel test robot wrote:
>> [    9.781974] kernel BUG at include/linux/mm.h:592!
>> [    9.782810] invalid opcode: 0000 [#1] PTI
>> [    9.783443] CPU: 0 PID: 1 Comm: swapper Not tainted 5.5.0-rc3-00001-g=
87c4696d57b5e #1
>> [    9.784528] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BI=
OS 1.10.2-1 04/01/2014
>> [    9.785756] EIP: __free_pages+0x14/0x40
>> [    9.786442] Code: 0c 9c 5e fa 89 d8 e8 5b f3 ff ff 56 9d 5b 5e 5d c3 =
8d 74 26 00 90 8b 48 1c 55 89 e5 85 c9 75 16 ba b4 b6 84 d6 e8 ac 49 fe ff =
<0f> 0b 8d b4 26 00 00 00 00 8d 76 00 ff 48 1c 75 10 85 d2 75 07 e8
>> [    9.789697] EAX: d68761f7 EBX: ea52f000 ECX: ea4f8520 EDX: d684b6b4
>> [    9.790850] ESI: 00000000 EDI: ef45e000 EBP: ea501f08 ESP: ea501f08
>> [    9.791879] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 0001=
0286
>> [    9.792783] CR0: 80050033 CR2: ffffffff CR3: 16d00000 CR4: 000406b0
>> [    9.792783] Call Trace:
>> [    9.792783]  free_pages+0x3c/0x50
>> [    9.792783]  pgd_free+0x5a/0x170
>> [    9.792783]  __mmdrop+0x42/0xe0
>> [    9.792783]  debug_vm_pgtable+0x54f/0x567
>> [    9.792783]  kernel_init_freeable+0x90/0x1e3
>> [    9.792783]  ? rest_init+0xf0/0xf0
>> [    9.792783]  kernel_init+0x8/0xf0
>> [    9.792783]  ret_from_fork+0x19/0x24
>> [    9.792783] Modules linked in:
>> [    9.792803] ---[ end trace 91b7335adcf0b656 ]---
>>
>>
>> To reproduce:
>>
>>          # build kernel
>> 	cd linux
>> 	cp config-5.5.0-rc3-00001-g87c4696d57b5e .config
>> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Di386 olddefconfig prepare modules=
_prepare bzImage
>>
>>          git clone https://github.com/intel/lkp-tests.git
>>          cd lkp-tests
>>          bin/lkp qemu -k <bzImage> job-script # job-script is attached i=
n this email
> Hello,
>
> As the failure might be happening during boot when the test executes,
> do we really need to run these LKP based QEMU environment in order to
> reproduce the problem ? Could not this be recreated on a standalone
> system.
>
> - Anshuman

Hi Anshuman,

Thanks for your advice, we provided another reproduce method which is in =

the end of dmesg.xz file attached in original report:
but the initrd file need to be supplied.

qemu-img create -f qcow2 disk-vm-snb-89942dcb126f-0 256G
qemu-img create -f qcow2 disk-vm-snb-89942dcb126f-1 256G
qemu-img create -f qcow2 disk-vm-snb-89942dcb126f-2 256G
qemu-img create -f qcow2 disk-vm-snb-89942dcb126f-3 256G
qemu-img create -f qcow2 disk-vm-snb-89942dcb126f-4 256G
qemu-img create -f qcow2 disk-vm-snb-89942dcb126f-5 256G
qemu-img create -f qcow2 disk-vm-snb-89942dcb126f-6 256G

kvm=3D(
=E2=80=BA=C2=A0=C2=A0 qemu-system-x86_64
=E2=80=BA=C2=A0=C2=A0 -enable-kvm
=E2=80=BA=C2=A0=C2=A0 -cpu SandyBridge
=E2=80=BA=C2=A0=C2=A0 -kernel $kernel
=E2=80=BA=C2=A0=C2=A0 -initrd initrd-vm-snb-89942dcb126f
=E2=80=BA=C2=A0=C2=A0 -m 8192
=E2=80=BA=C2=A0=C2=A0 -smp 2
=E2=80=BA=C2=A0=C2=A0 -device e1000,netdev=3Dnet0
=E2=80=BA=C2=A0=C2=A0 -netdev user,id=3Dnet0,hostfwd=3Dtcp::32032-:22
=E2=80=BA=C2=A0=C2=A0 -boot order=3Dnc
=E2=80=BA=C2=A0=C2=A0 -no-reboot
=E2=80=BA=C2=A0=C2=A0 -watchdog i6300esb
=E2=80=BA=C2=A0=C2=A0 -watchdog-action debug
=E2=80=BA=C2=A0=C2=A0 -rtc base=3Dlocaltime
=E2=80=BA=C2=A0=C2=A0 -drive file=3Ddisk-vm-snb-89942dcb126f-0,media=3Ddisk=
,if=3Dvirtio
=E2=80=BA=C2=A0=C2=A0 -drive file=3Ddisk-vm-snb-89942dcb126f-1,media=3Ddisk=
,if=3Dvirtio
=E2=80=BA=C2=A0=C2=A0 -drive file=3Ddisk-vm-snb-89942dcb126f-2,media=3Ddisk=
,if=3Dvirtio
=E2=80=BA=C2=A0=C2=A0 -drive file=3Ddisk-vm-snb-89942dcb126f-3,media=3Ddisk=
,if=3Dvirtio
=E2=80=BA=C2=A0=C2=A0 -drive file=3Ddisk-vm-snb-89942dcb126f-4,media=3Ddisk=
,if=3Dvirtio
=E2=80=BA=C2=A0=C2=A0 -drive file=3Ddisk-vm-snb-89942dcb126f-5,media=3Ddisk=
,if=3Dvirtio
=E2=80=BA=C2=A0=C2=A0 -drive file=3Ddisk-vm-snb-89942dcb126f-6,media=3Ddisk=
,if=3Dvirtio
=E2=80=BA=C2=A0=C2=A0 -serial stdio
=E2=80=BA=C2=A0=C2=A0 -display none
=E2=80=BA=C2=A0=C2=A0 -monitor null
)

append=3D(
=E2=80=BA=C2=A0=C2=A0 ip=3D::::vm-snb-89942dcb126f::dhcp
=E2=80=BA=C2=A0=C2=A0 root=3D/dev/ram0
=E2=80=BA=C2=A0=C2=A0 user=3Dlkp
=E2=80=BA=C2=A0=C2=A0 job=3D/job-script
=E2=80=BA ARCH=3Di386
=E2=80=BA=C2=A0=C2=A0 kconfig=3Di386-randconfig-h001-20191225
=E2=80=BA=C2=A0=C2=A0 branch=3Dlinux-devel/devel-hourly-2019122518
=E2=80=BA=C2=A0=C2=A0 commit=3D87c4696d57b5e380bc2720fdff0772b042462b7d
=E2=80=BA =

BOOT_IMAGE=3D/pkg/linux/i386-randconfig-h001-20191225/gcc-7/87c4696d57b5e38=
0bc2720fdff0772b042462b7d/vmlinuz-5.5.0-rc3-00001-g87c4696d57b5e
=E2=80=BA=C2=A0=C2=A0 max_uptime=3D1500
=E2=80=BA =

RESULT_ROOT=3D/result/trinity/300s/vm-snb/yocto-minimal-i386-2019-05-20.cgz=
/i386-randconfig-h001-20191225/gcc-7/87c4696d57b5e380bc2720fdff0772b042462b=
7d/8
=E2=80=BA=C2=A0=C2=A0 result_service=3Dtmpfs
=E2=80=BA=C2=A0=C2=A0 debug
=E2=80=BA=C2=A0=C2=A0 apic=3Ddebug
=E2=80=BA=C2=A0=C2=A0 sysrq_always_enabled
=E2=80=BA=C2=A0=C2=A0 rcupdate.rcu_cpu_stall_timeout=3D100
=E2=80=BA=C2=A0=C2=A0 net.ifnames=3D0
=E2=80=BA=C2=A0=C2=A0 printk.devkmsg=3Don
=E2=80=BA=C2=A0=C2=A0 panic=3D-1
=E2=80=BA=C2=A0=C2=A0 softlockup_panic=3D1
=E2=80=BA=C2=A0=C2=A0 nmi_watchdog=3Dpanic
=E2=80=BA=C2=A0=C2=A0 oops=3Dpanic
=E2=80=BA=C2=A0=C2=A0 load_ramdisk=3D2
=E2=80=BA=C2=A0=C2=A0 prompt_ramdisk=3D0
=E2=80=BA=C2=A0=C2=A0 drbd.minor_count=3D8
=E2=80=BA=C2=A0=C2=A0 systemd.log_level=3Derr
=E2=80=BA=C2=A0=C2=A0 ignore_loglevel
=E2=80=BA=C2=A0=C2=A0 console=3Dtty0
=E2=80=BA=C2=A0=C2=A0 earlyprintk=3DttyS0,115200
=E2=80=BA=C2=A0=C2=A0 console=3DttyS0,115200
=E2=80=BA=C2=A0=C2=A0 vga=3Dnormal
=E2=80=BA=C2=A0=C2=A0 rw
=E2=80=BA=C2=A0=C2=A0 rcuperf.shutdown=3D0
=E2=80=BA=C2=A0=C2=A0 watchdog_thresh=3D60
)

"${kvm[@]}" -append "${append[*]}"


We will definitely give serious thought to your suggestion.

Best Regards,
Rong Chen

--===============2462322046504635115==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRl
bnQ9InRleHQvaHRtbDsgY2hhcnNldD1VVEYtOCI+CiAgPC9oZWFkPgogIDxib2R5IHRleHQ9IiMw
MDAwMDAiIGJnY29sb3I9IiNGRkZGRkYiPgogICAgPGJyPgogICAgPGJyPgogICAgPGRpdiBjbGFz
cz0ibW96LWNpdGUtcHJlZml4Ij5PbiAxLzcvMjAgMjo0NiBQTSwgQW5zaHVtYW4gS2hhbmR1YWwK
ICAgICAgd3JvdGU6PGJyPgogICAgPC9kaXY+CiAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIgog
ICAgICBjaXRlPSJtaWQ6NDkwZTc3ZDYtYTNlZi1kZDcwLTRjMjktYjkwMjM0ZjhhMTNkQGFybS5j
b20iPgogICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPk9uIDEyLzI3LzIw
MTkgMDc6NTIgUE0sIGtlcm5lbCB0ZXN0IHJvYm90IHdyb3RlOgo8L3ByZT4KICAgICAgPGJsb2Nr
cXVvdGUgdHlwZT0iY2l0ZSI+CiAgICAgICAgPHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3Jh
cD0iIj5bICAgIDkuNzgxOTc0XSBrZXJuZWwgQlVHIGF0IGluY2x1ZGUvbGludXgvbW0uaDo1OTIh
ClsgICAgOS43ODI4MTBdIGludmFsaWQgb3Bjb2RlOiAwMDAwIFsjMV0gUFRJClsgICAgOS43ODM0
NDNdIENQVTogMCBQSUQ6IDEgQ29tbTogc3dhcHBlciBOb3QgdGFpbnRlZCA1LjUuMC1yYzMtMDAw
MDEtZzg3YzQ2OTZkNTdiNWUgIzEKWyAgICA5Ljc4NDUyOF0gSGFyZHdhcmUgbmFtZTogUUVNVSBT
dGFuZGFyZCBQQyAoaTQ0MEZYICsgUElJWCwgMTk5NiksIEJJT1MgMS4xMC4yLTEgMDQvMDEvMjAx
NApbICAgIDkuNzg1NzU2XSBFSVA6IF9fZnJlZV9wYWdlcysweDE0LzB4NDAKWyAgICA5Ljc4NjQ0
Ml0gQ29kZTogMGMgOWMgNWUgZmEgODkgZDggZTggNWIgZjMgZmYgZmYgNTYgOWQgNWIgNWUgNWQg
YzMgOGQgNzQgMjYgMDAgOTAgOGIgNDggMWMgNTUgODkgZTUgODUgYzkgNzUgMTYgYmEgYjQgYjYg
ODQgZDYgZTggYWMgNDkgZmUgZmYgJmx0OzBmJmd0OyAwYiA4ZCBiNCAyNiAwMCAwMCAwMCAwMCA4
ZCA3NiAwMCBmZiA0OCAxYyA3NSAxMCA4NSBkMiA3NSAwNyBlOApbICAgIDkuNzg5Njk3XSBFQVg6
IGQ2ODc2MWY3IEVCWDogZWE1MmYwMDAgRUNYOiBlYTRmODUyMCBFRFg6IGQ2ODRiNmI0ClsgICAg
OS43OTA4NTBdIEVTSTogMDAwMDAwMDAgRURJOiBlZjQ1ZTAwMCBFQlA6IGVhNTAxZjA4IEVTUDog
ZWE1MDFmMDgKWyAgICA5Ljc5MTg3OV0gRFM6IDAwN2IgRVM6IDAwN2IgRlM6IDAwMDAgR1M6IDAw
MDAgU1M6IDAwNjggRUZMQUdTOiAwMDAxMDI4NgpbICAgIDkuNzkyNzgzXSBDUjA6IDgwMDUwMDMz
IENSMjogZmZmZmZmZmYgQ1IzOiAxNmQwMDAwMCBDUjQ6IDAwMDQwNmIwClsgICAgOS43OTI3ODNd
IENhbGwgVHJhY2U6ClsgICAgOS43OTI3ODNdICBmcmVlX3BhZ2VzKzB4M2MvMHg1MApbICAgIDku
NzkyNzgzXSAgcGdkX2ZyZWUrMHg1YS8weDE3MApbICAgIDkuNzkyNzgzXSAgX19tbWRyb3ArMHg0
Mi8weGUwClsgICAgOS43OTI3ODNdICBkZWJ1Z192bV9wZ3RhYmxlKzB4NTRmLzB4NTY3ClsgICAg
OS43OTI3ODNdICBrZXJuZWxfaW5pdF9mcmVlYWJsZSsweDkwLzB4MWUzClsgICAgOS43OTI3ODNd
ICA/IHJlc3RfaW5pdCsweGYwLzB4ZjAKWyAgICA5Ljc5Mjc4M10gIGtlcm5lbF9pbml0KzB4OC8w
eGYwClsgICAgOS43OTI3ODNdICByZXRfZnJvbV9mb3JrKzB4MTkvMHgyNApbICAgIDkuNzkyNzgz
XSBNb2R1bGVzIGxpbmtlZCBpbjoKWyAgICA5Ljc5MjgwM10gLS0tWyBlbmQgdHJhY2UgOTFiNzMz
NWFkY2YwYjY1NiBdLS0tCgoKVG8gcmVwcm9kdWNlOgoKICAgICAgICAjIGJ1aWxkIGtlcm5lbAoJ
Y2QgbGludXgKCWNwIGNvbmZpZy01LjUuMC1yYzMtMDAwMDEtZzg3YzQ2OTZkNTdiNWUgLmNvbmZp
ZwoJbWFrZSBIT1NUQ0M9Z2NjLTcgQ0M9Z2NjLTcgQVJDSD1pMzg2IG9sZGRlZmNvbmZpZyBwcmVw
YXJlIG1vZHVsZXNfcHJlcGFyZSBiekltYWdlCgogICAgICAgIGdpdCBjbG9uZSA8YSBjbGFzcz0i
bW96LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vaW50ZWwvbGtw
LXRlc3RzLmdpdCI+aHR0cHM6Ly9naXRodWIuY29tL2ludGVsL2xrcC10ZXN0cy5naXQ8L2E+CiAg
ICAgICAgY2QgbGtwLXRlc3RzCiAgICAgICAgYmluL2xrcCBxZW11IC1rICZsdDtiekltYWdlJmd0
OyBqb2Itc2NyaXB0ICMgam9iLXNjcmlwdCBpcyBhdHRhY2hlZCBpbiB0aGlzIGVtYWlsCjwvcHJl
PgogICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdy
YXA9IiI+CkhlbGxvLAoKQXMgdGhlIGZhaWx1cmUgbWlnaHQgYmUgaGFwcGVuaW5nIGR1cmluZyBi
b290IHdoZW4gdGhlIHRlc3QgZXhlY3V0ZXMsCmRvIHdlIHJlYWxseSBuZWVkIHRvIHJ1biB0aGVz
ZSBMS1AgYmFzZWQgUUVNVSBlbnZpcm9ubWVudCBpbiBvcmRlciB0bwpyZXByb2R1Y2UgdGhlIHBy
b2JsZW0gPyBDb3VsZCBub3QgdGhpcyBiZSByZWNyZWF0ZWQgb24gYSBzdGFuZGFsb25lCnN5c3Rl
bS4KCi0gQW5zaHVtYW4KPC9wcmU+CiAgICA8L2Jsb2NrcXVvdGU+CiAgICA8YnI+CiAgICBIaSBB
bnNodW1hbiw8YnI+CiAgICA8YnI+CiAgICBUaGFua3MgZm9yIHlvdXIgYWR2aWNlLCB3ZSBwcm92
aWRlZCBhbm90aGVyIHJlcHJvZHVjZSBtZXRob2Qgd2hpY2gKICAgIGlzIGluIHRoZSBlbmQgb2Yg
ZG1lc2cueHogZmlsZSBhdHRhY2hlZCBpbiBvcmlnaW5hbCByZXBvcnQ6PGJyPgogICAgYnV0IHRo
ZSBpbml0cmQgZmlsZSBuZWVkIHRvIGJlIHN1cHBsaWVkLjxicj4KICAgIDxicj4KICAgIHFlbXUt
aW1nIGNyZWF0ZSAtZiBxY293MiBkaXNrLXZtLXNuYi04OTk0MmRjYjEyNmYtMCAyNTZHPGJyPgog
ICAgcWVtdS1pbWcgY3JlYXRlIC1mIHFjb3cyIGRpc2stdm0tc25iLTg5OTQyZGNiMTI2Zi0xIDI1
Nkc8YnI+CiAgICBxZW11LWltZyBjcmVhdGUgLWYgcWNvdzIgZGlzay12bS1zbmItODk5NDJkY2Ix
MjZmLTIgMjU2Rzxicj4KICAgIHFlbXUtaW1nIGNyZWF0ZSAtZiBxY293MiBkaXNrLXZtLXNuYi04
OTk0MmRjYjEyNmYtMyAyNTZHPGJyPgogICAgcWVtdS1pbWcgY3JlYXRlIC1mIHFjb3cyIGRpc2st
dm0tc25iLTg5OTQyZGNiMTI2Zi00IDI1Nkc8YnI+CiAgICBxZW11LWltZyBjcmVhdGUgLWYgcWNv
dzIgZGlzay12bS1zbmItODk5NDJkY2IxMjZmLTUgMjU2Rzxicj4KICAgIHFlbXUtaW1nIGNyZWF0
ZSAtZiBxY293MiBkaXNrLXZtLXNuYi04OTk0MmRjYjEyNmYtNiAyNTZHPGJyPgogICAgPGJyPgog
ICAga3ZtPSg8YnI+CiAgICDigLrCoMKgIHFlbXUtc3lzdGVtLXg4Nl82NDxicj4KICAgIOKAusKg
wqAgLWVuYWJsZS1rdm08YnI+CiAgICDigLrCoMKgIC1jcHUgU2FuZHlCcmlkZ2U8YnI+CiAgICDi
gLrCoMKgIC1rZXJuZWwgJGtlcm5lbDxicj4KICAgIOKAusKgwqAgLWluaXRyZCBpbml0cmQtdm0t
c25iLTg5OTQyZGNiMTI2Zjxicj4KICAgIOKAusKgwqAgLW0gODE5Mjxicj4KICAgIOKAusKgwqAg
LXNtcCAyPGJyPgogICAg4oC6wqDCoCAtZGV2aWNlIGUxMDAwLG5ldGRldj1uZXQwPGJyPgogICAg
4oC6wqDCoCAtbmV0ZGV2IHVzZXIsaWQ9bmV0MCxob3N0ZndkPXRjcDo6MzIwMzItOjIyPGJyPgog
ICAg4oC6wqDCoCAtYm9vdCBvcmRlcj1uYzxicj4KICAgIOKAusKgwqAgLW5vLXJlYm9vdDxicj4K
ICAgIOKAusKgwqAgLXdhdGNoZG9nIGk2MzAwZXNiPGJyPgogICAg4oC6wqDCoCAtd2F0Y2hkb2ct
YWN0aW9uIGRlYnVnPGJyPgogICAg4oC6wqDCoCAtcnRjIGJhc2U9bG9jYWx0aW1lPGJyPgogICAg
4oC6wqDCoCAtZHJpdmUgZmlsZT1kaXNrLXZtLXNuYi04OTk0MmRjYjEyNmYtMCxtZWRpYT1kaXNr
LGlmPXZpcnRpbzxicj4KICAgIOKAusKgwqAgLWRyaXZlIGZpbGU9ZGlzay12bS1zbmItODk5NDJk
Y2IxMjZmLTEsbWVkaWE9ZGlzayxpZj12aXJ0aW88YnI+CiAgICDigLrCoMKgIC1kcml2ZSBmaWxl
PWRpc2stdm0tc25iLTg5OTQyZGNiMTI2Zi0yLG1lZGlhPWRpc2ssaWY9dmlydGlvPGJyPgogICAg
4oC6wqDCoCAtZHJpdmUgZmlsZT1kaXNrLXZtLXNuYi04OTk0MmRjYjEyNmYtMyxtZWRpYT1kaXNr
LGlmPXZpcnRpbzxicj4KICAgIOKAusKgwqAgLWRyaXZlIGZpbGU9ZGlzay12bS1zbmItODk5NDJk
Y2IxMjZmLTQsbWVkaWE9ZGlzayxpZj12aXJ0aW88YnI+CiAgICDigLrCoMKgIC1kcml2ZSBmaWxl
PWRpc2stdm0tc25iLTg5OTQyZGNiMTI2Zi01LG1lZGlhPWRpc2ssaWY9dmlydGlvPGJyPgogICAg
4oC6wqDCoCAtZHJpdmUgZmlsZT1kaXNrLXZtLXNuYi04OTk0MmRjYjEyNmYtNixtZWRpYT1kaXNr
LGlmPXZpcnRpbzxicj4KICAgIOKAusKgwqAgLXNlcmlhbCBzdGRpbzxicj4KICAgIOKAusKgwqAg
LWRpc3BsYXkgbm9uZTxicj4KICAgIOKAusKgwqAgLW1vbml0b3IgbnVsbDxicj4KICAgICk8YnI+
CiAgICA8YnI+CiAgICBhcHBlbmQ9KDxicj4KICAgIOKAusKgwqAgaXA9Ojo6OnZtLXNuYi04OTk0
MmRjYjEyNmY6OmRoY3A8YnI+CiAgICDigLrCoMKgIHJvb3Q9L2Rldi9yYW0wPGJyPgogICAg4oC6
wqDCoCB1c2VyPWxrcDxicj4KICAgIOKAusKgwqAgam9iPS9qb2Itc2NyaXB0PGJyPgogICAg4oC6
wqDCoApBUkNIPWkzODbCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCiAgICA8YnI+CiAgICDigLrCoMKgIGtjb25m
aWc9aTM4Ni1yYW5kY29uZmlnLWgwMDEtMjAxOTEyMjU8YnI+CiAgICDigLrCoMKgIGJyYW5jaD1s
aW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxOTEyMjUxODxicj4KICAgIOKAusKgwqAgY29tbWl0
PTg3YzQ2OTZkNTdiNWUzODBiYzI3MjBmZGZmMDc3MmIwNDI0NjJiN2Q8YnI+CiAgICDigLrCoMKg
CkJPT1RfSU1BR0U9L3BrZy9saW51eC9pMzg2LXJhbmRjb25maWctaDAwMS0yMDE5MTIyNS9nY2Mt
Ny84N2M0Njk2ZDU3YjVlMzgwYmMyNzIwZmRmZjA3NzJiMDQyNDYyYjdkL3ZtbGludXotNS41LjAt
cmMzLTAwMDAxLWc4N2M0Njk2ZDU3YjVlPGJyPgogICAg4oC6wqDCoCBtYXhfdXB0aW1lPTE1MDA8
YnI+CiAgICDigLrCoMKgClJFU1VMVF9ST09UPS9yZXN1bHQvdHJpbml0eS8zMDBzL3ZtLXNuYi95
b2N0by1taW5pbWFsLWkzODYtMjAxOS0wNS0yMC5jZ3ovaTM4Ni1yYW5kY29uZmlnLWgwMDEtMjAx
OTEyMjUvZ2NjLTcvODdjNDY5NmQ1N2I1ZTM4MGJjMjcyMGZkZmYwNzcyYjA0MjQ2MmI3ZC84PGJy
PgogICAg4oC6wqDCoCByZXN1bHRfc2VydmljZT10bXBmczxicj4KICAgIOKAusKgwqAgZGVidWc8
YnI+CiAgICDigLrCoMKgIGFwaWM9ZGVidWc8YnI+CiAgICDigLrCoMKgIHN5c3JxX2Fsd2F5c19l
bmFibGVkPGJyPgogICAg4oC6wqDCoCByY3VwZGF0ZS5yY3VfY3B1X3N0YWxsX3RpbWVvdXQ9MTAw
PGJyPgogICAg4oC6wqDCoCBuZXQuaWZuYW1lcz0wPGJyPgogICAg4oC6wqDCoCBwcmludGsuZGV2
a21zZz1vbjxicj4KICAgIOKAusKgwqAgcGFuaWM9LTE8YnI+CiAgICDigLrCoMKgIHNvZnRsb2Nr
dXBfcGFuaWM9MTxicj4KICAgIOKAusKgwqAgbm1pX3dhdGNoZG9nPXBhbmljPGJyPgogICAg4oC6
wqDCoCBvb3BzPXBhbmljPGJyPgogICAg4oC6wqDCoCBsb2FkX3JhbWRpc2s9Mjxicj4KICAgIOKA
usKgwqAgcHJvbXB0X3JhbWRpc2s9MDxicj4KICAgIOKAusKgwqAgZHJiZC5taW5vcl9jb3VudD04
PGJyPgogICAg4oC6wqDCoCBzeXN0ZW1kLmxvZ19sZXZlbD1lcnI8YnI+CiAgICDigLrCoMKgIGln
bm9yZV9sb2dsZXZlbDxicj4KICAgIOKAusKgwqAgY29uc29sZT10dHkwPGJyPgogICAg4oC6wqDC
oCBlYXJseXByaW50az10dHlTMCwxMTUyMDA8YnI+CiAgICDigLrCoMKgIGNvbnNvbGU9dHR5UzAs
MTE1MjAwPGJyPgogICAg4oC6wqDCoCB2Z2E9bm9ybWFsPGJyPgogICAg4oC6wqDCoCBydzxicj4K
ICAgIOKAusKgwqAgcmN1cGVyZi5zaHV0ZG93bj0wPGJyPgogICAg4oC6wqDCoCB3YXRjaGRvZ190
aHJlc2g9NjA8YnI+CiAgICApPGJyPgogICAgPGJyPgogICAgIiR7a3ZtW0BdfSIgLWFwcGVuZCAi
JHthcHBlbmRbKl19Ijxicj4KICAgIDxicj4KICAgIDxicj4KICAgIFdlIDxzcGFuIHN0eWxlPSJj
b2xvcjogcmdiKDUxLCA1MSwgNTEpOyBmb250LWZhbWlseTogLWFwcGxlLXN5c3RlbSwKICAgICAg
JnF1b3Q7UGluZ0ZhbmcgU0MmcXVvdDssICZxdW90O0hlbHZldGljYSBOZXVlJnF1b3Q7LCBTVEhl
aXRpLAogICAgICAmcXVvdDtNaWNyb3NvZnQgWWFoZWkmcXVvdDssIFRhaG9tYSwgc2Fucy1zZXJp
ZjsgZm9udC1zaXplOiAxNnB4OwogICAgICBmb250LXN0eWxlOiBub3JtYWw7IGZvbnQtdmFyaWFu
dC1saWdhdHVyZXM6IG5vcm1hbDsKICAgICAgZm9udC12YXJpYW50LWNhcHM6IG5vcm1hbDsgZm9u
dC13ZWlnaHQ6IDQwMDsgbGV0dGVyLXNwYWNpbmc6CiAgICAgIG5vcm1hbDsgb3JwaGFuczogMjsg
dGV4dC1hbGlnbjogc3RhcnQ7IHRleHQtaW5kZW50OiAwcHg7CiAgICAgIHRleHQtdHJhbnNmb3Jt
OiBub25lOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyB3aWRvd3M6IDI7CiAgICAgIHdvcmQtc3BhY2lu
ZzogMHB4OyAtd2Via2l0LXRleHQtc3Ryb2tlLXdpZHRoOiAwcHg7CiAgICAgIGJhY2tncm91bmQt
Y29sb3I6IHJnYigyNTUsIDI1NSwgMjU1KTsgdGV4dC1kZWNvcmF0aW9uLXN0eWxlOgogICAgICBp
bml0aWFsOyB0ZXh0LWRlY29yYXRpb24tY29sb3I6IGluaXRpYWw7IGRpc3BsYXk6IGlubGluZQog
ICAgICAhaW1wb3J0YW50OyBmbG9hdDogbm9uZTsiPndpbGwgZGVmaW5pdGVseSBnaXZlIHNlcmlv
dXMgdGhvdWdodCB0bwogICAgICB5b3VyIHN1Z2dlc3Rpb24uPC9zcGFuPjxicj4KICAgIDxicj4K
ICAgIEJlc3QgUmVnYXJkcyw8YnI+CiAgICBSb25nIENoZW48YnI+CiAgPC9ib2R5Pgo8L2h0bWw+
Cg==

--===============2462322046504635115==--

