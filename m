Content-Type: multipart/mixed; boundary="===============3128239975674415465=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched/preempt] 103637a5b94: 12.4% fsmark.app_overhead, -1.4% fsmark.files_per_sec
Date: Sun, 26 Jul 2015 11:01:01 +0200
Message-ID: <20150726090101.GN19282@twins.programming.kicks-ass.net>
In-Reply-To: <CALYGNiNtLYwts6mu5-yTZTJ_7-FDym=bbtzUv-pmX5yhHWfRuA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3128239975674415465==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 25, 2015 at 07:32:03PM +0300, Konstantin Khlebnikov wrote:
> I guess that's because of cond_resched_lock() usage in nfs_scan_commit_li=
st().
> My patch fixes cond_resched_lock() which never worked since v3.13.

Yeah, I wasn't surprised to see preemptions go up with this patch, not
total throughput suffer a bit due to that.

--===============3128239975674415465==--

