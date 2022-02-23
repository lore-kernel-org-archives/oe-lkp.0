Content-Type: multipart/mixed; boundary="===============7545789861924318537=="
MIME-Version: 1.0
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: lkp@lists.01.org
Subject: Re: [PATCH] workqueue: Use private WQ for schedule_on_each_cpu() API
Date: Thu, 24 Feb 2022 07:26:30 +0900
Message-ID: <9a883d72-ea7d-1936-93e6-5c2a290509d4@I-love.SAKURA.ne.jp>
In-Reply-To: <YhaoDiJ8MUOhRmp6@slm.duckdns.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============7545789861924318537==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2022/02/24 6:33, Tejun Heo wrote:
> On Wed, Feb 23, 2022 at 09:57:27AM +0900, Tetsuo Handa wrote:
>> On 2022/02/23 2:29, Tejun Heo wrote:
>>> On Mon, Feb 21, 2022 at 07:38:09PM +0900, Tetsuo Handa wrote:
>>>> Since schedule_on_each_cpu() calls schedule_work_on() and flush_work(),
>>>> we should avoid using system_wq in order to avoid unexpected locking
>>>> dependency.
>>>
>>> I don't get it. schedule_on_each_cpu() is flushing each work item and t=
hus
>>> shouldn't need its own flushing domain. What's this change for?
>>
>> A kernel test robot tested "[PATCH v2] workqueue: Warn flush attempt usi=
ng
>> system-wide workqueues" on 5.16.0-06523-g29bd199e4e73 and hit a lockdep
>> warning ( https://lkml.kernel.org/r/20220221083358.GC835(a)xsang-OptiPle=
x-9020 ).
>>
>> Although the circular locking dependency itself needs to be handled by
>> lockless console printing support, we won't be able to apply
>> "[PATCH v2] workqueue: Warn flush attempt using system-wide workqueues"
>> if schedule_on_each_cpu() continues using system-wide workqueues.
> =

> The patch seems pretty wrong. What's problematic is system workqueue flus=
hes
> (which flushes the entire workqueue), not work item flushes.

Why? My understanding is that

  flushing a workqueue waits for completion of all work items in that workq=
ueue

  flushing a work item waits for for completion of that work item using
  a workqueue specified as of queue_work()

and

  if a work item in some workqueue is blocked by other work in that workque=
ue
  (e.g. max_active limit, work items on that workqueue and locks they need),
  it has a risk of deadlock

. Then, how can flushing a work item using system-wide workqueues be free o=
f deadlock risk?
Isn't it just "unlikely to deadlock" rather than "impossible to deadlock"?

--===============7545789861924318537==--

