Content-Type: multipart/mixed; boundary="===============1499432520306477021=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [rfcomm_run] WARNING: CPU: 0 PID: 95 at kernel/sched/core.c:7312 __might_sleep()
Date: Mon, 27 Oct 2014 14:36:27 +0100
Message-ID: <20141027133627.GH3337@twins.programming.kicks-ass.net>
In-Reply-To: <20141027130621.GA6336@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1499432520306477021==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2014 at 09:06:21PM +0800, Fengguang Wu wrote:
> Hi Peter,
> =

> FYI, this bug seems still there on v3.18-rc2.

Oh, right, I commented out that patch and the audit one because I was
waiting for some feedback. Lemme go prod people.

--===============1499432520306477021==--

