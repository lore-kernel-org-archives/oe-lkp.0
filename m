Content-Type: multipart/mixed; boundary="===============3812567946415596202=="
MIME-Version: 1.0
From: Borislav Petkov <bp@alien8.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/mce] 5de97c9f6d: WARNING:at_arch/x86/kernel/cpu/mcheck/mce.c:#mce_register_decode_chain
Date: Tue, 18 Apr 2017 09:38:20 +0200
Message-ID: <20170418073820.i6kl5tggcntwlisa@pd.tnic>
In-Reply-To: <20170418022445.GE1143@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============3812567946415596202==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 18, 2017 at 10:24:45AM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> commit: 5de97c9f6d85fd83af76e09e338b18e7adb1ae60 ("x86/mce: Factor out an=
d deprecate the /dev/mcelog driver")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> in testcase: boot
> =

> on test machine: qemu-system-i386 -enable-kvm -m 320M
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +------------------------------------------------------------------------=
+------------+------------+
> |                                                                        =
| 011d826111 | 5de97c9f6d |
> +------------------------------------------------------------------------=
+------------+------------+
> | boot_successes                                                         =
| 4          | 0          |
> | boot_failures                                                          =
| 50         | 12         |
> | WARNING:at_arch/x86/mm/dump_pagetables.c:#note_page                    =
| 50         | 6          |
> | WARNING:at_arch/x86/kernel/cpu/mcheck/mce.c:#mce_register_decode_chain =
| 0          | 12         |
> +------------------------------------------------------------------------=
+------------+------------+
> =

> =

> =

> [   39.479771] WARNING: CPU: 0 PID: 1 at arch/x86/kernel/cpu/mcheck/mce.c=
:162 mce_register_decode_chain+0x26/0x35
> [   39.479771] WARNING: CPU: 0 PID: 1 at arch/x86/kernel/cpu/mcheck/mce.c=
:162 mce_register_decode_chain+0x26/0x35

Ah, that's the prio check. Thanks for reporting, here's a correction:

---
From: Borislav Petkov <bp@suse.de>
Date: Tue, 18 Apr 2017 09:33:28 +0200
Subject: [PATCH] x86/mce: Update notifier priority check

Update the check which enforces the registration of MCE decoder notifier
callbacks with valid priority only, to include mcelog's priority.

Reported-by: kernel test robot <xiaolong.ye@intel.com>
Signed-off-by: Borislav Petkov <bp@suse.de>
Link: http://lkml.kernel.org/r/20170418022445.GE1143(a)yexl-desktop
---
 arch/x86/kernel/cpu/mcheck/mce.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/mcheck/mce.c b/arch/x86/kernel/cpu/mcheck/=
mce.c
index a09bb6775c23..9d41ec8c8927 100644
--- a/arch/x86/kernel/cpu/mcheck/mce.c
+++ b/arch/x86/kernel/cpu/mcheck/mce.c
@@ -157,7 +157,7 @@ static atomic_t num_notifiers;
 =

 void mce_register_decode_chain(struct notifier_block *nb)
 {
-	if (WARN_ON(nb->priority > MCE_PRIO_LOWEST && nb->priority < MCE_PRIO_EDA=
C))
+	if (WARN_ON(nb->priority > MCE_PRIO_MCELOG && nb->priority < MCE_PRIO_EDA=
C))
 		return;
 =

 	atomic_inc(&num_notifiers);
-- =

2.11.0

-- =

Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.

--===============3812567946415596202==--

