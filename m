Content-Type: multipart/mixed; boundary="===============2837831394753109725=="
MIME-Version: 1.0
From: Borislav Petkov <bp@alien8.de>
To: lkp@lists.01.org
Subject: [PATCH -v1.1] x86/MCE: Correct TSC timestamping of error records
Date: Thu, 10 Nov 2016 14:10:53 +0100
Message-ID: <20161110131053.kybsijfs5venpjnf@pd.tnic>
In-Reply-To: <20161110124633.3fv4mc4kxvdxmnzj@pd.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============2837831394753109725==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thomas,

here's the fixed version:

---
From: Borislav Petkov <bp@suse.de>

We did have logic in the MCE code which would TSC-timestamp an error
record only when it is exact - i.e., when it wasn't detected by polling.
This isn't the case anymore. So let's fix that:

We have a valid TSC timestamp in the error record only when it has been
a precise detection, i.e., either in the #MC handler or in one of the
interrupt handlers (thresholding, deferred, ...).

All other error records still have mce.time which contains the wall
time in order to be able to place the error record in time at least
approximately.

Also, this fixes another bug where machine_check_poll() would clear
mce.tsc unconditionally even if we requested precise MCP_TIMESTAMP
logging.

The proper fix would be to generate timestamp only when it has been
requested and not always. But that would require a more thorough code
audit of all mce_gather_info/mce_setup() users. Add a FIXME for now.

Signed-off-by: Borislav Petkov <bp@suse.de>
Cc: Tony Luck <tony.luck@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
---
 arch/x86/kernel/cpu/mcheck/mce.c       | 16 ++++++++++------
 arch/x86/kernel/cpu/mcheck/mce_intel.c |  4 ++--
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kernel/cpu/mcheck/mce.c b/arch/x86/kernel/cpu/mcheck/=
mce.c
index 4ca00474804b..aab96f8d52b0 100644
--- a/arch/x86/kernel/cpu/mcheck/mce.c
+++ b/arch/x86/kernel/cpu/mcheck/mce.c
@@ -706,6 +706,15 @@ bool machine_check_poll(enum mcp_flags flags, mce_bank=
s_t *b)
 =

 	mce_gather_info(&m, NULL);
 =

+	/*
+	 * m.tsc was set in mce_setup(). Clear it if not requested.
+	 *
+	 * FIXME: Propagate @flags to mce_gather_info/mce_setup() to avoid
+	 *	  that dance.
+	 */
+	if (!(flags & MCP_TIMESTAMP))
+		m.tsc =3D 0;
+
 	for (i =3D 0; i < mca_cfg.banks; i++) {
 		if (!mce_banks[i].ctl || !test_bit(i, *b))
 			continue;
@@ -713,14 +722,12 @@ bool machine_check_poll(enum mcp_flags flags, mce_ban=
ks_t *b)
 		m.misc =3D 0;
 		m.addr =3D 0;
 		m.bank =3D i;
-		m.tsc =3D 0;
 =

 		barrier();
 		m.status =3D mce_rdmsrl(msr_ops.status(i));
 		if (!(m.status & MCI_STATUS_VAL))
 			continue;
 =

-
 		/*
 		 * Uncorrected or signalled events are handled by the exception
 		 * handler when it is enabled, so don't process those here.
@@ -735,9 +742,6 @@ bool machine_check_poll(enum mcp_flags flags, mce_banks=
_t *b)
 =

 		mce_read_aux(&m, i);
 =

-		if (!(flags & MCP_TIMESTAMP))
-			m.tsc =3D 0;
-
 		severity =3D mce_severity(&m, mca_cfg.tolerant, NULL, false);
 =

 		if (severity =3D=3D MCE_DEFERRED_SEVERITY && memory_error(&m))
@@ -1394,7 +1398,7 @@ static void mce_timer_fn(unsigned long data)
 	iv =3D __this_cpu_read(mce_next_interval);
 =

 	if (mce_available(this_cpu_ptr(&cpu_info))) {
-		machine_check_poll(MCP_TIMESTAMP, this_cpu_ptr(&mce_poll_banks));
+		machine_check_poll(0, this_cpu_ptr(&mce_poll_banks));
 =

 		if (mce_intel_cmci_poll()) {
 			iv =3D mce_adjust_timer(iv);
diff --git a/arch/x86/kernel/cpu/mcheck/mce_intel.c b/arch/x86/kernel/cpu/m=
check/mce_intel.c
index 1defb8ea882c..be0b2fad47c5 100644
--- a/arch/x86/kernel/cpu/mcheck/mce_intel.c
+++ b/arch/x86/kernel/cpu/mcheck/mce_intel.c
@@ -130,7 +130,7 @@ bool mce_intel_cmci_poll(void)
 	 * Reset the counter if we've logged an error in the last poll
 	 * during the storm.
 	 */
-	if (machine_check_poll(MCP_TIMESTAMP, this_cpu_ptr(&mce_banks_owned)))
+	if (machine_check_poll(0, this_cpu_ptr(&mce_banks_owned)))
 		this_cpu_write(cmci_backoff_cnt, INITIAL_CHECK_INTERVAL);
 	else
 		this_cpu_dec(cmci_backoff_cnt);
@@ -342,7 +342,7 @@ void cmci_recheck(void)
 		return;
 =

 	local_irq_save(flags);
-	machine_check_poll(MCP_TIMESTAMP, this_cpu_ptr(&mce_banks_owned));
+	machine_check_poll(0, this_cpu_ptr(&mce_banks_owned));
 	local_irq_restore(flags);
 }
 =

-- =

2.10.0


-- =

Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.

--===============2837831394753109725==--

