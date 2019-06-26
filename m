Content-Type: multipart/mixed; boundary="===============7391242485337572365=="
MIME-Version: 1.0
From: Liu Yiding <liuyd.fnst@cn.fujitsu.com>
To: lkp@lists.01.org
Subject: Re: 07173c3ec2: stderr.fio:pid=#, err=#/file:filesetup.c:#, func=fsync, error=Input/output_error
Date: Wed, 26 Jun 2019 10:28:10 +0800
Message-ID: <80a11f3b-5954-246c-a083-1d718863c8f1@cn.fujitsu.com>
In-Reply-To: <35b3504b-e1dc-f345-76a4-ebf1c5f9ac57@cn.fujitsu.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7391242485337572365==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

attatch reproduce.sh


=E5=9C=A8 2019/6/26 =E4=B8=8A=E5=8D=8810:21, Liu Yiding =E5=86=99=E9=81=93:
>
> =E5=9C=A8 2019/6/26 =E4=B8=8A=E5=8D=8810:05, Ming Lei =E5=86=99=E9=81=93:
>> On Wed, Jun 26, 2019 at 09:18:36AM +0800, Liu Yiding wrote:
>>> Hi, Ming Lei.
>>>
>>>
>>> =E5=9C=A8 2019/6/25 =E4=B8=8B=E5=8D=886:47, Ming Lei =E5=86=99=E9=81=93:
>>>> Hi rong.a.chen,
>>>>
>>>> Thanks for your report!
>>>>
>>>> On Tue, Jun 25, 2019 at 04:32:48PM +0800, kernel test robot wrote:
>>>>> FYI, we noticed the following commit (built with gcc-7):
>>>>>
>>>>> commit: 07173c3ec276cbb18dc0e0687d37d310e98a1480 ("block: enable =

>>>>> multipage bvecs")
>>>>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git=C2=A0 =

>>>>> master
>>>>>
>>>>> in testcase: fio-basic
>>>>> on test machine: 72 threads Intel(R) Xeon(R) CPU E5-2699 v3 @ =

>>>>> 2.30GHz with 256G memory
>>>>> with following parameters:
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0runtime: 300s
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0nr_task: 8t
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0disk: 1SSD
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0fs: xfs
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0rw: randread
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0bs: 2M
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0ioengine: sync
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0test_size: 512g
>>>>>
>>>>> caused below changes (please refer to attached dmesg/kmsg for =

>>>>> entire log/backtrace):
>>>>>
>>>>> fio: pid=3D0, err=3D5/file:filesetup.c:190, func=3Dfsync, =

>>>>> error=3DInput/output error
>>>>> fio: pid=3D0, err=3D5/file:filesetup.c:190, func=3Dfsync, =

>>>>> error=3DInput/output error
>>>> I just tried the fio(randread, bs:2M, sync, nvme, xfs and block =

>>>> device) test on
>>>> 5.2-rc6 kernel, looks it can't be reproduced.
>>>>
>>>> For multi-page bvec change, I'd suggest to run test on 5.1 at least,
>>>> since there are several follow-up fixes.
>>>>
>>>> Also the dmesg log seems not intact, looks it only shows booting.
>>>>
>>>> Please let us know if the issue can be triggered on 5.1 or 5.2.
>>>
>>> This issue can be triggered on v5.1 and v5,2-rc* (include v5.2-rc6)
>>>
>>> on v5.2-rc6 run 20 times, 10 times trigger out this issue.
>> OK, thanks!
>>
>> It is EIO from fsync(), which should have something dumped in dmesg log,
>> could you provide me the dmesg log after the issue is triggered?
>
>
> i have attatched the whole dmesg.xz on email.
>
>
>>
>> BTW, can you provide me the exact fio command in your test? I need to
>> find a big machine like yours for reproducing it.
>
> lkp will do some test env setting for fio test,=C2=A0 it seems that this =

> error happend in mount.
>
> ------
>
> [=C2=A0 107.314810] 2019-06-19 03:37:09 mount -t xfs -o inode64 /dev/sdb1 =

> /fs/sdb1
> [=C2=A0 107.314812]
> [=C2=A0 107.316017] SGI XFS with ACLs, security attributes, realtime, =

> scrub, debug enabled
> [=C2=A0 107.338674] XFS (sdb1): Mounting V5 Filesystem
> [=C2=A0 107.356339] XFS (sdb1): Ending clean mount
> [=C2=A0 683.136603] WARNING: CPU: 1 PID: 1484 at =

> drivers/scsi/scsi_lib.c:1010 scsi_init_io+0x103/0x170
> [=C2=A0 683.148708] Modules linked in: xfs dm_mod btrfs xor zstd_decompre=
ss =

> zstd_compress raid6_pq libcrc32c sd_mod sg intel_rapl sb_edac =

> x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel kvm mgag200 =

> ttm irqbypass drm_kms_helper crct10dif_pclmul crc32_pclmul =

> crc32c_intel syscopyarea ghash_clmulni_intel snd_pcm sysfillrect =

> ipmi_si snd_timer sysimgblt aesni_intel ahci ipmi_devintf crypto_simd =

> snd fb_sys_fops libahci soundcore mei_me cryptd glue_helper =

> ipmi_msghandler pcspkr drm libata mei ioatdma joydev lpc_ich i2c_i801 =

> dca wmi acpi_power_meter acpi_pad pcc_cpufreq ip_tables
> [=C2=A0 683.207865] CPU: 1 PID: 1484 Comm: kworker/1:1H Tainted: G=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =

> I=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.2.0-rc5 #1
> [=C2=A0 683.217421] Hardware name: Intel Corporation S2600WTT/S2600WTT, =

> BIOS SE5C610.86B.01.01.0008.021120151325 02/11/2015
> [=C2=A0 683.229600] Workqueue: kblockd blk_mq_run_work_fn
> [=C2=A0 683.235364] RIP: 0010:scsi_init_io+0x103/0x170
> [=C2=A0 683.240834] Code: 5c 41 5d c3 be 01 00 00 00 e9 49 ff ff ff 8b 45 =

> 70 89 83 08 01 00 00 f6 45 1a 01 75 92 31 c0 48 83 c4 08 5b 5d 41 5c =

> 41 5d c3 <0f> 0b 48 83 c4 08 b8 0a 00 00 00 5b 5d 41 5c 41 5d c3 48 8b =

> 75 38
> [=C2=A0 683.262867] RSP: 0018:ffffb8f1cf853c78 EFLAGS: 00010246
> [=C2=A0 683.269260] RAX: 000000001d338288 RBX: ffff8d2af2612690 RCX: =

> 0000000000000000
> [=C2=A0 683.277768] RDX: 0000000000000000 RSI: 0000000000000000 RDI: =

> ffff8d2af2612690
> [=C2=A0 683.286278] RBP: ffff8d2af2612580 R08: 0000000000000000 R09: =

> ffff8d2af26126c8
> [=C2=A0 683.294785] R10: 0000000000000000 R11: fefefefefefefeff R12: =

> 0000000000000801
> [=C2=A0 683.303295] R13: 0000000000000000 R14: 0000000000000000 R15: =

> ffff8d2b0b99a800
> [=C2=A0 683.311804] FS:=C2=A0 0000000000000000(0000) GS:ffff8d2b3f240000(=
0000) =

> knlGS:0000000000000000
> [=C2=A0 683.321379] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [=C2=A0 683.328331] CR2: 00007faa9d9697d0 CR3: 000000407a8a8003 CR4: =

> 00000000001606e0
> [=C2=A0 683.336843] Call Trace:
> [=C2=A0 683.340122]=C2=A0 sd_init_command+0x2ee/0xaf0 [sd_mod]
> [=C2=A0 683.345917]=C2=A0 scsi_queue_rq+0x559/0xa80
> [=C2=A0 683.350639]=C2=A0 blk_mq_dispatch_rq_list+0x3da/0x5b0
> [=C2=A0 683.356333]=C2=A0 ? syscall_return_via_sysret+0x10/0x7f
> [=C2=A0 683.362276]=C2=A0 ? __switch_to_asm+0x40/0x70
> [=C2=A0 683.367187]=C2=A0 ? elv_rb_del+0x1f/0x30
> [=C2=A0 683.371607]=C2=A0 ? deadline_remove_request+0x55/0xc0
> [=C2=A0 683.377290]=C2=A0 blk_mq_do_dispatch_sched+0x76/0x120
> [=C2=A0 683.382990]=C2=A0 blk_mq_sched_dispatch_requests+0x100/0x170
> [=C2=A0 683.389349]=C2=A0 __blk_mq_run_hw_queue+0x60/0x130
> [=C2=A0 683.394745]=C2=A0 process_one_work+0x19c/0x3c0
> [=C2=A0 683.399746]=C2=A0 worker_thread+0x3c/0x3b0
> [=C2=A0 683.404392]=C2=A0 ? process_one_work+0x3c0/0x3c0
> [=C2=A0 683.409580]=C2=A0 kthread+0x11e/0x140
> [=C2=A0 683.413734]=C2=A0 ? kthread_park+0x90/0x90
> [=C2=A0 683.418335]=C2=A0 ret_from_fork+0x35/0x40
> [=C2=A0 683.422841] ---[ end trace f691cac020928424 ]---
> [=C2=A0 683.428614] print_req_error: I/O error, dev sdb, sector 489915016 =

> flags 801
> [=C2=A0 683.561809] XFS (sdb1): writeback error on sector 489915016
> [=C2=A0 732.579401] fio: pid=3D0, err=3D5/file:filesetup.c:190, func=3Dfs=
ync, =

> error=3DInput/output error
> [=C2=A0 732.579403]
> [ 1022.580119] print_req_error: I/O error, dev sdb, sector 795883128 =

> flags 801
> [ 1022.933676] XFS (sdb1): writeback error on sector 795883128
> [ 1035.041938] fio: pid=3D0, err=3D5/file:filesetup.c:190, func=3Dfsync, =

> error=3DInput/output error
>
> ------
>
>
>>
>> Thanks,
>> Ming
>>
>>
>
>
>
> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp



--===============7391242485337572365==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRl
bnQ9InRleHQvaHRtbDsgY2hhcnNldD1VVEYtOCI+CiAgPC9oZWFkPgogIDxib2R5IHRleHQ9IiMw
MDAwMDAiIGJnY29sb3I9IiNGRkZGRkYiPgogICAgPHA+YXR0YXRjaCByZXByb2R1Y2Uuc2g8YnI+
CiAgICA8L3A+CiAgICA8cD48YnI+CiAgICA8L3A+CiAgICA8ZGl2IGNsYXNzPSJtb3otY2l0ZS1w
cmVmaXgiPuWcqCAyMDE5LzYvMjYg5LiK5Y2IMTA6MjEsIExpdSBZaWRpbmcg5YaZ6YGTOjxicj4K
ICAgIDwvZGl2PgogICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIKICAgICAgY2l0ZT0ibWlkOjM1
YjM1MDRiLWUxZGMtZjM0NS03NmE0LWViZjFjNWY5YWM1N0Bjbi5mdWppdHN1LmNvbSI+CiAgICAg
IDxicj4KICAgICAg5ZyoIDIwMTkvNi8yNiDkuIrljYgxMDowNSwgTWluZyBMZWkg5YaZ6YGTOgog
ICAgICA8YnI+CiAgICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPk9uIFdlZCwgSnVuIDI2LCAy
MDE5IGF0IDA5OjE4OjM2QU0gKzA4MDAsCiAgICAgICAgTGl1IFlpZGluZyB3cm90ZToKICAgICAg
ICA8YnI+CiAgICAgICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+SGksIE1pbmcgTGVpLgogICAg
ICAgICAgPGJyPgogICAgICAgICAgPGJyPgogICAgICAgICAgPGJyPgogICAgICAgICAg5ZyoIDIw
MTkvNi8yNSDkuIvljYg2OjQ3LCBNaW5nIExlaSDlhpnpgZM6CiAgICAgICAgICA8YnI+CiAgICAg
ICAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj5IaSByb25nLmEuY2hlbiwKICAgICAgICAgICAg
PGJyPgogICAgICAgICAgICA8YnI+CiAgICAgICAgICAgIFRoYW5rcyBmb3IgeW91ciByZXBvcnQh
CiAgICAgICAgICAgIDxicj4KICAgICAgICAgICAgPGJyPgogICAgICAgICAgICBPbiBUdWUsIEp1
biAyNSwgMjAxOSBhdCAwNDozMjo0OFBNICswODAwLCBrZXJuZWwgdGVzdCByb2JvdAogICAgICAg
ICAgICB3cm90ZToKICAgICAgICAgICAgPGJyPgogICAgICAgICAgICA8YmxvY2txdW90ZSB0eXBl
PSJjaXRlIj5GWUksIHdlIG5vdGljZWQgdGhlIGZvbGxvd2luZyBjb21taXQKICAgICAgICAgICAg
ICAoYnVpbHQgd2l0aCBnY2MtNyk6CiAgICAgICAgICAgICAgPGJyPgogICAgICAgICAgICAgIDxi
cj4KICAgICAgICAgICAgICBjb21taXQ6IDA3MTczYzNlYzI3NmNiYjE4ZGMwZTA2ODdkMzdkMzEw
ZTk4YTE0ODAgKCJibG9jazoKICAgICAgICAgICAgICBlbmFibGUgbXVsdGlwYWdlIGJ2ZWNzIikK
ICAgICAgICAgICAgICA8YnI+CjxhIGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQiIGhyZWY9
Imh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvY2dpdC9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xp
bnV4LmdpdCI+aHR0cHM6Ly9naXQua2VybmVsLm9yZy9jZ2l0L2xpbnV4L2tlcm5lbC9naXQvdG9y
dmFsZHMvbGludXguZ2l0PC9hPsKgIG1hc3RlcgogICAgICAgICAgICAgIDxicj4KICAgICAgICAg
ICAgICA8YnI+CiAgICAgICAgICAgICAgaW4gdGVzdGNhc2U6IGZpby1iYXNpYwogICAgICAgICAg
ICAgIDxicj4KICAgICAgICAgICAgICBvbiB0ZXN0IG1hY2hpbmU6IDcyIHRocmVhZHMgSW50ZWwo
UikgWGVvbihSKSBDUFUgRTUtMjY5OQogICAgICAgICAgICAgIHYzIEAgMi4zMEdIeiB3aXRoIDI1
NkcgbWVtb3J5CiAgICAgICAgICAgICAgPGJyPgogICAgICAgICAgICAgIHdpdGggZm9sbG93aW5n
IHBhcmFtZXRlcnM6CiAgICAgICAgICAgICAgPGJyPgogICAgICAgICAgICAgIDxicj4KICAgICAg
ICAgICAgICDCoMKgwqDCoHJ1bnRpbWU6IDMwMHMKICAgICAgICAgICAgICA8YnI+CiAgICAgICAg
ICAgICAgwqDCoMKgwqBucl90YXNrOiA4dAogICAgICAgICAgICAgIDxicj4KICAgICAgICAgICAg
ICDCoMKgwqDCoGRpc2s6IDFTU0QKICAgICAgICAgICAgICA8YnI+CiAgICAgICAgICAgICAgwqDC
oMKgwqBmczogeGZzCiAgICAgICAgICAgICAgPGJyPgogICAgICAgICAgICAgIMKgwqDCoMKgcnc6
IHJhbmRyZWFkCiAgICAgICAgICAgICAgPGJyPgogICAgICAgICAgICAgIMKgwqDCoMKgYnM6IDJN
CiAgICAgICAgICAgICAgPGJyPgogICAgICAgICAgICAgIMKgwqDCoMKgaW9lbmdpbmU6IHN5bmMK
ICAgICAgICAgICAgICA8YnI+CiAgICAgICAgICAgICAgwqDCoMKgwqB0ZXN0X3NpemU6IDUxMmcK
ICAgICAgICAgICAgICA8YnI+CiAgICAgICAgICAgICAgPGJyPgogICAgICAgICAgICAgIGNhdXNl
ZCBiZWxvdyBjaGFuZ2VzIChwbGVhc2UgcmVmZXIgdG8gYXR0YWNoZWQgZG1lc2cva21zZwogICAg
ICAgICAgICAgIGZvciBlbnRpcmUgbG9nL2JhY2t0cmFjZSk6CiAgICAgICAgICAgICAgPGJyPgog
ICAgICAgICAgICAgIDxicj4KICAgICAgICAgICAgICBmaW86IHBpZD0wLCBlcnI9NS88YSBjbGFz
cz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVmPSJmaWxlOmZpbGVzZXR1cC5jOjE5MCI+Zmls
ZTpmaWxlc2V0dXAuYzoxOTA8L2E+LCBmdW5jPWZzeW5jLAogICAgICAgICAgICAgIGVycm9yPUlu
cHV0L291dHB1dCBlcnJvcgogICAgICAgICAgICAgIDxicj4KICAgICAgICAgICAgICBmaW86IHBp
ZD0wLCBlcnI9NS88YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVmPSJmaWxlOmZp
bGVzZXR1cC5jOjE5MCI+ZmlsZTpmaWxlc2V0dXAuYzoxOTA8L2E+LCBmdW5jPWZzeW5jLAogICAg
ICAgICAgICAgIGVycm9yPUlucHV0L291dHB1dCBlcnJvcgogICAgICAgICAgICAgIDxicj4KICAg
ICAgICAgICAgPC9ibG9ja3F1b3RlPgogICAgICAgICAgICBJIGp1c3QgdHJpZWQgdGhlIGZpbyhy
YW5kcmVhZCwgYnM6Mk0sIHN5bmMsIG52bWUsIHhmcyBhbmQKICAgICAgICAgICAgYmxvY2sgZGV2
aWNlKSB0ZXN0IG9uCiAgICAgICAgICAgIDxicj4KICAgICAgICAgICAgNS4yLXJjNiBrZXJuZWws
IGxvb2tzIGl0IGNhbid0IGJlIHJlcHJvZHVjZWQuCiAgICAgICAgICAgIDxicj4KICAgICAgICAg
ICAgPGJyPgogICAgICAgICAgICBGb3IgbXVsdGktcGFnZSBidmVjIGNoYW5nZSwgSSdkIHN1Z2dl
c3QgdG8gcnVuIHRlc3Qgb24gNS4xCiAgICAgICAgICAgIGF0IGxlYXN0LAogICAgICAgICAgICA8
YnI+CiAgICAgICAgICAgIHNpbmNlIHRoZXJlIGFyZSBzZXZlcmFsIGZvbGxvdy11cCBmaXhlcy4K
ICAgICAgICAgICAgPGJyPgogICAgICAgICAgICA8YnI+CiAgICAgICAgICAgIEFsc28gdGhlIGRt
ZXNnIGxvZyBzZWVtcyBub3QgaW50YWN0LCBsb29rcyBpdCBvbmx5IHNob3dzCiAgICAgICAgICAg
IGJvb3RpbmcuCiAgICAgICAgICAgIDxicj4KICAgICAgICAgICAgPGJyPgogICAgICAgICAgICBQ
bGVhc2UgbGV0IHVzIGtub3cgaWYgdGhlIGlzc3VlIGNhbiBiZSB0cmlnZ2VyZWQgb24gNS4xIG9y
CiAgICAgICAgICAgIDUuMi4KICAgICAgICAgICAgPGJyPgogICAgICAgICAgPC9ibG9ja3F1b3Rl
PgogICAgICAgICAgPGJyPgogICAgICAgICAgVGhpcyBpc3N1ZSBjYW4gYmUgdHJpZ2dlcmVkIG9u
IHY1LjEgYW5kIHY1LDItcmMqIChpbmNsdWRlCiAgICAgICAgICB2NS4yLXJjNikKICAgICAgICAg
IDxicj4KICAgICAgICAgIDxicj4KICAgICAgICAgIG9uIHY1LjItcmM2IHJ1biAyMCB0aW1lcywg
MTAgdGltZXMgdHJpZ2dlciBvdXQgdGhpcyBpc3N1ZS4KICAgICAgICAgIDxicj4KICAgICAgICA8
L2Jsb2NrcXVvdGU+CiAgICAgICAgT0ssIHRoYW5rcyEKICAgICAgICA8YnI+CiAgICAgICAgPGJy
PgogICAgICAgIEl0IGlzIEVJTyBmcm9tIGZzeW5jKCksIHdoaWNoIHNob3VsZCBoYXZlIHNvbWV0
aGluZyBkdW1wZWQgaW4KICAgICAgICBkbWVzZyBsb2csCiAgICAgICAgPGJyPgogICAgICAgIGNv
dWxkIHlvdSBwcm92aWRlIG1lIHRoZSBkbWVzZyBsb2cgYWZ0ZXIgdGhlIGlzc3VlIGlzIHRyaWdn
ZXJlZD8KICAgICAgICA8YnI+CiAgICAgIDwvYmxvY2txdW90ZT4KICAgICAgPGJyPgogICAgICA8
YnI+CiAgICAgIGkgaGF2ZSBhdHRhdGNoZWQgdGhlIHdob2xlIGRtZXNnLnh6IG9uIGVtYWlsLgog
ICAgICA8YnI+CiAgICAgIDxicj4KICAgICAgPGJyPgogICAgICA8YmxvY2txdW90ZSB0eXBlPSJj
aXRlIj4KICAgICAgICA8YnI+CiAgICAgICAgQlRXLCBjYW4geW91IHByb3ZpZGUgbWUgdGhlIGV4
YWN0IGZpbyBjb21tYW5kIGluIHlvdXIgdGVzdD8gSQogICAgICAgIG5lZWQgdG8KICAgICAgICA8
YnI+CiAgICAgICAgZmluZCBhIGJpZyBtYWNoaW5lIGxpa2UgeW91cnMgZm9yIHJlcHJvZHVjaW5n
IGl0LgogICAgICAgIDxicj4KICAgICAgPC9ibG9ja3F1b3RlPgogICAgICA8YnI+CiAgICAgIGxr
cCB3aWxsIGRvIHNvbWUgdGVzdCBlbnYgc2V0dGluZyBmb3IgZmlvIHRlc3QswqAgaXQgc2VlbXMg
dGhhdAogICAgICB0aGlzIGVycm9yIGhhcHBlbmQgaW4gbW91bnQuCiAgICAgIDxicj4KICAgICAg
PGJyPgogICAgICAtLS0tLS0KICAgICAgPGJyPgogICAgICA8YnI+CiAgICAgIFvCoCAxMDcuMzE0
ODEwXSAyMDE5LTA2LTE5IDAzOjM3OjA5IG1vdW50IC10IHhmcyAtbyBpbm9kZTY0CiAgICAgIC9k
ZXYvc2RiMSAvZnMvc2RiMQogICAgICA8YnI+CiAgICAgIFvCoCAxMDcuMzE0ODEyXQogICAgICA8
YnI+CiAgICAgIFvCoCAxMDcuMzE2MDE3XSBTR0kgWEZTIHdpdGggQUNMcywgc2VjdXJpdHkgYXR0
cmlidXRlcywgcmVhbHRpbWUsCiAgICAgIHNjcnViLCBkZWJ1ZyBlbmFibGVkCiAgICAgIDxicj4K
ICAgICAgW8KgIDEwNy4zMzg2NzRdIFhGUyAoc2RiMSk6IE1vdW50aW5nIFY1IEZpbGVzeXN0ZW0K
ICAgICAgPGJyPgogICAgICBbwqAgMTA3LjM1NjMzOV0gWEZTIChzZGIxKTogRW5kaW5nIGNsZWFu
IG1vdW50CiAgICAgIDxicj4KICAgICAgW8KgIDY4My4xMzY2MDNdIFdBUk5JTkc6IENQVTogMSBQ
SUQ6IDE0ODQgYXQKICAgICAgZHJpdmVycy9zY3NpL3Njc2lfbGliLmM6MTAxMCBzY3NpX2luaXRf
aW8rMHgxMDMvMHgxNzAKICAgICAgPGJyPgogICAgICBbwqAgNjgzLjE0ODcwOF0gTW9kdWxlcyBs
aW5rZWQgaW46IHhmcyBkbV9tb2QgYnRyZnMgeG9yCiAgICAgIHpzdGRfZGVjb21wcmVzcyB6c3Rk
X2NvbXByZXNzIHJhaWQ2X3BxIGxpYmNyYzMyYyBzZF9tb2Qgc2cKICAgICAgaW50ZWxfcmFwbCBz
Yl9lZGFjIHg4Nl9wa2dfdGVtcF90aGVybWFsIGludGVsX3Bvd2VyY2xhbXAgY29yZXRlbXAKICAg
ICAga3ZtX2ludGVsIGt2bSBtZ2FnMjAwIHR0bSBpcnFieXBhc3MgZHJtX2ttc19oZWxwZXIKICAg
ICAgY3JjdDEwZGlmX3BjbG11bCBjcmMzMl9wY2xtdWwgY3JjMzJjX2ludGVsIHN5c2NvcHlhcmVh
CiAgICAgIGdoYXNoX2NsbXVsbmlfaW50ZWwgc25kX3BjbSBzeXNmaWxscmVjdCBpcG1pX3NpIHNu
ZF90aW1lcgogICAgICBzeXNpbWdibHQgYWVzbmlfaW50ZWwgYWhjaSBpcG1pX2RldmludGYgY3J5
cHRvX3NpbWQgc25kCiAgICAgIGZiX3N5c19mb3BzIGxpYmFoY2kgc291bmRjb3JlIG1laV9tZSBj
cnlwdGQgZ2x1ZV9oZWxwZXIKICAgICAgaXBtaV9tc2doYW5kbGVyIHBjc3BrciBkcm0gbGliYXRh
IG1laSBpb2F0ZG1hIGpveWRldiBscGNfaWNoCiAgICAgIGkyY19pODAxIGRjYSB3bWkgYWNwaV9w
b3dlcl9tZXRlciBhY3BpX3BhZCBwY2NfY3B1ZnJlcSBpcF90YWJsZXMKICAgICAgPGJyPgogICAg
ICBbwqAgNjgzLjIwNzg2NV0gQ1BVOiAxIFBJRDogMTQ4NCBDb21tOiBrd29ya2VyLzE6MUggVGFp
bnRlZDoKICAgICAgR8KgwqDCoMKgwqDCoMKgwqDCoCBJwqDCoMKgwqDCoMKgIDUuMi4wLXJjNSAj
MQogICAgICA8YnI+CiAgICAgIFvCoCA2ODMuMjE3NDIxXSBIYXJkd2FyZSBuYW1lOiBJbnRlbCBD
b3Jwb3JhdGlvbiBTMjYwMFdUVC9TMjYwMFdUVCwKICAgICAgQklPUyBTRTVDNjEwLjg2Qi4wMS4w
MS4wMDA4LjAyMTEyMDE1MTMyNSAwMi8xMS8yMDE1CiAgICAgIDxicj4KICAgICAgW8KgIDY4My4y
Mjk2MDBdIFdvcmtxdWV1ZToga2Jsb2NrZCBibGtfbXFfcnVuX3dvcmtfZm4KICAgICAgPGJyPgog
ICAgICBbwqAgNjgzLjIzNTM2NF0gUklQOiAwMDEwOnNjc2lfaW5pdF9pbysweDEwMy8weDE3MAog
ICAgICA8YnI+CiAgICAgIFvCoCA2ODMuMjQwODM0XSBDb2RlOiA1YyA0MSA1ZCBjMyBiZSAwMSAw
MCAwMCAwMCBlOSA0OSBmZiBmZiBmZiA4YgogICAgICA0NSA3MCA4OSA4MyAwOCAwMSAwMCAwMCBm
NiA0NSAxYSAwMSA3NSA5MiAzMSBjMCA0OCA4MyBjNCAwOCA1YiA1ZAogICAgICA0MSA1YyA0MSA1
ZCBjMyAmbHQ7MGYmZ3Q7IDBiIDQ4IDgzIGM0IDA4IGI4IDBhIDAwIDAwIDAwIDViIDVkIDQxCiAg
ICAgIDVjIDQxIDVkIGMzIDQ4IDhiIDc1IDM4CiAgICAgIDxicj4KICAgICAgW8KgIDY4My4yNjI4
NjddIFJTUDogMDAxODpmZmZmYjhmMWNmODUzYzc4IEVGTEFHUzogMDAwMTAyNDYKICAgICAgPGJy
PgogICAgICBbwqAgNjgzLjI2OTI2MF0gUkFYOiAwMDAwMDAwMDFkMzM4Mjg4IFJCWDogZmZmZjhk
MmFmMjYxMjY5MCBSQ1g6CiAgICAgIDAwMDAwMDAwMDAwMDAwMDAKICAgICAgPGJyPgogICAgICBb
wqAgNjgzLjI3Nzc2OF0gUkRYOiAwMDAwMDAwMDAwMDAwMDAwIFJTSTogMDAwMDAwMDAwMDAwMDAw
MCBSREk6CiAgICAgIGZmZmY4ZDJhZjI2MTI2OTAKICAgICAgPGJyPgogICAgICBbwqAgNjgzLjI4
NjI3OF0gUkJQOiBmZmZmOGQyYWYyNjEyNTgwIFIwODogMDAwMDAwMDAwMDAwMDAwMCBSMDk6CiAg
ICAgIGZmZmY4ZDJhZjI2MTI2YzgKICAgICAgPGJyPgogICAgICBbwqAgNjgzLjI5NDc4NV0gUjEw
OiAwMDAwMDAwMDAwMDAwMDAwIFIxMTogZmVmZWZlZmVmZWZlZmVmZiBSMTI6CiAgICAgIDAwMDAw
MDAwMDAwMDA4MDEKICAgICAgPGJyPgogICAgICBbwqAgNjgzLjMwMzI5NV0gUjEzOiAwMDAwMDAw
MDAwMDAwMDAwIFIxNDogMDAwMDAwMDAwMDAwMDAwMCBSMTU6CiAgICAgIGZmZmY4ZDJiMGI5OWE4
MDAKICAgICAgPGJyPgogICAgICBbwqAgNjgzLjMxMTgwNF0gRlM6wqAgMDAwMDAwMDAwMDAwMDAw
MCgwMDAwKQogICAgICBHUzpmZmZmOGQyYjNmMjQwMDAwKDAwMDApIGtubEdTOjAwMDAwMDAwMDAw
MDAwMDAKICAgICAgPGJyPgogICAgICBbwqAgNjgzLjMyMTM3OV0gQ1M6wqAgMDAxMCBEUzogMDAw
MCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAwNTAwMzMKICAgICAgPGJyPgogICAgICBbwqAgNjgz
LjMyODMzMV0gQ1IyOiAwMDAwN2ZhYTlkOTY5N2QwIENSMzogMDAwMDAwNDA3YThhODAwMyBDUjQ6
CiAgICAgIDAwMDAwMDAwMDAxNjA2ZTAKICAgICAgPGJyPgogICAgICBbwqAgNjgzLjMzNjg0M10g
Q2FsbCBUcmFjZToKICAgICAgPGJyPgogICAgICBbwqAgNjgzLjM0MDEyMl3CoCBzZF9pbml0X2Nv
bW1hbmQrMHgyZWUvMHhhZjAgW3NkX21vZF0KICAgICAgPGJyPgogICAgICBbwqAgNjgzLjM0NTkx
N13CoCBzY3NpX3F1ZXVlX3JxKzB4NTU5LzB4YTgwCiAgICAgIDxicj4KICAgICAgW8KgIDY4My4z
NTA2MzldwqAgYmxrX21xX2Rpc3BhdGNoX3JxX2xpc3QrMHgzZGEvMHg1YjAKICAgICAgPGJyPgog
ICAgICBbwqAgNjgzLjM1NjMzM13CoCA/IHN5c2NhbGxfcmV0dXJuX3ZpYV9zeXNyZXQrMHgxMC8w
eDdmCiAgICAgIDxicj4KICAgICAgW8KgIDY4My4zNjIyNzZdwqAgPyBfX3N3aXRjaF90b19hc20r
MHg0MC8weDcwCiAgICAgIDxicj4KICAgICAgW8KgIDY4My4zNjcxODddwqAgPyBlbHZfcmJfZGVs
KzB4MWYvMHgzMAogICAgICA8YnI+CiAgICAgIFvCoCA2ODMuMzcxNjA3XcKgID8gZGVhZGxpbmVf
cmVtb3ZlX3JlcXVlc3QrMHg1NS8weGMwCiAgICAgIDxicj4KICAgICAgW8KgIDY4My4zNzcyOTBd
wqAgYmxrX21xX2RvX2Rpc3BhdGNoX3NjaGVkKzB4NzYvMHgxMjAKICAgICAgPGJyPgogICAgICBb
wqAgNjgzLjM4Mjk5MF3CoCBibGtfbXFfc2NoZWRfZGlzcGF0Y2hfcmVxdWVzdHMrMHgxMDAvMHgx
NzAKICAgICAgPGJyPgogICAgICBbwqAgNjgzLjM4OTM0OV3CoCBfX2Jsa19tcV9ydW5faHdfcXVl
dWUrMHg2MC8weDEzMAogICAgICA8YnI+CiAgICAgIFvCoCA2ODMuMzk0NzQ1XcKgIHByb2Nlc3Nf
b25lX3dvcmsrMHgxOWMvMHgzYzAKICAgICAgPGJyPgogICAgICBbwqAgNjgzLjM5OTc0Nl3CoCB3
b3JrZXJfdGhyZWFkKzB4M2MvMHgzYjAKICAgICAgPGJyPgogICAgICBbwqAgNjgzLjQwNDM5Ml3C
oCA/IHByb2Nlc3Nfb25lX3dvcmsrMHgzYzAvMHgzYzAKICAgICAgPGJyPgogICAgICBbwqAgNjgz
LjQwOTU4MF3CoCBrdGhyZWFkKzB4MTFlLzB4MTQwCiAgICAgIDxicj4KICAgICAgW8KgIDY4My40
MTM3MzRdwqAgPyBrdGhyZWFkX3BhcmsrMHg5MC8weDkwCiAgICAgIDxicj4KICAgICAgW8KgIDY4
My40MTgzMzVdwqAgcmV0X2Zyb21fZm9yaysweDM1LzB4NDAKICAgICAgPGJyPgogICAgICBbwqAg
NjgzLjQyMjg0MV0gLS0tWyBlbmQgdHJhY2UgZjY5MWNhYzAyMDkyODQyNCBdLS0tCiAgICAgIDxi
cj4KICAgICAgW8KgIDY4My40Mjg2MTRdIHByaW50X3JlcV9lcnJvcjogSS9PIGVycm9yLCBkZXYg
c2RiLCBzZWN0b3IKICAgICAgNDg5OTE1MDE2IGZsYWdzIDgwMQogICAgICA8YnI+CiAgICAgIFvC
oCA2ODMuNTYxODA5XSBYRlMgKHNkYjEpOiB3cml0ZWJhY2sgZXJyb3Igb24gc2VjdG9yIDQ4OTkx
NTAxNgogICAgICA8YnI+CiAgICAgIFvCoCA3MzIuNTc5NDAxXSBmaW86IHBpZD0wLCBlcnI9NS88
YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVmPSJmaWxlOmZpbGVzZXR1cC5jOjE5
MCI+ZmlsZTpmaWxlc2V0dXAuYzoxOTA8L2E+LCBmdW5jPWZzeW5jLAogICAgICBlcnJvcj1JbnB1
dC9vdXRwdXQgZXJyb3IKICAgICAgPGJyPgogICAgICBbwqAgNzMyLjU3OTQwM10KICAgICAgPGJy
PgogICAgICBbIDEwMjIuNTgwMTE5XSBwcmludF9yZXFfZXJyb3I6IEkvTyBlcnJvciwgZGV2IHNk
Yiwgc2VjdG9yCiAgICAgIDc5NTg4MzEyOCBmbGFncyA4MDEKICAgICAgPGJyPgogICAgICBbIDEw
MjIuOTMzNjc2XSBYRlMgKHNkYjEpOiB3cml0ZWJhY2sgZXJyb3Igb24gc2VjdG9yIDc5NTg4MzEy
OAogICAgICA8YnI+CiAgICAgIFsgMTAzNS4wNDE5MzhdIGZpbzogcGlkPTAsIGVycj01LzxhIGNs
YXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQiIGhyZWY9ImZpbGU6ZmlsZXNldHVwLmM6MTkwIj5m
aWxlOmZpbGVzZXR1cC5jOjE5MDwvYT4sIGZ1bmM9ZnN5bmMsCiAgICAgIGVycm9yPUlucHV0L291
dHB1dCBlcnJvcgogICAgICA8YnI+CiAgICAgIDxicj4KICAgICAgLS0tLS0tCiAgICAgIDxicj4K
ICAgICAgPGJyPgogICAgICA8YnI+CiAgICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPgogICAg
ICAgIDxicj4KICAgICAgICBUaGFua3MsCiAgICAgICAgPGJyPgogICAgICAgIE1pbmcKICAgICAg
ICA8YnI+CiAgICAgICAgPGJyPgogICAgICAgIDxicj4KICAgICAgPC9ibG9ja3F1b3RlPgogICAg
ICA8YnI+CiAgICAgIDxicj4KICAgICAgPGJyPgogICAgICA8ZmllbGRzZXQgY2xhc3M9Im1pbWVB
dHRhY2htZW50SGVhZGVyIj48L2ZpZWxkc2V0PgogICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUt
cHJlIiB3cmFwPSIiPl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxLUCBtYWlsaW5nIGxpc3QKPGEgY2xhc3M9Im1vei10eHQtbGluay1hYmJyZXZpYXRlZCIg
aHJlZj0ibWFpbHRvOkxLUEBsaXN0cy4wMS5vcmciPkxLUEBsaXN0cy4wMS5vcmc8L2E+CjxhIGNs
YXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQiIGhyZWY9Imh0dHBzOi8vbGlzdHMuMDEub3JnL21h
aWxtYW4vbGlzdGluZm8vbGtwIj5odHRwczovL2xpc3RzLjAxLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xrcDwvYT4KPC9wcmU+CiAgICA8L2Jsb2NrcXVvdGU+CiAgPC9ib2R5Pgo8L2h0bWw+Cg==

--===============7391242485337572365==
Content-Type: application/x-shellscript
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.sh"

ZG1zZXR1cCByZW1vdmVfYWxsCndpcGVmcyAtYSAtLWZvcmNlIC9kZXYvc2RiMQpta2ZzIC10IHhm
cyAvZGV2L3NkYjEKbWtkaXIgLXAgL2ZzL3NkYjEKbW91bnQgLXQgeGZzIC1vIGlub2RlNjQgL2Rl
di9zZGIxIC9mcy9zZGIxCgpmb3IgY3B1X2RpciBpbiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHVbMC05XSoKZG8KCW9ubGluZV9maWxlPSIkY3B1X2RpciIvb25saW5lCglbIC1mICIkb25saW5l
X2ZpbGUiIF0gJiYgWyAiJChjYXQgIiRvbmxpbmVfZmlsZSIpIiAtZXEgMCBdICYmIGNvbnRpbnVl
CgoJZmlsZT0iJGNwdV9kaXIiL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoJWyAtZiAiJGZpbGUi
IF0gJiYgZWNobyAicGVyZm9ybWFuY2UiID4gIiRmaWxlIgpkb25lCgplY2hvICdbZ2xvYmFsXQpi
cz0yTQppb2VuZ2luZT1zeW5jCmlvZGVwdGg9MzIKc2l6ZT02ODcxOTQ3NjczNgpkaXJlY3Q9MApy
dW50aW1lPTMwMAppbnZhbGlkYXRlPTEKZmFsbG9jYXRlPXBvc2l4Cmdyb3VwX3JlcG9ydGluZwoK
W3Rhc2tfMF0Kcnc9cmFuZHJlYWQKZGlyZWN0b3J5PS9mcy9zZGIxCm51bWpvYnM9OCcgfCBmaW8g
LS1vdXRwdXQtZm9ybWF0PWpzb24gLQp1bW91bnQgL2ZzL3NkYjEK

--===============7391242485337572365==--

