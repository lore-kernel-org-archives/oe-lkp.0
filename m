Content-Type: multipart/mixed; boundary="===============5070842531192466041=="
MIME-Version: 1.0
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: lkp@lists.01.org
Subject: Re: [PATCH] workqueue: Use private WQ for schedule_on_each_cpu() API
Date: Wed, 23 Feb 2022 09:57:27 +0900
Message-ID: <16a33a65-3c67-ef66-ccc8-9c4fffb0ae5a@I-love.SAKURA.ne.jp>
In-Reply-To: <YhUdjip4VSWe4zDO@slm.duckdns.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============5070842531192466041==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2022/02/23 2:29, Tejun Heo wrote:
> On Mon, Feb 21, 2022 at 07:38:09PM +0900, Tetsuo Handa wrote:
>> Since schedule_on_each_cpu() calls schedule_work_on() and flush_work(),
>> we should avoid using system_wq in order to avoid unexpected locking
>> dependency.
> =

> I don't get it. schedule_on_each_cpu() is flushing each work item and thus
> shouldn't need its own flushing domain. What's this change for?

A kernel test robot tested "[PATCH v2] workqueue: Warn flush attempt using
system-wide workqueues" on 5.16.0-06523-g29bd199e4e73 and hit a lockdep
warning ( https://lkml.kernel.org/r/20220221083358.GC835(a)xsang-OptiPlex-9=
020 ).

Although the circular locking dependency itself needs to be handled by
lockless console printing support, we won't be able to apply
"[PATCH v2] workqueue: Warn flush attempt using system-wide workqueues"
if schedule_on_each_cpu() continues using system-wide workqueues.

--===============5070842531192466041==--

