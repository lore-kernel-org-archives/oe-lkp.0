Content-Type: multipart/mixed; boundary="===============6257159849727199450=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched] kernel BUG at kernel/smpboot.c:134!
Date: Thu, 06 Nov 2014 11:45:13 +0100
Message-ID: <20141106104513.GS10501@worktop.programming.kicks-ass.net>
In-Reply-To: <20141105180758.GA19218@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6257159849727199450==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 06, 2014 at 02:07:58AM +0800, Yuyang Du wrote:
> Hi Peter and Thomas,
> =

> LKP found a bug, and it was bisected to my rewrite patch:
> http://article.gmane.org/gmane.linux.kernel/1818393/
> =

> But I really don't have a clue about why the patch can introduce
> such a bug, as the patch does not modify anything related. Or maybe
> the bug could be indirectly triggerd, just don't know how.
> =

> To confirm it is not a false positive, we are rebasing the patch to
> 3.18-rc3 to try to reproduce it, it is now ongoing.
> =

> In addition, I noticed this thread about the same symptom:
> http://thread.gmane.org/gmane.linux.kernel/1819348.
> =

> Thomas should already have a fix to this. Right?

Not quite; see https://lkml.org/lkml/2014/6/26/554

Let me read that thread though, maybe I can make sense of it.

--===============6257159849727199450==--

