Content-Type: multipart/mixed; boundary="===============6748092440737513431=="
MIME-Version: 1.0
From: Steven Rostedt <rostedt@goodmis.org>
To: lkp@lists.01.org
Subject: Re: [torture] 945fa9c631b: BUG: unable to handle kernel NULL pointer dereference at (null)
Date: Tue, 14 Jul 2015 11:48:48 -0400
Message-ID: <20150714114848.238118dd@gandalf.local.home>
In-Reply-To: <20150714153829.GF3717@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6748092440737513431==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 14 Jul 2015 08:38:29 -0700
"Paul E. McKenney" <paulmck@linux.vnet.ibm.com> wrote:

> On Tue, Jul 14, 2015 at 09:04:08PM +0800, Huang Ying wrote:
> > FYI, we noticed the below changes on
> > =

> > git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > commit 945fa9c631b04febe295a3a2a00c7e4a3cfb97db ("torture: Dump ftrace =
buffer when the RCU grace period stalls")
> > =

> > We think the commit may reveal a existing bug.
> =

> Hmmm...  Is this perhaps a very slow boot due to diagnostics?  If so,
> might the ftrace buffer not yet be initialized?  CCing Steven Rostedt
> for his thoughts.

Is this reproducible?

Does the following patch fix it for you?

-- Steve

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 6e79408674aa..4d68dc121687 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -6968,6 +6968,9 @@ void ftrace_dump(enum ftrace_dump_mode oops_dump_mode)
 	unsigned long flags;
 	int cnt =3D 0, cpu;
 =

+	if (tracing_disabled)
+		return;
+
 	/* Only allow one dump user at a time. */
 	if (atomic_inc_return(&dump_running) !=3D 1) {
 		atomic_dec(&dump_running);

--===============6748092440737513431==--

