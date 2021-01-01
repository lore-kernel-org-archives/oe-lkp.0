Content-Type: multipart/mixed; boundary="===============0232068773217684185=="
MIME-Version: 1.0
From: Yafang Shao <laoar.shao@gmail.com>
To: lkp@lists.01.org
Subject: Re: [xfs] db962cd266: Assertion_failed
Date: Fri, 01 Jan 2021 17:10:49 +0800
Message-ID: <CALOAHbD+mLMJSizToKPsx0iUd5Z71sJBOyMaV2enVvUHfHwLzg@mail.gmail.com>
In-Reply-To: <20201231030158.GB379@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============0232068773217684185==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 31, 2020 at 10:46 AM kernel test robot
<oliver.sang@intel.com> wrote:
>
>
> Greeting,
>
> FYI, we noticed the following commit (built with gcc-9):
>
> commit: db962cd266c4d3230436aec2899186510797d49f ("[PATCH v14 4/4] xfs: u=
se current->journal_info to avoid transaction reservation recursion")
> url: https://github.com/0day-ci/linux/commits/Yafang-Shao/xfs-avoid-trans=
action-reservation-recursion/20201222-092315
> base: https://git.kernel.org/cgit/fs/xfs/xfs-linux.git for-next
>
> in testcase: filebench
> version: filebench-x86_64-22620e6-1_20201112
> with following parameters:
>
>         disk: 1HDD
>         fs: btrfs
>         test: fivestreamwrite.f
>         cpufreq_governor: performance
>         ucode: 0x42e
>
>
>
> on test machine: 48 threads Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz wit=
h 112G memory
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
>
>
> [  552.503501]
> [  552.525993] /usr/bin/wget -q --timeout=3D1800 --tries=3D1 --local-enco=
ding=3DUTF-8 http://internal-lkp-server:80/~lkp/pkg/linux/x86_64-rhel-8.3/g=
cc-9/5c8fe583cce542aa0b84adc939ce85293de36e5e/modules.cgz -N -P /opt/rootfs=
/tmp/pkg/linux/x86_64-rhel-8.3/gcc-9/5c8fe583cce542aa0b84adc939ce85293de36e=
5e
> [  552.525995]
> [  552.884581] /opt/rootfs/tmp/pkg/linux/x86_64-rhel-8.3/gcc-9/5c8fe583cc=
e542aa0b84adc939ce85293de36e5e/modules.cgz isn't modified
> [  552.884583]
> [  552.905799] XFS: Assertion failed: !current->journal_info, file: fs/xf=
s/xfs_trans.h, line: 280
> [  552.907594] /usr/bin/wget -q --timeout=3D1800 --tries=3D1 --local-enco=
ding=3DUTF-8 http://internal-lkp-server:80/~lkp/osimage/ucode/intel-ucode-2=
0201117.cgz -N -P /opt/rootfs/tmp/osimage/ucode
> [  552.916568]
> [  552.916574] ------------[ cut here ]------------
> [  552.939361] /opt/rootfs/tmp/osimage/ucode/intel-ucode-20201117.cgz isn=
't modified
> [  552.940036] kernel BUG at fs/xfs/xfs_message.c:110!
> [  552.946338]
> [  552.955784] invalid opcode: 0000 [#1] SMP PTI
> [  552.971010] CPU: 46 PID: 3793 Comm: kexec-lkp Not tainted 5.10.0-rc5-0=
0044-gdb962cd266c4 #1
> [  552.981331] Hardware name: Intel Corporation S2600WP/S2600WP, BIOS SE5=
C600.86B.02.02.0002.122320131210 12/23/2013
> [  552.993907] RIP: 0010:assfail+0x23/0x28 [xfs]
> [  552.999797] Code: 67 fc ff ff 0f 0b c3 0f 1f 44 00 00 41 89 c8 48 89 d=
1 48 89 f2 48 c7 c6 30 58 be c0 e8 82 f9 ff ff 80 3d b1 80 0a 00 00 74 02 <=
0f> 0b 0f 0b c3 48 8d 45 10 48 89 e2 4c 89 e6 48 89 1c 24 48 89 44
> [  553.022798] RSP: 0018:ffffc90006a139c8 EFLAGS: 00010202
> [  553.029624] RAX: 0000000000000000 RBX: ffff889c3edea700 RCX: 000000000=
0000000
> [  553.038646] RDX: 00000000ffffffc0 RSI: 000000000000000a RDI: ffffffffc=
0bd7bab
> [  553.047600] RBP: ffffc90006a13a14 R08: 0000000000000000 R09: 000000000=
0000000
> [  553.056536] R10: 000000000000000a R11: f000000000000000 R12: 000000000=
0000000
> [  553.065546] R13: 0000000000000000 R14: ffff889c3ede91c8 R15: ffff888f4=
4608000
> [  553.074455] FS:  00007ffff7fc9580(0000) GS:ffff889bea380000(0000) knlG=
S:0000000000000000
> [  553.084494] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  553.091837] CR2: 00005555555a1420 CR3: 0000001c30fbe002 CR4: 000000000=
01706e0
> [  553.100720] Call Trace:
> [  553.104459]  xfs_trans_reserve+0x225/0x320 [xfs]
> [  553.110556]  xfs_trans_roll+0x6e/0xe0 [xfs]
> [  553.116134]  xfs_defer_trans_roll+0x104/0x2a0 [xfs]
> [  553.122489]  ? xfs_extent_free_create_intent+0x62/0xc0 [xfs]
> [  553.129780]  xfs_defer_finish_noroll+0xb8/0x620 [xfs]
> [  553.136299]  xfs_defer_finish+0x11/0xa0 [xfs]
> [  553.142017]  xfs_itruncate_extents_flags+0x141/0x440 [xfs]
> [  553.149053]  xfs_setattr_size+0x3da/0x480 [xfs]
> [  553.154939]  ? setattr_prepare+0x6a/0x1e0
> [  553.160250]  xfs_vn_setattr+0x70/0x120 [xfs]
> [  553.165833]  notify_change+0x364/0x500
> [  553.170820]  ? do_truncate+0x76/0xe0
> [  553.175673]  do_truncate+0x76/0xe0
> [  553.180184]  path_openat+0xe6c/0x10a0
> [  553.184981]  do_filp_open+0x91/0x100
> [  553.189707]  ? __check_object_size+0x136/0x160
> [  553.195493]  do_sys_openat2+0x20d/0x2e0
> [  553.200481]  do_sys_open+0x44/0x80
> [  553.204926]  do_syscall_64+0x33/0x40
> [  553.209588]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [  553.215867] RIP: 0033:0x7ffff7ef11ae
> [  553.220579] Code: 25 00 00 41 00 3d 00 00 41 00 74 48 48 8d 05 59 65 0=
d 00 8b 00 85 c0 75 69 89 f2 b8 01 01 00 00 48 89 fe bf 9c ff ff ff 0f 05 <=
48> 3d 00 f0 ff ff 0f 87 a6 00 00 00 48 8b 4c 24 28 64 48 33 0c 25
> [  553.242870] RSP: 002b:00007fffffffc980 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000101
> [  553.251949] RAX: ffffffffffffffda RBX: 000055555556afcc RCX: 00007ffff=
7ef11ae
> [  553.260586] RDX: 0000000000000241 RSI: 00005555555aaa40 RDI: 00000000f=
fffff9c
> [  553.269217] RBP: 0000555555577bd0 R08: 00005555555a250f R09: 000055555=
55783b0
> [  553.277804] R10: 00000000000001b6 R11: 0000000000000246 R12: 000055555=
55aaa40
> [  553.286406] R13: 00000000fffffffd R14: 00005555555a1400 R15: 000000000=
0000010
> [  553.294926] Modules linked in: dm_mod xfs btrfs blake2b_generic xor zs=
td_compress raid6_pq libcrc32c sd_mod t10_pi sg intel_rapl_msr intel_rapl_c=
ommon sb_edac x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel kvm =
mgag200 irqbypass crct10dif_pclmul drm_kms_helper crc32_pclmul crc32c_intel=
 ghash_clmulni_intel isci syscopyarea sysfillrect sysimgblt rapl fb_sys_fop=
s ahci libsas libahci ipmi_si scsi_transport_sas mei_me intel_cstate ipmi_d=
evintf ioatdma drm mei intel_uncore ipmi_msghandler libata dca wmi joydev i=
p_tables
> [  553.349820] ---[ end trace 41e34856cd03d8f3 ]---
> [  553.359002] RIP: 0010:assfail+0x23/0x28 [xfs]
> [  553.364558] Code: 67 fc ff ff 0f 0b c3 0f 1f 44 00 00 41 89 c8 48 89 d=
1 48 89 f2 48 c7 c6 30 58 be c0 e8 82 f9 ff ff 80 3d b1 80 0a 00 00 74 02 <=
0f> 0b 0f 0b c3 48 8d 45 10 48 89 e2 4c 89 e6 48 89 1c 24 48 89 44
> [  553.386866] RSP: 0018:ffffc90006a139c8 EFLAGS: 00010202
> [  553.393357] RAX: 0000000000000000 RBX: ffff889c3edea700 RCX: 000000000=
0000000
> [  553.402093] RDX: 00000000ffffffc0 RSI: 000000000000000a RDI: ffffffffc=
0bd7bab
> [  553.410746] RBP: ffffc90006a13a14 R08: 0000000000000000 R09: 000000000=
0000000
> [  553.419499] R10: 000000000000000a R11: f000000000000000 R12: 000000000=
0000000
> [  553.428122] R13: 0000000000000000 R14: ffff889c3ede91c8 R15: ffff888f4=
4608000
> [  553.436764] FS:  00007ffff7fc9580(0000) GS:ffff889bea380000(0000) knlG=
S:0000000000000000
> [  553.446562] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  553.453670] CR2: 00005555555a1420 CR3: 0000001c30fbe002 CR4: 000000000=
01706e0
> [  553.462302] Kernel panic - not syncing: Fatal exception
> [  553.513856] Kernel Offset: disabled
> ACPI MEMORY or I/O RESET_REG.
>
>
> To reproduce:
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
>
>
>
> Thanks,
> Oliver Sang
>

Thanks for the report.

At a first glance, it seems we should make a similar change as we did
in xfs_trans_context_clear().

static inline void
xfs_trans_context_set(struct xfs_trans *tp)
{
    /*
     * We have already handed over the context via xfs_trans_context_swap().
     */
    if (current->journal_info)
        return;
    current->journal_info =3D tp;
    tp->t_pflags =3D memalloc_nofs_save();
}


I will analyze and retest it.

-- =

Thanks
Yafang
--===============0232068773217684185==--

