Content-Type: multipart/mixed; boundary="===============4460608036388040030=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [locking/paravirt] 9043442b43: WARNING:at_kernel/jump_label.c:#static_key_disable_cpuslocked
Date: Thu, 12 Oct 2017 09:47:17 +0200
Message-ID: <20171012074717.jejrvn7q4gvyzg43@hirez.programming.kicks-ass.net>
In-Reply-To: <8ddf11c2-1cf7-c74c-e72a-29a7404370fe@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4460608036388040030==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 11, 2017 at 04:14:30PM -0400, Waiman Long wrote:

> > kern  :warn  : [    0.000000] WARNING: CPU: 0 PID: 0 at kernel/jump_lab=
el.c:161 static_key_disable_cpuslocked+0x69/0x80

> > kern  :warn  : [    0.000000]  static_key_disable+0x1a/0x30
> > kern  :warn  : [    0.000000]  native_pv_lock_init+0x1b/0x1e
> > kern  :warn  : [    0.000000]  native_smp_prepare_boot_cpu+0x32/0x35
> > kern  :warn  : [    0.000000]  start_kernel+0x14f/0x421
> > kern  :warn  : [    0.000000]  x86_64_start_reservations+0x2a/0x2c
> > kern  :warn  : [    0.000000]  x86_64_start_kernel+0x72/0x75
> > kern  :warn  : [    0.000000]  secondary_startup_64+0xa5/0xa5

> I think you need to move native_pv_lock_init() after jump_lable_init().

Urgh.. I always get lost in that whole patching maze :/ Unless Juergen
can move it later, I think the below should also work. Moving
jump_label_init() before smp_prepare_boot_cpu() might not work for all
architectures, but it should work for x86 (and we explicitly allow for
archs to initialize this early).

---
 arch/x86/kernel/smpboot.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index aed1460135e6..93b42d9d9d4f 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -1350,6 +1350,17 @@ void __init native_smp_prepare_boot_cpu(void)
 	/* already set me in cpu_online_mask in boot_cpu_init() */
 	cpumask_set_cpu(me, cpu_callout_mask);
 	cpu_set_state_online(me);
+
+	/*
+	 * native_pv_lock_init() needs jump_labels to work. Moving
+	 * jump_label_init() in generic code requires auditing all archs for
+	 * their text_poke requirements.
+	 *
+	 * The x86 version really only depends on ideal_nops[] which is
+	 * initialized at the end of setup_arch(). So doing an arch specific
+	 * early init of jump-labels here is fine.
+	 */
+	jump_label_init();
 	native_pv_lock_init();
 }
=20

--===============4460608036388040030==--

