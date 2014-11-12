Content-Type: multipart/mixed; boundary="===============2876680018051140471=="
MIME-Version: 1.0
From: Casey Schaufler <casey@schaufler-ca.com>
To: lkp@lists.01.org
Subject: Re: [LSM] Kernel panic - not syncing: No working init found.
Date: Tue, 11 Nov 2014 16:10:41 -0800
Message-ID: <5462A581.4050101@schaufler-ca.com>
In-Reply-To: <CAGXu5jJdB6pq5WqHWSAaGRmRvgkrzoq95PjHTf7GtSkUGmEchA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2876680018051140471==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/5/2014 10:15 AM, Kees Cook wrote:
> I assume this is due to some unhealthy arrangement of CONFIG items. I
> haven't had time to examine the original report...

This occurs with CONFIG_SECURITY off. The patch below fixes the problem.

>
> -Kees
>
> On Wed, Nov 5, 2014 at 3:16 AM, Fengguang Wu <fengguang.wu@intel.com> w=
rote:
>> Hi Casey,
>>
>> FYI, this error still remains in the updated tree.
>>
>> git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git lsm/stacking
>> commit 19ef36a6507555b231aef0498445148ac37aa2c4 ("LSM: Refactor existing=
 LSM stacking")
>>
>>
>> +------------------------------------------------+------------+---------=
---+
>> |                                                | 644fb12c65 | 19ef36a6=
50 |
>> +------------------------------------------------+------------+---------=
---+
>> | boot_successes                                 | 15         | 0       =
   |
>> | early-boot-hang                                | 1          |         =
   |
>> | boot_failures                                  | 0          | 15      =
   |
>> | Kernel_panic-not_syncing:No_working_init_found | 0          | 15      =
   |
>> | backtrace:panic                                | 0          | 15      =
   |
>> +------------------------------------------------+------------+---------=
---+
>>
>>
>> [   14.083301] Starting init: /sbin/init exists but couldn't execute it =
(error -12)
>> [   14.084391] Starting init: /etc/init exists but couldn't execute it (=
error -13)
>> [   14.085300] Starting init: /bin/sh exists but couldn't execute it (er=
ror -12)
>> [   14.085884] Kernel panic - not syncing: No working init found.  Try p=
assing init=3D option to kernel. See Linux Documentation/init.txt for guida=
nce.
>> [   14.086902] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 3.18.0-rc3-wl-0=
0142-gb2eaffd #43
>> [   14.087517]  00000000 00000000 b002df88 b17d4ee3 00000000 b002dfa0 b1=
7d1b54 02178e76
>> [   14.088230]  00000000 02178e76 b1bee500 b002dfac b17c8c30 b1aaf57d b0=
02c000 b17e30e1
>> [   14.088354]  b17c8a3a 00000000 00000000 00000000 00000000 00000000 00=
000000 0000007b
>> [   14.088354] Call Trace:
>> [   14.088354]  [<b17d4ee3>] dump_stack+0xb8/0x108
>> [   14.088354]  [<b17d1b54>] panic+0x13e/0x378
>> [   14.088354]  [<b17c8c30>] kernel_init+0x1f6/0x1fa
>> [   14.088354]  [<b17e30e1>] ret_from_kernel_thread+0x21/0x30
>> [   14.088354]  [<b17c8a3a>] ? rest_init+0x26f/0x26f
>> [   14.088354] Kernel Offset: 0x0 from 0xb1000000 (relocation range: 0xb=
0000000-0xc6ffdfff)
>>
>> Thanks,
>> Fengguang
>>
>> _______________________________________________
>> LKP mailing list
>> LKP(a)linux.intel.com
>>
>>
 include/linux/security.h |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/security.h b/include/linux/security.h
index 5a6c839..5cd3e93 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -27,6 +27,7 @@
 #include <linux/slab.h>
 #include <linux/err.h>
 #include <linux/string.h>
+#include <linux/mm.h>
 =

 struct linux_binprm;
 struct cred;
@@ -1995,7 +1996,7 @@ static inline int security_settime(const struct times=
pec *ts,
 =

 static inline int security_vm_enough_memory_mm(struct mm_struct *mm, long =
pages)
 {
-	return cap_vm_enough_memory(mm, pages);
+	return __vm_enough_memory(mm, pages, cap_vm_enough_memory(mm, pages));
 }
 =

 static inline int security_bprm_set_creds(struct linux_binprm *bprm)


--===============2876680018051140471==--

