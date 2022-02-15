Content-Type: multipart/mixed; boundary="===============1243391038615940910=="
MIME-Version: 1.0
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2 0/4] Fix softlockup when adding inotify watch
Date: Mon, 14 Feb 2022 22:23:04 -0800
Message-ID: <85af9b13-24b6-a147-b7c4-9c64eb3b962c@oracle.com>
In-Reply-To: <20220215025634.GB28159@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============1243391038615940910==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Oliver,

On 2/14/22 18:56, Oliver Sang wrote:
> hi Stephen,
> =

> On Mon, Jan 31, 2022 at 01:19:39PM -0800, Stephen Brennan wrote:
>> Hello,
>>
>> I'd like to request re-testing this series on LKP, before posting my v2
>> more broadly. The 0-day bot detected a warning on my v1 posting[1]. I
>> believe v2 should address the warning but I'm still working on
>> reproducing it via the information included in the email. According to
>> the LKP website [2] it's possible to request testing by directly mailing
>> this list, so I wanted to try that in case I can't reproduce the
>> original.
> =

> the issue still exist on this v2. (detail dmesg attached)
> =

> [   50.129453][ T4056] ------------[ cut here ]------------
> [   50.135243][ T4056] WARNING: CPU: 68 PID: 4056 at fs/nfsd/nfsctl.c:126=
3 nfsdfs_remove_files+0xd7/0x100 [nfsd]
> [   50.145632][ T4056] Modules linked in: rpcsec_gss_krb5 acpi_cpufreq(-)=
 nfsv4 dns_resolver nfsd auth_rpcgss xfs dm_mod brd binfmt_misc dax_pmem_co=
mpat(+) nd_pmem de
> vice_dax nd_btt dax_pmem_core intel_rapl_msr intel_rapl_common btrfs blak=
e2b_generic xor ipmi_ssif raid6_pq x86_pkg_temp_thermal intel_powerclamp zs=
td_compress corete
> mp libcrc32c sd_mod sg kvm_intel ast drm_vram_helper drm_ttm_helper kvm i=
rqbypass crct10dif_pclmul crc32_pclmul ttm crc32c_intel ghash_clmulni_intel=
 drm_kms_helper ra
> pl syscopyarea intel_cstate sysfillrect sysimgblt ahci nvme fb_sys_fops l=
ibahci intel_uncore nvme_core t10_pi ioatdma drm joydev libata dca wmi acpi=
_ipmi ipmi_si ipmi
> _devintf ipmi_msghandler nfit libnvdimm acpi_pad acpi_power_meter ip_tabl=
es
> [   50.212667][ T4056] CPU: 68 PID: 4056 Comm: nfsd Not tainted 5.16.0-rc=
2-00001-gc04e4a06741f #1
> [   50.221781][ T4056] RIP: 0010:nfsdfs_remove_files+0xd7/0x100 [nfsd]
> [   50.228562][ T4056] Code: 83 90 00 00 00 48 8d 93 90 00 00 00 48 89 dd=
 48 2d 90 00 00 00 49 39 d4 74 1b 48 89 c3 48 8b 45 30 48 85 c0 0f 85 6e ff=
 ff ff <0f> 0b eb
> d0 ff d2 0f 1f 00 eb 98 5b 5d 41 5c 41 5d 41 5e 41 5f c3
> [   50.249028][ T4056] RSP: 0018:ffa000002213fce8 EFLAGS: 00010246
> [   50.255476][ T4056] RAX: 0000000000000000 RBX: ff1100010c2c4e40 RCX: f=
f1100010c2c4ec0
> [   50.263828][ T4056] RDX: ff11000150659290 RSI: ff1100010c2c4ed0 RDI: f=
f1100010c2c5f18
> [   50.272186][ T4056] RBP: ff11000150659200 R08: ff1100010c2c52a0 R09: f=
f1100010c2c52a0
> [   50.280539][ T4056] R10: 000000000000013c R11: ff1100200012a404 R12: f=
f1100010c2c52a0
> [   50.288926][ T4056] R13: ff1100010c2c5200 R14: 00000000ffffffff R15: 0=
000000000000000
> [   50.297271][ T4056] FS:  0000000000000000(0000) GS:ff11002000100000(00=
00) knlGS:0000000000000000
> [   50.306577][ T4056] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   50.313549][ T4056] CR2: 00007f518e6bb114 CR3: 000000407ec0a005 CR4: 0=
000000000771ee0
> [   50.321898][ T4056] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0=
000000000000000
> [   50.330243][ T4056] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0=
000000000000400
> [   50.338596][ T4056] PKRU: 55555554
> [   50.342543][ T4056] Call Trace:
> [   50.346197][ T4056]  <TASK>
> [   50.349501][ T4056]  nfsd_client_rmdir+0x32/0x100 [nfsd]
> [   50.355378][ T4056]  free_client+0x9d/0x140 [nfsd]
> [   50.360689][ T4056]  __destroy_client+0x1e8/0x240 [nfsd]
> [   50.366521][ T4056]  nfsd4_setclientid_confirm+0x21d/0x480 [nfsd]
> [   50.373108][ T4056]  nfsd4_proc_compound+0x3ae/0x680 [nfsd]
> [   50.379171][ T4056]  nfsd_dispatch+0x146/0x280 [nfsd]
> [   50.384729][ T4056]  svc_process_common+0x45a/0x5c0
> [   50.390086][ T4056]  ? nfsd_svc+0x340/0x340 [nfsd]
> [   50.395373][ T4056]  ? nfsd_shutdown_threads+0xc0/0xc0 [nfsd]
> [   50.401611][ T4056]  svc_process+0xb7/0x100
> [   50.406298][ T4056]  nfsd+0xf1/0x180 [nfsd]
> [   50.410960][ T4056]  kthread+0x157/0x180
> [   50.415360][ T4056]  ? set_kthread_struct+0x40/0x40
> [   50.420716][ T4056]  ret_from_fork+0x1f/0x30
> [   50.425460][ T4056]  </TASK>
> [   50.428798][ T4056] ---[ end trace 2780c565d409a286 ]---
> =

