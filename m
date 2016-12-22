Content-Type: multipart/mixed; boundary="===============8554680994797107850=="
MIME-Version: 1.0
From: Matt Fleming <matt@codeblueprint.co.uk>
To: lkp@lists.01.org
Subject: Re: [sched] 4aa9e831f4 WARNING: CPU: 0 PID: 0 at kernel/sched/sched.h:804 attach_entity_cfs_rq
Date: Thu, 22 Dec 2016 20:00:13 +0000
Message-ID: <20161222200013.GH2225@codeblueprint.co.uk>
In-Reply-To: <20161222035301.rmm7x2urwxejgz2t@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8554680994797107850==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 22 Dec, at 11:53:01AM, Fengguang Wu wrote:
> Hi Matt,
> =

> FYI, this may be your expected results from the debug patch.
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/de=
bug
 =

Right, this patch really needs to come after,

    commit 3fb7dd05fdd7 ("sched: Add missing update_rq_clock() in post_init=
_entity_util_avg().")

in Peter's tree otherwise we're going to keep getting these emails
from LKP ad infinitum.

Peter, can you rearrange these patches?

--===============8554680994797107850==--

