Content-Type: multipart/mixed; boundary="===============3192578353526147373=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/lru] b8e7130188: WARNING:at_lib/list_debug.c:#__list_del_entry_valid
Date: Wed, 11 Mar 2020 12:54:16 +0800
Message-ID: <fc838cca-5dc9-419c-ae00-697ffcb48e25@intel.com>
In-Reply-To: <41da9310-987b-2819-1024-ecdaf922eb11@linux.alibaba.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3192578353526147373==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Alex,

The head commit build failed:

commit: d7e47ad94d8637480dde9caee0e7f97ab7b13c8f
status: FAIL: build error
build_errors: | 1
 =C2=A0 mm/mlock.c:325:35: error: 'struct pglist_data' has no member named =

'lru_lock'

Best Regards,
Rong Chen

On 3/9/20 9:43 PM, Alex Shi wrote:
> Hi Rong,
>
> Thanks a lot for this report!
>
> I reviewed this patch many times, it looks fine. so I am wondering if the=
 bug due to a far early patch 'mm/thp: narrow lru
> locking'? if so, it should be fixed on new branch, https://github.com/ale=
xshi/linux.git lrunext-nothpnarrow
>
> Could you like to give try on that branch?
>
> Thanks a lot!
> Alex
>
>
> =E5=9C=A8 2020/3/8 =E4=B8=8B=E5=8D=8810:00, kernel test robot =E5=86=99=
=E9=81=93:
>> FYI, we noticed the following commit (built with gcc-7):
>>
>> commit: b8e71301886b2ad0b0754fbc6884b6a24ac1931b ("mm/lru: take PageLRU =
first in moving page between lru lists")
>> https://github.com/alexshi/linux.git lrunext
>>
>> in testcase: pm-qa
>> with following parameters:
>>
>> 	test: thermal
>> 	ucode: 0x27
>>
>>
>>
>> on test machine: 8 threads Intel(R) Core(TM) i7-4790 v3 @ 3.60GHz with 6=
G memory
>>
>> caused below changes (please refer to attached dmesg/kmsg for entire log=
/backtrace):
>>
>>
>> If you fix the issue, kindly add following tag
>> Reported-by: kernel test robot <rong.a.chen@intel.com>
>>
>>
>> kern  :warn  : [   47.867335] WARNING: CPU: 0 PID: 12 at lib/list_debug.=
c:56 __list_del_entry_valid+0x8a/0x90
>> kern  :warn  : [   47.877485] Modules linked in: btrfs blake2b_generic x=
or zstd_decompress zstd_compress raid6_pq libcrc32c intel_rapl_msr intel_ra=
pl_common sd_mod t10_pi snd_hda_codec_hdmi sg intel_powerclamp coretemp kvm=
_intel kvm snd_hda_intel snd_intel_dspcfg irqbypass snd_hda_codec i915 crct=
10dif_pclmul snd_hda_core crc32_pclmul crc32c_intel mei_wdt dcdbas snd_hwde=
p ghash_clmulni_intel drm_kms_helper ahci snd_pcm aesni_intel syscopyarea l=
ibahci sysfillrect crypto_simd snd_timer sysimgblt fb_sys_fops mei_me crypt=
d glue_helper libata i2c_i801 snd pcspkr drm lpc_ich joydev mei soundcore v=
ideo ip_tables [last unloaded: x86_pkg_temp_thermal]
>> kern  :warn  : [   47.932620] CPU: 0 PID: 12 Comm: kworker/0:1 Not taint=
ed 5.6.0-rc3-00010-gb8e71301886b2 #1
>> kern  :warn  : [   47.940863] Hardware name: Dell Inc. OptiPlex 9020/03C=
PWF, BIOS A11 04/01/2015
>> kern  :warn  : [   47.948069] Workqueue: events delayed_fput
>> kern  :warn  : [   47.952155] RIP: 0010:__list_del_entry_valid+0x8a/0x90
>> kern  :warn  : [   47.957279] Code: bf ff 0f 0b 31 c0 c3 48 89 f2 48 89 =
fe 48 c7 c7 a8 56 37 82 e8 07 69 bf ff 0f 0b 31 c0 c3 48 c7 c7 e8 56 37 82 =
e8 f6 68 bf ff <0f> 0b 31 c0 c3 cc 48 85 d2 74 28 89 f8 48 01 f2 48 c7 c7 a=
0 9f 08
>> kern  :warn  : [   47.976005] RSP: 0000:ffffc90000083b48 EFLAGS: 00010082
>> kern  :warn  : [   47.981215] RAX: 0000000000000000 RBX: ffff88819edd400=
0 RCX: 0000000000000007
>> kern  :warn  : [   47.988332] RDX: 0000000000000000 RSI: 000000000000009=
6 RDI: ffff88819ea19b30
>> kern  :warn  : [   47.995450] RBP: 0000000000000000 R08: 00000000000004a=
2 R09: 0000000000000000
>> kern  :warn  : [   48.002568] R10: 0000000000000002 R11: ffffc900000839e=
8 R12: ffffc90000083cb0
>> kern  :warn  : [   48.009689] R13: ffffea0006643a00 R14: ffffffff8285b86=
8 R15: 0000000000000000
>> kern  :warn  : [   48.016808] FS:  0000000000000000(0000) GS:ffff88819ea=
00000(0000) knlGS:0000000000000000
>> kern  :warn  : [   48.024878] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008=
0050033
>> kern  :warn  : [   48.030608] CR2: 00007fc22447e000 CR3: 000000019769c00=
5 CR4: 00000000001606f0
>> kern  :warn  : [   48.037725] Call Trace:
>> kern  :warn  : [   48.040166]  release_pages+0x172/0x410
>> kern  :warn  : [   48.043908]  __pagevec_release+0x39/0x40
>> kern  :warn  : [   48.047820]  shmem_undo_range+0x3d6/0x900
>> kern  :warn  : [   48.051863]  ? __i915_request_submit+0x19e/0x1d0 [i915]
>> kern  :warn  : [   48.057078]  shmem_truncate_range+0x16/0x40
>> kern  :warn  : [   48.061249]  shmem_evict_inode+0xda/0x240
>> kern  :warn  : [   48.065248]  ? init_wait_var_entry+0x50/0x50
>> kern  :warn  : [   48.069506]  evict+0xd9/0x1b0
>> kern  :warn  : [   48.072466]  __dentry_kill+0xe0/0x1a0
>> kern  :warn  : [   48.076118]  __fput+0x122/0x270
>> kern  :warn  : [   48.079253]  delayed_fput+0x1c/0x30
>> kern  :warn  : [   48.082731]  process_one_work+0x1b0/0x3e0
>> kern  :warn  : [   48.086732]  worker_thread+0x3c/0x3b0
>> kern  :warn  : [   48.090385]  ? process_one_work+0x3e0/0x3e0
>> kern  :warn  : [   48.094555]  kthread+0x11e/0x140
>> kern  :warn  : [   48.097776]  ? kthread_park+0x90/0x90
>> kern  :warn  : [   48.101430]  ret_from_fork+0x35/0x40
>> kern  :warn  : [   48.104996] ---[ end trace 06ce6216f2c3ef35 ]---
>>
>>
>> To reproduce:
>>
>>          git clone https://github.com/intel/lkp-tests.git
>>          cd lkp-tests
>>          bin/lkp install job.yaml  # job file is attached in this email
>>          bin/lkp run     job.yaml
>>
>>
>>
>> Thanks,
>> Rong Chen
>>

--===============3192578353526147373==--

