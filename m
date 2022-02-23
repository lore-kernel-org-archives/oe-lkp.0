Content-Type: multipart/mixed; boundary="===============7763996913837365224=="
MIME-Version: 1.0
From: Tejun Heo <tj@kernel.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] workqueue: Use private WQ for schedule_on_each_cpu() API
Date: Wed, 23 Feb 2022 11:33:02 -1000
Message-ID: <YhaoDiJ8MUOhRmp6@slm.duckdns.org>
In-Reply-To: <16a33a65-3c67-ef66-ccc8-9c4fffb0ae5a@I-love.SAKURA.ne.jp>
List-Id: <oe-lkp.lists.linux.dev>

--===============7763996913837365224==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 23, 2022 at 09:57:27AM +0900, Tetsuo Handa wrote:
> On 2022/02/23 2:29, Tejun Heo wrote:
> > On Mon, Feb 21, 2022 at 07:38:09PM +0900, Tetsuo Handa wrote:
> >> Since schedule_on_each_cpu() calls schedule_work_on() and flush_work(),
> >> we should avoid using system_wq in order to avoid unexpected locking
> >> dependency.
> > =

> > I don't get it. schedule_on_each_cpu() is flushing each work item and t=
hus
> > shouldn't need its own flushing domain. What's this change for?
> =

> A kernel test robot tested "[PATCH v2] workqueue: Warn flush attempt using
> system-wide workqueues" on 5.16.0-06523-g29bd199e4e73 and hit a lockdep
> warning ( https://lkml.kernel.org/r/20220221083358.GC835(a)xsang-OptiPlex=
-9020 ).
> =

> Although the circular locking dependency itself needs to be handled by
> lockless console printing support, we won't be able to apply
> "[PATCH v2] workqueue: Warn flush attempt using system-wide workqueues"
> if schedule_on_each_cpu() continues using system-wide workqueues.

The patch seems pretty wrong. What's problematic is system workqueue flushes
(which flushes the entire workqueue), not work item flushes.

Thanks.

-- =

tejun
--===============7763996913837365224==--

