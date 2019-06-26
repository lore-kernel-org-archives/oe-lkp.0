Content-Type: multipart/mixed; boundary="===============5201326587571271732=="
MIME-Version: 1.0
From: Liu Yiding <liuyd.fnst@cn.fujitsu.com>
To: lkp@lists.01.org
Subject: Re: 07173c3ec2: stderr.fio:pid=#, err=#/file:filesetup.c:#, func=fsync, error=Input/output_error
Date: Wed, 26 Jun 2019 10:42:52 +0800
Message-ID: <5ed0c074-0b29-7781-3cab-9d11afee19cb@cn.fujitsu.com>
In-Reply-To: <80a11f3b-5954-246c-a083-1d718863c8f1@cn.fujitsu.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5201326587571271732==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

sorry, something wrong with attatched file.

------

wipefs -a --force /dev/sdb1
mkfs -t xfs /dev/sdb1
mkdir -p /fs/sdb1
mount -t xfs -o inode64 /dev/sdb1 /fs/sdb1

for cpu_dir in /sys/devices/system/cpu/cpu[0-9]*
do
 =C2=A0=C2=A0=C2=A0 online_file=3D"$cpu_dir"/online
 =C2=A0=C2=A0=C2=A0 [ -f "$online_file" ] && [ "$(cat "$online_file")" -eq =
0 ] && continue

 =C2=A0=C2=A0=C2=A0 file=3D"$cpu_dir"/cpufreq/scaling_governor
 =C2=A0=C2=A0=C2=A0 [ -f "$file" ] && echo "performance" > "$file"
done

echo '[global]
bs=3D2M
ioengine=3Dsync
iodepth=3D32
size=3D68719476736
direct=3D0
runtime=3D300
invalidate=3D1
fallocate=3Dposix
group_reporting

[task_0]
rw=3Drandread
directory=3D/fs/sdb1
numjobs=3D8' | fio --output-format=3Djson -
umount /fs/sdb1

------