> =

> BTW,
> the previous report upon 5384bd38a8 was based on v5.16-rc2:
> * 5384bd38a814f1 dcache: sweep cached negative dentries to the end of lis=
t of siblings
> * 136057256686de (tag: v5.16-rc2) Linux 5.16-rc2
> =

> so I still applied your v2 patch upon v5.16-rc2
> =

> * 4e96f210550b dcache: stop walking siblings if remaining dentries all ne=
gative
> * b38cd5a2cebd dcache: add action D_WALK_SKIP_SIBLINGS to d_walk()
> * 5aaf33a521ca fsnotify: stop walking child dentries if remaining tail is=
 negative
> * c04e4a06741f dcache: sweep cached negative dentries to the end of list =
of siblings
> * 136057256686 (tag: v5.16-rc2) Linux 5.16-rc2
> =

> if you think there should be a different code base, please let us know. T=
hanks
> =


Thank you for re-running these! I had a tough time getting the tests =

running on Oracle Linux or CentOS. More recently after sending this to =

you, I tried Debian, which seems to be the main distribution for the =

tests. It was quite smooth to get the tests working on Debian. I =

reproduced the warning on my v2 patch series based on 5.16-rc2, but not =

5.17 rc2+.

I was able to determine that the fix was 29044dae2e74 ("fsnotify: fix =

fsnotify hooks in pseudo filesystems") which is included in 5.17, which =

is why the warning no longer reproduces. From everything I've learned, =

NFS used a VFS method for deleting an in-memory file/dentry which is not =

ideal, and my patch merely surfaced a warning which may have been =

possible regardless. After the fix I cannot reproduce the warning.

I appreciate your re-running the tests!
Thank you,
Stephen

> =

>>
>> [1]: https://lore.kernel.org/linux-fsdevel/20211218081736.GA1071(a)xsang=
-OptiPlex-9020/
>> [2]: https://01.org/lkp/documentation/0-day-test-service
>>
>> Thanks,
>> Stephen
>>
>> (series summary below)
>>
>> When a system with large amounts of memory has several millions of
>> negative dentries in a single directory, a softlockup can occur while
>> adding an inotify watch:
>>
>>   watchdog: BUG: soft lockup - CPU#20 stuck for 9s! [inotifywait:9528]
>>   CPU: 20 PID: 9528 Comm: inotifywait Kdump: loaded Not tainted 5.16.0-r=
c4.20211208.el8uek.rc1.x86_64 #1
>>   Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.4.1 12/0=
3/2020
>>   RIP: 0010:__fsnotify_update_child_dentry_flags+0xad/0x120
>>   Call Trace:
>>    <TASK>
>>    fsnotify_add_mark_locked+0x113/0x160
>>    inotify_new_watch+0x130/0x190
>>    inotify_update_watch+0x11a/0x140
>>    __x64_sys_inotify_add_watch+0xef/0x140
>>    do_syscall_64+0x3b/0x90
>>    entry_SYSCALL_64_after_hwframe+0x44/0xae
>>
>> v1 of this series can be found at:
>> https://lore.kernel.org/linux-fsdevel/20211214005337.161885-1-stephen.s.=
brennan(a)oracle.com/
>> v1 itself is based on a prior series:
>> https://lore.kernel.org/linux-fsdevel/1611235185-1685-1-git-send-email-g=
autham.ananthakrishna(a)oracle.com/
>>
>> The strategy employed by this series is to move negative dentries to the
>> end of the d_subdirs list, and mark them with a flag as "tail negative".
>> Then, readers of the d_subdirs list, which are only interested in
>> positive dentries, can stop reading once they reach the first tail
>> negative dentry. By applying this patch, I'm able to avoid the above
>> softlockup caused by 200 million negative dentries on my test system.
>> Inotify watches are set up nearly instantly.
>>
>> Previously, Al expressed concern for:
>>
>> 1. Possible memory corruption due to use of lock_parent() in
>> sweep_negative(), see patch 01 for fix.
>> 2. The previous patch didn't catch all ways a negative dentry could
>> become positive (d_add, d_instantiate_new), see patch 01.
>> 3. The previous series contained a new negative dentry limit, which
>> capped the negative dentry count at around 3 per hash bucket. I've
>> dropped this patch from the series.
>>
>> Patches 2-4 are unmodified from the previous posting.
>>
>> Konstantin Khlebnikov (3):
>>    fsnotify: stop walking child dentries if remaining tail is negative
>>    dcache: add action D_WALK_SKIP_SIBLINGS to d_walk()
>>    dcache: stop walking siblings if remaining dentries all negative
>>
>> Stephen Brennan (1):
>>    dcache: sweep cached negative dentries to the end of list of siblings
>>
>>   fs/dcache.c            | 96 ++++++++++++++++++++++++++++++++++++++++--
>>   fs/libfs.c             |  3 ++
>>   fs/notify/fsnotify.c   |  6 ++-
>>   include/linux/dcache.h |  6 +++
>>   4 files changed, 106 insertions(+), 5 deletions(-)
>>
>> -- =

>> 2.30.2
>> _______________________________________________
>> LKP mailing list -- lkp(a)lists.01.org
>> To unsubscribe send an email to lkp-leave(a)lists.01.org
--===============1243391038615940910==--

