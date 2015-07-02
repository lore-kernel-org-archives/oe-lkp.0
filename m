Content-Type: multipart/mixed; boundary="===============2981905810233528044=="
MIME-Version: 1.0
From: Steven Rostedt <rostedt@goodmis.org>
To: lkp@lists.01.org
Subject: Re: [trace] kernel BUG at kernel/sched/core.c:2881!
Date: Thu, 02 Jul 2015 15:56:47 -0400
Message-ID: <20150702155647.693ad4d6@gandalf.local.home>
In-Reply-To: <20150630141803.GA28071@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2981905810233528044==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 30 Jun 2015 22:18:03 +0800
Fengguang Wu <fengguang.wu@intel.com> wrote:

> Hi Rostedt,
> =

> FYI, this merge changes kernel crash to some more obvious kernel BUG
> message. If it's still not helpful, I can try bisect the old crash
> or split up the merge and bisect into them.
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> =

> commit e382608254e06c8109f40044f5e693f2e04f3899

Hmm, I'm able to trigger this bug all the way back to 3.19 (I'll try
further). Something about this config makes the branch tracer crash.

-- Steve


--===============2981905810233528044==--