=E5=9C=A8 2019/6/26 =E4=B8=8A=E5=8D=8810:28, Liu Yiding =E5=86=99=E9=81=93:
>
> attatch reproduce.sh
>
>
> =E5=9C=A8 2019/6/26 =E4=B8=8A=E5=8D=8810:21, Liu Yiding =E5=86=99=E9=81=
=93:
>>
>> =E5=9C=A8 2019/6/26 =E4=B8=8A=E5=8D=8810:05, Ming Lei =E5=86=99=E9=81=93:
>>> On Wed, Jun 26, 2019 at 09:18:36AM +0800, Liu Yiding wrote:
>>>> Hi, Ming Lei.
>>>>
>>>>
>>>> =E5=9C=A8 2019/6/25 =E4=B8=8B=E5=8D=886:47, Ming Lei =E5=86=99=E9=81=
=93:
>>>>> Hi rong.a.chen,
>>>>>
>>>>> Thanks for your report!
>>>>>
>>>>> On Tue, Jun 25, 2019 at 04:32:48PM +0800, kernel test robot wrote:
>>>>>> FYI, we noticed the following commit (built with gcc-7):
>>>>>>
>>>>>> commit: 07173c3ec276cbb18dc0e0687d37d310e98a1480 ("block: enable =

>>>>>> multipage bvecs")
>>>>>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git =

>>>>>> master
>>>>>>
>>>>>> in testcase: fio-basic
>>>>>> on test machine: 72 threads Intel(R) Xeon(R) CPU E5-2699 v3 @ =

>>>>>> 2.30GHz with 256G memory
>>>>>> with following parameters:
>>>>>>
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0runtime: 300s
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0nr_task: 8t
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0disk: 1SSD
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0fs: xfs
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0rw: randread
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0bs: 2M
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0ioengine: sync
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0test_size: 512g
>>>>>>
>>>>>> caused below changes (please refer to attached dmesg/kmsg for =

>>>>>> entire log/backtrace):
>>>>>>
>>>>>> fio: pid=3D0, err=3D5/file:filesetup.c:190, func=3Dfsync, =

>>>>>> error=3DInput/output error
>>>>>> fio: pid=3D0, err=3D5/file:filesetup.c:190, func=3Dfsync, =

>>>>>> error=3DInput/output error
>>>>> I just tried the fio(randread, bs:2M, sync, nvme, xfs and block =

>>>>> device) test on
>>>>> 5.2-rc6 kernel, looks it can't be reproduced.
>>>>>
>>>>> For multi-page bvec change, I'd suggest to run test on 5.1 at least,
>>>>> since there are several follow-up fixes.
>>>>>
>>>>> Also the dmesg log seems not intact, looks it only shows booting.
>>>>>
>>>>> Please let us know if the issue can be triggered on 5.1 or 5.2.
>>>>
>>>> This issue can be triggered on v5.1 and v5,2-rc* (include v5.2-rc6)
>>>>
>>>> on v5.2-rc6 run 20 times, 10 times trigger out this issue.
>>> OK, thanks!
>>>
>>> It is EIO from fsync(), which should have something dumped in dmesg =

>>> log,
>>> could you provide me the dmesg log after the issue is triggered?
>>
>>
>> i have attatched the whole dmesg.xz on email.
>>
>>
>>>
>>> BTW, can you provide me the exact fio command in your test? I need to
>>> find a big machine like yours for reproducing it.
>>
>> lkp will do some test env setting for fio test,=C2=A0 it seems that this =

>> error happend in mount.
>>
>> ------
>>
>> [=C2=A0 107.314810] 2019-06-19 03:37:09 mount -t xfs -o inode64 /dev/sdb=
1 =

>> /fs/sdb1
>> [=C2=A0 107.314812]
>> [=C2=A0 107.316017] SGI XFS with ACLs, security attributes, realtime, =

>> scrub, debug enabled
>> [=C2=A0 107.338674] XFS (sdb1): Mounting V5 Filesystem
>> [=C2=A0 107.356339] XFS (sdb1): Ending clean mount
>> [=C2=A0 683.136603] WARNING: CPU: 1 PID: 1484 at =

>> drivers/scsi/scsi_lib.c:1010 scsi_init_io+0x103/0x170
>> [=C2=A0 683.148708] Modules linked in: xfs dm_mod btrfs xor =

>> zstd_decompress zstd_compress raid6_pq libcrc32c sd_mod sg intel_rapl =

>> sb_edac x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel kvm =

>> mgag200 ttm irqbypass drm_kms_helper crct10dif_pclmul crc32_pclmul =

>> crc32c_intel syscopyarea ghash_clmulni_intel snd_pcm sysfillrect =

>> ipmi_si snd_timer sysimgblt aesni_intel ahci ipmi_devintf crypto_simd =

>> snd fb_sys_fops libahci soundcore mei_me cryptd glue_helper =

>> ipmi_msghandler pcspkr drm libata mei ioatdma joydev lpc_ich i2c_i801 =

>> dca wmi acpi_power_meter acpi_pad pcc_cpufreq ip_tables
>> [=C2=A0 683.207865] CPU: 1 PID: 1484 Comm: kworker/1:1H Tainted: =

>> G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 5.2.0-rc5 #1
>> [=C2=A0 683.217421] Hardware name: Intel Corporation S2600WTT/S2600WTT, =

>> BIOS SE5C610.86B.01.01.0008.021120151325 02/11/2015
>> [=C2=A0 683.229600] Workqueue: kblockd blk_mq_run_work_fn
>> [=C2=A0 683.235364] RIP: 0010:scsi_init_io+0x103/0x170
>> [=C2=A0 683.240834] Code: 5c 41 5d c3 be 01 00 00 00 e9 49 ff ff ff 8b 4=
5 =

>> 70 89 83 08 01 00 00 f6 45 1a 01 75 92 31 c0 48 83 c4 08 5b 5d 41 5c =

>> 41 5d c3 <0f> 0b 48 83 c4 08 b8 0a 00 00 00 5b 5d 41 5c 41 5d c3 48 =

>> 8b 75 38
>> [=C2=A0 683.262867] RSP: 0018:ffffb8f1cf853c78 EFLAGS: 00010246
>> [=C2=A0 683.269260] RAX: 000000001d338288 RBX: ffff8d2af2612690 RCX: =

>> 0000000000000000
>> [=C2=A0 683.277768] RDX: 0000000000000000 RSI: 0000000000000000 RDI: =

>> ffff8d2af2612690
>> [=C2=A0 683.286278] RBP: ffff8d2af2612580 R08: 0000000000000000 R09: =

>> ffff8d2af26126c8
>> [=C2=A0 683.294785] R10: 0000000000000000 R11: fefefefefefefeff R12: =

>> 0000000000000801
>> [=C2=A0 683.303295] R13: 0000000000000000 R14: 0000000000000000 R15: =

>> ffff8d2b0b99a800
>> [=C2=A0 683.311804] FS:=C2=A0 0000000000000000(0000) GS:ffff8d2b3f240000=
(0000) =

>> knlGS:0000000000000000
>> [=C2=A0 683.321379] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 00000000800500=
33
>> [=C2=A0 683.328331] CR2: 00007faa9d9697d0 CR3: 000000407a8a8003 CR4: =

>> 00000000001606e0
>> [=C2=A0 683.336843] Call Trace:
>> [=C2=A0 683.340122]=C2=A0 sd_init_command+0x2ee/0xaf0 [sd_mod]
>> [=C2=A0 683.345917]=C2=A0 scsi_queue_rq+0x559/0xa80
>> [=C2=A0 683.350639]=C2=A0 blk_mq_dispatch_rq_list+0x3da/0x5b0
>> [=C2=A0 683.356333]=C2=A0 ? syscall_return_via_sysret+0x10/0x7f
>> [=C2=A0 683.362276]=C2=A0 ? __switch_to_asm+0x40/0x70
>> [=C2=A0 683.367187]=C2=A0 ? elv_rb_del+0x1f/0x30
>> [=C2=A0 683.371607]=C2=A0 ? deadline_remove_request+0x55/0xc0
>> [=C2=A0 683.377290]=C2=A0 blk_mq_do_dispatch_sched+0x76/0x120
>> [=C2=A0 683.382990]=C2=A0 blk_mq_sched_dispatch_requests+0x100/0x170
>> [=C2=A0 683.389349]=C2=A0 __blk_mq_run_hw_queue+0x60/0x130
>> [=C2=A0 683.394745]=C2=A0 process_one_work+0x19c/0x3c0
>> [=C2=A0 683.399746]=C2=A0 worker_thread+0x3c/0x3b0
>> [=C2=A0 683.404392]=C2=A0 ? process_one_work+0x3c0/0x3c0
>> [=C2=A0 683.409580]=C2=A0 kthread+0x11e/0x140
>> [=C2=A0 683.413734]=C2=A0 ? kthread_park+0x90/0x90
>> [=C2=A0 683.418335]=C2=A0 ret_from_fork+0x35/0x40
>> [=C2=A0 683.422841] ---[ end trace f691cac020928424 ]---
>> [=C2=A0 683.428614] print_req_error: I/O error, dev sdb, sector 48991501=
6 =

>> flags 801
>> [=C2=A0 683.561809] XFS (sdb1): writeback error on sector 489915016
>> [=C2=A0 732.579401] fio: pid=3D0, err=3D5/file:filesetup.c:190, func=3Df=
sync, =

>> error=3DInput/output error
>> [=C2=A0 732.579403]
>> [ 1022.580119] print_req_error: I/O error, dev sdb, sector 795883128 =

>> flags 801
>> [ 1022.933676] XFS (sdb1): writeback error on sector 795883128
>> [ 1035.041938] fio: pid=3D0, err=3D5/file:filesetup.c:190, func=3Dfsync, =

>> error=3DInput/output error
>>
>> ------
>>
>>
>>>
>>> Thanks,
>>> Ming
>>>
>>>
>>
>>
>>
>> _______________________________________________
>> LKP mailing list
>> LKP(a)lists.01.org
>> https://lists.01.org/mailman/listinfo/lkp
>
> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp



--===============5201326587571271732==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRl
bnQ9InRleHQvaHRtbDsgY2hhcnNldD1VVEYtOCI+CiAgPC9oZWFkPgogIDxib2R5IHRleHQ9IiMw
MDAwMDAiIGJnY29sb3I9IiNGRkZGRkYiPgogICAgPHA+c29ycnksIHNvbWV0aGluZyB3cm9uZyB3
aXRoIGF0dGF0Y2hlZCBmaWxlLjxicj4KICAgIDwvcD4KICAgIDxwPi0tLS0tLTwvcD4KICAgIDxw
PndpcGVmcyAtYSAtLWZvcmNlIC9kZXYvc2RiMTxicj4KICAgICAgbWtmcyAtdCB4ZnMgL2Rldi9z
ZGIxPGJyPgogICAgICBta2RpciAtcCAvZnMvc2RiMTxicj4KICAgICAgbW91bnQgLXQgeGZzIC1v
IGlub2RlNjQgL2Rldi9zZGIxIC9mcy9zZGIxPGJyPgogICAgICA8YnI+CiAgICAgIGZvciBjcHVf
ZGlyIGluIC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdVswLTldKjxicj4KICAgICAgZG88YnI+
CiAgICAgIMKgwqDCoCBvbmxpbmVfZmlsZT0iJGNwdV9kaXIiL29ubGluZTxicj4KICAgICAgwqDC
oMKgIFsgLWYgIiRvbmxpbmVfZmlsZSIgXSAmYW1wOyZhbXA7IFsgIiQoY2F0ICIkb25saW5lX2Zp
bGUiKSIgLWVxCiAgICAgIDAgXSAmYW1wOyZhbXA7IGNvbnRpbnVlPGJyPgogICAgICA8YnI+CiAg
ICAgIMKgwqDCoCBmaWxlPSIkY3B1X2RpciIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yPGJyPgog
ICAgICDCoMKgwqAgWyAtZiAiJGZpbGUiIF0gJmFtcDsmYW1wOyBlY2hvICJwZXJmb3JtYW5jZSIg
Jmd0OyAiJGZpbGUiPGJyPgogICAgICBkb25lPGJyPgogICAgICA8YnI+CiAgICAgIGVjaG8gJ1tn
bG9iYWxdPGJyPgogICAgICBicz0yTTxicj4KICAgICAgaW9lbmdpbmU9c3luYzxicj4KICAgICAg
aW9kZXB0aD0zMjxicj4KICAgICAgc2l6ZT02ODcxOTQ3NjczNjxicj4KICAgICAgZGlyZWN0PTA8
YnI+CiAgICAgIHJ1bnRpbWU9MzAwPGJyPgogICAgICBpbnZhbGlkYXRlPTE8YnI+CiAgICAgIGZh
bGxvY2F0ZT1wb3NpeDxicj4KICAgICAgZ3JvdXBfcmVwb3J0aW5nPGJyPgogICAgICA8YnI+CiAg
ICAgIFt0YXNrXzBdPGJyPgogICAgICBydz1yYW5kcmVhZDxicj4KICAgICAgZGlyZWN0b3J5PS9m
cy9zZGIxPGJyPgogICAgICBudW1qb2JzPTgnIHwgZmlvIC0tb3V0cHV0LWZvcm1hdD1qc29uIC08
YnI+CiAgICAgIHVtb3VudCAvZnMvc2RiMTxicj4KICAgIDwvcD4KICAgIDxwPi0tLS0tLTxicj4K
ICAgIDwvcD4KICAgIDxwPjxicj4KICAgIDwvcD4KICAgIDxkaXYgY2xhc3M9Im1vei1jaXRlLXBy
ZWZpeCI+5ZyoIDIwMTkvNi8yNiDkuIrljYgxMDoyOCwgTGl1IFlpZGluZyDlhpnpgZM6PGJyPgog
ICAgPC9kaXY+CiAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIgogICAgICBjaXRlPSJtaWQ6ODBh
MTFmM2ItNTk1NC0yNDZjLWEwODMtMWQ3MTg4NjNjOGYxQGNuLmZ1aml0c3UuY29tIj4KICAgICAg
PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJz
ZXQ9VVRGLTgiPgogICAgICA8cD5hdHRhdGNoIHJlcHJvZHVjZS5zaDxicj4KICAgICAgPC9wPgog
ICAgICA8cD48YnI+CiAgICAgIDwvcD4KICAgICAgPGRpdiBjbGFzcz0ibW96LWNpdGUtcHJlZml4
Ij7lnKggMjAxOS82LzI2IOS4iuWNiDEwOjIxLCBMaXUgWWlkaW5nIOWGmemBkzo8YnI+CiAgICAg
IDwvZGl2PgogICAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIgogICAgICAgIGNpdGU9Im1pZDoz
NWIzNTA0Yi1lMWRjLWYzNDUtNzZhNC1lYmYxYzVmOWFjNTdAY24uZnVqaXRzdS5jb20iPgogICAg
ICAgIDxicj4KICAgICAgICDlnKggMjAxOS82LzI2IOS4iuWNiDEwOjA1LCBNaW5nIExlaSDlhpnp
gZM6IDxicj4KICAgICAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj5PbiBXZWQsIEp1biAyNiwg
MjAxOSBhdCAwOToxODozNkFNCiAgICAgICAgICArMDgwMCwgTGl1IFlpZGluZyB3cm90ZTogPGJy
PgogICAgICAgICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+SGksIE1pbmcgTGVpLiA8YnI+CiAg
ICAgICAgICAgIDxicj4KICAgICAgICAgICAgPGJyPgogICAgICAgICAgICDlnKggMjAxOS82LzI1
IOS4i+WNiDY6NDcsIE1pbmcgTGVpIOWGmemBkzogPGJyPgogICAgICAgICAgICA8YmxvY2txdW90
ZSB0eXBlPSJjaXRlIj5IaSByb25nLmEuY2hlbiwgPGJyPgogICAgICAgICAgICAgIDxicj4KICAg
ICAgICAgICAgICBUaGFua3MgZm9yIHlvdXIgcmVwb3J0ISA8YnI+CiAgICAgICAgICAgICAgPGJy
PgogICAgICAgICAgICAgIE9uIFR1ZSwgSnVuIDI1LCAyMDE5IGF0IDA0OjMyOjQ4UE0gKzA4MDAs
IGtlcm5lbCB0ZXN0CiAgICAgICAgICAgICAgcm9ib3Qgd3JvdGU6IDxicj4KICAgICAgICAgICAg
ICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj5GWUksIHdlIG5vdGljZWQgdGhlIGZvbGxvd2luZwog
ICAgICAgICAgICAgICAgY29tbWl0IChidWlsdCB3aXRoIGdjYy03KTogPGJyPgogICAgICAgICAg
ICAgICAgPGJyPgogICAgICAgICAgICAgICAgY29tbWl0OiAwNzE3M2MzZWMyNzZjYmIxOGRjMGUw
Njg3ZDM3ZDMxMGU5OGExNDgwCiAgICAgICAgICAgICAgICAoImJsb2NrOiBlbmFibGUgbXVsdGlw
YWdlIGJ2ZWNzIikgPGJyPgogICAgICAgICAgICAgICAgPGEgY2xhc3M9Im1vei10eHQtbGluay1m
cmVldGV4dCIKICAgICAgICAgICAgICAgICAgaHJlZj0iaHR0cHM6Ly9naXQua2VybmVsLm9yZy9j
Z2l0L2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0IgogICAgICAgICAgICAgICAg
ICBtb3otZG8tbm90LXNlbmQ9InRydWUiPmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvY2dpdC9saW51
eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdDwvYT7CoAogICAgICAgICAgICAgICAgbWFz
dGVyIDxicj4KICAgICAgICAgICAgICAgIDxicj4KICAgICAgICAgICAgICAgIGluIHRlc3RjYXNl
OiBmaW8tYmFzaWMgPGJyPgogICAgICAgICAgICAgICAgb24gdGVzdCBtYWNoaW5lOiA3MiB0aHJl
YWRzIEludGVsKFIpIFhlb24oUikgQ1BVIEU1LTI2OTkKICAgICAgICAgICAgICAgIHYzIEAgMi4z
MEdIeiB3aXRoIDI1NkcgbWVtb3J5IDxicj4KICAgICAgICAgICAgICAgIHdpdGggZm9sbG93aW5n
IHBhcmFtZXRlcnM6IDxicj4KICAgICAgICAgICAgICAgIDxicj4KICAgICAgICAgICAgICAgIMKg
wqDCoMKgcnVudGltZTogMzAwcyA8YnI+CiAgICAgICAgICAgICAgICDCoMKgwqDCoG5yX3Rhc2s6
IDh0IDxicj4KICAgICAgICAgICAgICAgIMKgwqDCoMKgZGlzazogMVNTRCA8YnI+CiAgICAgICAg
ICAgICAgICDCoMKgwqDCoGZzOiB4ZnMgPGJyPgogICAgICAgICAgICAgICAgwqDCoMKgwqBydzog
cmFuZHJlYWQgPGJyPgogICAgICAgICAgICAgICAgwqDCoMKgwqBiczogMk0gPGJyPgogICAgICAg
ICAgICAgICAgwqDCoMKgwqBpb2VuZ2luZTogc3luYyA8YnI+CiAgICAgICAgICAgICAgICDCoMKg
wqDCoHRlc3Rfc2l6ZTogNTEyZyA8YnI+CiAgICAgICAgICAgICAgICA8YnI+CiAgICAgICAgICAg
ICAgICBjYXVzZWQgYmVsb3cgY2hhbmdlcyAocGxlYXNlIHJlZmVyIHRvIGF0dGFjaGVkCiAgICAg
ICAgICAgICAgICBkbWVzZy9rbXNnIGZvciBlbnRpcmUgbG9nL2JhY2t0cmFjZSk6IDxicj4KICAg
ICAgICAgICAgICAgIDxicj4KICAgICAgICAgICAgICAgIGZpbzogcGlkPTAsIGVycj01LzxhIGNs
YXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQiCiAgICAgICAgICAgICAgICAgIGhyZWY9ImZpbGU6
ZmlsZXNldHVwLmM6MTkwIiBtb3otZG8tbm90LXNlbmQ9InRydWUiPmZpbGU6ZmlsZXNldHVwLmM6
MTkwPC9hPiwKICAgICAgICAgICAgICAgIGZ1bmM9ZnN5bmMsIGVycm9yPUlucHV0L291dHB1dCBl
cnJvciA8YnI+CiAgICAgICAgICAgICAgICBmaW86IHBpZD0wLCBlcnI9NS88YSBjbGFzcz0ibW96
LXR4dC1saW5rLWZyZWV0ZXh0IgogICAgICAgICAgICAgICAgICBocmVmPSJmaWxlOmZpbGVzZXR1
cC5jOjE5MCIgbW96LWRvLW5vdC1zZW5kPSJ0cnVlIj5maWxlOmZpbGVzZXR1cC5jOjE5MDwvYT4s
CiAgICAgICAgICAgICAgICBmdW5jPWZzeW5jLCBlcnJvcj1JbnB1dC9vdXRwdXQgZXJyb3IgPGJy
PgogICAgICAgICAgICAgIDwvYmxvY2txdW90ZT4KICAgICAgICAgICAgICBJIGp1c3QgdHJpZWQg
dGhlIGZpbyhyYW5kcmVhZCwgYnM6Mk0sIHN5bmMsIG52bWUsIHhmcyBhbmQKICAgICAgICAgICAg
ICBibG9jayBkZXZpY2UpIHRlc3Qgb24gPGJyPgogICAgICAgICAgICAgIDUuMi1yYzYga2VybmVs
LCBsb29rcyBpdCBjYW4ndCBiZSByZXByb2R1Y2VkLiA8YnI+CiAgICAgICAgICAgICAgPGJyPgog
ICAgICAgICAgICAgIEZvciBtdWx0aS1wYWdlIGJ2ZWMgY2hhbmdlLCBJJ2Qgc3VnZ2VzdCB0byBy
dW4gdGVzdCBvbiA1LjEKICAgICAgICAgICAgICBhdCBsZWFzdCwgPGJyPgogICAgICAgICAgICAg
IHNpbmNlIHRoZXJlIGFyZSBzZXZlcmFsIGZvbGxvdy11cCBmaXhlcy4gPGJyPgogICAgICAgICAg
ICAgIDxicj4KICAgICAgICAgICAgICBBbHNvIHRoZSBkbWVzZyBsb2cgc2VlbXMgbm90IGludGFj
dCwgbG9va3MgaXQgb25seSBzaG93cwogICAgICAgICAgICAgIGJvb3RpbmcuIDxicj4KICAgICAg
ICAgICAgICA8YnI+CiAgICAgICAgICAgICAgUGxlYXNlIGxldCB1cyBrbm93IGlmIHRoZSBpc3N1
ZSBjYW4gYmUgdHJpZ2dlcmVkIG9uIDUuMSBvcgogICAgICAgICAgICAgIDUuMi4gPGJyPgogICAg
ICAgICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgICAgICAgIDxicj4KICAgICAgICAgICAgVGhpcyBp
c3N1ZSBjYW4gYmUgdHJpZ2dlcmVkIG9uIHY1LjEgYW5kIHY1LDItcmMqIChpbmNsdWRlCiAgICAg
ICAgICAgIHY1LjItcmM2KSA8YnI+CiAgICAgICAgICAgIDxicj4KICAgICAgICAgICAgb24gdjUu
Mi1yYzYgcnVuIDIwIHRpbWVzLCAxMCB0aW1lcyB0cmlnZ2VyIG91dCB0aGlzIGlzc3VlLiA8YnI+
CiAgICAgICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgICAgICBPSywgdGhhbmtzISA8YnI+CiAgICAg
ICAgICA8YnI+CiAgICAgICAgICBJdCBpcyBFSU8gZnJvbSBmc3luYygpLCB3aGljaCBzaG91bGQg
aGF2ZSBzb21ldGhpbmcgZHVtcGVkIGluCiAgICAgICAgICBkbWVzZyBsb2csIDxicj4KICAgICAg
ICAgIGNvdWxkIHlvdSBwcm92aWRlIG1lIHRoZSBkbWVzZyBsb2cgYWZ0ZXIgdGhlIGlzc3VlIGlz
CiAgICAgICAgICB0cmlnZ2VyZWQ/IDxicj4KICAgICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgICAg
PGJyPgogICAgICAgIDxicj4KICAgICAgICBpIGhhdmUgYXR0YXRjaGVkIHRoZSB3aG9sZSBkbWVz
Zy54eiBvbiBlbWFpbC4gPGJyPgogICAgICAgIDxicj4KICAgICAgICA8YnI+CiAgICAgICAgPGJs
b2NrcXVvdGUgdHlwZT0iY2l0ZSI+IDxicj4KICAgICAgICAgIEJUVywgY2FuIHlvdSBwcm92aWRl
IG1lIHRoZSBleGFjdCBmaW8gY29tbWFuZCBpbiB5b3VyIHRlc3Q/IEkKICAgICAgICAgIG5lZWQg
dG8gPGJyPgogICAgICAgICAgZmluZCBhIGJpZyBtYWNoaW5lIGxpa2UgeW91cnMgZm9yIHJlcHJv
ZHVjaW5nIGl0LiA8YnI+CiAgICAgICAgPC9ibG9ja3F1b3RlPgogICAgICAgIDxicj4KICAgICAg
ICBsa3Agd2lsbCBkbyBzb21lIHRlc3QgZW52IHNldHRpbmcgZm9yIGZpbyB0ZXN0LMKgIGl0IHNl
ZW1zIHRoYXQKICAgICAgICB0aGlzIGVycm9yIGhhcHBlbmQgaW4gbW91bnQuIDxicj4KICAgICAg
ICA8YnI+CiAgICAgICAgLS0tLS0tIDxicj4KICAgICAgICA8YnI+CiAgICAgICAgW8KgIDEwNy4z
MTQ4MTBdIDIwMTktMDYtMTkgMDM6Mzc6MDkgbW91bnQgLXQgeGZzIC1vIGlub2RlNjQKICAgICAg
ICAvZGV2L3NkYjEgL2ZzL3NkYjEgPGJyPgogICAgICAgIFvCoCAxMDcuMzE0ODEyXSA8YnI+CiAg
ICAgICAgW8KgIDEwNy4zMTYwMTddIFNHSSBYRlMgd2l0aCBBQ0xzLCBzZWN1cml0eSBhdHRyaWJ1
dGVzLCByZWFsdGltZSwKICAgICAgICBzY3J1YiwgZGVidWcgZW5hYmxlZCA8YnI+CiAgICAgICAg
W8KgIDEwNy4zMzg2NzRdIFhGUyAoc2RiMSk6IE1vdW50aW5nIFY1IEZpbGVzeXN0ZW0gPGJyPgog
ICAgICAgIFvCoCAxMDcuMzU2MzM5XSBYRlMgKHNkYjEpOiBFbmRpbmcgY2xlYW4gbW91bnQgPGJy
PgogICAgICAgIFvCoCA2ODMuMTM2NjAzXSBXQVJOSU5HOiBDUFU6IDEgUElEOiAxNDg0IGF0CiAg
ICAgICAgZHJpdmVycy9zY3NpL3Njc2lfbGliLmM6MTAxMCBzY3NpX2luaXRfaW8rMHgxMDMvMHgx
NzAgPGJyPgogICAgICAgIFvCoCA2ODMuMTQ4NzA4XSBNb2R1bGVzIGxpbmtlZCBpbjogeGZzIGRt
X21vZCBidHJmcyB4b3IKICAgICAgICB6c3RkX2RlY29tcHJlc3MgenN0ZF9jb21wcmVzcyByYWlk
Nl9wcSBsaWJjcmMzMmMgc2RfbW9kIHNnCiAgICAgICAgaW50ZWxfcmFwbCBzYl9lZGFjIHg4Nl9w
a2dfdGVtcF90aGVybWFsIGludGVsX3Bvd2VyY2xhbXAKICAgICAgICBjb3JldGVtcCBrdm1faW50
ZWwga3ZtIG1nYWcyMDAgdHRtIGlycWJ5cGFzcyBkcm1fa21zX2hlbHBlcgogICAgICAgIGNyY3Qx
MGRpZl9wY2xtdWwgY3JjMzJfcGNsbXVsIGNyYzMyY19pbnRlbCBzeXNjb3B5YXJlYQogICAgICAg
IGdoYXNoX2NsbXVsbmlfaW50ZWwgc25kX3BjbSBzeXNmaWxscmVjdCBpcG1pX3NpIHNuZF90aW1l
cgogICAgICAgIHN5c2ltZ2JsdCBhZXNuaV9pbnRlbCBhaGNpIGlwbWlfZGV2aW50ZiBjcnlwdG9f
c2ltZCBzbmQKICAgICAgICBmYl9zeXNfZm9wcyBsaWJhaGNpIHNvdW5kY29yZSBtZWlfbWUgY3J5
cHRkIGdsdWVfaGVscGVyCiAgICAgICAgaXBtaV9tc2doYW5kbGVyIHBjc3BrciBkcm0gbGliYXRh
IG1laSBpb2F0ZG1hIGpveWRldiBscGNfaWNoCiAgICAgICAgaTJjX2k4MDEgZGNhIHdtaSBhY3Bp
X3Bvd2VyX21ldGVyIGFjcGlfcGFkIHBjY19jcHVmcmVxIGlwX3RhYmxlcwogICAgICAgIDxicj4K
ICAgICAgICBbwqAgNjgzLjIwNzg2NV0gQ1BVOiAxIFBJRDogMTQ4NCBDb21tOiBrd29ya2VyLzE6
MUggVGFpbnRlZDoKICAgICAgICBHwqDCoMKgwqDCoMKgwqDCoMKgIEnCoMKgwqDCoMKgwqAgNS4y
LjAtcmM1ICMxIDxicj4KICAgICAgICBbwqAgNjgzLjIxNzQyMV0gSGFyZHdhcmUgbmFtZTogSW50
ZWwgQ29ycG9yYXRpb24KICAgICAgICBTMjYwMFdUVC9TMjYwMFdUVCwgQklPUyBTRTVDNjEwLjg2
Qi4wMS4wMS4wMDA4LjAyMTEyMDE1MTMyNQogICAgICAgIDAyLzExLzIwMTUgPGJyPgogICAgICAg
IFvCoCA2ODMuMjI5NjAwXSBXb3JrcXVldWU6IGtibG9ja2QgYmxrX21xX3J1bl93b3JrX2ZuIDxi
cj4KICAgICAgICBbwqAgNjgzLjIzNTM2NF0gUklQOiAwMDEwOnNjc2lfaW5pdF9pbysweDEwMy8w
eDE3MCA8YnI+CiAgICAgICAgW8KgIDY4My4yNDA4MzRdIENvZGU6IDVjIDQxIDVkIGMzIGJlIDAx
IDAwIDAwIDAwIGU5IDQ5IGZmIGZmIGZmCiAgICAgICAgOGIgNDUgNzAgODkgODMgMDggMDEgMDAg
MDAgZjYgNDUgMWEgMDEgNzUgOTIgMzEgYzAgNDggODMgYzQgMDgKICAgICAgICA1YiA1ZCA0MSA1
YyA0MSA1ZCBjMyAmbHQ7MGYmZ3Q7IDBiIDQ4IDgzIGM0IDA4IGI4IDBhIDAwIDAwIDAwIDViCiAg
ICAgICAgNWQgNDEgNWMgNDEgNWQgYzMgNDggOGIgNzUgMzggPGJyPgogICAgICAgIFvCoCA2ODMu
MjYyODY3XSBSU1A6IDAwMTg6ZmZmZmI4ZjFjZjg1M2M3OCBFRkxBR1M6IDAwMDEwMjQ2IDxicj4K
ICAgICAgICBbwqAgNjgzLjI2OTI2MF0gUkFYOiAwMDAwMDAwMDFkMzM4Mjg4IFJCWDogZmZmZjhk
MmFmMjYxMjY5MCBSQ1g6CiAgICAgICAgMDAwMDAwMDAwMDAwMDAwMCA8YnI+CiAgICAgICAgW8Kg
IDY4My4yNzc3NjhdIFJEWDogMDAwMDAwMDAwMDAwMDAwMCBSU0k6IDAwMDAwMDAwMDAwMDAwMDAg
UkRJOgogICAgICAgIGZmZmY4ZDJhZjI2MTI2OTAgPGJyPgogICAgICAgIFvCoCA2ODMuMjg2Mjc4
XSBSQlA6IGZmZmY4ZDJhZjI2MTI1ODAgUjA4OiAwMDAwMDAwMDAwMDAwMDAwIFIwOToKICAgICAg
ICBmZmZmOGQyYWYyNjEyNmM4IDxicj4KICAgICAgICBbwqAgNjgzLjI5NDc4NV0gUjEwOiAwMDAw
MDAwMDAwMDAwMDAwIFIxMTogZmVmZWZlZmVmZWZlZmVmZiBSMTI6CiAgICAgICAgMDAwMDAwMDAw
MDAwMDgwMSA8YnI+CiAgICAgICAgW8KgIDY4My4zMDMyOTVdIFIxMzogMDAwMDAwMDAwMDAwMDAw
MCBSMTQ6IDAwMDAwMDAwMDAwMDAwMDAgUjE1OgogICAgICAgIGZmZmY4ZDJiMGI5OWE4MDAgPGJy
PgogICAgICAgIFvCoCA2ODMuMzExODA0XSBGUzrCoCAwMDAwMDAwMDAwMDAwMDAwKDAwMDApCiAg
ICAgICAgR1M6ZmZmZjhkMmIzZjI0MDAwMCgwMDAwKSBrbmxHUzowMDAwMDAwMDAwMDAwMDAwIDxi
cj4KICAgICAgICBbwqAgNjgzLjMyMTM3OV0gQ1M6wqAgMDAxMCBEUzogMDAwMCBFUzogMDAwMCBD
UjA6IDAwMDAwMDAwODAwNTAwMzMKICAgICAgICA8YnI+CiAgICAgICAgW8KgIDY4My4zMjgzMzFd
IENSMjogMDAwMDdmYWE5ZDk2OTdkMCBDUjM6IDAwMDAwMDQwN2E4YTgwMDMgQ1I0OgogICAgICAg
IDAwMDAwMDAwMDAxNjA2ZTAgPGJyPgogICAgICAgIFvCoCA2ODMuMzM2ODQzXSBDYWxsIFRyYWNl
OiA8YnI+CiAgICAgICAgW8KgIDY4My4zNDAxMjJdwqAgc2RfaW5pdF9jb21tYW5kKzB4MmVlLzB4
YWYwIFtzZF9tb2RdIDxicj4KICAgICAgICBbwqAgNjgzLjM0NTkxN13CoCBzY3NpX3F1ZXVlX3Jx
KzB4NTU5LzB4YTgwIDxicj4KICAgICAgICBbwqAgNjgzLjM1MDYzOV3CoCBibGtfbXFfZGlzcGF0
Y2hfcnFfbGlzdCsweDNkYS8weDViMCA8YnI+CiAgICAgICAgW8KgIDY4My4zNTYzMzNdwqAgPyBz
eXNjYWxsX3JldHVybl92aWFfc3lzcmV0KzB4MTAvMHg3ZiA8YnI+CiAgICAgICAgW8KgIDY4My4z
NjIyNzZdwqAgPyBfX3N3aXRjaF90b19hc20rMHg0MC8weDcwIDxicj4KICAgICAgICBbwqAgNjgz
LjM2NzE4N13CoCA/IGVsdl9yYl9kZWwrMHgxZi8weDMwIDxicj4KICAgICAgICBbwqAgNjgzLjM3
MTYwN13CoCA/IGRlYWRsaW5lX3JlbW92ZV9yZXF1ZXN0KzB4NTUvMHhjMCA8YnI+CiAgICAgICAg
W8KgIDY4My4zNzcyOTBdwqAgYmxrX21xX2RvX2Rpc3BhdGNoX3NjaGVkKzB4NzYvMHgxMjAgPGJy
PgogICAgICAgIFvCoCA2ODMuMzgyOTkwXcKgIGJsa19tcV9zY2hlZF9kaXNwYXRjaF9yZXF1ZXN0
cysweDEwMC8weDE3MCA8YnI+CiAgICAgICAgW8KgIDY4My4zODkzNDldwqAgX19ibGtfbXFfcnVu
X2h3X3F1ZXVlKzB4NjAvMHgxMzAgPGJyPgogICAgICAgIFvCoCA2ODMuMzk0NzQ1XcKgIHByb2Nl
c3Nfb25lX3dvcmsrMHgxOWMvMHgzYzAgPGJyPgogICAgICAgIFvCoCA2ODMuMzk5NzQ2XcKgIHdv
cmtlcl90aHJlYWQrMHgzYy8weDNiMCA8YnI+CiAgICAgICAgW8KgIDY4My40MDQzOTJdwqAgPyBw
cm9jZXNzX29uZV93b3JrKzB4M2MwLzB4M2MwIDxicj4KICAgICAgICBbwqAgNjgzLjQwOTU4MF3C
oCBrdGhyZWFkKzB4MTFlLzB4MTQwIDxicj4KICAgICAgICBbwqAgNjgzLjQxMzczNF3CoCA/IGt0
aHJlYWRfcGFyaysweDkwLzB4OTAgPGJyPgogICAgICAgIFvCoCA2ODMuNDE4MzM1XcKgIHJldF9m
cm9tX2ZvcmsrMHgzNS8weDQwIDxicj4KICAgICAgICBbwqAgNjgzLjQyMjg0MV0gLS0tWyBlbmQg
dHJhY2UgZjY5MWNhYzAyMDkyODQyNCBdLS0tIDxicj4KICAgICAgICBbwqAgNjgzLjQyODYxNF0g
cHJpbnRfcmVxX2Vycm9yOiBJL08gZXJyb3IsIGRldiBzZGIsIHNlY3RvcgogICAgICAgIDQ4OTkx
NTAxNiBmbGFncyA4MDEgPGJyPgogICAgICAgIFvCoCA2ODMuNTYxODA5XSBYRlMgKHNkYjEpOiB3
cml0ZWJhY2sgZXJyb3Igb24gc2VjdG9yIDQ4OTkxNTAxNiA8YnI+CiAgICAgICAgW8KgIDczMi41
Nzk0MDFdIGZpbzogcGlkPTAsIGVycj01LzxhCiAgICAgICAgICBjbGFzcz0ibW96LXR4dC1saW5r
LWZyZWV0ZXh0IiBocmVmPSJmaWxlOmZpbGVzZXR1cC5jOjE5MCIKICAgICAgICAgIG1vei1kby1u
b3Qtc2VuZD0idHJ1ZSI+ZmlsZTpmaWxlc2V0dXAuYzoxOTA8L2E+LCBmdW5jPWZzeW5jLAogICAg
ICAgIGVycm9yPUlucHV0L291dHB1dCBlcnJvciA8YnI+CiAgICAgICAgW8KgIDczMi41Nzk0MDNd
IDxicj4KICAgICAgICBbIDEwMjIuNTgwMTE5XSBwcmludF9yZXFfZXJyb3I6IEkvTyBlcnJvciwg
ZGV2IHNkYiwgc2VjdG9yCiAgICAgICAgNzk1ODgzMTI4IGZsYWdzIDgwMSA8YnI+CiAgICAgICAg
WyAxMDIyLjkzMzY3Nl0gWEZTIChzZGIxKTogd3JpdGViYWNrIGVycm9yIG9uIHNlY3RvciA3OTU4
ODMxMjggPGJyPgogICAgICAgIFsgMTAzNS4wNDE5MzhdIGZpbzogcGlkPTAsIGVycj01LzxhCiAg
ICAgICAgICBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVmPSJmaWxlOmZpbGVzZXR1
cC5jOjE5MCIKICAgICAgICAgIG1vei1kby1ub3Qtc2VuZD0idHJ1ZSI+ZmlsZTpmaWxlc2V0dXAu
YzoxOTA8L2E+LCBmdW5jPWZzeW5jLAogICAgICAgIGVycm9yPUlucHV0L291dHB1dCBlcnJvciA8
YnI+CiAgICAgICAgPGJyPgogICAgICAgIC0tLS0tLSA8YnI+CiAgICAgICAgPGJyPgogICAgICAg
IDxicj4KICAgICAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj4gPGJyPgogICAgICAgICAgVGhh
bmtzLCA8YnI+CiAgICAgICAgICBNaW5nIDxicj4KICAgICAgICAgIDxicj4KICAgICAgICAgIDxi
cj4KICAgICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgICAgPGJyPgogICAgICAgIDxicj4KICAgICAg
ICA8YnI+CiAgICAgICAgPGZpZWxkc2V0IGNsYXNzPSJtaW1lQXR0YWNobWVudEhlYWRlciI+PC9m
aWVsZHNldD4KICAgICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxLUCBtYWlsaW5nIGxp
c3QKPGEgY2xhc3M9Im1vei10eHQtbGluay1hYmJyZXZpYXRlZCIgaHJlZj0ibWFpbHRvOkxLUEBs
aXN0cy4wMS5vcmciIG1vei1kby1ub3Qtc2VuZD0idHJ1ZSI+TEtQQGxpc3RzLjAxLm9yZzwvYT4K
PGEgY2xhc3M9Im1vei10eHQtbGluay1mcmVldGV4dCIgaHJlZj0iaHR0cHM6Ly9saXN0cy4wMS5v
cmcvbWFpbG1hbi9saXN0aW5mby9sa3AiIG1vei1kby1ub3Qtc2VuZD0idHJ1ZSI+aHR0cHM6Ly9s
aXN0cy4wMS5vcmcvbWFpbG1hbi9saXN0aW5mby9sa3A8L2E+CjwvcHJlPgogICAgICA8L2Jsb2Nr
cXVvdGU+CiAgICAgIDxicj4KICAgICAgPGZpZWxkc2V0IGNsYXNzPSJtaW1lQXR0YWNobWVudEhl
YWRlciI+PC9maWVsZHNldD4KICAgICAgPHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0i
Ij5fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMS1AgbWFp
bGluZyBsaXN0CjxhIGNsYXNzPSJtb3otdHh0LWxpbmstYWJicmV2aWF0ZWQiIGhyZWY9Im1haWx0
bzpMS1BAbGlzdHMuMDEub3JnIj5MS1BAbGlzdHMuMDEub3JnPC9hPgo8YSBjbGFzcz0ibW96LXR4
dC1saW5rLWZyZWV0ZXh0IiBocmVmPSJodHRwczovL2xpc3RzLjAxLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xrcCI+aHR0cHM6Ly9saXN0cy4wMS5vcmcvbWFpbG1hbi9saXN0aW5mby9sa3A8L2E+Cjwv
cHJlPgogICAgPC9ibG9ja3F1b3RlPgogIDwvYm9keT4KPC9odG1sPgo=

--===============5201326587571271732==--

