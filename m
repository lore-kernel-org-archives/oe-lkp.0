Content-Type: multipart/mixed; boundary="===============3264754745639786978=="
MIME-Version: 1.0
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lockdep] b09be676e0 BUG: unable to handle kernel NULL pointer dereference at 000001f2
Date: Tue, 03 Oct 2017 09:31:47 -0500
Message-ID: <20171003143147.ypotpg4f3dql4gtf@treble>
In-Reply-To: <20171003140634.r2jzujgl62ox4uzh@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3264754745639786978==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 03, 2017 at 10:06:34PM +0800, Fengguang Wu wrote:
> Hi Byungchul,
> =

> This patch triggers a NULL-dereference bug at update_stack_state().
> Although its parent commit also has a NULL-dereference bug, however
> the call stack looks rather different. Both dmesg files are attached.
> =

> It also triggers this warning, which is being discussed in another
> thread, so CC Josh. The full dmesg attached, too.
> =

>         Please press Enter to activate this console.
>         [  138.605622] WARNING: kernel stack regs at be299c9a in procd:34=
0 has bad 'bp' value 000001be
>         [  138.605627] unwind stack type:0 next_sp:  (null) mask:0x2 grap=
h_idx:0
>         [  138.605631] be299c9a: 299ceb00 (0x299ceb00)
>         [  138.605633] be299c9e: 2281f1be (0x2281f1be)
>         [  138.605634] be299ca2: 299cebb6 (0x299cebb6)

I suspect the bug is in:

  ce07a9415f26 ("locking/lockdep: Make check_prev_add() able to handle exte=
rnal stack_trace")

It converts the stack-allocated stack_trace struct from static to
non-static, yet still adds it to a list.  Does this fix it?

diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index 44c8d0d17170..b4a5e60488aa 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -1986,7 +1986,7 @@ check_prevs_add(struct task_struct *curr, struct held=
_lock *next)
 {
 	int depth =3D curr->lockdep_depth;
 	struct held_lock *hlock;
-	struct stack_trace trace;
+	static struct stack_trace trace;
 	int (*save)(struct stack_trace *trace) =3D save_trace;
 =

 	/*

--===============3264754745639786978==--

