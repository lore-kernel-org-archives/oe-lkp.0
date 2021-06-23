Content-Type: multipart/mixed; boundary="===============6540377505605347780=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [jump_label, x86] e7bf1ba97a: BUG:unable_to_handle_page_fault_for_address
Date: Wed, 23 Jun 2021 10:14:00 +0200
Message-ID: <YNLtSKUtqxqPxmGP@hirez.programming.kicks-ass.net>
In-Reply-To: <20210623022826.GA20282@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============6540377505605347780==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 23, 2021 at 10:28:26AM +0800, kernel test robot wrote:

> [  222.094341] BUG: unable to handle page fault for address: ffffffff83cc=
ffe0

> [  222.283298] insn_decode (kbuild/src/consumer/arch/x86/lib/insn.c:747) =

> [  222.286668] arch_jump_entry_size (kbuild/src/consumer/arch/x86/kernel/=
jump_label.c:27) =

> [  222.303592] jump_label_text_reserved (kbuild/src/consumer/kernel/jump_=
label.c:312 kbuild/src/consumer/kernel/jump_label.c:325 kbuild/src/consumer=
/kernel/jump_label.c:791) =

> [  222.308170] register_kprobe (kbuild/src/consumer/kernel/kprobes.c:2052=
) =


(FWIW, maybe you can run s'kbuild/src/consumer/''g on the thing before
sending)

I *think* the below might help, can you try?

---
diff --git a/kernel/jump_label.c b/kernel/jump_label.c
index bdb0681bece8..c44381dcf25b 100644
--- a/kernel/jump_label.c
+++ b/kernel/jump_label.c
@@ -316,14 +316,16 @@ static int addr_conflict(struct jump_entry *entry, vo=
id *start, void *end)
 }
 =

 static int __jump_label_text_reserved(struct jump_entry *iter_start,
-		struct jump_entry *iter_stop, void *start, void *end)
+		struct jump_entry *iter_stop, void *start, void *end, bool init)
 {
 	struct jump_entry *iter;
 =

 	iter =3D iter_start;
 	while (iter < iter_stop) {
-		if (addr_conflict(iter, start, end))
-			return 1;
+		if (init || !jump_entry_is_init(iter)) {
+			if (addr_conflict(iter, start, end))
+				return 1;
+		}
 		iter++;
 	}
 =

@@ -548,6 +550,7 @@ static void static_key_set_mod(struct static_key *key,
 static int __jump_label_mod_text_reserved(void *start, void *end)
 {
 	struct module *mod;
+	bool init;
 	int ret;
 =

 	preempt_disable();
@@ -555,6 +558,7 @@ static int __jump_label_mod_text_reserved(void *start, =
void *end)
 	WARN_ON_ONCE(__module_text_address((unsigned long)end) !=3D mod);
 	if (!try_module_get(mod))
 		mod =3D NULL;
+	init =3D mod->state =3D=3D MODULE_STATE_COMING;
 	preempt_enable();
 =

 	if (!mod)
@@ -562,7 +566,7 @@ static int __jump_label_mod_text_reserved(void *start, =
void *end)
 =

 	ret =3D __jump_label_text_reserved(mod->jump_entries,
 				mod->jump_entries + mod->num_jump_entries,
-				start, end);
+				start, end, init);
 =

 	module_put(mod);
 =

@@ -788,8 +792,9 @@ early_initcall(jump_label_init_module);
  */
 int jump_label_text_reserved(void *start, void *end)
 {
+	bool init =3D system_state < SYSTEM_RUNNING;
 	int ret =3D __jump_label_text_reserved(__start___jump_table,
-			__stop___jump_table, start, end);
+			__stop___jump_table, start, end, init);
 =

 	if (ret)
 		return ret;
--===============6540377505605347780==--

