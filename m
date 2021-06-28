Content-Type: multipart/mixed; boundary="===============0744838907587000100=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [jump_label, x86] e7bf1ba97a: BUG:unable_to_handle_page_fault_for_address
Date: Mon, 28 Jun 2021 12:08:22 +0200
Message-ID: <YNmflj/WpFG5Ivmb@hirez.programming.kicks-ass.net>
In-Reply-To: <YNmUzDjX6sECp37P@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============0744838907587000100==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 28, 2021 at 11:22:20AM +0200, Peter Zijlstra wrote:
> On Thu, Jun 24, 2021 at 06:32:25AM +0000, Liu, Yujie wrote:
> > > > [  222.094341] BUG: unable to handle page fault for address:
> > > > ffffffff83ccffe0
> > > =

> > > I *think* the below might help, can you try?
> > =

> > Hi Peter Z,
> > =

> > We try to apply the patch on commit e7bf1ba97afdd (jump_label, x86: Emi=
t short JMP)
> > A new BUG appeared before reaching the BUG reported in previous mail.
> > Full dmesg in attachment.
> =

> > > @@ -555,6 +558,7 @@ static int __jump_label_mod_text_reserved(void *s=
tart, void *end)
> > >  	WARN_ON_ONCE(__module_text_address((unsigned long)end) !=3D mod);
> > >  	if (!try_module_get(mod))
> > >  		mod =3D NULL;
> > > +	init =3D mod->state =3D=3D MODULE_STATE_COMING;
> > >  	preempt_enable();
> > > =

> > >  	if (!mod)
> =

> *groan*, I'm an idiot... There's an obvious NULL pointer deref right
> there.
> =

> Let me try locally first before I send yet another dud.

OK, the below seems to work. Your report might've been easier to parse
if it had told me the failing test was:

  tools/testing/selftests/ftrace/ftracetest

And that test would've been easier to use if it would just say wth was
missing from the .config :/

Let me go write up a proper patch and do the same for static_call.

---
diff --git a/kernel/jump_label.c b/kernel/jump_label.c
index ba39fbb1f8e7..af520ca26360 100644
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

@@ -561,7 +563,7 @@ static int __jump_label_mod_text_reserved(void *start, =
void *end)
 =

 	ret =3D __jump_label_text_reserved(mod->jump_entries,
 				mod->jump_entries + mod->num_jump_entries,
-				start, end);
+				start, end, mod->state =3D=3D MODULE_STATE_COMING);
 =

 	module_put(mod);
 =

@@ -786,8 +788,9 @@ early_initcall(jump_label_init_module);
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
--===============0744838907587000100==--

