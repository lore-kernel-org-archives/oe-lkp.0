Content-Type: multipart/mixed; boundary="===============6176310824624286812=="
MIME-Version: 1.0
From: Yin Fengwei <fengwei.yin@intel.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 6191cf3ad5: stress-ng.rename.ops_per_sec -73.5% regression
Date: Wed, 02 Mar 2022 16:32:02 +0800
Message-ID: <191b6d46-cb8d-4e5d-8c4c-9dae91e32a45@intel.com>
In-Reply-To: <20220131154927.GF16385@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============6176310824624286812==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On 2022/1/31 23:49, kernel test robot wrote:
>        0.00           +59.8       59.78        perf-profile.calltrace.cyc=
les-pp.osq_lock.__mutex_lock.flush_workqueue.xfs_fs_statfs.statfs_by_dentry
>       23.44 =C2=B1  2%     +61.0       84.49        perf-profile.calltrac=
e.cycles-pp.vfs_statfs.user_statfs.__do_sys_statfs.do_syscall_64.entry_SYSC=
ALL_64_after_hwframe
>       23.40 =C2=B1  2%     +61.1       84.47        perf-profile.calltrac=
e.cycles-pp.statfs_by_dentry.vfs_statfs.user_statfs.__do_sys_statfs.do_sysc=
all_64

We did further check of the perf data. From above three lines,
the patch brought higher lock content (+59.8) in this extreme cases.

Regarding the patch could fix race issue, we will not tracking this
report. Let us know if you have any comments. Thanks.


Regards
Yin, Fengwei

--===============6176310824624286812==--

